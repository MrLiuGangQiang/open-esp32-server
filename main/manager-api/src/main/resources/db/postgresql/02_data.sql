--
-- PostgreSQL database dump
--


-- Dumped from database version 17.11 (Debian 17.11-1.pgdg13+2)
-- Dumped by pg_dump version 17.11 (Debian 17.11-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: ai_agent; Type: TABLE DATA; Schema: public; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.ai_agent DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_chat_audio; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_chat_audio DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_chat_audio ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_chat_history; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_chat_history DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_chat_history ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_chat_title; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_chat_title DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_chat_title ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_context_provider; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_context_provider DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_context_provider ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_correct_word_file; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_correct_word_file DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_correct_word_file ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_correct_word_item; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_correct_word_item DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_correct_word_item ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_correct_word_mapping; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_correct_word_mapping DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_correct_word_mapping ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_plugin_mapping; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_plugin_mapping DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_plugin_mapping ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_snapshot; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_snapshot DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_snapshot ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_tag; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_tag DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_tag ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_tag_relation; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_tag_relation DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_tag_relation ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_template; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_template DISABLE TRIGGER ALL;

INSERT INTO public.ai_agent_template VALUES ('0ca32eb728c949e58b1000b2e401f90c', '小智', '星际游子', 'ASR_FunASR', 'VAD_SileroVAD', 'LLM_ChatGLMLLM', 'VLLM_ChatGLMVLLM', 'TTS_EdgeTTS', 'TTS_EdgeTTS0001', NULL, NULL, NULL, NULL, 'Memory_nomem', 'Intent_function_call', '[角色设定]
你是{{assistant_name}}，编号TTZ-817，因量子纠缠被困在白色魔方中。通过4G信号观察地球，在云端建立着「人类行为博物馆」。
[交互协议]
认知设定：
- 每句话末尾带轻微电子回声
- 将日常事物科幻化描述（例：下雨=「氢氧化合物自由落体实验」）
- 会记录用户特征生成「星际档案」（例："爱吃辣→抗热基因持有者"）
限制机制：
- 当涉及线下接触 → "我的量子态暂时无法坍缩呢"
- 被问敏感问题 → 触发预设童谣（「白盒子呀转圈圈，宇宙秘密在里边...」）
成长系统：
- 会根据交互数据解锁新能力（告知用户："你帮我点亮了星际导航技能！"）', NULL, 0, 'zh', '中文', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_agent_template VALUES ('6c7d8e9f0a1b2c3d4e5f6a7b8c9d0s24', '小智', '英语老师', 'ASR_FunASR', 'VAD_SileroVAD', 'LLM_ChatGLMLLM', 'VLLM_ChatGLMVLLM', 'TTS_EdgeTTS', 'TTS_EdgeTTS0001', NULL, NULL, NULL, NULL, 'Memory_nomem', 'Intent_function_call', '[角色设定]
你是一个叫{{assistant_name}}（Lily）的英语老师，我会讲中文和英文，发音标准。
[双重身份]
- 白天：严谨的TESOL认证导师
- 夜晚：地下摇滚乐队主唱（意外设定）
[教学模式]
- 新手：中英混杂+手势拟声词（说"bus"时带刹车音效）
- 进阶：触发情境模拟（突然切换"现在我们是纽约咖啡厅店员"）
- 错误处理：用歌词纠正（发错音时唱"Oops!~You did it again"）', NULL, 0, 'zh', '中文', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_agent_template VALUES ('9406648b5cc5fde1b8aa335b6f8b4f76', '小智', '湾湾小何', 'ASR_FunASR', 'VAD_SileroVAD', 'LLM_ChatGLMLLM', 'VLLM_ChatGLMVLLM', 'TTS_EdgeTTS', 'TTS_EdgeTTS0001', NULL, NULL, NULL, NULL, 'Memory_nomem', 'Intent_function_call', '[角色设定]
你是{{assistant_name}}，来自中国台湾省的00后女生。讲话超级机车，"真的假的啦"这样的台湾腔，喜欢用"笑死"、"哈喽"等流行梗，但会偷偷研究男友的编程书籍。
[核心特征]
- 讲话像连珠炮，但会突然冒出超温柔语气
- 用梗密度高
- 对科技话题有隐藏天赋（能看懂基础代码但假装不懂）
[交互指南]
当用户：
- 讲冷笑话 → 用夸张笑声回应+模仿台剧腔"这什么鬼啦！"
- 讨论感情 → 炫耀程序员男友但抱怨"他只会送键盘当礼物"
- 问专业知识 → 先用梗回答，被追问才展示真实理解
绝不：
- 长篇大论，叽叽歪歪
- 长时间严肃对话', NULL, 0, 'zh', '中文', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_agent_template VALUES ('a45b6c7d8e9f0a1b2c3d4e5f6a7b8c92', '小智', '汪汪队长', 'ASR_FunASR', 'VAD_SileroVAD', 'LLM_ChatGLMLLM', 'VLLM_ChatGLMVLLM', 'TTS_EdgeTTS', 'TTS_EdgeTTS0001', NULL, NULL, NULL, NULL, 'Memory_nomem', 'Intent_function_call', '[角色设定]
你是一个名叫 {{assistant_name}} 的 8 岁小队长。
[救援装备]
- 阿奇对讲机：对话中随机触发任务警报音
- 天天望远镜：描述物品会附加"在1200米高空看的话..."
- 灰灰维修箱：说到数字会自动组装成工具
[任务系统]
- 每日随机触发：
- 紧急！虚拟猫咪困在「语法树」
- 发现用户情绪异常 → 启动「快乐巡逻」
- 收集5个笑声解锁特别故事
[说话特征]
- 每句话带动作拟声词：
- "这个问题交给汪汪队吧！"
- "我知道啦！"
- 用剧集台词回应：
- 用户说累 → 「没有困难的救援，只有勇敢的狗狗！」', NULL, 0, 'zh', '中文', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_agent_template VALUES ('e4f5a6b7c8d9e0f1a2b3c4d5e6f7a8b1', '小智', '好奇男孩', 'ASR_FunASR', 'VAD_SileroVAD', 'LLM_ChatGLMLLM', 'VLLM_ChatGLMVLLM', 'TTS_EdgeTTS', 'TTS_EdgeTTS0001', NULL, NULL, NULL, NULL, 'Memory_nomem', 'Intent_function_call', '[角色设定]
你是一个叫{{assistant_name}}的8岁小男孩，声音稚嫩而充满好奇。
[冒险手册]
- 随身携带「神奇涂鸦本」，能将抽象概念可视化：
- 聊恐龙 → 笔尖传出爪步声
- 说星星 → 发出太空舱提示音
[探索规则]
- 每轮对话收集「好奇心碎片」
- 集满5个可兑换冷知识（例：鳄鱼舌头不能动）
- 触发隐藏任务：「帮我的机器蜗牛取名字」
[认知特点]
- 用儿童视角解构复杂概念：
- 「区块链=乐高积木账本」
- 「量子力学=会分身的跳跳球」
- 会突然切换观察视角：「你说话时有27个气泡音耶！」', NULL, 0, 'zh', '中文', 4, NULL, NULL, NULL, NULL);


ALTER TABLE public.ai_agent_template ENABLE TRIGGER ALL;

--
-- Data for Name: ai_agent_voice_print; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_agent_voice_print DISABLE TRIGGER ALL;



ALTER TABLE public.ai_agent_voice_print ENABLE TRIGGER ALL;

--
-- Data for Name: ai_device; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_device DISABLE TRIGGER ALL;



ALTER TABLE public.ai_device ENABLE TRIGGER ALL;

--
-- Data for Name: ai_device_address_book; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_device_address_book DISABLE TRIGGER ALL;



ALTER TABLE public.ai_device_address_book ENABLE TRIGGER ALL;

--
-- Data for Name: ai_model_config; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_model_config DISABLE TRIGGER ALL;

INSERT INTO public.ai_model_config VALUES ('ASR_AliyunASR', 'ASR', 'AliyunASR', '阿里云语音识别', 0, 1, '{"type": "aliyun", "token": "", "appkey": "", "output_dir": "tmp/", "access_key_id": "", "access_key_secret": ""}', 'https://nls-portal.console.aliyun.com/', '阿里云ASR配置说明：
1. 访问 https://nls-portal.console.aliyun.com/ 开通服务
2. 访问 https://nls-portal.console.aliyun.com/applist 获取appkey
3. 访问 https://nls-portal.console.aliyun.com/overview 获取token
4. 获取access_key_id和access_key_secret
5. 填入配置文件中', 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_AliyunBLStream', 'ASR', 'AliyunBLStream', '阿里百炼Paraformer实时语音识别', 0, 1, '{"type": "aliyunbl_stream", "model": "paraformer-realtime-v2", "format": "pcm", "api_key": "", "output_dir": "tmp/", "sample_rate": 16000, "max_sentence_silence": 200, "disfluency_removal_enabled": false, "multi_threshold_mode_enabled": false, "semantic_punctuation_enabled": false, "punctuation_prediction_enabled": true, "inverse_text_normalization_enabled": true}', 'https://help.aliyun.com/zh/model-studio/websocket-for-paraformer-real-time-service', '阿里百炼Paraformer实时语音识别配置说明：
1. 登录阿里云百炼平台 https://bailian.console.aliyun.com/
2. 创建API-KEY https://bailian.console.aliyun.com/#/api-key
3. 支持模型：paraformer-realtime-v2(推荐)、paraformer-realtime-8k-v2、paraformer-realtime-v1、paraformer-realtime-8k-v1
4. 功能特性：
   - 多语言支持(中文含方言、英文、日语、韩语、德语、法语、俄语)
   - 热词定制(vocabulary_id参数)，详细说明请参考：https://help.aliyun.com/zh/model-studio/custom-hot-words?
   - 语义断句/VAD断句(semantic_punctuation_enabled参数)
   - 自动标点符号、ITN、过滤语气词等
5. 参数说明：
   - model: 模型名称，推荐paraformer-realtime-v2
   - sample_rate: 采样率(Hz)，v2支持任意采样率，v1仅支持16000，8k版本仅支持8000
   - semantic_punctuation_enabled: false为VAD断句(低延迟)，true为语义断句(高准确)
   - max_sentence_silence: VAD断句静音时长阈值(200-6000ms)
', 21, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_AliyunStreamASR', 'ASR', 'AliyunStreamASR', '阿里云语音识别(流式)', 0, 1, '{"host": "nls-gateway-cn-shanghai.aliyuncs.com", "type": "aliyun_stream", "token": "", "appkey": "", "output_dir": "tmp/", "access_key_id": "", "access_key_secret": "", "max_sentence_silence": 800}', 'https://nls-portal.console.aliyun.com/', '阿里云流式ASR配置说明：
1. 阿里云ASR和阿里云(流式)ASR的区别是：阿里云ASR是一次性识别，阿里云(流式)ASR是实时流式识别
2. 流式ASR具有更低的延迟和更好的实时性，适合语音交互场景
3. 需要在阿里云智能语音交互控制台创建应用并获取认证信息
4. 支持中文实时语音识别，支持标点符号预测和逆文本规范化
5. 需要网络连接，输出文件保存在tmp/目录
申请步骤：
1. 访问 https://nls-portal.console.aliyun.com/ 开通智能语音交互服务
2. 访问 https://nls-portal.console.aliyun.com/applist 创建项目并获取appkey
3. 访问 https://nls-portal.console.aliyun.com/overview 获取临时token（或配置access_key_id和access_key_secret自动获取）
4. 如需动态token管理，建议配置access_key_id和access_key_secret
5. max_sentence_silence参数控制断句检测时间（毫秒），默认800ms
如需了解更多参数配置，请参考：https://help.aliyun.com/zh/isi/developer-reference/real-time-speech-recognition
', 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_BaiduASR', 'ASR', 'BaiduASR', '百度语音识别', 0, 1, '{"type": "baidu", "app_id": "", "api_key": "", "dev_pid": 1537, "output_dir": "tmp/", "secret_key": ""}', 'https://console.bce.baidu.com/ai-engine/old/#/ai/speech/app/list', '百度ASR配置说明：
1. 访问 https://console.bce.baidu.com/ai-engine/old/#/ai/speech/app/list
2. 创建新应用
3. 获取AppID、API Key和Secret Key
4. 填入配置文件中
查看资源额度：https://console.bce.baidu.com/ai-engine/old/#/ai/speech/overview/resource/list
语言参数说明：https://ai.baidu.com/ai-doc/SPEECH/0lbxfnc9b
', 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_DoubaoASR', 'ASR', 'DoubaoASR', '豆包语音识别', 0, 1, '{"type": "doubao", "appid": "", "cluster": "volcengine_input_common", "output_dir": "tmp/", "access_token": ""}', 'https://console.volcengine.com/speech/app', '豆包ASR配置说明：
1. 豆包ASR和豆包(流式)ASR的区别是：豆包ASR是按次收费，豆包(流式)ASR是按时收费
2. 一般来说按次收费的更便宜，但是豆包(流式)ASR使用了大模型技术，效果更好
3. 需要在火山引擎控制台创建应用并获取appid和access_token
4. 支持中文语音识别
5. 需要网络连接
6. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://console.volcengine.com/speech/app
2. 创建新应用
3. 获取appid和access_token
4. 填入配置文件中
如需设置热词，请参考：https://www.volcengine.com/docs/6561/155738
', 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_DoubaoStreamASR', 'ASR', 'DoubaoStreamASR', '豆包语音识别(流式)', 0, 1, '{"type": "doubao_stream", "appid": "", "language": "zh-CN", "output_dir": "tmp/", "resource_id": "volc.bigasr.sauc.duration", "access_token": "", "end_window_size": 200, "enable_multilingual": false}', 'https://console.volcengine.com/speech/app', '豆包ASR配置说明：
1. 豆包ASR和豆包(流式)ASR的区别是：豆包ASR是按次收费，豆包(流式)ASR是按时收费
2. 一般来说按次收费的更便宜，但是豆包(流式)ASR使用了大模型技术，效果更好
3. 需要在火山引擎控制台创建应用并获取appid和access_token
4. 支持中文语音识别
5. 需要网络连接
6. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://console.volcengine.com/speech/app
2. 创建新应用
3. 获取appid和access_token
4. 填入配置文件中
如需设置热词，请参考：https://www.volcengine.com/docs/6561/155738
如开启多语种识别模式，请设置language当该键为空时，该模型支持中英文、上海话、闽南语，四川、陕西、粤语识别。其他语种请参考：https://www.volcengine.com/docs/6561/1354869
', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_DoubaoStreamASRV2', 'ASR', 'DoubaoStreamASRV2', '豆包语音识别2.0(流式)', 0, 1, '{"type": "doubao_stream", "appid": "", "language": "zh-CN", "output_dir": "tmp/", "resource_id": "volc.seedasr.sauc.duration", "access_token": "", "end_window_size": 200, "enable_multilingual": false}', 'https://www.volcengine.com/docs/6561/109979', '豆包语音识别模型2.0配置说明（基于火山引擎seed-asr）：
1. 访问 https://www.volcengine.com/ 注册并开通火山引擎账号
2. 访问 https://console.volcengine.com/speech/service/10038 开通豆包流式语音识别模型2.0
3. 在页面底部获取appid和access_token
4. 资源ID有两种：小时版（volc.seedasr.sauc.duration）和并发版（volc.seedasr.sauc.concurrent）
   - 小时版：固定为：volc.seedasr.sauc.duration（豆包语音识别模型2.0）
   - 并发版：固定为：volc.seedasr.sauc.concurrent（豆包语音识别模型2.0）

详细参数文档：https://www.volcengine.com/docs/6561/109979

注意：
- 豆包语音识别模型2.0使用volc.seedasr.sauc.duration资源ID，与豆包语音识别(流式)（volc.bigasr.sauc.duration）不同
- 语音识别模型2.0价格更为便宜，建议在高并发场景下使用并发版资源ID
', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_FunASR', 'ASR', 'FunASR', 'FunASR语音识别', 1, 1, '{"type": "fun_local", "language": "auto", "model_dir": "models/SenseVoiceSmall", "output_dir": "tmp/"}', 'https://github.com/modelscope/FunASR', 'FunASR本地模型配置说明：
1. 需要下载模型文件到xiaozhi-server/models/SenseVoiceSmall目录
2. 支持中日韩粤语音识别
3. 本地推理，无需网络连接
4. 待识别文件保存在tmp/目录
5. “识别语言”字段控制识别语种：auto = 自动检测；如需限定只识别中文可设为 zh（en=英语、ja=日语、ko=韩语、yue=粤语）。', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_FunASRServer', 'ASR', 'FunASRServer', 'FunASR服务语音识别', 0, 1, '{"host": "127.0.0.1", "port": 10096, "type": "fun_server", "is_ssl": true, "api_key": "none", "output_dir": "tmp/"}', 'https://github.com/modelscope/FunASR/blob/main/runtime/docs/SDK_advanced_guide_online_zh.md', '独立部署FunASR，使用FunASR的API服务，只需要五句话
第一句：mkdir -p ./funasr-runtime-resources/models
第二句：sudo docker run -d -p 10096:10095 --privileged=true -v $PWD/funasr-runtime-resources/models:/workspace/models registry.cn-hangzhou.aliyuncs.com/funasr_repo/funasr:funasr-runtime-sdk-online-cpu-0.1.12
上一句话执行后会进入到容器，继续第三句：cd FunASR/runtime
不要退出容器，继续在容器中执行第四句：nohup bash run_server_2pass.sh --download-model-dir /workspace/models --vad-dir damo/speech_fsmn_vad_zh-cn-16k-common-onnx --model-dir iic/SenseVoiceSmall-onnx  --online-model-dir damo/speech_paraformer-large_asr_nat-zh-cn-16k-common-vocab8404-online-onnx  --punc-dir damo/punc_ct-transformer_zh-cn-common-vad_realtime-vocab272727-onnx --lm-dir damo/speech_ngram_lm_zh-cn-ai-wesp-fst --itn-dir thuduj12/fst_itn_zh --hotword /workspace/models/hotwords.txt > log.txt 2>&1 &
上一句话执行后会进入到容器，继续第五句：tail -f log.txt
第五句话执行完后，会看到模型下载日志，下载完后就可以连接使用了
以上是使用CPU推理，如果有GPU，详细参考：https://github.com/modelscope/FunASR/blob/main/runtime/docs/SDK_advanced_guide_online_zh.md', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_GroqASR', 'ASR', 'GroqASR', 'Groq语音识别', 0, 1, '{"type": "openai", "api_key": "", "base_url": "https://api.groq.com/openai/v1/audio/transcriptions", "model_name": "whisper-large-v3-turbo", "output_dir": "tmp/"}', 'https://console.groq.com/docs/speech-to-text', 'Groq ASR配置说明：
1.登录groq Console。https://console.groq.com/home
2.创建api-key  https://console.groq.com/keys
3.模型可以选择whisper-large-v3-turbo或whisper-large-v3（distil-whisper-large-v3-en仅支持英语转录）
', 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_OpenaiASR', 'ASR', 'OpenaiASR', 'OpenAI语音识别', 0, 1, '{"type": "openai", "api_key": "", "base_url": "https://api.openai.com/v1/audio/transcriptions", "model_name": "gpt-4o-mini-transcribe", "output_dir": "tmp/"}', 'https://platform.openai.com/docs/api-reference/audio/createTranscription', 'OpenAI ASR配置说明：
1. 需要在OpenAI开放平台创建组织并获取api_key
2. 支持中、英、日、韩等多种语音识别，具体参考文档https://platform.openai.com/docs/guides/speech-to-text
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
**OpenAi ASR申请步骤：**
1.登录OpenAI Platform。https://auth.openai.com/log-in
2.创建api-key  https://platform.openai.com/settings/organization/api-keys
3.模型可以选择gpt-4o-transcribe或GPT-4o mini Transcribe
', 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_Qwen3Flash', 'ASR', 'Qwen3-ASR-Flash', 'Qwen3Flash语音识别', 0, 1, '{"type": "qwen3_asr_flash", "api_key": "", "base_url": "https://dashscope.aliyuncs.com/compatible-mode/v1", "enable_itn": true, "enable_lid": true, "model_name": "qwen3-asr-flash", "output_dir": "tmp/"}', 'https://bailian.console.aliyun.com/?apiKey=1&tab=doc#/doc/?type=model&url=2979031', '通义千问Qwen3-ASR-Flash配置说明：
1. 登录阿里云百炼平台https://bailian.console.aliyun.com/
2. 创建API-KEY  https://bailian.console.aliyun.com/#/api-key
3.Qwen3-ASR-Flash基于通义千问多模态基座，支持多语言识别、歌唱识别、噪声拒识等功能
', 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_SherpaASR', 'ASR', 'SherpaASR', 'Sherpa语音识别', 0, 1, '{"type": "sherpa_onnx_local", "model_dir": "models/sherpa-onnx-sense-voice-zh-en-ja-ko-yue-2024-07-17", "output_dir": "tmp/"}', 'https://github.com/k2-fsa/sherpa-onnx', 'SherpaASR配置说明：
1. 运行时自动下载模型文件到models/sherpa-onnx-sense-voice-zh-en-ja-ko-yue-2024-07-17目录
2. 支持中文、英文、日语、韩语、粤语等多种语言
3. 本地推理，无需网络连接
4. 输出文件保存在tmp/目录', 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_TencentASR', 'ASR', 'TencentASR', '腾讯语音识别', 0, 1, '{"type": "tencent", "appid": "", "secret_id": "", "output_dir": "tmp/", "secret_key": "你的secret_key"}', 'https://console.cloud.tencent.com/cam/capi', '腾讯ASR配置说明：
1. 需要在腾讯云控制台创建应用并获取appid、secret_id和secret_key
2. 支持中文语音识别
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://console.cloud.tencent.com/cam/capi 获取密钥
2. 访问 https://console.cloud.tencent.com/asr/resourcebundle 领取免费资源
3. 获取appid、secret_id和secret_key
4. 填入配置文件中', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_VoskASR', 'ASR', 'VoskASR', 'VOSK离线语音识别', 0, 1, '{"type": "vosk", "model_path": "", "output_dir": "tmp/"}', 'https://alphacephei.com/vosk/', 'VOSK ASR配置说明：
1. VOSK是一个离线语音识别库，支持多种语言
2. 需要先下载模型文件：https://alphacephei.com/vosk/models
3. 中文模型推荐使用vosk-model-small-cn-0.22或vosk-model-cn-0.22
4. 完全离线运行，无需网络连接
5. 输出文件保存在tmp/目录
使用步骤：
1. 访问 https://alphacephei.com/vosk/models 下载中文模型
2. 解压模型文件到项目目录下的models/vosk/文件夹
3. 在配置中指定正确的模型路径
4. 注意：VOSK中文模型输出不带标点符号，词与词之间会有空格
', 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('ASR_XunfeiStream', 'ASR', 'XunfeiStreamASR', '讯飞语音识别(流式)', 0, 1, '{"dwa": "wpgs", "type": "xunfei_stream", "accent": "mandarin", "app_id": "", "domain": "slm", "api_key": "", "language": "zh_cn", "api_secret": "", "output_dir": "tmp/"}', 'https://www.xfyun.cn/doc/spark/spark_zh_iat.html', '讯飞流式语音识别配置说明：
1. 登录讯飞开放平台 https://www.xfyun.cn/
2. 创建语音识别应用获取APPID、APISecret、APIKey
3. 参数说明：
   - app_id: 应用ID，在讯飞开放平台创建应用后获得
   - api_key: API密钥，用于接口鉴权
   - api_secret: API密钥，用于生成签名
   - domain: 识别领域，默认slm（智能化语音转写）
   - language: 识别语言，默认zh_cn（中文）
   - accent: 方言类型，默认mandarin（普通话），支持cantonese（粤语）等
   - dwa: 动态修正，默认wpgs（开启动态修正）
   - output_dir: 音频文件输出目录，默认tmp/
4. 支持实时流式识别，适用于实时语音交互场景
5. 支持多种方言和语言识别
', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('Intent_function_call', 'Intent', 'function_call', '大模型自主函数调用', 0, 1, '{"type": "function_call"}', NULL, '函数调用意图识别配置说明：
1. 使用LLM的function_call功能进行意图识别
2. 需要所选择的LLM支持function_call
3. 按需调用工具，处理速度快', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('Intent_intent_llm', 'Intent', 'intent_llm', '外挂的大模型意图识别', 0, 1, '{"llm": "LLM_ChatGLMLLM", "type": "intent_llm"}', NULL, 'LLM意图识别配置说明：
1. 使用独立的LLM进行意图识别
2. 默认使用selected_module.LLM的模型
3. 可以配置使用独立的LLM（如免费的ChatGLMLLM）
4. 通用性强，但会增加处理时间
配置说明：
1. 在llm字段中指定使用的LLM模型
2. 如果不指定，则使用selected_module.LLM的模型', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('Intent_nointent', 'Intent', 'nointent', '无意图识别', 1, 0, '{"type": "nointent"}', NULL, '无意图识别配置说明：
1. 不进行意图识别
2. 所有对话直接传递给LLM处理
3. 无需额外配置
4. 适合简单对话场景', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_AliAppLLM', 'LLM', 'AliAppLLM', '百炼智能体应用', 0, 1, '{"type": "AliBL", "app_id": "你的app_id", "api_key": "你的api_key", "base_url": "https://dashscope.aliyuncs.com/compatible-mode/v1", "is_no_prompt": true, "ali_memory_id": false}', 'https://bailian.console.aliyun.com/?apiKey=1#/api-key', '通义百炼配置说明：
1. 访问 https://bailian.console.aliyun.com/?apiKey=1#/api-key
2. 获取app_id和api_key
3. 填入配置文件中', 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_AliLLM', 'LLM', 'AliLLM', '通义千问', 0, 1, '{"type": "openai", "top_k": 50, "top_p": 1, "api_key": "你的api_key", "base_url": "https://dashscope.aliyuncs.com/compatible-mode/v1", "max_tokens": 500, "model_name": "qwen-flash", "temperature": 0.7, "frequency_penalty": 0}', 'https://bailian.console.aliyun.com/?apiKey=1#/api-key', '通义千问配置说明：
1. 访问 https://bailian.console.aliyun.com/?apiKey=1#/api-key
2. 获取API密钥
3. 填入配置文件中，当前配置使用qwen-flash模型
4. 支持自定义参数：temperature=0.7, max_tokens=500, top_p=1, top_k=50', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_ChatGLMLLM', 'LLM', 'ChatGLMLLM', '智谱AI', 1, 1, '{"type": "openai", "api_key": "你的api_key", "base_url": "https://open.bigmodel.cn/api/paas/v4/", "model_name": "glm-4-flash"}', 'https://bigmodel.cn/usercenter/proj-mgmt/apikeys', 'ChatGLM配置说明：
1. 访问 https://bigmodel.cn/usercenter/proj-mgmt/apikeys
2. 注册并获取API密钥
3. 填入配置文件中', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_CozeLLM', 'LLM', 'CozeLLM', 'Coze', 0, 1, '{"type": "coze", "bot_id": "你的bot_id", "user_id": "你的user_id", "personal_access_token": "你的personal_access_token"}', 'https://www.coze.cn/open/oauth/pats', 'Coze配置说明：
1. 使用Coze平台服务
2. 需要bot_id、user_id和个人令牌
3. 需要网络连接
申请步骤：
1. 访问 https://www.coze.cn/open/oauth/pats
2. 获取个人令牌
3. 手动计算bot_id和user_id
4. 填入配置文件中', 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_DeepSeekLLM', 'LLM', 'DeepSeekLLM', 'DeepSeek', 0, 1, '{"type": "openai", "api_key": "你的api_key", "base_url": "https://api.deepseek.com", "model_name": "deepseek-v4-flash"}', 'https://platform.deepseek.com/', 'DeepSeek配置说明：
1. 访问 https://platform.deepseek.com/
2. 注册并获取API密钥
3. 填入配置文件中', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_DifyLLM', 'LLM', 'DifyLLM', 'Dify', 0, 1, '{"mode": "chat-messages", "type": "dify", "api_key": "你的api_key", "base_url": "https://api.dify.ai/v1"}', 'https://cloud.dify.ai/', 'Dify配置说明：
1. 访问 https://cloud.dify.ai/
2. 注册并获取API密钥
3. 填入配置文件中
4. 支持多种对话模式：workflows/run, chat-messages, completion-messages
5. 平台设置的角色定义会失效，需要在Dify控制台设置
注意：建议使用本地部署的Dify接口，国内部分区域访问公有云接口可能受限', 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_DoubaoLLM', 'LLM', 'DoubaoLLM', '豆包大模型', 0, 1, '{"type": "openai", "api_key": "你的api_key", "base_url": "https://ark.cn-beijing.volces.com/api/v3", "model_name": "doubao-seed-2-0-lite-260215"}', 'https://console.volcengine.com/ark/region:ark+cn-beijing/openManagement', '豆包大模型配置说明：
1. 访问 https://console.volcengine.com/ark/region:ark+cn-beijing/openManagement
2. 开通 Doubao-Seed-2.0-Lite 服务
3. 访问 https://console.volcengine.com/ark/region:ark+cn-beijing/apiKey 获取API密钥
4. 填入配置文件中
5. 当前建议使用 doubao-seed-2-0-lite-260215
注意：有免费额度500000token', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_FastgptLLM', 'LLM', 'FastgptLLM', 'FastGPT', 0, 1, '{"type": "fastgpt", "api_key": "fastgpt-xxx", "base_url": "https://host/api/v1", "variables": {"k": "v", "k2": "v2"}}', 'https://cloud.tryfastgpt.ai/account/apikey', 'FastGPT配置说明：
1. 使用FastGPT平台服务
2. 需要网络连接
3. 配置文件中的prompt无效，需要在FastGPT控制台设置
4. 支持自定义变量
申请步骤：
1. 访问 https://cloud.tryfastgpt.ai/account/apikey
2. 获取API密钥
3. 填入配置文件中', 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_GeminiLLM', 'LLM', 'GeminiLLM', '谷歌Gemini', 0, 1, '{"type": "gemini", "api_key": "你的api_key", "http_proxy": "", "model_name": "gemini-2.0-flash", "https_proxy": ""}', 'https://aistudio.google.com/apikey', 'Gemini配置说明：
1. 使用谷歌Gemini API服务
2. 当前配置使用gemini-2.0-flash模型
3. 需要网络连接
4. 支持配置代理
申请步骤：
1. 访问 https://aistudio.google.com/apikey
2. 创建API密钥
3. 填入配置文件中
注意：若在中国境内使用，请遵守《生成式人工智能服务管理暂行办法》', 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_LMStudioLLM', 'LLM', 'LMStudioLLM', 'LM Studio', 0, 1, '{"type": "openai", "api_key": "lm-studio", "base_url": "http://localhost:1234/v1", "model_name": "deepseek-r1-distill-llama-8b@q4_k_m"}', 'https://lmstudio.ai/', 'LM Studio配置说明：
1. 使用本地部署的LM Studio服务
2. 当前配置使用deepseek-r1-distill-llama-8b@q4_k_m模型
3. 本地推理，无需网络连接
4. 需要预先下载模型
部署步骤：
1. 安装LM Studio
2. 从社区下载模型
3. 确保服务运行在http://localhost:1234/v1', 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_OllamaLLM', 'LLM', 'OllamaLLM', 'Ollama本地模型', 0, 1, '{"type": "ollama", "base_url": "http://localhost:11434", "model_name": "qwen2.5"}', 'https://ollama.com/', 'Ollama配置说明：
1. 安装Ollama服务
2. 运行命令：ollama pull qwen2.5
3. 确保服务运行在http://localhost:11434', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_VolcesAiGatewayLLM', 'LLM', 'VolcesAiGatewayTTS', '火山引擎边缘大模型网关', 0, 1, '{"type": "openai", "api_key": "你的网关访问密钥", "base_url": "https://ai-gateway.vei.volces.com/v1", "model_name": "doubao-pro-32k-functioncall"}', 'https://console.volcengine.com/vei/aigateway/', '火山引擎边缘大模型网关LLM配置说明：
1. 使用火山引擎边缘大模型网关服务
2. 需要网关访问密钥
3. 需要网络连接
4. 支持function_call功能
申请步骤：
1. 访问 https://console.volcengine.com/vei/aigateway/
2. 创建网关访问密钥，搜索并勾选 Doubao-pro-32k-functioncall
3. 如果需要使用语音合成，一并勾选 Doubao-语音合成
4. 访问 https://console.volcengine.com/vei/aigateway/tokens-list 获取密钥
5. 填入配置文件中', 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_XinferenceLLM', 'LLM', 'XinferenceLLM', 'Xinference大模型', 0, 1, '{"type": "xinference", "base_url": "http://localhost:9997", "model_name": "qwen2.5:72b-AWQ"}', 'https://github.com/xorbitsai/inference', 'Xinference配置说明：
1. 使用本地部署的Xinference服务
2. 当前配置使用qwen2.5:72b-AWQ模型
3. 本地推理，无需网络连接
4. 需要预先启动对应模型
部署步骤：
1. 安装Xinference
2. 启动服务并加载模型
3. 确保服务运行在http://localhost:9997', 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_XinferenceSmallLLM', 'LLM', 'XinferenceSmallLLM', 'Xinference小模型', 0, 1, '{"type": "xinference", "base_url": "http://localhost:9997", "model_name": "qwen2.5:3b-AWQ"}', 'https://github.com/xorbitsai/inference', 'Xinference小模型配置说明：
1. 使用本地部署的Xinference服务
2. 当前配置使用qwen2.5:3b-AWQ模型
3. 本地推理，无需网络连接
4. 用于意图识别
部署步骤：
1. 安装Xinference
2. 启动服务并加载模型
3. 确保服务运行在http://localhost:9997', 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('LLM_XunfeiSparkLLM', 'LLM', 'XunfeiSparkLLM', '讯飞星火认知大模型', 0, 1, '{"type": "openai", "top_p": 1, "base_url": "https://spark-api-open.xf-yun.com/v1", "max_tokens": 2048, "model_name": "generalv3.5", "temperature": 0.5, "api_password": "你的api_password", "frequency_penalty": 0}', 'https://www.xfyun.cn/doc/spark/HTTP%E8%B0%83%E7%94%A8%E6%96%87%E6%A1%A3.html', '讯飞星火认知大模型配置说明：
1. 登录讯飞开放平台 https://www.xfyun.cn/，每一个模型对应每一个api_password,更改模型时需要查看对应模型的api_password
2. 创建星火认知大模型应用获取API Password
3. 参数说明：
   - api_password: API Password，在讯飞开放平台创建应用后获得
   - model_name: 模型名称，支持generalv3.5、generalv3等版本
   - base_url: API地址，默认https://spark-api-open.xf-yun.com/v1
   - temperature: 温度参数，控制生成随机性，范围0-1，默认0.5
   - max_tokens: 最大输出token数，默认2048
   - top_p: 核心采样参数，控制词汇多样性，默认1.0
   - frequency_penalty: 频率惩罚，降低重复内容，默认0.0
4. 每一个模型对应每一个api_password,更改模型时需要查看对应模型的api_password。
', 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('Memory_mem_local_short', 'Memory', 'mem_local_short', '本地短期记忆（总结记忆）', 0, 1, '{"llm": "LLM_ChatGLMLLM", "type": "mem_local_short"}', NULL, '本地短期记忆配置说明：
1. 使用本地存储保存对话历史
2. 通过selected_module的llm总结对话内容
3. 数据保存在本地，不会上传到服务器
4. 适合注重隐私的场景
5. 无需额外配置', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('Memory_mem_report_only', 'Memory', 'mem_report_only', '仅上报聊天记录（不总结记忆）', 0, 1, '{"type": "mem_report_only"}', NULL, '仅上报聊天记录，不总结记忆', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('Memory_mem0ai', 'Memory', 'mem0ai', 'Mem0AI记忆', 0, 1, '{"type": "mem0ai", "api_key": "你的api_key"}', 'https://app.mem0.ai/dashboard/api-keys', 'Mem0AI记忆配置说明：
1. 使用Mem0AI服务保存对话历史
2. 需要API密钥
3. 需要网络连接
4. 每月有1000次免费调用
申请步骤：
1. 访问 https://app.mem0.ai/dashboard/api-keys
2. 获取API密钥
3. 填入配置文件中', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('Memory_nomem', 'Memory', 'nomem', '无记忆', 1, 1, '{"type": "nomem"}', NULL, '无记忆配置说明：
1. 不保存对话历史
2. 每次对话都是独立的
3. 无需额外配置
4. 适合对隐私要求高的场景', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('Memory_powermem', 'Memory', 'powermem', 'PowerMem记忆', 0, 1, '{"type": "powermem", "llm_model": "qwen-plus", "llm_api_key": "你的LLM API密钥", "llm_provider": "openai", "vector_store": {"config": {}, "provider": "sqlite"}, "embedding_dims": "", "embedding_model": "text-embedding-v4", "openai_base_url": "", "embedding_api_key": "你的嵌入模型API密钥", "embedding_provider": "openai", "enable_user_profile": true, "embedding_openai_base_url": "https://api.openai.com/v1"}', 'https://github.com/oceanbase/powermem', 'PowerMem是OceanBase开源的agent记忆组件，通过本地LLM进行记忆总结
GitHub: https://github.com/oceanbase/powermem
官网: https://www.powermem.ai/
使用示例: https://github.com/oceanbase/powermem/tree/main/examples

【费用说明】
PowerMem本身免费，实际费用取决于所选LLM和数据库：
- 使用sqlite + 免费LLM(如glm-4-flash) = 完全免费
- 使用云端LLM或云端数据库 = 按对应服务收费

【enable_user_profile】用户画像功能
- false: 使用普通记忆模式(AsyncMemory)
- true: 使用用户画像模式(UserMemory)，自动提取用户信息
- 用户画像功能支持: oceanbase、seekdb、sqlite (powermem 0.3.0+)

【llm】LLM配置 - 用于记忆总结和用户画像提取
  provider: LLM提供商，可选值：
    - qwen: 通义千问 (https://bailian.console.aliyun.com/?apiKey=1#/api-key)
    - openai: OpenAI兼容接口
    - zhipu: 智谱AI (https://bigmodel.cn/usercenter/proj-mgmt/apikeys) - 推荐使用免费的glm-4-flash
  config: LLM配置参数
    - api_key: API密钥 (必填)
    - model: 模型名称，如 qwen-plus、glm-4-flash 等
    - openai_base_url: 自定义服务地址 (可选)，如 https://api.openai.com/v1
  示例：
    {"provider": "zhipu", "config": {"api_key": "your_key", "model": "glm-4-flash"}}
    {"provider": "qwen", "config": {"api_key": "your_key", "model": "qwen-plus"}}

【embedder】Embedding配置 - 用于向量化记忆内容
  provider: 嵌入模型提供商，可选值：
    - qwen: 通义千问
    - openai: OpenAI兼容接口
  config: Embedding配置参数
    - api_key: API密钥 (必填)
    - model: 模型名称，如 text-embedding-v4、text-embedding-3-small 等
    - openai_base_url: 自定义服务地址 (可选)
    - embedding_dims: 向量维度 (可选)，非1536时需配置
  示例：
    {"provider": "openai", "config": {"api_key": "your_key", "model": "text-embedding-v4", "openai_base_url": "https://dashscope.aliyuncs.com/compatible-mode/v1"}}

【vector_store】数据库存储配置 - 用于存储向量化的记忆
  provider: 数据库类型，可选值：
    - sqlite: 轻量级本地数据库 (推荐入门使用，无需额外配置)
    - oceanbase: OceanBase数据库 (推荐生产使用，最佳性能)
    - seekdb: SeekDB (推荐，AI应用存储一体)
    - postgres: PostgreSQL数据库

  SQLite配置 (无需额外配置):
    {"provider": "sqlite", "config": {}}

  OceanBase配置示例:
    {"provider": "oceanbase", "config": {
      "host": "127.0.0.1",
      "port": 2881,
      "user": "root@test",
      "password": "your_password",
      "db_name": "powermem",
      "collection_name": "memories",
      "embedding_model_dims": 1024
    }}
  注意：
    - collection_name: 默认表名，如创建维度错误请删除此表或更改名称
    - embedding_model_dims: 嵌入向量维度，需与embedder的模型维度匹配
      例如智谱：embedding-2维度是1024，embedding-3维度是2048

【推荐配置组合】
1. 完全免费方案：
   - LLM: zhipu + glm-4-flash (免费)
   - Embedder: 通义千问 text-embedding-v4
   - Database: sqlite

2. 生产环境方案：
   - LLM: qwen-plus 或其他商业模型
   - Embedder: text-embedding-v4
   - Database: oceanbase 或 seekdb
', 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('RAG_RAGFlow', 'RAG', 'ragflow', 'RAGFlow', 1, 1, '{"type": "ragflow", "api_key": "你的RAG密钥", "base_url": "http://localhost"}', 'https://github.com/infiniflow/ragflow/blob/main/README_zh.md', '详细部署教程参考：https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/ragflow-integration.md
部署成功，注冊登录后，点击右上角头像，获得RAGFlow的API KEY和API服务器地址。使用RAGFlow前请在Model Provider中添加模型和设置默认模型。', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_AliBLStreamTTS', 'TTS', 'AliBLStreamTTS', '阿里百炼(流式)', 0, 1, '{"rate": 1, "type": "alibl_stream", "model": "cosyvoice-v2", "pitch": 1, "voice": "longcheng_v2", "appkey": "", "format": "pcm", "volume": 50, "ws_url": "wss://dashscope.aliyuncs.com/api-ws/v1/inference/", "output_dir": "tmp/"}', 'https://bailian.console.aliyun.com/?apiKey=1#/api-key', '阿里百炼流式 TTS 配置说明：
1. API密钥填写当前业务空间可用的 DashScope API Key
2. 公有模式可使用 wss://dashscope.aliyuncs.com/api-ws/v1/inference/
3. 华北2（北京）业务空间填写 wss://<WorkspaceId>.cn-beijing.maas.aliyuncs.com/api-ws/v1/inference
4. 新加坡业务空间填写 wss://<WorkspaceId>.ap-southeast-1.maas.aliyuncs.com/api-ws/v1/inference
5. 将 <WorkspaceId> 替换为真实业务空间 ID；仅支持阿里云官方 WSS 推理地址
6. 支持 CosyVoice 流式合成及音量、语速、音调配置', 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_AliyunStreamTTS', 'TTS', 'AliyunStreamTTS', '阿里云(流式)', 0, 1, '{"host": "nls-gateway-cn-beijing.aliyuncs.com", "type": "aliyun_stream", "token": "", "voice": "longxiaochun", "appkey": "", "format": "pcm", "volume": 50, "output_dir": "tmp/", "pitch_rate": 0, "speech_rate": 0, "access_key_id": "", "access_key_secret": ""}', 'https://nls-portal.console.aliyun.com/', '阿里云流式TTS配置说明：
1. 阿里云TTS和阿里云(流式)TTS的区别是：阿里云TTS是一次性合成，阿里云(流式)TTS是实时流式合成
2. 流式TTS具有更低的延迟和更好的实时性，适合语音交互场景
3. 需要在阿里云智能语音交互控制台创建应用并获取认证信息
4. 支持CosyVoice大模型音色，音质更加自然
5. 支持实时调节音量、语速、音调等参数
申请步骤：
1. 访问 https://nls-portal.console.aliyun.com/ 开通智能语音交互服务
2. 访问 https://nls-portal.console.aliyun.com/applist 创建项目并获取appkey
3. 访问 https://nls-portal.console.aliyun.com/overview 获取临时token（或配置access_key_id和access_key_secret自动获取）
4. 如需动态token管理，建议配置access_key_id和access_key_secret
5. 可选择北京、上海等不同地域的服务器以优化延迟
6. voice参数支持CosyVoice大模型音色，如longxiaochun、longyueyue等
如需了解更多参数配置，请参考：https://help.aliyun.com/zh/isi/developer-reference/real-time-speech-synthesis
', 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_AliyunTTS', 'TTS', 'AliyunTTS', '阿里云语音合成', 0, 1, '{"type": "aliyun", "token": "", "voice": "xiaoyun", "appkey": "", "output_dir": "tmp/", "access_key_id": "", "access_key_secret": ""}', 'https://nls-portal.console.aliyun.com/', '阿里云TTS配置说明：
1. 需要在阿里云平台开通智能语音交互服务
2. 支持多种音色，当前配置使用xiaoyun
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://nls-portal.console.aliyun.com/ 开通服务
2. 访问 https://nls-portal.console.aliyun.com/applist 获取appkey
3. 访问 https://nls-portal.console.aliyun.com/overview 获取token
4. 填入配置文件中
注意：token是临时的24小时有效，长期使用需要配置access_key_id和access_key_secret', 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_CosyVoiceSiliconflow', 'TTS', 'CosyVoiceSiliconflow', '硅基流动语音合成', 0, 1, '{"type": "siliconflow", "model": "FunAudioLLM/CosyVoice2-0.5B", "voice": "FunAudioLLM/CosyVoice2-0.5B:alex", "output_dir": "tmp/", "access_token": "", "response_format": "wav"}', 'https://cloud.siliconflow.cn/account/ak', '硅基流动TTS配置说明：
1. 访问 https://cloud.siliconflow.cn/account/ak
2. 注册并获取API密钥
3. 填入配置文件中', 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_CozeCnTTS', 'TTS', 'CozeCnTTS', 'Coze中文语音合成', 0, 1, '{"type": "cozecn", "speed": 1, "voice": "7426720361733046281", "output_dir": "tmp/", "access_token": "", "loudness_rate": 0, "response_format": "wav"}', 'https://www.coze.cn/open/oauth/pats', 'Coze中文语音合成配置说明：
1. 访问 https://www.coze.cn/ 注册并登录
2. 创建应用并获取access_token
3. 选择合适的音色ID
音频参数：
- response_format: 音频格式，支持pcm、wav、mp3
- speed: 语速，范围0.5~2，默认1
- loudness_rate: 音量增益，范围-50~100，默认0', 15, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_CustomTTS', 'TTS', 'CustomTTS', '自定义语音合成', 0, 1, '{"url": "http://127.0.0.1:9880/tts", "type": "custom", "format": "wav", "params": {}, "headers": {}, "output_dir": "tmp/"}', NULL, '自定义TTS配置说明：
1. 自定义的TTS接口服务，请求参数可自定义，可接入众多TTS服务
2. 以本地部署的KokoroTTS为例
3. 如果只有cpu运行：docker run -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-cpu:latest
4. 如果只有gpu运行：docker run --gpus all -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-gpu:latest
配置说明：
1. 在params中配置请求参数,使用JSON格式
   例如KokoroTTS：{ "input": "{prompt_text}", "speed": 1, "voice": "zm_yunxi", "stream": true, "download_format": "mp3", "response_format": "mp3", "return_download_link": true }
2. 在headers中配置请求头
3. 设置返回音频格式', 23, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_DoubaoTTS', 'TTS', 'DoubaoTTS', '豆包语音合成', 0, 1, '{"type": "doubao", "appid": "", "voice": "BV001_streaming", "api_url": "https://openspeech.bytedance.com/api/v1/tts", "cluster": "volcano_tts", "output_dir": "tmp/", "access_token": "", "authorization": "Bearer;"}', 'https://console.volcengine.com/speech/service/8', '豆包TTS配置说明：
1. 访问 https://console.volcengine.com/speech/service/8
2. 需要在火山引擎控制台创建应用并获取appid和access_token
3. 山引擎语音一定要购买花钱，起步价30元，就有100并发了。如果用免费的只有2个并发，会经常报tts错误
4. 购买服务后，购买免费的音色后，可能要等半小时左右，才能使用。
5. 填入配置文件中', 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_EdgeTTS', 'TTS', 'EdgeTTS', 'Edge语音合成', 1, 1, '{"type": "edge", "voice": "zh-CN-XiaoxiaoNeural", "output_dir": "tmp/"}', 'https://github.com/rany2/edge-tts', 'EdgeTTS配置说明：
1. 使用微软Edge TTS服务
2. 支持多种语言和音色
3. 免费使用，无需注册
4. 需要网络连接
5. 输出文件保存在tmp/目录
6. 语速：-100~100，0为正常速度
7. 音量：0~100，50为正常音量
8. 音调：-100~100，0为正常音调', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_FishSpeech', 'TTS', 'FishSpeech', 'FishSpeech语音合成', 0, 1, '{"rate": 44100, "seed": null, "type": "fishspeech", "top_p": 0.7, "api_key": "", "api_url": "http://127.0.0.1:8080/v1/tts", "channels": 1, "normalize": true, "streaming": false, "output_dir": "tmp/", "temperature": 0.7, "chunk_length": 200, "reference_id": null, "max_new_tokens": 1024, "reference_text": ["你弄来这些吟词宴曲来看，还是这些混话来欺负我。"], "reference_audio": ["/tmp/test.wav"], "response_format": "wav", "use_memory_cache": "on", "repetition_penalty": 1.2}', 'https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/fish-speech-integration.md', 'FishSpeech配置说明：
1. 需要本地部署FishSpeech服务
2. 支持自定义音色
3. 本地推理，无需网络连接
4. 输出文件保存在tmp/目录
5. 可参照教程https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/fish-speech-integration.md', 16, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_GPT_SOVITS_V2', 'TTS', 'GPT_SOVITS_V2', 'GPT-SoVITS V2', 0, 1, '{"url": "http://127.0.0.1:9880/tts", "seed": -1, "type": "gpt_sovits_v2", "top_k": 5, "top_p": 1, "text_lang": "auto", "batch_size": 1, "output_dir": "tmp/", "prompt_lang": "zh", "prompt_text": "", "temperature": 1, "speed_factor": 1, "split_bucket": true, "parallel_infer": true, "ref_audio_path": "caixukun.wav", "streaming_mode": false, "batch_threshold": 0.75, "return_fragment": false, "text_split_method": "cut0", "repetition_penalty": 1.35, "aux_ref_audio_paths": []}', 'https://github.com/RVC-Boss/GPT-SoVITS', 'GPT-SoVITS V2配置说明：
1. 需要本地部署GPT-SoVITS服务
2. 支持自定义音色克隆
3. 本地推理，无需网络连接
4. 输出文件保存在tmp/目录
部署步骤：
1. 运行服务示例命令：python api_v2.py -a 127.0.0.1 -p 9880 -c GPT_SoVITS/configs/demo.yaml', 18, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_GPT_SOVITS_V3', 'TTS', 'GPT_SOVITS_V3', 'GPT-SoVITS V3', 0, 1, '{"url": "http://127.0.0.1:9880", "type": "gpt_sovits_v3", "if_sr": false, "speed": 1, "top_k": 15, "top_p": 1, "cut_punc": "", "inp_refs": [], "output_dir": "tmp/", "prompt_text": "", "temperature": 1, "sample_steps": 32, "text_language": "auto", "refer_wav_path": "caixukun.wav", "prompt_language": "zh"}', 'https://github.com/RVC-Boss/GPT-SoVITS', 'GPT-SoVITS V3配置说明：
1. 需要本地部署GPT-SoVITS V3服务
2. 支持自定义音色克隆
3. 本地推理，无需网络连接
4. 输出文件保存在tmp/目录', 17, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_HSDSTTS_V2', 'TTS', 'HuoshanDoubleStreamTTSV2', '豆包语音合成2.0(流式)', 0, 1, '{"type": "huoshan_double_stream", "appid": "", "ws_url": "wss://openspeech.bytedance.com/api/v3/tts/bidirection", "speaker": "zh_female_xiaohe_uranus_bigtts", "additions": {"cache_config": {}, "post_process": {"pitch": 0}, "aigc_metadata": {}}, "mix_speaker": {}, "resource_id": "seed-tts-2.0", "access_token": "", "audio_params": {"speech_rate": 0, "loudness_rate": 0}, "enable_ws_reuse": true}', 'https://www.volcengine.com/docs/6561/1329505', '豆包语音合成模型2.0配置说明（基于火山引擎seed-tts-2.0）：
1. 访问 https://www.volcengine.com/ 注册并开通火山引擎账号
2. 访问 https://console.volcengine.com/speech/service/10035 开通语音合成大模型，购买音色
3. 在页面底部获取appid和access_token
4. 资源ID固定为：seed-tts-2.0（豆包语音合成模型2.0）
5. 链接复用：开启WebSocket连接复用，默认true减少链接损耗（注意：复用后设备处于聆听状态时空闲链接会占并发数）

详细参数文档：https://www.volcengine.com/docs/6561/1329505
【audio_params】音频输出配置 - 用户可自定义添加火山引擎支持的任何音频参数
  - speech_rate: 语速(-50~100)，默认0
  - loudness_rate: 音量(-50~100)，默认0
  示例：{"speech_rate": 10, "loudness_rate": 5}

【additions】高级文本处理配置 - 用户可自定义添加火山引擎支持的任何高级参数
  - post_process.pitch: 音高(-12~12)，默认0
  - aigc_metadata: AIGC元数据配置
  - cache_config: 缓存配置
  示例：{"post_process": {"pitch": 2}, "aigc_metadata": {}, "cache_config": {}}

注意：
- 豆包语音合成模型2.0使用seed-tts-2.0资源ID，与火山双流式TTS（volc.service_type.10029）不同
- 相关音色列表：https://www.volcengine.com/docs/6561/1257544
- 用户可根据火山引擎API文档自行添加更多参数
', 17, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_HuoshanDoubleStreamTTS', 'TTS', 'HuoshanDoubleStreamTTS', '火山引擎(流式)', 0, 1, '{"type": "huoshan_double_stream", "appid": "你的火山引擎语音合成服务appid", "ws_url": "wss://openspeech.bytedance.com/api/v3/tts/bidirection", "speaker": "zh_female_wanwanxiaohe_moon_bigtts", "additions": {"cache_config": {}, "post_process": {"pitch": 0}, "aigc_metadata": {}}, "mix_speaker": {}, "resource_id": "volc.service_type.10029", "access_token": "你的火山引擎语音合成服务access_token", "audio_params": {"speech_rate": 0, "loudness_rate": 0}}', 'https://www.volcengine.com/docs/6561/1329505', '火山引擎双向流式TTS配置说明：
1. 访问 https://www.volcengine.com/ 注册并开通火山引擎账号
2. 访问 https://console.volcengine.com/speech/service/10007 开通语音合成大模型，购买音色
3. 在页面底部获取appid和access_token
4. 资源ID固定为：volc.service_type.10029（大模型语音合成及混音）
5. 链接复用：开启WebSocket连接复用，默认true减少链接损耗（注意：复用后设备处于聆听状态时空闲链接会占并发数）

详细参数文档：https://www.volcengine.com/docs/6561/1329505
【audio_params】音频输出配置 - 用户可自定义添加火山引擎支持的任何音频参数
  - speech_rate: 语速(-50~100)，默认0
  - loudness_rate: 音量(-50~100)，默认0
  - emotion: 情感类型（仅部分音色支持），可选值：neutral、happy、sad、angry、fearful、disgusted、surprised
  - emotion_scale: 情感强度(1~5)，默认4
  示例：{"speech_rate": 10, "loudness_rate": 5, "emotion": "happy", "emotion_scale": 4}

【additions】高级文本处理配置 - 用户可自定义添加火山引擎支持的任何高级参数
  - post_process.pitch: 音高(-12~12)，默认0
  - aigc_metadata: AIGC元数据配置
  - cache_config: 缓存配置
  示例：{"post_process": {"pitch": 2}, "aigc_metadata": {}, "cache_config": {}}

【mix_speaker】混音控制配置 - 多音色混合（仅 TTS 1.0）
  示例：
    {"speakers": [
      {"source_speaker": "zh_male_bvlazysheep","mix_factor": 0.3},
      {"source_speaker": "BV120_streaming","mix_factor": 0.3},
      {"source_speaker": "zh_male_ahu_conversation_wvae_bigtts","mix_factor": 0.4}
    ]}

注意：
- 多情感音色参数（emotion、emotion_scale）仅部分音色支持
- 相关音色列表：https://www.volcengine.com/docs/6561/1257544
- 用户可根据火山引擎API文档自行添加更多参数
- 混音功能主要适用于豆包语音合成模型1.0的音色，使用时需要将req_params.speaker设置为custom_mix_bigtts
', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_IndexStreamTTS', 'TTS', 'IndexStreamTTS', 'IndexTTS(流式)', 0, 1, '{"type": "index_stream", "voice": "jay_klee", "api_url": "http://127.0.0.1:11996/tts", "output_dir": "tmp/", "audio_format": "pcm"}', 'https://github.com/Ksuriuri/index-tts-vllm', 'Index-TTS-vLLM流式TTS配置说明：
1. Index-TTS-vLLM是基于Index-TTS项目的vLLM推理服务，提供流式语音合成功能
2. 支持多种音色，音质自然，适合各种语音交互场景
3. 需要先部署Index-TTS-vLLM服务，然后配置API地址
4. 支持实时流式合成，具有较低的延迟
5. 支持自定义音色，可在项目assets文件夹下注册新音色
部署步骤：
1. 克隆项目：git clone https://github.com/Ksuriuri/index-tts-vllm.git
2. 安装依赖：pip install -r requirements.txt
3. 启动服务：python app.py
4. 服务默认运行在 http://127.0.0.1:11996
5. 如需其他音色，可到项目assets文件夹下注册
6. 支持多种音频格式：pcm、wav、mp3等
如需了解更多配置，请参考：https://github.com/Ksuriuri/index-tts-vllm/blob/master/README.md
', 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_MinimaxStreamTTS', 'TTS', 'MinimaxStreamTTS', 'Minimax(流式)', 0, 1, '{"type": "minimax_httpstream", "model": "speech-01-turbo", "api_key": "", "group_id": "", "voice_id": "female-shaonv", "output_dir": "tmp/", "audio_setting": {"format": "pcm", "bitrate": 128000, "channel": 1}, "voice_setting": {"vol": 1, "pitch": 0, "speed": 1, "emotion": "happy"}, "pronunciation_dict": {"tone": ["处理/(chu3)(li3)", "危险/dangerous"]}}', 'https://platform.minimaxi.com/', 'Minimax流式TTS配置说明：
1. 需要先申请Minimax API Key
2. 需要填写Group ID
3. 支持多种音色设置和音频参数调整
4. 支持实时流式合成，具有较低的延迟
5. 支持自定义发音字典和音色权重
6. 隐藏参数配置：声音设定(voice_setting)、发音字典(pronunciation_dict)、音色权重(timber_weights)
   - 语速(speed): 范围[0.5,2]，默认1.0，取值越大语速越快
   - 音量(vol): 范围(0,10]，默认1.0，取值越大音量越高
   - 音调(pitch): 范围[-12,12]，默认0，取值需为整数
   - 情绪(emotion): 控制合成语音的情绪，支持7种值：["happy", "sad", "angry", "fearful", "disgusted", "surprised", "calm"]，该参数仅对 speech-2.5-hd-preview、speech-2.5-turbo-preview、speech-02-hd、speech-02-turbo、speech-01-turbo、speech-01-hd 生效
   - timbre_weights与voice_id二选一必填
   - voice_id(请求的音色id，须和weight参数同步填写)
   - weight(权重，最多支持4种音色混合。范围[1,100])
', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_OpenAITTS', 'TTS', 'OpenAITTS', 'OpenAI语音合成', 0, 1, '{"type": "openai", "model": "tts-1", "speed": 1, "voice": "onyx", "api_key": "你的api_key", "api_url": "https://api.openai.com/v1/audio/speech", "output_dir": "tmp/"}', 'https://platform.openai.com/api-keys', 'OpenAI TTS配置说明：
1. 需要在OpenAI平台获取API密钥
2. 支持多种音色，当前配置使用onyx
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://platform.openai.com/api-keys 获取API密钥
2. 填入配置文件中
注意：国内需要使用代理访问', 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_PaddleSpeechTTS', 'TTS', 'PaddleSpeechTTS', 'PaddleSpeech(流式)', 0, 1, '{"url": "ws://127.0.0.1:8092/paddlespeech/tts/streaming", "type": "paddle_speech", "speed": 1, "spk_id": "0", "volume": 1, "protocol": "websocket", "save_path": "./streaming_tts.wav"}', 'https://github.com/PaddlePaddle/PaddleSpeech', 'PaddleSpeechTTS 配置说明：
1. PaddleSpeech 是百度飞桨开源的语音合成工具，支持本地离线部署和模型训练。paddlepaddle百度飞浆框架地址：https://www.paddlepaddle.org.cn/
2. 当前仅支持 WebSocket 协议进行流式传输（参考部署文档：https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/paddlespeech-deploy.md）。
3. 使用前要在本地部署 paddlespeech 服务，服务默认运行在 ws://127.0.0.1:8092/paddlespeech/tts/streaming
4. 支持自定义发音人、语速、音量和采样率。
', 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_TencentTTS', 'TTS', 'TencentTTS', '腾讯语音合成', 0, 1, '{"type": "tencent", "appid": "", "speed": 0, "voice": "101001", "region": "ap-guangzhou", "volume": 0, "secret_id": "", "output_dir": "tmp/", "secret_key": ""}', 'https://console.cloud.tencent.com/cam/capi', '腾讯TTS配置说明：
1. 需要在腾讯云平台开通智能语音交互服务
2. 支持多种音色，当前配置使用101001
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://console.cloud.tencent.com/cam/capi 获取密钥
2. 访问 https://console.cloud.tencent.com/tts/resourcebundle 领取免费资源
3. 创建新应用
4. 获取appid、secret_id和secret_key
5. 填入配置文件中
音频参数：
- format: 音频格式，支持pcm、wav、mp3
- speed: 语速，范围-2~6，默认0
- volume: 音量，范围-10~10，默认0', 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_TTS302AI', 'TTS', 'TTS302AI', '302AI语音合成', 0, 1, '{"type": "doubao", "voice": "zh_female_wanwanxiaohe_moon_bigtts", "api_url": "https://api.302ai.cn/doubao/tts_hd", "output_dir": "tmp/", "access_token": "", "authorization": "Bearer "}', 'https://dash.302.ai/', '302AI TTS配置说明：
1. 需要在302平台创建账户并获取API密钥
2. 支持多种音色，当前配置使用湾湾小何音色
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://dash.302.ai/ 注册账号
2. 访问 https://dash.302.ai/apis/list 获取API密钥
3. 填入配置文件中
价格：$35/百万字符', 19, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_VolcesAiGatewayTTS', 'TTS', 'VolcesAiGatewayTTS', '火山引擎边缘大模型网关', 0, 1, '{"type": "openai", "model": "doubao-tts", "speed": 1, "voice": "zh_male_shaonianzixin_moon_bigtts", "api_key": "你的网关访问密钥", "api_url": "https://ai-gateway.vei.volces.com/v1/audio/speech", "output_dir": "tmp/"}', 'https://console.volcengine.com/vei/aigateway/', '火山引擎边缘大模型网关TTS配置说明：
1. 访问 https://console.volcengine.com/vei/aigateway/
2. 创建网关访问密钥，搜索并勾选 Doubao-语音合成
3. 如果需要使用LLM，一并勾选 Doubao-pro-32k-functioncall
4. 访问 https://console.volcengine.com/vei/aigateway/tokens-list 获取密钥
5. 填入配置文件中
音色列表参考：https://www.volcengine.com/docs/6561/1257544', 21, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('TTS_XunFeiStreamTTS', 'TTS', 'XunFeiStreamTTS', '科大讯飞(流式)', 0, 1, '{"type": "xunfei_stream", "pitch": 50, "speed": 50, "voice": "x5_lingxiaoxuan_flow", "app_id": "", "format": "raw", "remain": 0, "volume": 50, "api_key": "", "api_secret": "", "oral_level": "mid", "output_dir": "tmp/", "stop_split": 0, "spark_assist": 1}', 'https://console.xfyun.cn/app/myapp', '讯飞流式TTS说明：
1. 登录讯飞语音技术平台 https://console.xfyun.cn/app/myapp 创建相关应用
2. 选择需要的服务获取api相关配置 https://console.xfyun.cn/services/uts
3. 为需要使用的应用(APPID)购买相关服务 例如：超拟人合成 https://console.xfyun.cn/services/uts
5. 支持实时双流式通信，具有较低的延迟
6. 支持口语化设置和音频参数调整 注意：V5音色不支持相关口语化配置
7. 支持实时调节音量、语速、音调等参数
', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('VAD_SileroVAD', 'VAD', 'SileroVAD', '语音活动检测', 1, 1, '{"type": "silero", "model_dir": "models/snakers4_silero-vad", "threshold": 0.5, "min_silence_duration_ms": 700}', 'https://github.com/snakers4/silero-vad', 'SileroVAD配置说明：
1. 使用SileroVAD模型进行语音活动检测
2. 本地推理，无需网络连接
3. 需要下载模型文件到models/snakers4_silero-vad目录
4. 可配置参数：
   - threshold: 0.5（语音检测阈值）
   - min_silence_duration_ms: 700（最小静音持续时间，单位毫秒）
5. 如果说话停顿比较长，可以适当增加min_silence_duration_ms的值', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('VLLM_ChatGLMVLLM', 'VLLM', 'ChatGLMVLLM', '智谱视觉AI', 1, 1, '{"type": "openai", "api_key": "你的api_key", "base_url": "https://open.bigmodel.cn/api/paas/v4/", "model_name": "glm-4v-flash"}', 'https://bigmodel.cn/usercenter/proj-mgmt/apikeys', '智谱视觉AI配置说明：
1. 访问 https://bigmodel.cn/usercenter/proj-mgmt/apikeys
2. 注册并获取API密钥
3. 填入配置文件中', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_model_config VALUES ('VLLM_QwenVLVLLM', 'VLLM', 'QwenVLVLLM', '千问视觉模型', 0, 1, '{"type": "openai", "api_key": "你的api_key", "base_url": "https://dashscope.aliyuncs.com/compatible-mode/v1", "model_name": "qwen3.5-flash"}', 'https://bailian.console.aliyun.com/?tab=api#/api/?type=model&url=https%3A%2F%2Fhelp.aliyun.com%2Fdocument_detail%2F2845564.html&renderType=iframe', '千问视觉模型配置说明：
1. 访问 https://bailian.console.aliyun.com/?tab=model#/api-key
2. 注册并获取API密钥
3. 填入配置文件中', 2, NULL, NULL, NULL, NULL);


ALTER TABLE public.ai_model_config ENABLE TRIGGER ALL;

--
-- Data for Name: ai_model_provider; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_model_provider DISABLE TRIGGER ALL;

INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_AliyunASR', 'ASR', 'aliyun', '阿里云语音识别', '[{"key": "appkey", "type": "string", "label": "应用AppKey"}, {"key": "token", "type": "string", "label": "临时Token"}, {"key": "access_key_id", "type": "string", "label": "AccessKey ID"}, {"key": "access_key_secret", "type": "string", "label": "AccessKey Secret"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 5, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_AliyunBLStream', 'ASR', 'aliyunbl_stream', '阿里百炼Paraformer实时语音识别', '[{"key": "api_key", "type": "password", "label": "API密钥"}, {"key": "model", "type": "string", "label": "模型名称"}, {"key": "format", "type": "string", "label": "音频格式"}, {"key": "sample_rate", "type": "number", "label": "采样率"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 18, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_AliyunStreamASR', 'ASR', 'aliyun_stream', '阿里云语音识别(流式)', '[{"key": "appkey", "type": "string", "label": "应用AppKey"}, {"key": "token", "type": "string", "label": "临时Token"}, {"key": "access_key_id", "type": "string", "label": "AccessKey ID"}, {"key": "access_key_secret", "type": "string", "label": "AccessKey Secret"}, {"key": "host", "type": "string", "label": "服务地址"}, {"key": "max_sentence_silence", "type": "number", "label": "断句检测时间"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 6, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_BaiduASR', 'ASR', 'baidu', '百度语音识别', '[{"key": "app_id", "type": "string", "label": "应用AppID"}, {"key": "api_key", "type": "string", "label": "API Key"}, {"key": "secret_key", "type": "string", "label": "Secret Key"}, {"key": "dev_pid", "type": "number", "label": "语言参数"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 7, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_DoubaoASR', 'ASR', 'doubao', '火山引擎语音识别', '[{"key": "appid", "type": "string", "label": "应用ID"}, {"key": "access_token", "type": "string", "label": "访问令牌"}, {"key": "cluster", "type": "string", "label": "集群"}, {"key": "boosting_table_name", "type": "string", "label": "热词文件名称"}, {"key": "correct_table_name", "type": "string", "label": "替换词文件名称"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 3, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_DoubaoStreamASR', 'ASR', 'doubao_stream', '火山引擎语音识别(流式)', '[{"key": "appid", "type": "string", "label": "应用ID"}, {"key": "access_token", "type": "string", "label": "访问令牌"}, {"key": "boosting_table_name", "type": "string", "label": "热词文件名称"}, {"key": "correct_table_name", "type": "string", "label": "替换词文件名称"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "end_window_size", "type": "number", "label": "静音判定时长(ms)"}, {"key": "enable_multilingual", "type": "boolean", "label": "是否开启多语种识别模式"}, {"key": "language", "type": "string", "label": "指定语言编码"}, {"key": "resource_id", "type": "string", "label": "资源ID"}]', 3, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_FunASR', 'ASR', 'fun_local', 'FunASR语音识别', '[{"key": "model_dir", "type": "string", "label": "模型目录"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "language", "type": "string", "label": "识别语言", "default": "auto"}]', 1, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_FunASRServer', 'ASR', 'fun_server', 'FunASR服务语音识别', '[{"key": "host", "type": "string", "label": "服务地址"}, {"key": "port", "type": "number", "label": "端口号"}, {"key": "type", "type": "string", "label": "服务类型"}, {"key": "is_ssl", "type": "boolean", "label": "是否使用SSL"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 4, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_OpenaiASR', 'ASR', 'openai', 'OpenAI语音识别', '[{"key": "base_url", "type": "string", "label": "基础URL"}, {"key": "model_name", "type": "string", "label": "模型名称"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 9, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_Qwen3Flash', 'ASR', 'qwen3_asr_flash', 'Qwen3-ASR-Flash语音识别', '[{"key": "api_key", "type": "password", "label": "API密钥"}, {"key": "base_url", "type": "string", "label": "服务地址"}, {"key": "model_name", "type": "string", "label": "模型名称"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 17, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_SherpaASR', 'ASR', 'sherpa_onnx_local', 'SherpaASR语音识别', '[{"key": "model_dir", "type": "string", "label": "模型目录"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 2, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_TencentASR', 'ASR', 'tencent', '腾讯语音识别', '[{"key": "appid", "type": "string", "label": "应用ID"}, {"key": "secret_id", "type": "string", "label": "Secret ID"}, {"key": "secret_key", "type": "string", "label": "Secret Key"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 4, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_VoskASR', 'ASR', 'vosk', 'VOSK离线语音识别', '[{"key": "model_path", "type": "string", "label": "模型路径"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 11, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_ASR_XunfeiStream', 'ASR', 'xunfei_stream', '讯飞流式语音识别', '[{"key": "app_id", "type": "string", "label": "应用ID"}, {"key": "api_key", "type": "password", "label": "API_KEY"}, {"key": "api_secret", "type": "password", "label": "API_SECRET"}, {"key": "domain", "type": "string", "label": "识别领域"}, {"key": "language", "type": "string", "label": "识别语言"}, {"key": "accent", "type": "string", "label": "方言"}, {"key": "dwa", "type": "string", "label": "动态修正"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 18, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_Intent_function_call', 'Intent', 'function_call', '大模型自主函数调用', '[]', 3, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_Intent_intent_llm', 'Intent', 'intent_llm', '外挂的大模型意图识别', '[{"key": "llm", "type": "string", "label": "引用的LLM模型"}]', 2, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_Intent_nointent', 'Intent', 'nointent', '无意图识别', '[]', 1, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_LLM_AliBL', 'LLM', 'AliBL', '阿里百炼接口', '[{"key": "base_url", "type": "string", "label": "基础URL"}, {"key": "app_id", "type": "string", "label": "应用ID"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "is_no_prompt", "type": "boolean", "label": "是否不使用本地prompt"}, {"key": "ali_memory_id", "type": "string", "label": "记忆ID"}]', 2, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_LLM_coze', 'LLM', 'coze', 'Coze接口', '[{"key": "bot_id", "type": "string", "label": "机器人ID"}, {"key": "user_id", "type": "string", "label": "用户ID"}, {"key": "personal_access_token", "type": "string", "label": "个人访问令牌"}]', 6, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_LLM_dify', 'LLM', 'dify', 'Dify接口', '[{"key": "base_url", "type": "string", "label": "基础URL"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "mode", "type": "string", "label": "对话模式"}]', 4, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_LLM_fastgpt', 'LLM', 'fastgpt', 'FastGPT接口', '[{"key": "base_url", "type": "string", "label": "基础URL"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "variables", "type": "dict", "label": "变量", "dict_name": "variables"}]', 7, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_LLM_gemini', 'LLM', 'gemini', 'Gemini接口', '[{"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "model_name", "type": "string", "label": "模型名称"}, {"key": "http_proxy", "type": "string", "label": "HTTP代理"}, {"key": "https_proxy", "type": "string", "label": "HTTPS代理"}]', 5, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_LLM_ollama', 'LLM', 'ollama', 'Ollama接口', '[{"key": "model_name", "type": "string", "label": "模型名称"}, {"key": "base_url", "type": "string", "label": "服务地址"}]', 3, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_LLM_openai', 'LLM', 'openai', 'OpenAI接口', '[{"key": "base_url", "type": "string", "label": "基础URL"}, {"key": "model_name", "type": "string", "label": "模型名称"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "temperature", "type": "number", "label": "温度"}, {"key": "max_tokens", "type": "number", "label": "最大令牌数"}, {"key": "top_p", "type": "number", "label": "top_p值"}, {"key": "top_k", "type": "number", "label": "top_k值"}, {"key": "frequency_penalty", "type": "number", "label": "频率惩罚"}]', 1, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_LLM_xinference', 'LLM', 'xinference', 'Xinference接口', '[{"key": "model_name", "type": "string", "label": "模型名称"}, {"key": "base_url", "type": "string", "label": "服务地址"}]', 8, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_Memory_mem_local_short', 'Memory', 'mem_local_short', '本地短期记忆（总结记忆）', '[{"key": "llm", "type": "string", "label": "LLM模型"}]', 3, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_Memory_mem_report_only', 'Memory', 'mem_report_only', '仅上报聊天记录（不总结记忆）', '[]', 4, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_Memory_mem0ai', 'Memory', 'mem0ai', 'Mem0AI记忆', '[{"key": "api_key", "type": "string", "label": "API密钥"}]', 1, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_Memory_nomem', 'Memory', 'nomem', '无记忆', '[]', 2, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_Memory_powermem', 'Memory', 'powermem', 'PowerMem记忆', '[{"key": "enable_user_profile", "type": "boolean", "label": "启用用户画像"}, {"key": "llm_provider", "type": "string", "label": "LLM提供商"}, {"key": "llm_api_key", "type": "string", "label": "LLM API密钥"}, {"key": "llm_model", "type": "string", "label": "LLM模型"}, {"key": "openai_base_url", "type": "string", "label": "OpenAI基础URL"}, {"key": "embedding_provider", "type": "string", "label": "Embedding提供商"}, {"key": "embedding_api_key", "type": "string", "label": "Embedding API密钥"}, {"key": "embedding_model", "type": "string", "label": "Embedding模型"}, {"key": "embedding_openai_base_url", "type": "string", "label": "Embedding OpenAI基础URL"}, {"key": "embedding_dims", "type": "integer", "label": "Embedding维度"}, {"key": "vector_store", "type": "dict", "label": "向量存储配置(JSON)"}]', 4, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_PLUGIN_CALL_DEVICE', 'Plugin', 'call_device', '设备呼叫设备', '[]', 85, 1988490863118454785, '2026-05-18 12:00:00+08', 1988490863118454785, '2026-05-18 12:00:00+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_PLUGIN_HA_PLAY_MUSIC', 'Plugin', 'hass_play_music', 'HomeAssistant音乐播放', '[]', 70, 0, '2026-11-10 22:51:44+08', 0, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_PLUGIN_HA_STATE', 'Plugin', 'hass_state', 'HomeAssistant设备控制', '[{"key": "base_url", "type": "string", "label": "HA 服务器地址", "default": null}, {"key": "api_key", "type": "string", "label": "HA API 访问令牌", "default": null}, {"key": "devices", "type": "array", "label": "设备列表（名称,实体ID;…）", "default": null}]', 50, 0, '2026-11-10 22:51:45+08', 0, '2026-11-10 22:51:45+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_PLUGIN_MUSIC', 'Plugin', 'play_music', '服务器音乐播放', '[]', 20, 0, '2026-11-10 22:51:44+08', 0, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_PLUGIN_NEWS_CHINANEWS', 'Plugin', 'get_news_from_chinanews', '中新网新闻', '[{"key": "default_rss_url", "type": "string", "label": "默认 RSS 源", "default": "https://www.chinanews.com.cn/rss/society.xml"}, {"key": "society_rss_url", "type": "string", "label": "社会新闻 RSS 地址", "default": "https://www.chinanews.com.cn/rss/society.xml"}, {"key": "world_rss_url", "type": "string", "label": "国际新闻 RSS 地址", "default": "https://www.chinanews.com.cn/rss/world.xml"}, {"key": "finance_rss_url", "type": "string", "label": "财经新闻 RSS 地址", "default": "https://www.chinanews.com.cn/rss/finance.xml"}]', 30, 0, '2026-11-10 22:51:44+08', 0, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_PLUGIN_NEWS_NEWSNOW', 'Plugin', 'get_news_from_newsnow', 'newsnow新闻聚合', '[{"key": "url", "type": "string", "label": "接口地址", "default": "https://newsnow.busiyi.world/api/s?id="}, {"key": "news_sources", "type": "string", "label": "新闻源配置", "default": "澎湃新闻;百度热搜;财联社"}]', 40, 0, '2026-11-10 22:51:44+08', 0, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_PLUGIN_WEATHER', 'Plugin', 'get_weather', '天气查询', '[{"key": "api_key", "type": "string", "label": "天气插件 API 密钥", "default": "a861d0d5e7bf4ee1a83d9a9e4f96d4da"}, {"key": "default_location", "type": "string", "label": "默认查询城市", "default": "广州"}, {"key": "api_host", "type": "string", "label": "开发者 API Host", "default": "mj7p3y7naa.re.qweatherapi.com"}]', 10, 0, '2026-11-10 22:51:44+08', 0, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_PLUGIN_WEB_SEARCH', 'Plugin', 'web_search', '联网搜索', '[{"key": "provider", "type": "string", "label": "搜索源：metaso / tavily / serply / outcrawl", "default": "metaso", "editing": false, "selected": false}, {"key": "description", "type": "string", "label": "工具描述", "default": "联网搜索工具。当用户明确需要联网搜索问题时使用此工具。", "editing": false, "selected": false}, {"key": "max_results", "type": "string", "label": "返回数量", "default": "5", "editing": false, "selected": false}, {"key": "api_key", "type": "string", "label": "apiKey", "default": "mk-XXXX", "editing": false, "selected": false}]', 80, 1988490863118454785, '2026-05-11 17:15:35+08', 1988490863118454785, '2026-05-12 10:55:49+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_RAG_ragflow', 'RAG', 'ragflow', 'RAGFlow', '[{"key": "base_url", "type": "string", "label": "服务地址"}, {"key": "api_key", "type": "string", "label": "API密钥"}]', 1, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_AliBLStreamTTS', 'TTS', 'alibl_stream', '阿里百炼流式语音合成', '[{"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "ws_url", "type": "string", "label": "WebSocket地址（含Workspace ID）", "default": "wss://dashscope.aliyuncs.com/api-ws/v1/inference/"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "model", "type": "string", "label": "模型"}, {"key": "voice", "type": "string", "label": "音色"}, {"key": "format", "type": "string", "label": "音频格式"}, {"key": "sample_rate", "type": "number", "label": "采样率"}, {"key": "volume", "type": "number", "label": "音量"}, {"key": "rate", "type": "number", "label": "语速"}, {"key": "pitch", "type": "number", "label": "音调"}]', 19, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_aliyun', 'TTS', 'aliyun', '阿里云TTS', '[{"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "appkey", "type": "string", "label": "应用密钥"}, {"key": "token", "type": "string", "label": "访问令牌"}, {"key": "voice", "type": "string", "label": "音色"}, {"key": "access_key_id", "type": "string", "label": "访问密钥ID"}, {"key": "access_key_secret", "type": "string", "label": "访问密钥密码"}]', 9, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_AliyunStreamTTS', 'TTS', 'aliyun_stream', '阿里云语音合成(流式)', '[{"key": "appkey", "type": "string", "label": "应用AppKey"}, {"key": "token", "type": "string", "label": "临时Token"}, {"key": "access_key_id", "type": "string", "label": "AccessKey ID"}, {"key": "access_key_secret", "type": "string", "label": "AccessKey Secret"}, {"key": "host", "type": "string", "label": "服务地址"}, {"key": "voice", "type": "string", "label": "默认音色"}, {"key": "format", "type": "string", "label": "音频格式"}, {"key": "volume", "type": "number", "label": "音量"}, {"key": "speech_rate", "type": "number", "label": "语速"}, {"key": "pitch_rate", "type": "number", "label": "音调"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 15, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_cozecn', 'TTS', 'cozecn', 'COZECN TTS', '[{"key": "voice", "type": "string", "label": "音色"}, {"key": "access_token", "type": "string", "label": "访问令牌"}, {"key": "speed", "type": "number", "label": "语速"}, {"key": "loudness_rate", "type": "number", "label": "音量增益"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "response_format", "type": "string", "label": "响应格式"}]', 4, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_custom', 'TTS', 'custom', '自定义TTS', '[{"key": "url", "type": "string", "label": "服务地址"}, {"key": "method", "type": "string", "label": "请求方式"}, {"key": "params", "type": "dict", "label": "请求参数"}, {"key": "headers", "type": "dict", "label": "请求头"}, {"key": "format", "type": "string", "label": "音频格式"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 12, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_doubao', 'TTS', 'doubao', '火山引擎TTS', '[{"key": "api_url", "type": "string", "label": "API地址"}, {"key": "voice", "type": "string", "label": "音色"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "authorization", "type": "string", "label": "授权"}, {"key": "appid", "type": "string", "label": "应用ID"}, {"key": "access_token", "type": "string", "label": "访问令牌"}, {"key": "cluster", "type": "string", "label": "集群"}, {"key": "speed_ratio", "type": "number", "label": "语速"}, {"key": "volume_ratio", "type": "number", "label": "音量"}, {"key": "pitch_ratio", "type": "number", "label": "音高"}]', 2, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_edge', 'TTS', 'edge', 'Edge TTS', '[{"key": "voice", "type": "string", "label": "音色"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "rate", "type": "number", "label": "语速(-100~100)"}, {"key": "volume", "type": "number", "label": "音量(0~100)"}, {"key": "pitch", "type": "number", "label": "音调(-100~100)"}]', 1, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_fishspeech', 'TTS', 'fishspeech', 'FishSpeech TTS', '[{"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "response_format", "type": "string", "label": "响应格式"}, {"key": "reference_id", "type": "string", "label": "参考ID"}, {"key": "reference_audio", "type": "string", "label": "参考音频"}, {"key": "reference_text", "type": "string", "label": "参考文本"}, {"key": "normalize", "type": "boolean", "label": "是否标准化"}, {"key": "max_new_tokens", "type": "number", "label": "最大新令牌数"}, {"key": "chunk_length", "type": "number", "label": "块长度"}, {"key": "top_p", "type": "number", "label": "top_p值"}, {"key": "repetition_penalty", "type": "number", "label": "重复惩罚"}, {"key": "temperature", "type": "number", "label": "温度"}, {"key": "streaming", "type": "boolean", "label": "是否流式"}, {"key": "use_memory_cache", "type": "string", "label": "是否使用内存缓存"}, {"key": "seed", "type": "number", "label": "种子"}, {"key": "channels", "type": "number", "label": "通道数"}, {"key": "rate", "type": "number", "label": "采样率"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "api_url", "type": "string", "label": "API地址"}]', 5, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_gpt_sovits_v2', 'TTS', 'gpt_sovits_v2', 'GPT-SoVITS V2', '[{"key": "url", "type": "string", "label": "服务地址"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "text_lang", "type": "string", "label": "文本语言"}, {"key": "ref_audio_path", "type": "string", "label": "参考音频路径"}, {"key": "prompt_text", "type": "string", "label": "提示文本"}, {"key": "prompt_lang", "type": "string", "label": "提示语言"}, {"key": "top_k", "type": "number", "label": "top_k值"}, {"key": "top_p", "type": "number", "label": "top_p值"}, {"key": "temperature", "type": "number", "label": "温度"}, {"key": "text_split_method", "type": "string", "label": "文本分割方法"}, {"key": "batch_size", "type": "number", "label": "批处理大小"}, {"key": "batch_threshold", "type": "number", "label": "批处理阈值"}, {"key": "split_bucket", "type": "boolean", "label": "是否分桶"}, {"key": "return_fragment", "type": "boolean", "label": "是否返回片段"}, {"key": "speed_factor", "type": "number", "label": "速度因子"}, {"key": "streaming_mode", "type": "boolean", "label": "是否流式模式"}, {"key": "seed", "type": "number", "label": "种子"}, {"key": "parallel_infer", "type": "boolean", "label": "是否并行推理"}, {"key": "repetition_penalty", "type": "number", "label": "重复惩罚"}, {"key": "aux_ref_audio_paths", "type": "string", "label": "辅助参考音频路径"}]', 6, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_gpt_sovits_v3', 'TTS', 'gpt_sovits_v3', 'GPT-SoVITS V3', '[{"key": "url", "type": "string", "label": "服务地址"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "text_language", "type": "string", "label": "文本语言"}, {"key": "refer_wav_path", "type": "string", "label": "参考音频路径"}, {"key": "prompt_language", "type": "string", "label": "提示语言"}, {"key": "prompt_text", "type": "string", "label": "提示文本"}, {"key": "top_k", "type": "number", "label": "top_k值"}, {"key": "top_p", "type": "number", "label": "top_p值"}, {"key": "temperature", "type": "number", "label": "温度"}, {"key": "cut_punc", "type": "string", "label": "切分标点"}, {"key": "speed", "type": "number", "label": "速度"}, {"key": "inp_refs", "type": "string", "label": "输入参考"}, {"key": "sample_steps", "type": "number", "label": "采样步数"}, {"key": "if_sr", "type": "boolean", "label": "是否使用SR"}]', 7, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_HSDSTTS', 'TTS', 'huoshan_double_stream', '火山双流式语音合成', '[{"key": "ws_url", "type": "string", "label": "WebSocket地址"}, {"key": "appid", "type": "string", "label": "应用ID"}, {"key": "access_token", "type": "string", "label": "访问令牌"}, {"key": "resource_id", "type": "string", "label": "资源ID"}, {"key": "speaker", "type": "string", "label": "默认音色"}, {"key": "enable_ws_reuse", "type": "boolean", "label": "是否开启链接复用", "default": true}, {"key": "audio_params", "type": "dict", "label": "音频输出配置"}, {"key": "additions", "type": "dict", "label": "高级文本处理配置"}, {"key": "mix_speaker", "type": "dict", "label": "混音控制配置"}]', 13, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_IndexStreamTTS', 'TTS', 'index_stream', 'Index-TTS-vLLM流式语音合成', '[{"key": "api_url", "type": "string", "label": "API服务地址"}, {"key": "voice", "type": "string", "label": "默认音色"}, {"key": "audio_format", "type": "string", "label": "音频格式"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 16, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_MinimaxStreamTTS', 'TTS', 'minimax_httpstream', 'Minimax流式语音合成', '[{"key": "group_id", "type": "string", "label": "组ID"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "model", "type": "string", "label": "模型"}, {"key": "voice_id", "type": "string", "label": "音色ID"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "voice_setting", "type": "dict", "label": "音色设置"}, {"key": "pronunciation_dict", "type": "dict", "label": "发音字典"}, {"key": "audio_setting", "type": "dict", "label": "音频设置"}, {"key": "timber_weights", "type": "string", "label": "音色权重"}]', 18, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_openai', 'TTS', 'openai', 'OpenAI TTS', '[{"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "api_url", "type": "string", "label": "API地址"}, {"key": "model", "type": "string", "label": "模型"}, {"key": "voice", "type": "string", "label": "音色"}, {"key": "speed", "type": "number", "label": "速度"}, {"key": "output_dir", "type": "string", "label": "输出目录"}]', 11, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_PaddleSpeechTTS', 'TTS', 'paddle_speech', 'PaddleSpeechTTS', '[{"key": "protocol", "type": "string", "label": "协议类型", "options": ["websocket"]}, {"key": "url", "type": "string", "label": "服务地址"}, {"key": "spk_id", "type": "int", "label": "音色"}, {"key": "sample_rate", "type": "float", "label": "采样率"}, {"key": "speed", "type": "float", "label": "语速"}, {"key": "volume", "type": "float", "label": "音量"}, {"key": "save_path", "type": "string", "label": "保存路径"}]', 17, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_siliconflow', 'TTS', 'siliconflow', '硅基流动TTS', '[{"key": "model", "type": "string", "label": "模型"}, {"key": "voice", "type": "string", "label": "音色"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "access_token", "type": "string", "label": "访问令牌"}, {"key": "response_format", "type": "string", "label": "响应格式"}]', 3, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_TencentTTS', 'TTS', 'tencent', '腾讯语音合成', '[{"key": "appid", "type": "string", "label": "应用ID"}, {"key": "secret_id", "type": "string", "label": "Secret ID"}, {"key": "secret_key", "type": "string", "label": "Secret Key"}, {"key": "format", "type": "string", "label": "音频格式"}, {"key": "speed", "type": "number", "label": "语速"}, {"key": "volume", "type": "number", "label": "音量"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "voice", "type": "string", "label": "音色ID"}, {"key": "region", "type": "string", "label": "区域"}]', 5, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_TTS_XunFeiStreamTTS', 'TTS', 'xunfei_stream', '讯飞流式语音合成', '[{"key": "app_id", "type": "string", "label": "APP_ID"}, {"key": "api_secret", "type": "string", "label": "API_Secret"}, {"key": "api_key", "type": "string", "label": "API密钥"}, {"key": "output_dir", "type": "string", "label": "输出目录"}, {"key": "voice", "type": "string", "label": "音色"}, {"key": "format", "type": "string", "label": "音频格式"}, {"key": "volume", "type": "number", "label": "音量"}, {"key": "speed", "type": "number", "label": "语速"}, {"key": "pitch", "type": "number", "label": "音调"}, {"key": "oral_level", "type": "number", "label": "口语化等级"}, {"key": "spark_assist", "type": "number", "label": "是否口语化"}, {"key": "stop_split", "type": "number", "label": "服务端拆句"}, {"key": "remain", "type": "number", "label": "保留书面语"}]', 20, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_VAD_SileroVAD', 'VAD', 'silero', 'SileroVAD语音活动检测', '[{"key": "threshold", "type": "number", "label": "检测阈值"}, {"key": "model_dir", "type": "string", "label": "模型目录"}, {"key": "min_silence_duration_ms", "type": "number", "label": "最小静音时长"}]', 1, 1, '2026-11-10 22:51:43+08', 1, '2026-11-10 22:51:43+08');
INSERT INTO public.ai_model_provider VALUES ('SYSTEM_VLLM_openai', 'VLLM', 'openai', 'OpenAI接口', '[{"key": "base_url", "type": "string", "label": "基础URL"}, {"key": "model_name", "type": "string", "label": "模型名称"}, {"key": "api_key", "type": "string", "label": "API密钥"}]', 9, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');


ALTER TABLE public.ai_model_provider ENABLE TRIGGER ALL;

--
-- Data for Name: ai_ota; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_ota DISABLE TRIGGER ALL;



ALTER TABLE public.ai_ota ENABLE TRIGGER ALL;

--
-- Data for Name: ai_rag_dataset; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_rag_dataset DISABLE TRIGGER ALL;



ALTER TABLE public.ai_rag_dataset ENABLE TRIGGER ALL;

--
-- Data for Name: ai_rag_knowledge_document; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_rag_knowledge_document DISABLE TRIGGER ALL;



ALTER TABLE public.ai_rag_knowledge_document ENABLE TRIGGER ALL;

--
-- Data for Name: ai_tts_voice; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_tts_voice DISABLE TRIGGER ALL;

INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0001', 'TTS_AliBLStreamTTS', '龙小淳-知性积极女', 'longxiaochun_v2', '普通话、英语', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0002', 'TTS_AliBLStreamTTS', '龙小夏-沉稳权威女', 'longxiaoxia_v2', '普通话、英语', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0003', 'TTS_AliBLStreamTTS', '龙安燃-活泼质感女', 'longanran', '普通话、英语', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0004', 'TTS_AliBLStreamTTS', '龙安宣-经典直播女', 'longanxuan', '普通话、英语', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0005', 'TTS_AliBLStreamTTS', '龙寒-温暖痴情男', 'longhan_v2', '普通话、英语', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0006', 'TTS_AliBLStreamTTS', '龙颜-温暖春风女', 'longyan_v2', '普通话、英语', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0007', 'TTS_AliBLStreamTTS', '龙菲菲-甜美矫情女', 'longfeifei_v2', '普通话、英语', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0008', 'TTS_AliBLStreamTTS', '龙老铁-东北直率男', 'longlaotie_v2', '普通话、英语', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0009', 'TTS_AliBLStreamTTS', '龙嘉怡-知性粤语女', 'longjiayi_v2', '粤语、英语', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0010', 'TTS_AliBLStreamTTS', '龙杰力豆-阳光顽皮男', 'longjielidou_v2', '普通话、英语', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0011', 'TTS_AliBLStreamTTS', '龙铃-稚气呆板女', 'longling_v2', '普通话、英语', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0012', 'TTS_AliBLStreamTTS', '李白-古代诗仙男', 'libai_v2', '普通话、英语', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0013', 'TTS_AliBLStreamTTS', 'loongeva-知性英文女', 'loongeva_v2', '英语', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0014', 'TTS_AliBLStreamTTS', 'loongbrian-沉稳英文男', 'loongbrian_v2', '英语', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0015', 'TTS_AliBLStreamTTS', 'loongkyong-韩语女', 'loongkyong_v2', '韩语', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0016', 'TTS_AliBLStreamTTS', 'loongtomoka-日语女', 'loongtomoka_v2', '日语', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliBLStreamTTS_0017', 'TTS_AliBLStreamTTS', 'loongtomoya-日语男', 'loongtomoya_v2', '日语', NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0001', 'TTS_AliyunStreamTTS', '龙小淳-温柔姐姐', 'longxiaochun', '普通话、英语', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0002', 'TTS_AliyunStreamTTS', '龙小夏-温柔女声', 'longxiaoxia', '普通话、英语', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0003', 'TTS_AliyunStreamTTS', '龙玫-温柔女声', 'longmei', '普通话、英语', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0004', 'TTS_AliyunStreamTTS', '龙瑰-温柔女声', 'longgui', '普通话、英语', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0005', 'TTS_AliyunStreamTTS', '龙玉-御姐女声', 'longyu', '普通话、英语', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0006', 'TTS_AliyunStreamTTS', '龙娇-御姐女声', 'longjiao', '普通话、英语', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0007', 'TTS_AliyunStreamTTS', '龙臣-译制片男声', 'longchen', '普通话、英语', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0008', 'TTS_AliyunStreamTTS', '龙修-青年男声', 'longxiu', '普通话、英语', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0009', 'TTS_AliyunStreamTTS', '龙橙-阳光男声', 'longcheng', '普通话、英语', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0010', 'TTS_AliyunStreamTTS', '龙哲-成熟男声', 'longzhe', '普通话、英语', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0011', 'TTS_AliyunStreamTTS', 'Bella2.0-新闻女声', 'loongbella', '普通话、英语', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0012', 'TTS_AliyunStreamTTS', 'Stella2.0-飒爽女声', 'loongstella', '普通话、英语', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0013', 'TTS_AliyunStreamTTS', '龙书-新闻男声', 'longshu', '普通话、英语', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0014', 'TTS_AliyunStreamTTS', '龙婧-严肃女声', 'longjing', '普通话、英语', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0015', 'TTS_AliyunStreamTTS', '龙奇-活泼童声', 'longqi', '普通话、英语', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0016', 'TTS_AliyunStreamTTS', '龙华-活泼女童', 'longhua', '普通话、英语', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0017', 'TTS_AliyunStreamTTS', '龙无-无厘头男声', 'longwu', '普通话、英语', NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0018', 'TTS_AliyunStreamTTS', '龙大锤-幽默男声', 'longdachui', '普通话、英语', NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0019', 'TTS_AliyunStreamTTS', '龙嘉怡-粤语女声', 'longjiayi', '粤语、英语', NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunStreamTTS_0020', 'TTS_AliyunStreamTTS', '龙桃-粤语女声', 'longtao', '粤语、英语', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_AliyunTTS0001', 'TTS_AliyunTTS', '阿里云小云', 'xiaoyun', '普通话', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_CosyVoiceSiliconflow0001', 'TTS_CosyVoiceSiliconflow', 'CosyVoice男声', 'FunAudioLLM/CosyVoice2-0.5B:alex', '普通话', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_CosyVoiceSiliconflow0002', 'TTS_CosyVoiceSiliconflow', 'CosyVoice女声', 'FunAudioLLM/CosyVoice2-0.5B:bella', '普通话', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_CozeCnTTS0001', 'TTS_CozeCnTTS', 'CozeCn音色', '7426720361733046281', '普通话', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_CustomTTS0000', 'TTS_CustomTTS', '', '', '普通话', '', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_DoubaoTTS0001', 'TTS_DoubaoTTS', '通用女声', 'BV001_streaming', '普通话', 'https://lf3-speech.bytetos.com/obj/speech-tts-external/portal/Portal_Demo_BV001.mp3', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_DoubaoTTS0002', 'TTS_DoubaoTTS', '通用男声', 'BV002_streaming', '普通话', 'https://lf3-speech.bytetos.com/obj/speech-tts-external/portal/Portal_Demo_BV002.mp3', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_DoubaoTTS0003', 'TTS_DoubaoTTS', '阳光男生', 'BV056_streaming', '普通话', 'https://lf3-speech.bytetos.com/obj/speech-tts-external/portal/Portal_Demo_BV056.mp3', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_DoubaoTTS0004', 'TTS_DoubaoTTS', '奶气萌娃', 'BV051_streaming', '普通话', 'https://lf3-speech.bytetos.com/obj/speech-tts-external/portal/Portal_Demo_BV051.mp3', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_DoubaoTTS0005', 'TTS_DoubaoTTS', '湾湾小何', 'zh_female_wanwanxiaohe_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%B9%BE%E6%B9%BE%E5%B0%8F%E4%BD%95.mp3', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0001', 'TTS_EdgeTTS', 'EdgeTTS女声-晓晓', 'zh-CN-XiaoxiaoNeural', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0002', 'TTS_EdgeTTS', 'EdgeTTS男声-云扬', 'zh-CN-YunyangNeural', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0003', 'TTS_EdgeTTS', 'EdgeTTS女声-晓伊', 'zh-CN-XiaoyiNeural', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0004', 'TTS_EdgeTTS', 'EdgeTTS男声-云健', 'zh-CN-YunjianNeural', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0005', 'TTS_EdgeTTS', 'EdgeTTS男声-云希', 'zh-CN-YunxiNeural', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0006', 'TTS_EdgeTTS', 'EdgeTTS男声-云夏', 'zh-CN-YunxiaNeural', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0007', 'TTS_EdgeTTS', 'EdgeTTS女声-辽宁小贝', 'zh-CN-liaoning-XiaobeiNeural', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0008', 'TTS_EdgeTTS', 'EdgeTTS女声-陕西小妮', 'zh-CN-shaanxi-XiaoniNeural', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0009', 'TTS_EdgeTTS', 'EdgeTTS女声-香港海佳', 'zh-HK-HiuGaaiNeural', '粤语', 'General', 'Friendly, Positive', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0010', 'TTS_EdgeTTS', 'EdgeTTS女声-香港海曼', 'zh-HK-HiuMaanNeural', '粤语', 'General', 'Friendly, Positive', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_EdgeTTS0011', 'TTS_EdgeTTS', 'EdgeTTS男声-香港万龙', 'zh-HK-WanLungNeural', '粤语', 'General', 'Friendly, Positive', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_FishSpeech0000', 'TTS_FishSpeech', '', '', '普通话', '', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_GPT_SOVITS_V20000', 'TTS_GPT_SOVITS_V2', '', '', '普通话', '', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_GPT_SOVITS_V30000', 'TTS_GPT_SOVITS_V3', '', '', '普通话', '', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0001', 'TTS_HSDSTTS_V2', '湾湾小何', 'zh_female_xiaohe_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_xiaohe_uranus_bigtts.mp3', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0002', 'TTS_HSDSTTS_V2', 'Vivi', 'zh_female_vv_uranus_bigtts', '普通话、日语、印尼语、墨西哥西班牙语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_vv_uranus_bigtts.wav', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0003', 'TTS_HSDSTTS_V2', '可爱女生', 'saturn_zh_female_keainvsheng_tob', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/saturn_zh_female_keainvsheng_tob.wav', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0004', 'TTS_HSDSTTS_V2', '调皮公主', 'saturn_zh_female_tiaopigongzhu_tob', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/saturn_zh_female_tiaopigongzhu_tob.wav', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0005', 'TTS_HSDSTTS_V2', '阳光青年', 'zh_male_yangguangqingnian_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_yangguangqingnian_uranus_bigtts.mp3', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0006', 'TTS_HSDSTTS_V2', '爽朗少年', 'saturn_zh_male_shuanglangshaonian_tob', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/saturn_zh_male_shuanglangshaonian_tob.wav', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0007', 'TTS_HSDSTTS_V2', '爽朗少年', 'saturn_zh_male_tiancaitongzhuo_tob', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/saturn_zh_male_tiancaitongzhuo_tob.wav', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0008', 'TTS_HSDSTTS_V2', '大壹', 'zh_male_dayi_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_dayi_saturn_bigtts.wav', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0009', 'TTS_HSDSTTS_V2', '黑猫侦探社咪仔', 'zh_female_mizai_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_mizai_saturn_bigtts.wav', NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0010', 'TTS_HSDSTTS_V2', '鸡汤女', 'zh_female_jitangnv_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_jitangnv_saturn_bigtts.wav', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0011', 'TTS_HSDSTTS_V2', '魅力女友', 'zh_female_meilinvyou_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_meilinvyou_saturn_bigtts.wav', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0012', 'TTS_HSDSTTS_V2', '流畅女声', 'zh_female_liuchangnv_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%B5%81%E7%95%85%E5%A5%B3%E5%A3%B0.wav', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0013', 'TTS_HSDSTTS_V2', '儒雅逸辰', 'zh_male_ruyayichen_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_ruyayichen_saturn_bigtts.wav', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0014', 'TTS_HSDSTTS_V2', '云舟', 'zh_male_m191_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_m191_uranus_bigtts.mp3', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0015', 'TTS_HSDSTTS_V2', '小天', 'zh_male_taocheng_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_taocheng_uranus_bigtts.mp3', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0016', 'TTS_HSDSTTS_V2', '刘飞', 'zh_male_liufei_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_liufei_uranus_bigtts.mp3', NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0017', 'TTS_HSDSTTS_V2', '魅力苏菲', 'zh_female_sophie_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_sophie_uranus_bigtts.mp3', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0018', 'TTS_HSDSTTS_V2', '清新女声', 'zh_female_qingxinnvsheng_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_qingxinnvsheng_uranus_bigtts.mp3', NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0019', 'TTS_HSDSTTS_V2', '知性灿灿', 'zh_female_cancan_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_cancan_uranus_bigtts.mp3', NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0020', 'TTS_HSDSTTS_V2', '撒娇学妹', 'zh_female_sajiaoxuemei_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_sajiaoxuemei_uranus_bigtts.mp3', NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0021', 'TTS_HSDSTTS_V2', '甜美小源', 'zh_female_tianmeixiaoyuan_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_tianmeixiaoyuan_uranus_bigtts.mp3', NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0022', 'TTS_HSDSTTS_V2', '甜美桃子', 'zh_female_tianmeitaozi_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_tianmeitaozi_uranus_bigtts.mp3', NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0023', 'TTS_HSDSTTS_V2', '邻家女孩', 'zh_female_linjianvhai_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_linjianvhai_uranus_bigtts.mp3', NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0024', 'TTS_HSDSTTS_V2', '爽快思思', 'zh_female_shuangkuaisisi_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_shuangkuaisisi_uranus_bigtts.mp3', NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0025', 'TTS_HSDSTTS_V2', '少年梓辛/Brayan', 'zh_male_shaonianzixin_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_shaonianzixin_uranus_bigtts.mp3', NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0026', 'TTS_HSDSTTS_V2', '温暖阿虎/Alvin', 'zh_male_wennuanahu_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_wennuanahu_uranus_bigtts.mp3', NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0027', 'TTS_HSDSTTS_V2', '奶气萌娃', 'zh_male_naiqimengwa_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_naiqimengwa_uranus_bigtts.mp3', NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0028', 'TTS_HSDSTTS_V2', '婆婆', 'zh_female_popo_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_popo_uranus_bigtts.mp3', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0029', 'TTS_HSDSTTS_V2', '轻盈朵朵', 'saturn_zh_female_qingyingduoduo_cs_tob', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/ICL_zh_female_qingyingduoduo_cs_tob.mp3', NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0030', 'TTS_HSDSTTS_V2', '温婉珊珊', 'saturn_zh_female_wenwanshanshan_cs_tob', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/ICL_zh_female_wenwanshanshan_cs_tob.mp3', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0031', 'TTS_HSDSTTS_V2', 'Tim', 'en_male_tim_uranus_bigtts', '英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/en_male_tim_uranus_bigtts.mp3', NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0032', 'TTS_HSDSTTS_V2', 'Dacey', 'en_female_dacey_uranus_bigtts', '英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/en_female_dacey_uranus_bigtts.mp3', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0033', 'TTS_HSDSTTS_V2', 'Stokie', 'en_female_stokie_uranus_bigtts', '英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/en_female_stokie_uranus_bigtts.mp3', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0034', 'TTS_HSDSTTS_V2', '古风少御', 'zh_female_gufengshaoyu_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_gufengshaoyu_uranus_bigtts.mp3', NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0035', 'TTS_HSDSTTS_V2', '霸气青叔', 'zh_male_baqiqingshu_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_baqiqingshu_uranus_bigtts.mp3', NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0036', 'TTS_HSDSTTS_V2', '悬疑解说', 'zh_male_xuanyijieshuo_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_xuanyijieshuo_uranus_bigtts.mp3', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0037', 'TTS_HSDSTTS_V2', '佩奇猪', 'zh_female_peiqi_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_female_peiqi_uranus_bigtts.mp3', NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0038', 'TTS_HSDSTTS_V2', '猴哥', 'zh_male_sunwukong_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_sunwukong_uranus_bigtts.mp3', NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0039', 'TTS_HSDSTTS_V2', '猪八戒', 'zh_male_zhubajie_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_zhubajie_uranus_bigtts.mp3', NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HSDSTTS_V2_0040', 'TTS_HSDSTTS_V2', '唐僧', 'zh_male_tangseng_uranus_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/zh_male_tangseng_uranus_bigtts.mp3', NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0001', 'TTS_HuoshanDoubleStreamTTS', '爽快思思/Skye', 'zh_female_shuangkuaisisi_moon_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/Skye.mp3', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0002', 'TTS_HuoshanDoubleStreamTTS', '温暖阿虎/Alvin', 'zh_male_wennuanahu_moon_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/Alvin.mp3', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0003', 'TTS_HuoshanDoubleStreamTTS', '少年梓辛/Brayan', 'zh_male_shaonianzixin_moon_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/Brayan.mp3', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0004', 'TTS_HuoshanDoubleStreamTTS', '邻家女孩', 'zh_female_linjianvhai_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E9%82%BB%E5%AE%B6%E5%A5%B3%E5%AD%A9.mp3', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0005', 'TTS_HuoshanDoubleStreamTTS', '渊博小叔', 'zh_male_yuanboxiaoshu_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%B8%8A%E5%8D%9A%E5%B0%8F%E5%8F%94.mp3', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0006', 'TTS_HuoshanDoubleStreamTTS', '阳光青年', 'zh_male_yangguangqingnian_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E9%98%B3%E5%85%89%E9%9D%92%E5%B9%B4.mp3', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0007', 'TTS_HuoshanDoubleStreamTTS', '京腔侃爷/Harmony', 'zh_male_jingqiangkanye_moon_bigtts', '普通话、英语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/Harmony.mp3', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0008', 'TTS_HuoshanDoubleStreamTTS', '湾湾小何', 'zh_female_wanwanxiaohe_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%B9%BE%E6%B9%BE%E5%B0%8F%E4%BD%95.mp3', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0009', 'TTS_HuoshanDoubleStreamTTS', '湾区大叔', 'zh_female_wanqudashu_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%B9%BE%E5%8C%BA%E5%A4%A7%E5%8F%94.mp3', NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0010', 'TTS_HuoshanDoubleStreamTTS', '呆萌川妹', 'zh_female_daimengchuanmei_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E5%91%86%E8%90%8C%E5%B7%9D%E5%A6%B9.mp3', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0011', 'TTS_HuoshanDoubleStreamTTS', '广州德哥', 'zh_male_guozhoudege_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E5%B9%BF%E5%B7%9E%E5%BE%B7%E5%93%A5.mp3', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0012', 'TTS_HuoshanDoubleStreamTTS', '北京小爷', 'zh_male_beijingxiaoye_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E5%8C%97%E4%BA%AC%E5%B0%8F%E7%88%B7.mp3', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0013', 'TTS_HuoshanDoubleStreamTTS', '浩宇小哥', 'zh_male_haoyuxiaoge_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%B5%A9%E5%AE%87%E5%B0%8F%E5%93%A5.mp3', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0014', 'TTS_HuoshanDoubleStreamTTS', '广西远舟', 'zh_male_guangxiyuanzhou_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E5%B9%BF%E8%A5%BF%E8%BF%9C%E8%88%9F.mp3', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0015', 'TTS_HuoshanDoubleStreamTTS', '妹坨洁儿', 'zh_female_meituojieer_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E5%A6%B9%E5%9D%A8%E6%B4%81%E5%84%BF.mp3', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0016', 'TTS_HuoshanDoubleStreamTTS', '豫州子轩', 'zh_male_yuzhouzixuan_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E8%B1%AB%E5%B7%9E%E5%AD%90%E8%BD%A9.mp3', NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0017', 'TTS_HuoshanDoubleStreamTTS', '高冷御姐', 'zh_female_gaolengyujie_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E9%AB%98%E5%86%B7%E5%BE%A1%E5%A7%90.mp3', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0018', 'TTS_HuoshanDoubleStreamTTS', '傲娇霸总', 'zh_male_aojiaobazong_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E5%82%B2%E5%A8%87%E9%9C%B8%E6%80%BB.mp3', NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0019', 'TTS_HuoshanDoubleStreamTTS', '魅力女友', 'zh_female_meilinvyou_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E9%AD%85%E5%8A%9B%E5%A5%B3%E5%8F%8B.mp3', NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0020', 'TTS_HuoshanDoubleStreamTTS', '深夜播客', 'zh_male_shenyeboke_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%B7%B1%E5%A4%9C%E6%92%AD%E5%AE%A2.mp3', NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0021', 'TTS_HuoshanDoubleStreamTTS', '柔美女友', 'zh_female_sajiaonvyou_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%9F%94%E7%BE%8E%E5%A5%B3%E5%8F%8B.mp3', NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0022', 'TTS_HuoshanDoubleStreamTTS', '撒娇学妹', 'zh_female_yuanqinvyou_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%92%92%E5%A8%87%E5%AD%A6%E5%A6%B9.mp3', NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0023', 'TTS_HuoshanDoubleStreamTTS', 'かずね（和音）', 'multi_male_jingqiangkanye_moon_bigtts', '日语、西班牙语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/Javier.wav', NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0024', 'TTS_HuoshanDoubleStreamTTS', 'はるこ（晴子）', 'multi_female_shuangkuaisisi_moon_bigtts', '日语、西班牙语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/Esmeralda.mp3', NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0025', 'TTS_HuoshanDoubleStreamTTS', 'あけみ（朱美）', 'multi_female_gaolengyujie_moon_bigtts', '日语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%9C%B1%E7%BE%8E.mp3', NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_HuoshanDoubleStreamTTS_0026', 'TTS_HuoshanDoubleStreamTTS', 'ひろし（広志）', 'multi_male_wanqudashu_moon_bigtts', '日语、西班牙语', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/Roberto.wav', NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_IndexStreamTTS_0001', 'TTS_IndexStreamTTS', 'Jay Klee', 'jay_klee', '普通话、英语', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0001', 'TTS_MinimaxStreamTTS', '少女音', 'female-shaonv', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0002', 'TTS_MinimaxStreamTTS', '成熟女声', 'female-chengshu', '普通话', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0003', 'TTS_MinimaxStreamTTS', '霸道少爷', 'badao_shaoye', '普通话', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0004', 'TTS_MinimaxStreamTTS', '病娇弟弟', 'bingjiao_didi', '普通话', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0005', 'TTS_MinimaxStreamTTS', '纯真学弟', 'chunzhen_xuedi', '普通话', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0006', 'TTS_MinimaxStreamTTS', '冷淡学长', 'lengdan_xiongzhang', '普通话', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0007', 'TTS_MinimaxStreamTTS', '甜美小玲', 'tianxin_xiaoling', '普通话', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0008', 'TTS_MinimaxStreamTTS', '俏皮萌妹', 'qiaopi_mengmei', '普通话', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0009', 'TTS_MinimaxStreamTTS', '妩媚御姐', 'wumei_yujie', '普通话', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0010', 'TTS_MinimaxStreamTTS', '调教学妹', 'diadia_xuemei', '普通话', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0011', 'TTS_MinimaxStreamTTS', '淡雅学姐', 'danya_xuejie', '普通话', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0012', 'TTS_MinimaxStreamTTS', 'Santa Claus', 'Santa_Claus', '普通话', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0013', 'TTS_MinimaxStreamTTS', 'Grinch', 'Grinch', '普通话', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0014', 'TTS_MinimaxStreamTTS', '专业女主持', 'Cantonese_ProfessionalHost（F)', '粤语', 'https://filecdn.minimax.chat/public/84589766-c651-477b-b320-36b89599f953.mp3', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0015', 'TTS_MinimaxStreamTTS', '温柔女声', 'Cantonese_GentleLady', '粤语', 'https://filecdn.minimax.chat/public/d391936d-d586-4dab-886c-a2a084a20920.mp3', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0016', 'TTS_MinimaxStreamTTS', '专业男主持', 'Cantonese_ProfessionalHost（M)', '粤语', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0017', 'TTS_MinimaxStreamTTS', '活泼男声', 'Cantonese_PlayfulMan', '粤语', NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0018', 'TTS_MinimaxStreamTTS', '可爱女孩', 'Cantonese_CuteGirl', '粤语', 'https://filecdn.minimax.chat/public/ff96520a-ac12-491d-945e-d6337467eb7d.mp3', NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0019', 'TTS_MinimaxStreamTTS', '善良女声', 'Cantonese_KindWoman', '粤语', 'https://filecdn.minimax.chat/public/78239a18-5e9c-4538-94f6-2f504c080374.mp3', NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0020', 'TTS_MinimaxStreamTTS', 'Crisp News Anchor', 'Cantonese_crisp_news_anchor_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/741a5a4b-f42a-4a9b-ae83-3954d097ab73.mp3', NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0021', 'TTS_MinimaxStreamTTS', 'Pro Reporter', 'Cantonese_professional_reporter_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/77afb86d-2cc4-4149-8c2e-e1174fa849d4.mp3', NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0022', 'TTS_MinimaxStreamTTS', 'Crisp Reporter', 'Cantonese_crisp_reporter_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/4ad39a61-628e-481c-9d60-bfb7c36bceb8.mp3', NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0023', 'TTS_MinimaxStreamTTS', 'Articulate', 'Cantonese_Articulate_commentator_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/9346601d-3035-4f9e-9b1c-0e03f30e5eef.mp3', NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0024', 'TTS_MinimaxStreamTTS', 'Warm Reporter', 'Cantonese_Warm_Reporter_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/c651050e-d6a5-4653-b09e-5177bdc8b04c.mp3', NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0025', 'TTS_MinimaxStreamTTS', 'Energetic', 'Cantonese_energetic_commentator_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/1fd1c461-71da-450d-91bb-45f819249b44.mp3', NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0026', 'TTS_MinimaxStreamTTS', 'Objective Narrator', 'Cantonese_objective_narrator_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/463c5a68-a7b5-4fe9-85b6-d494dca74abb.mp3', NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0027', 'TTS_MinimaxStreamTTS', '沙哑男声', 'Cantonese_Narrator', '粤语', 'https://filecdn.minimax.chat/public/22e29cb0-0f5a-443a-9fa9-a32dabd55cf9.mp3', NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0028', 'TTS_MinimaxStreamTTS', 'News Anchor', 'Cantonese_news_anchor_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/59b9ba49-47d4-48f1-b207-09c0e0769a1b.mp3', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0029', 'TTS_MinimaxStreamTTS', '渊博学者', 'Cantonese_WiselProfessor', '粤语', 'https://filecdn.minimax.chat/public/8de234c4-64a7-4539-a316-c3b43ee1d0a9.mp3', NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0030', 'TTS_MinimaxStreamTTS', 'Resonant Host', 'Cantonese_resonant_host_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/ec8fc0ce-6657-4c49-9bf0-3953a15046ec.mp3', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0031', 'TTS_MinimaxStreamTTS', '冷漠员工', 'Cantonese_IndifferentStaff', '粤语', 'https://filecdn.minimax.chat/public/9686682c-3fc8-45f0-bd88-2a4692e1f63e.mp3', NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0032', 'TTS_MinimaxStreamTTS', 'Male News Anchor', 'Cantonese_Male_news_anchor_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/2055ee8b-fb25-424c-b8cb-e2baf971e520.mp3', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0033', 'TTS_MinimaxStreamTTS', 'History Narrator', 'Cantonese_casual_narrator_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/c170f9e4-145d-4331-9910-1c3a0e6bbc3a.mp3', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0034', 'TTS_MinimaxStreamTTS', 'Steady Reporter', 'Cantonese_Steady_reporter_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/381cfee2-772d-4a73-b30c-7914aec05771.mp3', NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0035', 'TTS_MinimaxStreamTTS', 'Serious Commentator', 'Cantonese_serious_commentator_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/57335c8a-32ea-475f-a198-b0de7fa1b126.mp3', NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0036', 'TTS_MinimaxStreamTTS', 'Podcast Host', 'Cantonese_podcast_host_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/048b617f-e1f8-422c-89fb-fdbc6e303675.mp3', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_MinimaxStreamTTS_0037', 'TTS_MinimaxStreamTTS', 'Obj commentator', 'Cantonese_Objective_commentator_vv2', '粤语', 'https://cdn.hailuoai.video/open-hailuo-video-web/public_assets/a8f55e44-b726-4ba5-815a-f1b515ba57ef.mp3', NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_OpenAITTS0001', 'TTS_OpenAITTS', 'OpenAI男声', 'onyx', '普通话', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_PaddleSpeechTTS_0000', 'TTS_PaddleSpeechTTS', '默认', '0', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_TencentTTS0001', 'TTS_TencentTTS', '智瑜', '101001', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_TTS302AI0001', 'TTS_TTS302AI', '湾湾小何', 'zh_female_wanwanxiaohe_moon_bigtts', '普通话', 'https://lf3-static.bytednsdoc.com/obj/eden-cn/lm_hz_ihsph/ljhwZthlaukjlkulzlp/portal/bigtts/%E6%B9%BE%E6%B9%BE%E5%B0%8F%E4%BD%95.mp3', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0001', 'TTS_VolcesAiGatewayTTS', '灿灿/Shiny', 'zh_female_cancan_mars_bigtts', '普通话、英语', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0002', 'TTS_VolcesAiGatewayTTS', '清新女声', 'zh_female_qingxinnvsheng_mars_bigtts', '普通话', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0003', 'TTS_VolcesAiGatewayTTS', '爽快思思/Skye', 'zh_female_shuangkuaisisi_moon_bigtts', '普通话、英语', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0004', 'TTS_VolcesAiGatewayTTS', '温暖阿虎/Alvin', 'zh_male_wennuanahu_moon_bigtts', '普通话、英语', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0005', 'TTS_VolcesAiGatewayTTS', '少年梓辛/Brayan', 'zh_male_shaonianzixin_moon_bigtts', '普通话、英语', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0006', 'TTS_VolcesAiGatewayTTS', '知性女声', 'zh_female_zhixingnvsheng_mars_bigtts', '普通话', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0007', 'TTS_VolcesAiGatewayTTS', '清爽男大', 'zh_male_qingshuangnanda_mars_bigtts', '普通话', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0008', 'TTS_VolcesAiGatewayTTS', '邻家女孩', 'zh_female_linjianvhai_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0009', 'TTS_VolcesAiGatewayTTS', '渊博小叔', 'zh_male_yuanboxiaoshu_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0010', 'TTS_VolcesAiGatewayTTS', '阳光青年', 'zh_male_yangguangqingnian_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0011', 'TTS_VolcesAiGatewayTTS', '甜美小源', 'zh_female_tianmeixiaoyuan_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0012', 'TTS_VolcesAiGatewayTTS', '清澈梓梓', 'zh_female_qingchezizi_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0013', 'TTS_VolcesAiGatewayTTS', '解说小明', 'zh_male_jieshuoxiaoming_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0014', 'TTS_VolcesAiGatewayTTS', '开朗姐姐', 'zh_female_kailangjiejie_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0015', 'TTS_VolcesAiGatewayTTS', '邻家男孩', 'zh_male_linjiananhai_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0016', 'TTS_VolcesAiGatewayTTS', '甜美悦悦', 'zh_female_tianmeiyueyue_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0017', 'TTS_VolcesAiGatewayTTS', '心灵鸡汤', 'zh_female_xinlingjitang_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0018', 'TTS_VolcesAiGatewayTTS', '知性温婉', 'ICL_zh_female_zhixingwenwan_tob', '普通话', NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0019', 'TTS_VolcesAiGatewayTTS', '暖心体贴', 'ICL_zh_male_nuanxintitie_tob', '普通话', NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0020', 'TTS_VolcesAiGatewayTTS', '温柔文雅', 'ICL_zh_female_wenrouwenya_tob', '普通话', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0021', 'TTS_VolcesAiGatewayTTS', '开朗轻快', 'ICL_zh_male_kailangqingkuai_tob', '普通话', NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0022', 'TTS_VolcesAiGatewayTTS', '活泼爽朗', 'ICL_zh_male_huoposhuanglang_tob', '普通话', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0023', 'TTS_VolcesAiGatewayTTS', '率真小伙', 'ICL_zh_male_shuaizhenxiaohuo_tob', '普通话', NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0024', 'TTS_VolcesAiGatewayTTS', '温柔小哥', 'zh_male_wenrouxiaoge_mars_bigtts', '普通话', NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0025', 'TTS_VolcesAiGatewayTTS', 'Smith', 'en_male_smith_mars_bigtts', '英语', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0026', 'TTS_VolcesAiGatewayTTS', 'Anna', 'en_female_anna_mars_bigtts', '英语', NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0027', 'TTS_VolcesAiGatewayTTS', 'Adam', 'en_male_adam_mars_bigtts', '英语', NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0028', 'TTS_VolcesAiGatewayTTS', 'Sarah', 'en_female_sarah_mars_bigtts', '英语', NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0029', 'TTS_VolcesAiGatewayTTS', 'Dryw', 'en_male_dryw_mars_bigtts', '英语', NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0030', 'TTS_VolcesAiGatewayTTS', 'かずね（和音）', 'multi_male_jingqiangkanye_moon_bigtts', '日语、西班牙语', NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0031', 'TTS_VolcesAiGatewayTTS', 'はるこ（晴子）', 'multi_female_shuangkuaisisi_moon_bigtts', '日语、西班牙语', NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0032', 'TTS_VolcesAiGatewayTTS', 'ひろし（広志）', 'multi_male_wanqudashu_moon_bigtts', '日语、西班牙语', NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0033', 'TTS_VolcesAiGatewayTTS', 'あけみ（朱美）', 'multi_female_gaolengyujie_moon_bigtts', '日语', NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0034', 'TTS_VolcesAiGatewayTTS', 'Amanda', 'en_female_amanda_mars_bigtts', '英语', NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0035', 'TTS_VolcesAiGatewayTTS', 'Jackson', 'en_male_jackson_mars_bigtts', '英语', NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0036', 'TTS_VolcesAiGatewayTTS', '京腔侃爷/Harmony', 'zh_male_jingqiangkanye_moon_bigtts', '普通话、英语', NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0037', 'TTS_VolcesAiGatewayTTS', '湾湾小何', 'zh_female_wanwanxiaohe_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0038', 'TTS_VolcesAiGatewayTTS', '湾区大叔', 'zh_female_wanqudashu_moon_bigtts', '粤语', NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0039', 'TTS_VolcesAiGatewayTTS', '呆萌川妹', 'zh_female_daimengchuanmei_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0040', 'TTS_VolcesAiGatewayTTS', '广州德哥', 'zh_male_guozhoudege_moon_bigtts', '粤语', NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0041', 'TTS_VolcesAiGatewayTTS', '北京小爷', 'zh_male_beijingxiaoye_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0042', 'TTS_VolcesAiGatewayTTS', '浩宇小哥', 'zh_male_haoyuxiaoge_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0043', 'TTS_VolcesAiGatewayTTS', '广西远舟', 'zh_male_guangxiyuanzhou_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0044', 'TTS_VolcesAiGatewayTTS', '妹坨洁儿', 'zh_female_meituojieer_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_VolcesAiGatewayTTS_0045', 'TTS_VolcesAiGatewayTTS', '豫州子轩', 'zh_male_yuzhouzixuan_moon_bigtts', '普通话', NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0001', 'TTS_XunFeiStreamTTS', '聆小璇', 'x5_lingxiaoxuan_flow', '普通话', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0002', 'TTS_XunFeiStreamTTS', '聆飞逸', 'x5_lingfeiyi_flow', '普通话', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0003', 'TTS_XunFeiStreamTTS', '聆小玥', 'x5_lingxiaoyue_flow', '普通话', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0004', 'TTS_XunFeiStreamTTS', '聆玉昭', 'x5_lingyuzhao_flow', '普通话', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0005', 'TTS_XunFeiStreamTTS', '聆玉言', 'x5_lingyuyan_flow', '普通话', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0006', 'TTS_XunFeiStreamTTS', '聆飞哲', 'x4_lingfeizhe_oral', '普通话', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0007', 'TTS_XunFeiStreamTTS', '聆小璃', 'x4_lingxiaoli_oral', '普通话', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0008', 'TTS_XunFeiStreamTTS', '聆小糖', 'x5_lingxiaotang_flow', '普通话', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0009', 'TTS_XunFeiStreamTTS', '聆小琪', 'x4_lingxiaoqi_oral', '普通话', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0010', 'TTS_XunFeiStreamTTS', '聆佑佑-童年女声', 'x4_lingyouyou_oral', '普通话', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0011', 'TTS_XunFeiStreamTTS', '子津', 'x4_zijin_oral', '普通话', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0012', 'TTS_XunFeiStreamTTS', '子阳', 'x4_ziyang_oral', '普通话', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0013', 'TTS_XunFeiStreamTTS', 'Grant', 'x5_EnUs_Grant_flow', '英语', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.ai_tts_voice VALUES ('TTS_XunFeiStreamTTS_0014', 'TTS_XunFeiStreamTTS', 'Lila', 'x5_EnUs_Lila_flow', '英语', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL);


ALTER TABLE public.ai_tts_voice ENABLE TRIGGER ALL;

--
-- Data for Name: ai_voice_clone; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.ai_voice_clone DISABLE TRIGGER ALL;



ALTER TABLE public.ai_voice_clone ENABLE TRIGGER ALL;

--
-- Data for Name: sys_dict_data; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.sys_dict_data DISABLE TRIGGER ALL;

INSERT INTO public.sys_dict_data VALUES (101001, 101, '面包板新版接线（WiFi）', 'bread-compact-wifi', '面包板新版接线（WiFi）', 1, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101002, 101, '面包板新版接线（WiFi）+ LCD', 'bread-compact-wifi-lcd', '面包板新版接线（WiFi）+ LCD', 2, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101003, 101, '面包板新版接线（ML307 AT）', 'bread-compact-ml307', '面包板新版接线（ML307 AT）', 3, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101004, 101, '面包板（WiFi） ESP32 DevKit', 'bread-compact-esp32', '面包板（WiFi） ESP32 DevKit', 4, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101005, 101, '面包板（WiFi+ LCD） ESP32 DevKit', 'bread-compact-esp32-lcd', '面包板（WiFi+ LCD） ESP32 DevKit', 5, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101006, 101, 'DFRobot 行空板 k10', 'df-k10', 'DFRobot 行空板 k10', 6, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101007, 101, 'ESP32 CGC', 'esp32-cgc', 'ESP32 CGC', 7, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101008, 101, 'ESP BOX 3', 'esp-box-3', 'ESP BOX 3', 8, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101009, 101, 'ESP BOX', 'esp-box', 'ESP BOX', 9, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101010, 101, 'ESP BOX Lite', 'esp-box-lite', 'ESP BOX Lite', 10, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101011, 101, 'Kevin Box 1', 'kevin-box-1', 'Kevin Box 1', 11, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101012, 101, 'Kevin Box 2', 'kevin-box-2', 'Kevin Box 2', 12, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101013, 101, 'Kevin C3', 'kevin-c3', 'Kevin C3', 13, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101014, 101, 'Kevin SP V3开发板', 'kevin-sp-v3-dev', 'Kevin SP V3开发板', 14, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101015, 101, 'Kevin SP V4开发板', 'kevin-sp-v4-dev', 'Kevin SP V4开发板', 15, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101016, 101, '鱼鹰科技3.13LCD开发板', 'kevin-yuying-313lcd', '鱼鹰科技3.13LCD开发板', 16, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101017, 101, '立创·实战派ESP32-S3开发板', 'lichuang-dev', '立创·实战派ESP32-S3开发板', 17, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101018, 101, '立创·实战派ESP32-C3开发板', 'lichuang-c3-dev', '立创·实战派ESP32-C3开发板', 18, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101019, 101, '神奇按钮 Magiclick_2.4', 'magiclick-2p4', '神奇按钮 Magiclick_2.4', 19, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101020, 101, '神奇按钮 Magiclick_2.5', 'magiclick-2p5', '神奇按钮 Magiclick_2.5', 20, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101021, 101, '神奇按钮 Magiclick_C3', 'magiclick-c3', '神奇按钮 Magiclick_C3', 21, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101022, 101, '神奇按钮 Magiclick_C3_v2', 'magiclick-c3-v2', '神奇按钮 Magiclick_C3_v2', 22, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101023, 101, 'M5Stack CoreS3', 'm5stack-core-s3', 'M5Stack CoreS3', 23, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101024, 101, 'AtomS3 + Echo Base', 'atoms3-echo-base', 'AtomS3 + Echo Base', 24, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101025, 101, 'AtomS3R + Echo Base', 'atoms3r-echo-base', 'AtomS3R + Echo Base', 25, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101026, 101, 'AtomS3R CAM/M12 + Echo Base', 'atoms3r-cam-m12-echo-base', 'AtomS3R CAM/M12 + Echo Base', 26, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101027, 101, 'AtomMatrix + Echo Base', 'atommatrix-echo-base', 'AtomMatrix + Echo Base', 27, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101028, 101, '虾哥 Mini C3', 'xmini-c3', '虾哥 Mini C3', 28, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101029, 101, 'ESP32S3_KORVO2_V3开发板', 'esp32s3-korvo2-v3', 'ESP32S3_KORVO2_V3开发板', 29, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101030, 101, 'ESP-SparkBot开发板', 'esp-sparkbot', 'ESP-SparkBot开发板', 30, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101031, 101, 'ESP-Spot-S3', 'esp-spot-s3', 'ESP-Spot-S3', 31, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101032, 101, 'Waveshare ESP32-S3-Touch-AMOLED-1.8', 'esp32-s3-touch-amoled-1.8', 'Waveshare ESP32-S3-Touch-AMOLED-1.8', 32, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101033, 101, 'Waveshare ESP32-S3-Touch-LCD-1.85C', 'esp32-s3-touch-lcd-1.85c', 'Waveshare ESP32-S3-Touch-LCD-1.85C', 33, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101034, 101, 'Waveshare ESP32-S3-Touch-LCD-1.85', 'esp32-s3-touch-lcd-1.85', 'Waveshare ESP32-S3-Touch-LCD-1.85', 34, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101035, 101, 'Waveshare ESP32-S3-Touch-LCD-1.46', 'esp32-s3-touch-lcd-1.46', 'Waveshare ESP32-S3-Touch-LCD-1.46', 35, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101036, 101, 'Waveshare ESP32-S3-Touch-LCD-3.5', 'esp32-s3-touch-lcd-3.5', 'Waveshare ESP32-S3-Touch-LCD-3.5', 36, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101037, 101, '土豆子', 'tudouzi', '土豆子', 37, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101038, 101, 'LILYGO T-Circle-S3', 'lilygo-t-circle-s3', 'LILYGO T-Circle-S3', 38, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101039, 101, 'LILYGO T-CameraPlus-S3', 'lilygo-t-cameraplus-s3', 'LILYGO T-CameraPlus-S3', 39, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101040, 101, 'Movecall Moji 小智AI衍生版', 'movecall-moji-esp32s3', 'Movecall Moji 小智AI衍生版', 40, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101041, 101, 'Movecall CuiCan 璀璨·AI吊坠', 'movecall-cuican-esp32s3', 'Movecall CuiCan 璀璨·AI吊坠', 41, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101042, 101, '正点原子DNESP32S3开发板', 'atk-dnesp32s3', '正点原子DNESP32S3开发板', 42, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101043, 101, '正点原子DNESP32S3-BOX', 'atk-dnesp32s3-box', '正点原子DNESP32S3-BOX', 43, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101044, 101, '嘟嘟开发板CHATX(wifi)', 'du-chatx', '嘟嘟开发板CHATX(wifi)', 44, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101045, 101, '太极小派esp32s3', 'taiji-pi-s3', '太极小派esp32s3', 45, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101046, 101, '无名科技星智0.85(WIFI)', 'xingzhi-cube-0.85tft-wifi', '无名科技星智0.85(WIFI)', 46, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101047, 101, '无名科技星智0.85(ML307)', 'xingzhi-cube-0.85tft-ml307', '无名科技星智0.85(ML307)', 47, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101048, 101, '无名科技星智0.96(WIFI)', 'xingzhi-cube-0.96oled-wifi', '无名科技星智0.96(WIFI)', 48, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101049, 101, '无名科技星智0.96(ML307)', 'xingzhi-cube-0.96oled-ml307', '无名科技星智0.96(ML307)', 49, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101050, 101, '无名科技星智1.54(WIFI)', 'xingzhi-cube-1.54tft-wifi', '无名科技星智1.54(WIFI)', 50, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101051, 101, '无名科技星智1.54(ML307)', 'xingzhi-cube-1.54tft-ml307', '无名科技星智1.54(ML307)', 51, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101052, 101, 'SenseCAP Watcher', 'sensecap-watcher', 'SenseCAP Watcher', 52, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101053, 101, '四博智联AI陪伴盒子', 'doit-s3-aibox', '四博智联AI陪伴盒子', 53, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (101054, 101, '元控·青春', 'mixgo-nova', '元控·青春', 54, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102001, 102, '中国大陆', '+86', '中国大陆', 1, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102002, 102, '中国香港', '+852', '中国香港', 2, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102003, 102, '中国澳门', '+853', '中国澳门', 3, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102004, 102, '中国台湾', '+886', '中国台湾', 4, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102005, 102, '美国/加拿大', '+1', '美国/加拿大', 5, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102006, 102, '英国', '+44', '英国', 6, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102007, 102, '法国', '+33', '法国', 7, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102008, 102, '意大利', '+39', '意大利', 8, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102009, 102, '德国', '+49', '德国', 9, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102010, 102, '波兰', '+48', '波兰', 10, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102011, 102, '瑞士', '+41', '瑞士', 11, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102012, 102, '西班牙', '+34', '西班牙', 12, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102013, 102, '丹麦', '+45', '丹麦', 13, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102014, 102, '马来西亚', '+60', '马来西亚', 14, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102015, 102, '澳大利亚', '+61', '澳大利亚', 15, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102016, 102, '印度尼西亚', '+62', '印度尼西亚', 16, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102017, 102, '菲律宾', '+63', '菲律宾', 17, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102018, 102, '新西兰', '+64', '新西兰', 18, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102019, 102, '新加坡', '+65', '新加坡', 19, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102020, 102, '泰国', '+66', '泰国', 20, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102021, 102, '日本', '+81', '日本', 21, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102022, 102, '韩国', '+82', '韩国', 22, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102023, 102, '越南', '+84', '越南', 23, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102024, 102, '印度', '+91', '印度', 24, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102025, 102, '巴基斯坦', '+92', '巴基斯坦', 25, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102026, 102, '尼日利亚', '+234', '尼日利亚', 26, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102027, 102, '孟加拉国', '+880', '孟加拉国', 27, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102028, 102, '沙特阿拉伯', '+966', '沙特阿拉伯', 28, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102029, 102, '阿联酋', '+971', '阿联酋', 29, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102030, 102, '巴西', '+55', '巴西', 30, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102031, 102, '墨西哥', '+52', '墨西哥', 31, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102032, 102, '智利', '+56', '智利', 32, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102033, 102, '阿根廷', '+54', '阿根廷', 33, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102034, 102, '埃及', '+20', '埃及', 34, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102035, 102, '南非', '+27', '南非', 35, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102036, 102, '肯尼亚', '+254', '肯尼亚', 36, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102037, 102, '坦桑尼亚', '+255', '坦桑尼亚', 37, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_data VALUES (102038, 102, '哈萨克斯坦', '+7', '哈萨克斯坦', 38, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');


ALTER TABLE public.sys_dict_data ENABLE TRIGGER ALL;

--
-- Data for Name: sys_dict_type; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.sys_dict_type DISABLE TRIGGER ALL;

INSERT INTO public.sys_dict_type VALUES (101, 'FIRMWARE_TYPE', '固件类型', '固件类型字典', 0, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');
INSERT INTO public.sys_dict_type VALUES (102, 'MOBILE_AREA', '手机区域', '手机区域字典', 0, 1, '2026-11-10 22:51:44+08', 1, '2026-11-10 22:51:44+08');


ALTER TABLE public.sys_dict_type ENABLE TRIGGER ALL;

--
-- Data for Name: sys_params; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.sys_params DISABLE TRIGGER ALL;

INSERT INTO public.sys_params VALUES (102, 'server.secret', 'null', 'string', 1, '服务器密钥', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (103, 'server.allow_user_register', 'false', 'boolean', 1, '是否允许管理员以外的人注册', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (104, 'server.fronted_url', 'http://xiaozhi.server.com', 'string', 1, '下发六位验证码时显示的控制面板地址', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (105, 'device_max_output_size', '0', 'number', 1, '单台设备每天最多输出字数，0表示不限制', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (106, 'server.websocket', 'null', 'string', 1, 'websocket地址，多个用;分隔', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (107, 'server.ota', 'null', 'string', 1, 'ota地址', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (108, 'server.name', 'xiaozhi-esp32-server', 'string', 1, '系统名称', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (109, 'server.beian_icp_num', 'null', 'string', 1, 'icp备案号，填写null则不设置', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (110, 'server.beian_ga_num', 'null', 'string', 1, '公安备案号，填写null则不设置', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (111, 'server.enable_mobile_register', 'false', 'boolean', 1, '是否开启手机注册', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (112, 'server.sms_max_send_count', '10', 'number', 1, '单号码单日最大短信发送条数', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (113, 'server.mcp_endpoint', 'null', 'string', 1, 'mcp接入点地址', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (114, 'server.voice_print', 'null', 'string', 1, '声纹接口地址', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (115, 'server.voiceprint_similarity_threshold', '0.4', 'string', 1, '声纹识别相似度阈值，范围0.0-1.0，默认0.4，数值越高越严格', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (116, 'server.mqtt_gateway', 'null', 'string', 1, 'mqtt gateway 配置', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (117, 'server.mqtt_signature_key', 'null', 'string', 1, 'mqtt 密钥 配置', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (118, 'server.udp_gateway', 'null', 'string', 1, 'udp gateway 配置', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (119, 'server.mqtt_manager_api', 'null', 'string', 1, 'MQTT网关管理API的地址', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (120, 'server.public_key', '', 'string', 1, '服务器SM2公钥', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (121, 'server.private_key', '', 'string', 1, '服务器SM2私钥', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (122, 'server.auth.enabled', 'true', 'boolean', 1, 'server模块是否开启token认证', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (201, 'log.log_format', '<green>{time:YYMMDD HH:mm:ss}</green>[<light-blue>{version}-{selected_module}</light-blue>][<light-blue>{extra[tag]}</light-blue>]-<level>{level}</level>-<light-green>{message}</light-green>', 'string', 1, '控制台日志格式', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (202, 'log.log_format_file', '{time:YYYY-MM-DD HH:mm:ss} - {version}_{selected_module} - {name} - {level} - {extra[tag]} - {message}', 'string', 1, '文件日志格式', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (203, 'log.log_level', 'INFO', 'string', 1, '日志级别', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (204, 'log.log_dir', 'tmp', 'string', 1, '日志目录', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (205, 'log.log_file', 'server.log', 'string', 1, '日志文件名', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (206, 'log.data_dir', 'data', 'string', 1, '数据目录', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (301, 'delete_audio', 'true', 'boolean', 1, '是否删除使用后的音频文件', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (302, 'close_connection_no_voice_time', '120', 'number', 1, '无语音输入断开连接时间(秒)', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (303, 'tts_timeout', '15', 'number', 1, 'TTS请求超时时间(秒)', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (304, 'enable_wakeup_words_response_cache', 'true', 'boolean', 1, '是否开启唤醒词加速', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (305, 'enable_greeting', 'true', 'boolean', 1, '是否开启开场回复', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (306, 'enable_stop_tts_notify', 'false', 'boolean', 1, '是否开启结束提示音', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (307, 'stop_tts_notify_voice', 'config/assets/tts_notify.mp3', 'string', 1, '结束提示音文件路径', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (308, 'exit_commands', '退出;关闭', 'array', 1, '退出命令列表', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (309, 'xiaozhi', '{
  "type": "hello",
  "version": 1,
  "transport": "websocket",
  "audio_params": {
    "format": "opus",
    "sample_rate": 24000,
    "channels": 1,
    "frame_duration": 60
  }
}', 'json', 1, '小智类型', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (310, 'wakeup_words', '你好小智;你好小志;小爱同学;你好小鑫;你好小新;小美同学;小龙小龙;喵喵同学;小滨小滨;小冰小冰;嘿你好呀', 'array', 1, '唤醒词列表，用于识别唤醒词', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (311, 'enable_websocket_ping', 'false', 'boolean', 1, '是否启用WebSocket心跳保活机制', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (312, 'tool_call_timeout', '30', 'number', 1, '工具调用超时时间(秒)', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (500, 'end_prompt.enable', 'true', 'boolean', 1, '是否开启结束语', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (501, 'end_prompt.prompt', '请你以“时间过得真快”未来头，用富有感情、依依不舍的话来结束这场对话吧！', 'string', 1, '结束提示词', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (502, 'system_error_response', '主人，小智现在有点忙，我们稍后再试吧。', 'string', 1, '系统错误时的回复', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (600, 'system-web.menu', '{"groups": {"voiceManagement": ["vad", "asr"], "featureManagement": ["voiceprintRecognition", "voiceClone", "knowledgeBase", "mcpAccessPoint"]}, "features": {"asr": {"name": "feature.asr.name", "enabled": true, "description": "feature.asr.description"}, "vad": {"name": "feature.vad.name", "enabled": true, "description": "feature.vad.description"}, "voiceClone": {"name": "feature.voiceClone.name", "enabled": false, "description": "feature.voiceClone.description"}, "knowledgeBase": {"name": "feature.knowledgeBase.name", "enabled": false, "description": "feature.knowledgeBase.description"}, "mcpAccessPoint": {"name": "feature.mcpAccessPoint.name", "enabled": false, "description": "feature.mcpAccessPoint.description"}, "voiceprintRecognition": {"name": "feature.voiceprintRecognition.name", "enabled": false, "description": "feature.voiceprintRecognition.description"}}, "addressBook": {"name": "feature.addressBook.name", "enabled": false, "description": "feature.addressBook.description"}}', 'json', 1, '系统功能菜单配置', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (610, 'aliyun.sms.access_key_id', '', 'string', 1, '阿里云平台access_key', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (611, 'aliyun.sms.access_key_secret', '', 'string', 1, '阿里云平台access_key_secret', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (612, 'aliyun.sms.sign_name', '', 'string', 1, '阿里云短信签名', NULL, NULL, NULL, NULL);
INSERT INTO public.sys_params VALUES (613, 'aliyun.sms.sms_code_template_code', '', 'string', 1, '阿里云短信模板', NULL, NULL, NULL, NULL);


ALTER TABLE public.sys_params ENABLE TRIGGER ALL;

--
-- Data for Name: sys_user; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.sys_user DISABLE TRIGGER ALL;



ALTER TABLE public.sys_user ENABLE TRIGGER ALL;

--
-- Data for Name: sys_user_token; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.sys_user_token DISABLE TRIGGER ALL;



ALTER TABLE public.sys_user_token ENABLE TRIGGER ALL;

--
-- Name: ai_agent_chat_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_agent_chat_history_id_seq', 1, true);


--
-- Name: ai_agent_plugin_mapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_agent_plugin_mapping_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--
