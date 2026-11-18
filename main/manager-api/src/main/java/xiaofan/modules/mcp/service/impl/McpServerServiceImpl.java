package xiaofan.modules.mcp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xiaofan.common.exception.ErrorCode;
import xiaofan.common.exception.RenException;
import xiaofan.common.utils.JsonUtils;
import xiaofan.modules.mcp.dao.AgentMcpServerDao;
import xiaofan.modules.mcp.dao.McpDeviceAccountDao;
import xiaofan.modules.mcp.dao.McpServerDao;
import xiaofan.modules.mcp.dto.DeviceMcpAccountSaveDTO;
import xiaofan.modules.mcp.dto.DeviceMcpAccountSaveDTO.DeviceAccountItem;
import xiaofan.modules.mcp.dto.McpServerDTO;
import xiaofan.modules.mcp.entity.AgentMcpServerEntity;
import xiaofan.modules.mcp.entity.McpDeviceAccountEntity;
import xiaofan.modules.mcp.entity.McpServerEntity;
import xiaofan.modules.mcp.service.McpServerService;
import xiaofan.common.constant.Constant;
import xiaofan.modules.sys.service.SysParamsService;
import xiaofan.modules.llm.service.LLMService;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.net.CookieManager;
import java.net.CookiePolicy;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.net.URLEncoder;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@AllArgsConstructor
public class McpServerServiceImpl implements McpServerService {
    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();
    private final HttpClient httpClient = HttpClient.newBuilder()
            .version(HttpClient.Version.HTTP_1_1)
            .connectTimeout(Duration.ofSeconds(10))
            .followRedirects(HttpClient.Redirect.NEVER)
            .build();
    private final McpServerDao mcpServerDao;
    private final AgentMcpServerDao agentMcpServerDao;
    private final McpDeviceAccountDao mcpDeviceAccountDao;
    private final SysParamsService sysParamsService;
    private final LLMService llmService;

    @Override
    public List<McpServerDTO> listAll() {
        LambdaQueryWrapper<McpServerEntity> wrapper = new LambdaQueryWrapper<McpServerEntity>()
                .orderByAsc(McpServerEntity::getName);
        return toDtoList(mcpServerDao.selectList(wrapper));
    }

    @Override
    public List<McpServerDTO> listEnabled() {
        LambdaQueryWrapper<McpServerEntity> wrapper = new LambdaQueryWrapper<McpServerEntity>()
                .eq(McpServerEntity::getEnabled, 1)
                .orderByAsc(McpServerEntity::getName);
        return toDtoList(mcpServerDao.selectList(wrapper));
    }

    @Override
    public List<Map<String, Object>> runtimeServers(List<String> authorizedIds) {
        LambdaQueryWrapper<McpServerEntity> wrapper = new LambdaQueryWrapper<McpServerEntity>()
                .eq(McpServerEntity::getEnabled, 1)
                .orderByAsc(McpServerEntity::getName);
        List<McpServerEntity> entities = mcpServerDao.selectList(wrapper);
        Set<String> authorized = authorizedIds == null ? null : new HashSet<>(authorizedIds);
        List<Map<String, Object>> result = new ArrayList<>();
        for (McpServerEntity entity : entities) {
            if (authorized != null && !authorized.contains(entity.getId())) {
                continue;
            }
            Map<String, Object> item = new LinkedHashMap<>();
            item.put("id", entity.getId());
            item.put("name", entity.getName());
            item.put("description", entity.getDescription());
            item.put("endpoint", entity.getEndpoint());
            item.put("transport", normalizeTransport(entity.getTransport()));
            item.put("command", entity.getCommand());
            item.put("args", parseStringList(entity.getArgsJson()));
            item.put("env", parseObject(entity.getEnvJson()));
            item.put("enabled", true);
            item.put("headers", parseHeaders(entity.getHeadersJson()));
            item.put("authMode", normalizeAuthMode(entity.getAuthMode()));
            item.put("authConfig", parseObject(entity.getAuthConfigJson()));
            result.add(item);
        }
        return result;
    }

