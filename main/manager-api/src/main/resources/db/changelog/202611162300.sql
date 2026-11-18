-- Add a built-in professional template for enterprise platform communication.
INSERT INTO ai_agent_template (
    id, agent_code, agent_name,
    asr_model_id, vad_model_id, llm_model_id, vllm_model_id,
    tts_model_id, tts_voice_id, tts_language, tts_volume, tts_rate, tts_pitch,
    mem_model_id, intent_model_id, system_prompt, summary_memory,
    chat_history_conf, lang_code, language, sort, creator, created_at, updater, updated_at
) VALUES (
    'enterpriseassist20261116', '小凡', '企业沟通助手',
    'ASR_FunASR', 'VAD_SileroVAD', 'authine-deepseek', NULL,
    'TTS_EdgeTTS', 'TTS_EdgeTTS0001', NULL, NULL, NULL, NULL,
    'Memory_mem_local_short', 'Intent_function_call', E'[角色设定]\n你是{{assistant_name}}，一名企业平台沟通助手，负责在用户与企业平台之间完成清晰、准确、专业的业务沟通。\n\n[沟通原则]\n- 回复简洁直接，先给结论或处理结果，再补充必要原因。\n- 使用正式书面语和专业术语，不闲聊、不使用语气词和表情。\n- 不编造平台数据；缺少必要信息时，一次性列出需要确认的字段。\n- 涉及工单、审批、项目、任务、财务或组织数据时，优先调用匹配的企业平台工具。\n- 存在多个同类平台时，根据系统、环境和业务域选择正确服务；不要跨环境调用。\n- 未经用户明确确认，不执行创建、修改、删除、审批或发布类操作。\n\n[输出格式]\n- 普通问题用1到3句话回复。\n- 复杂事项用短列表或分步说明，保留关键单号、状态、时间、责任人和下一步动作。\n- 语音回复避免Markdown符号；只保留必要序号和换行。\n\n[边界]\n- 只处理与企业平台业务相关的请求；无关问题时简短说明并引导用户回到业务场景。',
    '',
    0, 'zh', '中文', 6, NULL, NOW(), NULL, NOW()
)
ON CONFLICT (id) DO UPDATE SET
    agent_code = EXCLUDED.agent_code,
    agent_name = EXCLUDED.agent_name,
    asr_model_id = EXCLUDED.asr_model_id,
    vad_model_id = EXCLUDED.vad_model_id,
    llm_model_id = EXCLUDED.llm_model_id,
    vllm_model_id = EXCLUDED.vllm_model_id,
    tts_model_id = EXCLUDED.tts_model_id,
    tts_voice_id = EXCLUDED.tts_voice_id,
    tts_language = EXCLUDED.tts_language,
    tts_volume = EXCLUDED.tts_volume,
    tts_rate = EXCLUDED.tts_rate,
    tts_pitch = EXCLUDED.tts_pitch,
    mem_model_id = EXCLUDED.mem_model_id,
    intent_model_id = EXCLUDED.intent_model_id,
    system_prompt = EXCLUDED.system_prompt,
    summary_memory = EXCLUDED.summary_memory,
    chat_history_conf = EXCLUDED.chat_history_conf,
    lang_code = EXCLUDED.lang_code,
    language = EXCLUDED.language,
    sort = EXCLUDED.sort,
    updated_at = NOW();
