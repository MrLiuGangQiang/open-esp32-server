<template>
  <CustomDialog
    :visible.sync="visible"
    :title="$t('capability.agentAuthTitle')"
    width="860px"
    size="large"
    custom-class="agent-mcp-dialog"
    :confirm-loading="saving"
    :cancel-text="$t('common.cancel')"
    :confirm-text="$t('roleConfig.saveConfig')"
    @open="handleOpen"
    @confirm="save"
  >
    <div v-loading="loading" class="agent-mcp">
      <div class="mcp-auth-toolbar">
        <el-input
          v-model.trim="keyword"
          class="mcp-auth-search"
          size="small"
          clearable
          prefix-icon="el-icon-search"
          :placeholder="$t('capability.agentAuthSearch')"
        />
        <el-checkbox
          v-model="allSelected"
          class="select-all"
          :indeterminate="isIndeterminate"
          :disabled="!servers.length"
        >
          {{ $t('capability.selectAll') }}
        </el-checkbox>
        <span class="selected-count">
          {{ $t('capability.selectedCount', { selected: selected.length, total: servers.length }) }}
        </span>
      </div>

      <div class="mcp-auth-body">
        <aside class="service-pane">
          <div class="service-list">
            <div
              v-for="server in filteredServers"
              :key="server.id"
              class="service-item"
              :class="{ 'is-active': activeServerId === server.id }"
              role="button"
              tabindex="0"
              @click="selectServer(server.id)"
              @keydown.enter.prevent="selectServer(server.id)"
            >
              <span class="checkbox-wrap" @click.stop>
                <el-checkbox
                  :value="selected.includes(server.id)"
                  @change="value => toggleServer(server.id, value)"
                />
              </span>
              <div class="service-main">
                <div class="service-name" :title="server.name">{{ server.name }}</div>
              </div>
            </div>
            <el-empty
              v-if="!loading && !filteredServers.length"
              :description="$t('capability.noSearchResults')"
              :image-size="60"
            />
          </div>
        </aside>

        <section v-if="activeServer" class="detail-pane">
          <div class="detail-cards">
            <div class="compact-card">
              <div class="card-title">{{ activeServer.name }}</div>
              <div class="meta-grid">
                <span class="meta-label">{{ $t('capability.transport') }}</span>
                <span class="meta-value">{{ formatTransport(activeServer.transport) }}</span>

                <span class="meta-label">{{ $t('capability.authMode') }}</span>
                <span class="meta-value">{{ mcpAuthLabel(activeServer) }}</span>

                <span class="meta-label">{{ $t('capability.connection') }}</span>
                <span class="meta-value detail-break">{{ serverConnection(activeServer) }}</span>
              </div>
            </div>

            <div
              v-if="selected.includes(activeServer.id) && mcpAuthMode(activeServer) === 'client'"
              class="compact-card"
            >
              <div class="card-title">
                <span class="required-mark">*</span>{{ $t('capability.deviceToken') }}
              </div>
              <div v-if="!devices.length" class="credential-empty">
                {{ $t('capability.noDevicesForCredentials') }}
              </div>
              <div v-else class="token-list">
                <div v-for="device in devices" :key="device.macAddress" class="token-row">
                  <div class="token-device">
                    <span class="device-name">{{ device.alias || device.macAddress }}</span>
                    <span class="device-code">{{ device.macAddress }}</span>
                  </div>
                  <el-input
                    v-model="accountFor(device.macAddress, activeServer.id).token"
                    size="small"
                    show-password
                    autocomplete="new-password"
                    :class="{ 'token-error': credentialErrors[accountKey(activeServer.id, device.macAddress)] }"
                    :placeholder="accountFor(device.macAddress, activeServer.id).hasToken ? $t('capability.testTokenSavedKeep') : $t('capability.deviceTokenRequired')"
                    @input="clearTokenError(activeServer.id, device.macAddress)"
                  />
                </div>
              </div>
            </div>

            <div class="compact-card">
              <div class="card-title">{{ $t('capability.description') }}</div>
              <RichTextEditor
                class="rich-description"
                :value="activeServer.description"
                disabled
                :placeholder="$t('capability.description')"
              />
            </div>
          </div>
        </section>
        <section v-else class="detail-pane is-empty">
          <el-empty :description="$t('capability.empty')" :image-size="80" />
        </section>
      </div>
    </div>
  </CustomDialog>
</template>

<script>
import Api from "@/apis/api";
import CustomDialog from "./CustomDialog.vue";
import RichTextEditor from "@/components/RichTextEditor.vue";