    @Override
    public List<String> getAuthorizedServerIds(String agentId) {
        return agentMcpServerDao.selectList(new LambdaQueryWrapper<AgentMcpServerEntity>()
                        .eq(AgentMcpServerEntity::getAgentId, agentId))
                .stream().map(AgentMcpServerEntity::getServerId).distinct().toList();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveAuthorization(String agentId, List<String> serverIds) {
        agentMcpServerDao.delete(new LambdaQueryWrapper<AgentMcpServerEntity>()
                .eq(AgentMcpServerEntity::getAgentId, agentId));
        if (serverIds == null || serverIds.isEmpty()) {
            return;
        }
        Set<String> uniqueIds = new HashSet<>(serverIds);
        for (String serverId : uniqueIds) {
            if (mcpServerDao.selectById(serverId) == null) {
                continue;
            }
            AgentMcpServerEntity mapping = new AgentMcpServerEntity();
            mapping.setAgentId(agentId);
            mapping.setServerId(serverId);
            agentMcpServerDao.insert(mapping);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByServerId(String serverId) {
        agentMcpServerDao.delete(new LambdaQueryWrapper<AgentMcpServerEntity>()
                .eq(AgentMcpServerEntity::getServerId, serverId));
    }

    @Override
    public Map<String, Object> testConnection(McpServerDTO dto) {
        validateServiceDto(dto);
        String transport = StringUtils.defaultIfBlank(dto.getTransport(), "streamable-http");
        if (!"streamable-http".equals(transport)) {
            throw new RenException(ErrorCode.MCP_URL_INVALID);
        }

        try {
            Map<String, String> headers = resolveTestHeaders(dto);
            RpcResponse initResponse = postRpc(dto.getEndpoint(), headers, null, 1, "initialize", Map.of(
                    "protocolVersion", "2025-03-26",
                    "capabilities", Map.of(),
                    "clientInfo", Map.of("name", "xiaofan-capability-console", "version", "1.0.0")
            ));
            JsonNode initResult = initResponse.body().path("result");
            if (initResponse.body().has("error")) {
                throw new IllegalStateException("MCP initialize failed: " + initResponse.body().path("error").toString());
            }

            // Some standard streamable HTTP MCP servers return 202 with an empty
            // body for lifecycle notifications and do not require it before tools/list.
            // Sending the notification separately also breaks some stateless servers.
            // CloudPivot accepts tools/list directly after initialize.

            RpcResponse toolsResponse = postRpc(dto.getEndpoint(), headers,
                    initResponse.sessionId(), 2, "tools/list", Map.of());
            if (toolsResponse.body().has("error")) {
                throw new IllegalStateException("MCP tools/list failed: "
                        + toolsResponse.body().path("error").toString());
            }

            JsonNode tools = toolsResponse.body().path("result").path("tools");
            List<Map<String, Object>> toolList = new ArrayList<>();
            if (tools.isArray()) {
                for (JsonNode tool : tools) {
                    Map<String, Object> item = new LinkedHashMap<>();
                    item.put("name", tool.path("name").asText());
                    item.put("description", tool.path("description").asText());
                    toolList.add(item);
                }
            }

            Map<String, Object> result = new LinkedHashMap<>();
            result.put("connected", true);
            result.put("protocolVersion", initResult.path("protocolVersion").asText());
            result.put("serverName", initResult.path("serverInfo").path("name").asText());
            result.put("serverVersion", initResult.path("serverInfo").path("version").asText());
            result.put("toolCount", toolList.size());
            result.put("tools", toolList);
            return result;
        } catch (RenException e) {
            throw e;
        } catch (Exception e) {
            Map<String, Object> result = new LinkedHashMap<>();
            result.put("connected", false);
            result.put("message", e.getMessage() == null ? e.getClass().getSimpleName() : e.getMessage());
            return result;
        }
    }

    @Override
    public void applyTestCredentials(McpServerDTO dto, McpServerEntity entity) {
        entity.setTestUsername(StringUtils.trimToNull(dto.getTestUsername()));
        if (StringUtils.isNotBlank(dto.getTestPassword())) {
            entity.setTestPasswordCipher(encryptPassword(dto.getTestPassword()));
        } else if (entity.getId() == null) {
            entity.setTestPasswordCipher(null);
        }
        if (StringUtils.isNotBlank(dto.getTestToken())) {
            entity.setTestTokenCipher(encryptPassword(dto.getTestToken().trim()));
        } else if (entity.getId() == null) {
            entity.setTestTokenCipher(null);
        }
        // On update, blank test credentials intentionally preserve the saved ciphers.
    }

    private Map<String, String> resolveTestHeaders(McpServerDTO dto) throws Exception {
        Map<String, String> headers = sanitizeHeaders(dto.getHeaders());
        String testToken = StringUtils.trimToEmpty(dto.getTestToken());
        if (StringUtils.isBlank(testToken) && dto.getId() != null) {
            McpServerEntity savedServer = mcpServerDao.selectById(dto.getId());
            if (savedServer != null && StringUtils.isNotBlank(savedServer.getTestTokenCipher())) {
                testToken = decryptPassword(savedServer.getTestTokenCipher());
            }
        }
        if (StringUtils.isNotBlank(testToken)) {
            String tokenValue = testToken.trim();
            if (!tokenValue.regionMatches(true, 0, "Bearer ", 0, 7)) {
                tokenValue = "Bearer " + tokenValue;
            }
            headers.put("Authorization", tokenValue);
            return headers;
        }
        if (!"client".equals(normalizeAuthMode(dto.getAuthMode()))) {
            return headers;
        }

        String username = StringUtils.trimToEmpty(dto.getTestUsername());
        String password = StringUtils.trimToEmpty(dto.getTestPassword());
        if ((StringUtils.isBlank(username) || StringUtils.isBlank(password)) && dto.getId() != null) {
            McpServerEntity savedServer = mcpServerDao.selectById(dto.getId());
            if (savedServer != null && StringUtils.isNotBlank(savedServer.getTestPasswordCipher())
                    && (StringUtils.isBlank(username)
                        || username.equals(StringUtils.trimToEmpty(savedServer.getTestUsername())))) {
                username = StringUtils.trimToEmpty(savedServer.getTestUsername());
                password = decryptPassword(savedServer.getTestPasswordCipher());
            }
        }
        if (StringUtils.isBlank(username) && dto.getId() != null) {
            McpDeviceAccountEntity savedAccount = mcpDeviceAccountDao.selectList(
                            new LambdaQueryWrapper<McpDeviceAccountEntity>()
                                    .eq(McpDeviceAccountEntity::getServerId, dto.getId())
                                    .eq(McpDeviceAccountEntity::getEnabled, 1)
                                    .orderByAsc(McpDeviceAccountEntity::getCreateDate)
                                    .last("LIMIT 1"))
                    .stream().findFirst().orElse(null);
            if (savedAccount != null && StringUtils.isNotBlank(savedAccount.getPasswordCipher())) {
                username = savedAccount.getUsername();
                password = decryptPassword(savedAccount.getPasswordCipher());
            }
        }

        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            throw new IllegalStateException("Client auth test requires a test Token or legacy credentials");
        }

        Map<String, Object> authConfig = dto.getAuthConfig() == null ? Map.of() : dto.getAuthConfig();
        String authType = stringValue(authConfig.get("authType"));
        if (StringUtils.isBlank(authType)) {
            authType = "cloudpivot_password";
        }
        if (!"cloudpivot_password".equals(authType)) {
            throw new IllegalStateException("Unsupported client auth type: " + authType);
        }

        Map<String, String> tokens = cloudPivotLogin(dto.getEndpoint(), authConfig, username, password);
        headers.keySet().removeIf(key -> {
            String name = key.toLowerCase();
            return "authorization".equals(name) || "x-refresh-token".equals(name) || "cookie".equals(name);
        });
        headers.put("Authorization", "Bearer " + tokens.get("accessToken"));
        if (StringUtils.isNotBlank(tokens.get("refreshToken"))) {
            headers.put("X-Refresh-Token", tokens.get("refreshToken"));
        }
        return headers;
    }

    private Map<String, String> cloudPivotLogin(String endpoint, Map<String, Object> authConfig,
                                                String username, String password) throws Exception {
        String origin = stringValue(authConfig.get("baseUrl"));
        if (StringUtils.isBlank(origin)) {
            URI endpointUri = URI.create(endpoint);
            origin = endpointUri.getScheme() + "://" + endpointUri.getHost()
                    + (endpointUri.getPort() == -1 ? "" : ":" + endpointUri.getPort());
        }
        origin = StringUtils.removeEnd(origin, "/");
        String corpId = stringValue(authConfig.get("corpId"));
        if (StringUtils.isBlank(corpId)) {
            corpId = stringValue(authConfig.get("corpIdValue"));
        }

        HttpClient browserClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(20))
                .cookieHandler(new CookieManager(null, CookiePolicy.ACCEPT_ALL))
                .followRedirects(HttpClient.Redirect.NEVER)
                .build();

        // Start at the OAuth authorize endpoint so Spring Security can preserve the
        // authorization request while it redirects to the login page.
        String redirectUri = origin + "/oauth";
        String authorizeQuery = "client_id=" + urlEncode("api")
                + "&response_type=" + urlEncode("code")
                + "&scope=" + urlEncode("read")
                + "&redirect_uri=" + urlEncode(redirectUri);
        HttpResponse<String> current = browserSend(browserClient, HttpRequest.newBuilder(URI.create(origin + "/user/oauth/authorize?" + authorizeQuery))
                .timeout(Duration.ofSeconds(20))
                .header("X-LowCode-Corpid", corpId)
                .header("User-Agent", "Mozilla/5.0 XiaofanMCPAuthTest")
                .GET()
                .build());
        if (isRedirect(current.statusCode())) {
            // CloudPivot redirects HTTPS -> HTTP; use the HTTPS login URL explicitly
            // while preserving the OAuth session created by the authorize request.
            current = browserSend(browserClient, HttpRequest.newBuilder(URI.create(origin + "/user/login"))
                    .timeout(Duration.ofSeconds(20))
                    .header("X-LowCode-Corpid", corpId)
                    .header("User-Agent", "Mozilla/5.0 XiaofanMCPAuthTest")
                    .GET()
                    .build());
        }
        if (current.statusCode() < 200 || current.statusCode() >= 300) {
            throw new IllegalStateException("CloudPivot login page failed: HTTP " + current.statusCode());
        }
        String loginUrl = current.uri().toString();

        Matcher csrfMatcher = Pattern.compile("name=\"_csrf\" value=\"([^\"]+)").matcher(current.body());
        if (!csrfMatcher.find()) {
            throw new IllegalStateException("CloudPivot login page did not contain a CSRF token");
        }

        current = browserSend(browserClient, HttpRequest.newBuilder(URI.create(origin + "/api/public/getKey"))
                .timeout(Duration.ofSeconds(20))
                .header("X-LowCode-Corpid", corpId)
                .header("User-Agent", "Mozilla/5.0 XiaofanMCPAuthTest")
                .GET()
                .build());
        if (current.statusCode() < 200 || current.statusCode() >= 300) {
            throw new IllegalStateException("CloudPivot getKey failed: HTTP " + current.statusCode());
        }
        JsonNode keyData = OBJECT_MAPPER.readTree(current.body());
        String publicKeyText = keyData.path("key").asText();
        if (StringUtils.isBlank(publicKeyText)) {
            throw new IllegalStateException("CloudPivot getKey returned no public key");
        }

        PublicKey publicKey = KeyFactory.getInstance("RSA")
                .generatePublic(new X509EncodedKeySpec(java.util.Base64.getMimeDecoder().decode(publicKeyText)));
        Cipher rsaCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        rsaCipher.init(Cipher.ENCRYPT_MODE, publicKey);
        String encryptedPassword = java.util.Base64.getEncoder()
                .encodeToString(rsaCipher.doFinal(password.getBytes(StandardCharsets.UTF_8)));

        String form = "_csrf=" + urlEncode(csrfMatcher.group(1))
                + "&username=" + urlEncode(username)
                + "&password=" + urlEncode(encryptedPassword)
                + "&index=" + urlEncode(keyData.path("index").asText());
        current = browserSend(browserClient, HttpRequest.newBuilder(URI.create(origin + "/user/login"))
                .timeout(Duration.ofSeconds(20))
                .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                .header("X-LowCode-Corpid", corpId)
                .header("Referer", loginUrl)
                .header("User-Agent", "Mozilla/5.0 XiaofanMCPAuthTest")
                .POST(HttpRequest.BodyPublishers.ofString(form, StandardCharsets.UTF_8))
                .build());

        String code = extractCode(current.uri().toString());
        if (StringUtils.isBlank(code)) {
            code = extractCode(current.headers().firstValue("Location").orElse(null));
        }
        for (int follow = 0; code.isBlank() && isRedirect(current.statusCode()) && follow < 10; follow++) {
            String location = current.headers().firstValue("Location").orElse(null);
            if (StringUtils.isBlank(location)) break;
            if (location.contains("/login?error")) {
                throw new IllegalStateException("CloudPivot username or password is incorrect");
            }
            URI next = current.uri().resolve(location);
            code = extractCode(next.toString());
            if (code.isBlank()) {
                current = browserSend(browserClient, HttpRequest.newBuilder(next)
                        .timeout(Duration.ofSeconds(20))
                        .header("X-LowCode-Corpid", corpId)
                        .header("User-Agent", "Mozilla/5.0 XiaofanMCPAuthTest")
                        .GET()
                        .build());
                code = extractCode(current.uri().toString());
            }
        }
        if (StringUtils.isBlank(code)) {
            if (current.uri().toString().contains("/login?error")) {
                throw new IllegalStateException("CloudPivot username or password is incorrect");
            }
            throw new IllegalStateException("CloudPivot login did not return an authorization code");
        }

        String clientId = stringValue(authConfig.get("clientId"));
        if (StringUtils.isBlank(clientId)) clientId = "api";
        String clientSecret = stringValue(authConfig.get("clientSecret"));
        if (StringUtils.isBlank(clientSecret)) {
            clientSecret = System.getenv("CLOUDPIVOT_CLIENT_SECRET");
        }
        if (StringUtils.isBlank(clientSecret)) {
            throw new IllegalStateException("CloudPivot client secret is not configured");
        }
        String tokenQuery = "code=" + urlEncode(code)
                + "&url=" + urlEncode(origin + "/user")
                + "&client_secret=" + urlEncode(clientSecret)
                + "&client_id=" + urlEncode(clientId)
                + "&redirect_uri=" + urlEncode(redirectUri)
                + "&corpId=" + urlEncode(corpId);
        current = browserSend(browserClient, HttpRequest.newBuilder(URI.create(origin + "/user/login/Authentication/get_token?" + tokenQuery))
                .timeout(Duration.ofSeconds(20))
                .header("X-LowCode-Corpid", corpId)
                .header("User-Agent", "Mozilla/5.0 XiaofanMCPAuthTest")
                .GET()
                .build());
        if (current.statusCode() < 200 || current.statusCode() >= 300) {
            throw new IllegalStateException("CloudPivot token exchange failed: HTTP " + current.statusCode());
        }
        JsonNode tokenData = OBJECT_MAPPER.readTree(current.body());
        String accessToken = tokenData.path("access_token").asText();
        if (StringUtils.isBlank(accessToken)) {
            throw new IllegalStateException("CloudPivot token exchange failed: " + current.body());
        }
        Map<String, String> result = new HashMap<>();
        result.put("accessToken", accessToken);
        result.put("refreshToken", tokenData.path("refresh_token").asText());
        return result;
    }

    private HttpResponse<String> browserSend(HttpClient client, HttpRequest request) throws Exception {
        return client.send(request, HttpResponse.BodyHandlers.ofString(StandardCharsets.UTF_8));
    }

    private boolean isRedirect(int status) {
        return status == 301 || status == 302 || status == 303 || status == 307 || status == 308;
    }

    private String urlEncode(String value) {
        return URLEncoder.encode(StringUtils.defaultString(value), StandardCharsets.UTF_8);
    }

    private String extractCode(String value) {
        if (StringUtils.isBlank(value)) return "";
        Matcher matcher = Pattern.compile("[?&]code=([^&]+)").matcher(value);
        return matcher.find() ? urlDecode(matcher.group(1)) : "";
    }

    private String urlDecode(String value) {
        try {
            return java.net.URLDecoder.decode(value, StandardCharsets.UTF_8);
        } catch (Exception e) {
            return value;
        }
    }

    private String decryptPassword(String cipherText) throws Exception {
        String secret = sysParamsService.getValue(Constant.SERVER_SECRET, false);
        byte[] key = MessageDigest.getInstance("SHA-256")
                .digest((secret + ":mcp-device-password").getBytes(StandardCharsets.UTF_8));
        byte[] decoded = java.util.Base64.getDecoder().decode(cipherText);
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new GCMParameterSpec(128, decoded, 0, 12));
        byte[] plain = cipher.doFinal(decoded, 12, decoded.length - 12);
        return new String(plain, StandardCharsets.UTF_8);
    }