export default {
  name: "AgentMcpDialog",
  components: { CustomDialog, RichTextEditor },
  props: {
    visible: { type: Boolean, default: false },
    agentId: { type: String, default: "" },
  },
  data() {
    return {
      loading: false,
      saving: false,
      servers: [],
      selected: [],
      devices: [],
      deviceAccounts: {},
      credentialErrors: {},
      keyword: "",
      activeServerId: "",
    };
  },
  computed: {
    filteredServers() {
      const keyword = this.keyword.toLowerCase();
      if (!keyword) return this.servers;
      return this.servers.filter(server => {
        const searchable = [server.name, this.plainDescription(server.description), server.endpoint]
          .filter(Boolean)
          .join(" ")
          .toLowerCase();
        return searchable.includes(keyword);
      });
    },
    activeServer() {
      return this.servers.find(server => server.id === this.activeServerId) || null;
    },
    allSelected: {
      get() {
        return this.servers.length > 0 && this.selected.length === this.servers.length;
      },
      set(value) {
        this.selected = value ? this.servers.map(item => item.id) : [];
        if (this.selected.length && !this.selected.includes(this.activeServerId)) {
          this.activeServerId = this.selected[0];
        }
      },
    },
    isIndeterminate() {
      return this.selected.length > 0 && this.selected.length < this.servers.length;
    },
  },
  methods: {
    handleOpen() {
      if (this.agentId) this.load();
    },
    formatTransport(transport) {
      if (transport === "stdio") return "STDIO";
      if (transport === "sse") return "SSE";
      return "HTTP";
    },
    plainDescription(value) {
      return String(value || "")
        .replace(/<\s*(?:br|\/p|\/div|\/li)[^>]*>/gi, "\n")
        .replace(/<[^>]+>/g, " ")
        .replace(/&nbsp;/gi, " ")
        .replace(/&amp;/gi, "&")
        .replace(/&lt;/gi, "<")
        .replace(/&gt;/gi, ">")
        .replace(/&quot;/gi, "\"")
        .replace(/&#39;/gi, "'")
        .split(/\n+/)
        .map(line => line.replace(/\s+/g, " ").trim())
        .filter(Boolean)
        .join("\n\n");
    },
    mcpAuthMode(server) {
      const mode = (server.authMode || "").toLowerCase();
      if (mode === "server" || mode === "client") return mode;
      const authType = ((server.authConfig || {}).authType || "").toLowerCase();
      if (authType === "cloudpivot_password") return "client";
      if (Object.keys(server.headers || {}).length) return "server";
      return "client";
    },
    mcpAuthLabel(server) {
      const mode = this.mcpAuthMode(server);
      if (mode === "server") return this.$t("capability.serverAuth");
      return this.$t("capability.clientAuth");
    },
    mcpAuthTag(server) {
      return this.mcpAuthMode(server) === "client" ? "warning" : "";
    },
    serverConnection(server) {
      if (server.transport === "stdio") {
        return [server.command, ...(server.args || [])].filter(Boolean).join(" ");
      }
      return server.endpoint || "-";
    },
    accountKey(serverId, macAddress) {
      return `${serverId}::${macAddress}`;
    },
    accountFor(macAddress, serverId) {
      const key = this.accountKey(serverId, macAddress);
      if (!this.deviceAccounts[key]) {
        this.$set(this.deviceAccounts, key, {
          macAddress,
          serverId,
          username: "",
          password: "",
          hasPassword: false,
          token: "",
          hasToken: false,
          enabled: 1,
        });
      }
      return this.deviceAccounts[key];
    },
    async loadDevices() {
      return new Promise((resolve, reject) => {
        Api.device.getAgentBindDevices(
          this.agentId,
          ({ data }) => {
            if (data.code === 0) resolve(data.data || []);
            else reject(new Error(data.msg || this.$t("capability.loadFailed")));
          },
          error => reject(new Error(error?.data?.msg || error?.message || this.$t("capability.loadFailed")))
        );
      });
    },
    async loadDeviceAccounts(macAddress) {
      return new Promise((resolve, reject) => {
        Api.model.getDeviceMcpAccounts(macAddress, ({ data }) => {
          if (data.code === 0) resolve(data.data || []);
          else reject(new Error(data.msg || this.$t("capability.loadFailed")));
        });
      });
    },
    initializeClientAccounts() {
      this.servers
        .filter(server => this.mcpAuthMode(server) === "client")
        .forEach(server => {
          this.devices.forEach(device => this.accountFor(device.macAddress, server.id));
        });
    },
    async load() {
      this.loading = true;
      this.activeServerId = "";
      this.deviceAccounts = {};
      try {
        const authResult = await new Promise((resolve, reject) => {
          Api.model.getAgentMcpAuthorization(this.agentId, ({ data }) => {
            if (data.code === 0) resolve(data);
            else reject(new Error(data.msg || this.$t("capability.loadFailed")));
          });
        });
        this.servers = authResult.data?.servers || [];
        this.selected = authResult.data?.authorizedServerIds || [];

        try {
          this.devices = await this.loadDevices();
        } catch (error) {
          this.devices = [];
          this.$message.warning(error.message || this.$t("capability.loadFailed"));
        }

        this.deviceAccounts = {};
        this.credentialErrors = {};
        if (this.devices.length) {
          const batches = await Promise.all(
            this.devices.map(async device => ({
              device,
              accounts: await this.loadDeviceAccounts(device.macAddress),
            }))
          );
          batches.forEach(({ device, accounts }) => {
            accounts.forEach(account => {
              this.$set(this.deviceAccounts, this.accountKey(account.serverId, device.macAddress), {
                macAddress: device.macAddress,
                serverId: account.serverId,
                username: account.username || "",
                password: "",
                hasPassword: account.hasPassword === true,
                token: "",
                hasToken: account.hasToken === true,
                enabled: account.enabled == null ? 1 : account.enabled,
              });
            });
          });
        }
        this.initializeClientAccounts();
        this.activeServerId = this.selected[0] || this.servers[0]?.id || "";

      } catch (error) {
        this.$message.error(error.message || this.$t("capability.loadFailed"));
      } finally {
        this.loading = false;
      }
    },
    clearTokenError(serverId, macAddress) {
      this.$delete(this.credentialErrors, this.accountKey(serverId, macAddress));
    },
    selectServer(serverId) {
      this.activeServerId = serverId;
    },
    toggleServer(serverId, checked) {
      this.selected = checked
        ? [...this.selected, serverId]
        : this.selected.filter(item => item !== serverId);
      this.activeServerId = serverId;
    },
    validateClientCredentials() {
      const clientServers = this.servers.filter(
        server => this.selected.includes(server.id) && this.mcpAuthMode(server) === "client"
      );
      if (!clientServers.length) return true;
      if (!this.devices.length) {
        this.$message.warning(this.$t("capability.noDevicesForCredentials"));
        return false;
      }
      for (const server of clientServers) {
        for (const device of this.devices) {
          const account = this.accountFor(device.macAddress, server.id);
          const key = this.accountKey(server.id, device.macAddress);
          const hasToken = String(account.token || "").trim() || account.hasToken === true;
          if (!hasToken) {
            this.$set(this.credentialErrors, key, true);
            this.activeServerId = server.id;
            this.$message.warning(
              `${this.$t("capability.deviceTokenRequired")}: ${server.name} / ${device.alias || device.macAddress}`
            );
            return false;
          }
          this.$delete(this.credentialErrors, key);
        }
      }
      return true;
    },
    async saveDeviceCredentials() {
      for (const device of this.devices) {
        const accounts = Object.values(this.deviceAccounts)
          .filter(account => account.macAddress === device.macAddress)
          .filter(account => String(account.token || "").trim() || account.hasToken === true)
          .map(account => ({
            serverId: account.serverId,
            username: String(account.username || "").trim(),
            password: account.password || "",
            token: account.token || "",
            enabled: account.enabled == null ? 1 : account.enabled,
          }));
        if (!accounts.length) continue;
        await new Promise((resolve, reject) => {
          Api.model.saveDeviceMcpAccounts(
            { macAddress: device.macAddress, accounts },
            ({ data }) => {
              if (data.code === 0) resolve(data);
              else reject(new Error(data.msg || this.$t("capability.saveFailed")));
            }
          );
        });
      }
    },
    async save() {
      if (!this.validateClientCredentials()) return;
      this.saving = true;
      try {
        await this.saveDeviceCredentials();
        await new Promise((resolve, reject) => {
          Api.model.saveAgentMcpAuthorization(this.agentId, [...this.selected], ({ data }) => {
            if (data.code === 0) resolve(data);
            else reject(new Error(data.msg || this.$t("capability.saveFailed")));
          });
        });

        this.$message.success(this.$t("capability.saveSuccess"));
        this.$emit("update:visible", false);
      } catch (error) {
        this.$message.error(error.message || this.$t("capability.saveFailed"));
      } finally {
        this.saving = false;
      }
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/styles/global.scss';

.agent-mcp {
  color: #606266;
  text-align: left;
}

.mcp-auth-toolbar {
  display: grid;
  grid-template-columns: minmax(0, 1fr) auto auto;
  align-items: center;
  gap: 12px;
  margin-bottom: 10px;
  text-align: left;
}

.mcp-auth-search {
  width: 260px;
}

.select-all {
  margin: 0;
  white-space: nowrap;
}

.selected-count {
  color: #909399;
  font-size: 12px;
  white-space: nowrap;
}

.mcp-auth-body {
  display: grid;
  grid-template-columns: 260px minmax(0, 1fr);
  min-height: 420px;
  border: 1px solid #e4e7ed;
  border-radius: 8px;
  overflow: hidden;
  background: #fff;
}

.service-pane {
  min-width: 0;
  border-right: 1px solid #e4e7ed;
  text-align: left;
}

.service-list {
  max-height: 520px;
  padding: 5px;
  overflow-y: auto;
  @include scrollbar-style;
}

.service-item {
  display: grid;
  grid-template-columns: auto minmax(0, 1fr);
  align-items: center;
  gap: 8px;
  padding: 9px 8px;
  border-radius: 6px;
  cursor: pointer;
  outline: none;
  text-align: left;
}

.service-item:hover {
  background: #f5f7fa;
}

.service-item.is-active {
  background: #eef3ff;
}

.checkbox-wrap {
  display: flex;
  align-items: center;
}

.service-main {
  min-width: 0;
}

.service-name {
  overflow: hidden;
  color: #303133;
  font-size: 13px;
  font-weight: 600;
  line-height: 20px;
  text-align: left;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.detail-pane {
  min-width: 0;
  max-height: 520px;
  padding: 10px 12px;
  overflow-y: auto;
  text-align: left;
  background: #f7f9fc;
  @include scrollbar-style;
}

.detail-pane.is-empty {
  display: flex;
  align-items: center;
  justify-content: center;
}

.detail-cards {
  display: flex;
  flex-direction: column;
  gap: 8px;
  min-width: 0;
}

.compact-card {
  min-width: 0;
  padding: 9px 11px;
  border: 1px solid #e4e7ed;
  border-radius: 6px;
  background: #fff;
  text-align: left;
}

.card-title {
  margin-bottom: 8px;
  color: #303133;
  font-size: 13px;
  font-weight: 600;
  line-height: 20px;
  text-align: left;
}

.required-mark {
  margin-right: 3px;
  color: #f56c6c;
}

.meta-grid {
  display: grid;
  grid-template-columns: 68px minmax(0, 1fr);
  align-items: start;
  gap: 5px 8px;
}

.meta-label {
  color: #909399;
  font-size: 12px;
  line-height: 20px;
  text-align: left;
  white-space: nowrap;
}

.meta-value {
  min-width: 0;
  color: #606266;
  font-size: 12px;
  line-height: 20px;
  text-align: left;
}

.detail-break {
  word-break: break-all;
}

.token-list {
  display: flex;
  flex-direction: column;
  gap: 7px;
}

.token-row {
  display: grid;
  grid-template-columns: minmax(118px, 0.58fr) minmax(0, 1fr);
  align-items: center;
  gap: 8px;
}

.token-device {
  min-width: 0;
  text-align: left;
}

.device-name {
  display: block;
  overflow: hidden;
  color: #303133;
  font-size: 12px;
  font-weight: 600;
  line-height: 18px;
  text-align: left;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.device-code {
  display: block;
  overflow: hidden;
  color: #909399;
  font-size: 11px;
  line-height: 16px;
  text-align: left;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.token-list :deep(.token-error .el-input__inner) {
  border-color: #f56c6c;
}

.credential-empty {
  padding: 8px 10px;
  border: 1px solid #faecd8;
  border-radius: 5px;
  background: #fdf6ec;
  color: #b88230;
  font-size: 12px;
  line-height: 1.5;
  text-align: left;
}

.rich-description {
  min-height: 100px;
}

.rich-description :deep(.rich-toolbar) {
  display: none;
}

.rich-description :deep(.rich-content) {
  min-height: 90px;
  max-height: 220px;
  padding: 8px 10px;
  font-size: 12px;
  line-height: 1.7;
  text-align: left;
}

.rich-description :deep(.rich-content p) {
  margin: 0 0 7px;
}

.rich-description :deep(.rich-content p:last-child) {
  margin-bottom: 0;
}

.rich-description :deep(.rich-content ul),
.rich-description :deep(.rich-content ol) {
  margin: 4px 0;
  padding-left: 18px;
}

.rich-description :deep(.rich-content strong),
.rich-description :deep(.rich-content b) {
  font-weight: 700;
}

::v-deep .agent-mcp-dialog .el-dialog__body {
  max-height: calc(100vh - 220px);
  padding: 16px 18px;
  overflow-y: auto;
}

::v-deep .agent-mcp-dialog .el-input__inner {
  border-radius: 4px;
}

@media (max-width: 900px) {
  .mcp-auth-toolbar {
    grid-template-columns: minmax(0, 1fr) auto;
  }

  .selected-count {
    grid-column: 1 / -1;
    justify-self: end;
  }

  .mcp-auth-body {
    grid-template-columns: 1fr;
  }

  .service-pane {
    border-right: 0;
    border-bottom: 1px solid #e4e7ed;
  }

  .service-list {
    max-height: 180px;
  }

  .detail-pane {
    max-height: none;
  }

  .token-row {
    grid-template-columns: 1fr;
    row-gap: 5px;
  }
}
</style>