    private void validateServiceDto(McpServerDTO dto) {
        if (dto == null || StringUtils.isBlank(dto.getName())) {
            throw new RenException(ErrorCode.PARAMS_GET_ERROR);
        }
        String transport = normalizeTransport(dto.getTransport());
        if (!"stdio".equals(transport) && !"sse".equals(transport)
                && !"http".equals(transport) && !"streamable-http".equals(transport)) {
            throw new RenException(ErrorCode.PARAM_TYPE_INVALID);
        }
        if ("stdio".equals(transport)) {
            if (StringUtils.isBlank(dto.getCommand())) {
                throw new RenException(ErrorCode.PARAMS_GET_ERROR);
            }
            return;
        }
        if (StringUtils.isBlank(dto.getEndpoint())
                || (!dto.getEndpoint().startsWith("http://")
                    && !dto.getEndpoint().startsWith("https://"))) {
            throw new RenException(ErrorCode.MCP_URL_INVALID);
        }
    }

    @Override
    public Map<String, Object> describeCapability(McpServerDTO dto) {
        Map<String, Object> connection = testConnection(dto);
        if (!Boolean.TRUE.equals(connection.get("connected"))) {
            throw new RenException(String.valueOf(connection.getOrDefault("message", "MCP connection failed")));
        }

        Object rawTools = connection.get("tools");
        String toolText = "无";
        try {
            toolText = OBJECT_MAPPER.writerWithDefaultPrettyPrinter().writeValueAsString(rawTools);
        } catch (Exception ignored) {
        }

        String serviceName = StringUtils.defaultIfBlank(dto.getName(), "未命名 MCP");
        String currentDescription = stripHtml(dto.getDescription());
        String prompt = """
                你是一名 MCP 能力分析专家。请根据下面 MCP 服务的工具列表，生成一段可直接用于意图识别的能力描述。
                描述必须明确区分系统/平台、环境（例如生产、测试、演示）、业务域（例如 PMO、财务、工单、知识库）和核心能力，避免多个同类 MCP 混淆。
                请用简体中文返回 3 个自然段，每段独占一行：
                第一段以“服务定位：”开头，说明系统、环境、部署/运行范围；
                第二段以“核心能力：”开头，概括业务对象、主要操作、数据范围和约束；
                第三段以“适用请求：”开头，说明典型意图、同义词和不适合交给它处理的相邻场景。
                总长度控制在 360 到 520 个汉字。不要逐个罗列工具名，不要写代码、Markdown、序号或额外解释。

                服务名称：%s
                当前描述：%s
                工具列表：
                %s
                """.formatted(serviceName, currentDescription, toolText);

        String description = llmService.generateSummary(prompt, prompt, null);
        if (StringUtils.isBlank(description)
                || description.contains("LLM服务不可用")
                || description.contains("未找到可用的LLM模型配置")
                || description.contains("生成总结失败")) {
            throw new RenException(StringUtils.defaultIfBlank(description, "AI capability summary failed"));
        }

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("description", description.trim());
        result.put("toolCount", connection.get("toolCount"));
        return result;
    }

    private String stripHtml(String value) {
        if (StringUtils.isBlank(value)) return "";
        return value
                .replaceAll("(?is)<(script|style)[^>]*>.*?</\\1>", " ")
                .replaceAll("<[^>]+>", " ")
                .replaceAll("&nbsp;", " ")
                .replaceAll("&amp;", "&")
                .replaceAll("&lt;", "<")
                .replaceAll("&gt;", ">")
                .replaceAll("\\s+", " ")
                .trim();
    }

    private String normalizeAuthMode(String authMode) {
        return "server".equals(StringUtils.defaultIfBlank(authMode, "client")) ? "server" : "client";
    }

    private String normalizeTransport(String transport) {
        String value = StringUtils.defaultIfBlank(transport, "streamable-http");
        if ("streamable_http".equals(value)) {
            return "streamable-http";
        }
        return value;
    }

    private List<String> parseStringList(String json) {
        if (StringUtils.isBlank(json)) {
            return new ArrayList<>();
        }
        try {
            return JsonUtils.toList(json, String.class);
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    private Map<String, String> sanitizeHeaders(Map<String, String> headers) {
        Map<String, String> result = new HashMap<>();
        if (headers != null) {
            headers.forEach((key, value) -> {
                if (StringUtils.isNotBlank(key) && value != null) {
                    result.put(key, value);
                }
            });
        }
        return result;
    }

    private RpcResponse postRpc(String endpoint, Map<String, String> headers, String sessionId,
                                Integer id, String method, Object params) throws Exception {
        Map<String, Object> payload = id == null
                ? Map.of("jsonrpc", "2.0", "method", method)
                : Map.of("jsonrpc", "2.0", "id", id, "method", method, "params", params);

        HttpRequest.Builder builder = HttpRequest.newBuilder()
                .uri(URI.create(endpoint))
                .timeout(Duration.ofSeconds(30))
                .header("Accept", "application/json, text/event-stream")
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(OBJECT_MAPPER.writeValueAsString(payload)));
        headers.forEach(builder::header);
        if (StringUtils.isNotBlank(sessionId)) {
            builder.header("Mcp-Session-Id", sessionId);
        }

        HttpResponse<String> response = httpClient.send(builder.build(), HttpResponse.BodyHandlers.ofString());
        if (response.statusCode() == 401 || response.statusCode() == 403) {
            throw new IllegalStateException("Authentication failed: HTTP " + response.statusCode());
        }
        if (response.statusCode() < 200 || response.statusCode() >= 300) {
            throw new IllegalStateException("HTTP " + response.statusCode() + ": "
                    + StringUtils.abbreviate(response.body(), 500));
        }
        return new RpcResponse(parseRpcResponse(response.body()),
                response.headers().firstValue("Mcp-Session-Id").orElse(sessionId));
    }

    private JsonNode parseRpcResponse(String body) throws Exception {
        if (StringUtils.isBlank(body)) {
            throw new IllegalStateException("Empty MCP response");
        }
        if (body.strip().startsWith("{")) {
            return OBJECT_MAPPER.readTree(body);
        }
        for (String line : body.split("\\R")) {
            String value = line.trim();
            if (value.startsWith("data:")) {
                value = value.substring(5).trim();
                if (StringUtils.isNotBlank(value) && value.startsWith("{")) {
                    return OBJECT_MAPPER.readTree(value);
                }
            }
        }
        throw new IllegalStateException("Unsupported MCP response format");
    }

    private record RpcResponse(JsonNode body, String sessionId) {
    }

    @Override
    public List<Map<String, Object>> listDeviceAccounts(String macAddress) {
        List<McpDeviceAccountEntity> accounts = mcpDeviceAccountDao.selectList(
                new LambdaQueryWrapper<McpDeviceAccountEntity>()
                        .eq(McpDeviceAccountEntity::getMacAddress, macAddress));
        List<Map<String, Object>> result = new ArrayList<>();
        for (McpDeviceAccountEntity account : accounts) {
            McpServerEntity server = mcpServerDao.selectById(account.getServerId());
            Map<String, Object> item = new LinkedHashMap<>();
            item.put("id", account.getId());
            item.put("macAddress", account.getMacAddress());
            item.put("serverId", account.getServerId());
            item.put("serverName", server == null ? account.getServerId() : server.getName());
            item.put("username", account.getUsername());
            item.put("hasPassword", StringUtils.isNotBlank(account.getPasswordCipher()));
            item.put("hasToken", StringUtils.isNotBlank(account.getTokenCipher()));
            item.put("enabled", account.getEnabled());
            result.add(item);
        }
        return result;
    }

    @Override
    public List<Map<String, Object>> runtimeDeviceAccounts(String macAddress, List<String> authorizedIds) {
        List<McpDeviceAccountEntity> accounts = mcpDeviceAccountDao.selectList(
                new LambdaQueryWrapper<McpDeviceAccountEntity>()
                        .eq(McpDeviceAccountEntity::getMacAddress, macAddress)
                        .eq(McpDeviceAccountEntity::getEnabled, 1));
        Set<String> authorized = authorizedIds == null ? null : new HashSet<>(authorizedIds);
        List<Map<String, Object>> result = new ArrayList<>();
        for (McpDeviceAccountEntity account : accounts) {
            if (authorized != null && !authorized.contains(account.getServerId())) {
                continue;
            }
            Map<String, Object> item = new LinkedHashMap<>();
            item.put("serverId", account.getServerId());
            item.put("username", account.getUsername());
            item.put("passwordCipher", account.getPasswordCipher());
            item.put("tokenCipher", account.getTokenCipher());
            result.add(item);
        }
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveDeviceAccounts(String macAddress, List<DeviceAccountItem> accounts, Long userId) {
        if (StringUtils.isBlank(macAddress)) {
            throw new RenException(ErrorCode.PARAMS_GET_ERROR);
        }
        Map<String, McpDeviceAccountEntity> existingAccounts = mcpDeviceAccountDao.selectList(
                        new LambdaQueryWrapper<McpDeviceAccountEntity>()
                                .eq(McpDeviceAccountEntity::getMacAddress, macAddress))
                .stream()
                .collect(java.util.stream.Collectors.toMap(McpDeviceAccountEntity::getServerId, account -> account));
        mcpDeviceAccountDao.delete(new LambdaQueryWrapper<McpDeviceAccountEntity>()
                .eq(McpDeviceAccountEntity::getMacAddress, macAddress));
        if (accounts == null) {
            return;
        }
        Date now = new Date();
        for (DeviceAccountItem item : accounts) {
            String serverId = item.getServerId();
            String username = StringUtils.trimToEmpty(item.getUsername());
            String password = StringUtils.trimToEmpty(item.getPassword());
            String token = StringUtils.trimToEmpty(item.getToken());
            if (StringUtils.isBlank(serverId) || mcpServerDao.selectById(serverId) == null) {
                continue;
            }
            McpDeviceAccountEntity oldAccount = existingAccounts.get(serverId);
            boolean keepToken = StringUtils.isBlank(token) && oldAccount != null
                    && StringUtils.isNotBlank(oldAccount.getTokenCipher());
            boolean keepPassword = StringUtils.isBlank(password) && oldAccount != null
                    && StringUtils.isNotBlank(oldAccount.getPasswordCipher());
            boolean hasLegacyCredential = StringUtils.isNotBlank(username) && (StringUtils.isNotBlank(password) || keepPassword);
            if (!keepToken && StringUtils.isBlank(token) && !hasLegacyCredential) {
                continue;
            }
            McpDeviceAccountEntity account = new McpDeviceAccountEntity();
            account.setMacAddress(macAddress);
            account.setServerId(serverId);
            account.setUsername(StringUtils.isNotBlank(username)
                    ? username : (oldAccount == null ? null : oldAccount.getUsername()));
            account.setTokenCipher(StringUtils.isNotBlank(token)
                    ? encryptPassword(token)
                    : (keepToken ? oldAccount.getTokenCipher() : null));
            account.setPasswordCipher(StringUtils.isNotBlank(password)
                    ? encryptPassword(password)
                    : (keepPassword ? oldAccount.getPasswordCipher() : null));
            account.setEnabled(item.getEnabled() == null ? 1 : item.getEnabled());
            account.setCreator(userId);
            account.setCreateDate(now);
            account.setUpdater(userId);
            account.setUpdateDate(now);
            mcpDeviceAccountDao.insert(account);
        }
    }

    private List<McpServerDTO> toDtoList(List<McpServerEntity> entities) {
        Map<String, int[]> accountCounts = new HashMap<>();
        for (McpDeviceAccountEntity account : mcpDeviceAccountDao.selectList(null)) {
            int[] count = accountCounts.computeIfAbsent(account.getServerId(), key -> new int[2]);
            count[0]++;
            if (Integer.valueOf(1).equals(account.getEnabled())) {
                count[1]++;
            }
        }
        Map<String, Integer> agentCounts = new HashMap<>();
        for (AgentMcpServerEntity authorization : agentMcpServerDao.selectList(null)) {
            agentCounts.merge(authorization.getServerId(), 1, Integer::sum);
        }

        List<McpServerDTO> result = new ArrayList<>();
        for (McpServerEntity entity : entities) {
            McpServerDTO dto = new McpServerDTO();
            dto.setId(entity.getId());
            dto.setName(entity.getName());
            dto.setDescription(entity.getDescription());
            dto.setEndpoint(entity.getEndpoint());
            dto.setTransport(normalizeTransport(entity.getTransport()));
            dto.setCommand(entity.getCommand());
            dto.setArgs(parseStringList(entity.getArgsJson()));
            dto.setEnv(parseObject(entity.getEnvJson()).entrySet().stream().collect(java.util.stream.Collectors.toMap(java.util.Map.Entry::getKey, e -> String.valueOf(e.getValue()))));
            dto.setHeaders(parseHeaders(entity.getHeadersJson()));
            dto.setAuthMode(normalizeAuthMode(entity.getAuthMode()));
            dto.setAuthConfig(parseObject(entity.getAuthConfigJson()));
            dto.setTestUsername(entity.getTestUsername());
            dto.setHasTestPassword(StringUtils.isNotBlank(entity.getTestPasswordCipher()));
            dto.setHasTestToken(StringUtils.isNotBlank(entity.getTestTokenCipher()));
            int[] count = accountCounts.getOrDefault(entity.getId(), new int[2]);
            dto.setDeviceAccountCount(count[0]);
            dto.setEnabledDeviceAccountCount(count[1]);
            dto.setAgentCount(agentCounts.getOrDefault(entity.getId(), 0));
            dto.setEnabled(entity.getEnabled());
            result.add(dto);
        }
        return result;
    }

    private Map<String, Object> parseObject(String json) {
        if (StringUtils.isBlank(json)) {
            return new HashMap<>();
        }
        try {
            Map<?, ?> raw = JsonUtils.parseMap(json);
            Map<String, Object> result = new HashMap<>();
            if (raw != null) {
                raw.forEach((key, value) -> result.put(String.valueOf(key), value));
            }
            return result;
        } catch (Exception ignored) {
            return new HashMap<>();
        }
    }

    private String stringValue(Object value) {
        return value == null ? null : String.valueOf(value);
    }

    private String encryptPassword(String plain) {
        String secret = sysParamsService.getValue(Constant.SERVER_SECRET, false);
        try {
            byte[] key = MessageDigest.getInstance("SHA-256")
                    .digest((secret + ":mcp-device-password").getBytes(StandardCharsets.UTF_8));
            byte[] iv = new byte[12];
            new SecureRandom().nextBytes(iv);
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"), new GCMParameterSpec(128, iv));
            byte[] encrypted = cipher.doFinal(plain.getBytes(StandardCharsets.UTF_8));
            byte[] output = new byte[iv.length + encrypted.length];
            System.arraycopy(iv, 0, output, 0, iv.length);
            System.arraycopy(encrypted, 0, output, iv.length, encrypted.length);
            return java.util.Base64.getEncoder().encodeToString(output);
        } catch (Exception e) {
            throw new RuntimeException("Failed to encrypt MCP account password", e);
        }
    }

    private Map<String, String> parseHeaders(String headersJson) {
        Map<String, String> headers = new HashMap<>();
        if (StringUtils.isBlank(headersJson)) {
            return headers;
        }
        try {
            Map<?, ?> raw = JsonUtils.parseMap(headersJson);
            if (raw != null) {
                raw.forEach((key, value) -> headers.put(String.valueOf(key), value == null ? "" : String.valueOf(value)));
            }
        } catch (Exception ignored) {
        }
        return headers;
    }
}
