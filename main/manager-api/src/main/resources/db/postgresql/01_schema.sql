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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS '';


--
-- Name: on_update_current_timestamp_ai_agent_correct_word_file(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.on_update_current_timestamp_ai_agent_correct_word_file() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$$;


--
-- Name: on_update_current_timestamp_ai_agent_correct_word_mapping(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.on_update_current_timestamp_ai_agent_correct_word_mapping() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$$;


--
-- Name: on_update_current_timestamp_ai_device_address_book(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.on_update_current_timestamp_ai_device_address_book() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
   NEW.update_date = now();
   RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ai_agent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent (
    id character varying(32) NOT NULL,
    user_id bigint,
    agent_code character varying(36),
    agent_name character varying(64),
    asr_model_id character varying(32),
    vad_model_id character varying(64),
    llm_model_id character varying(32),
    slm_model_id character varying(255),
    vllm_model_id character varying(32) DEFAULT 'VLLM_ChatGLMVLLM'::character varying,
    tts_model_id character varying(32),
    tts_voice_id character varying(32),
    tts_language character varying(50),
    tts_volume bigint,
    tts_rate bigint,
    tts_pitch bigint,
    mem_model_id character varying(32),
    intent_model_id character varying(32),
    system_prompt text,
    summary_memory text,
    chat_history_conf smallint DEFAULT '0'::smallint NOT NULL,
    lang_code character varying(10),
    language character varying(10),
    sort bigint DEFAULT '0'::bigint,
    creator bigint,
    created_at timestamp with time zone,
    updater bigint,
    updated_at timestamp with time zone
);


--
-- Name: TABLE ai_agent; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent IS '智能体配置表';


--
-- Name: COLUMN ai_agent.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.id IS '智能体唯一标识';


--
-- Name: COLUMN ai_agent.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.user_id IS '所属用户 ID';


--
-- Name: COLUMN ai_agent.agent_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.agent_code IS '智能体编码';


--
-- Name: COLUMN ai_agent.agent_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.agent_name IS '智能体名称';


--
-- Name: COLUMN ai_agent.asr_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.asr_model_id IS '语音识别模型标识';


--
-- Name: COLUMN ai_agent.vad_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.vad_model_id IS '语音活动检测标识';


--
-- Name: COLUMN ai_agent.llm_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.llm_model_id IS '大语言模型标识';


--
-- Name: COLUMN ai_agent.slm_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.slm_model_id IS '小模型ID';


--
-- Name: COLUMN ai_agent.vllm_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.vllm_model_id IS '视觉模型标识';


--
-- Name: COLUMN ai_agent.tts_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.tts_model_id IS '语音合成模型标识';


--
-- Name: COLUMN ai_agent.tts_voice_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.tts_voice_id IS '音色标识';


--
-- Name: COLUMN ai_agent.tts_language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.tts_language IS '音色语言';


--
-- Name: COLUMN ai_agent.tts_volume; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.tts_volume IS 'TTS音量';


--
-- Name: COLUMN ai_agent.tts_rate; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.tts_rate IS 'TTS语速';


--
-- Name: COLUMN ai_agent.tts_pitch; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.tts_pitch IS 'TTS音调';


--
-- Name: COLUMN ai_agent.mem_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.mem_model_id IS '记忆模型标识';


--
-- Name: COLUMN ai_agent.intent_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.intent_model_id IS '意图模型标识';


--
-- Name: COLUMN ai_agent.system_prompt; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.system_prompt IS '角色设定参数';


--
-- Name: COLUMN ai_agent.summary_memory; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.summary_memory IS '总结记忆';


--
-- Name: COLUMN ai_agent.chat_history_conf; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.chat_history_conf IS '聊天记录配置（0不记录 1仅记录文本 2记录文本和语音）';


--
-- Name: COLUMN ai_agent.lang_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.lang_code IS '语言编码';


--
-- Name: COLUMN ai_agent.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.language IS '交互语种';


--
-- Name: COLUMN ai_agent.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.sort IS '排序权重';


--
-- Name: COLUMN ai_agent.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.creator IS '创建者 ID';


--
-- Name: COLUMN ai_agent.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.created_at IS '创建时间';


--
-- Name: COLUMN ai_agent.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.updater IS '更新者 ID';


--
-- Name: COLUMN ai_agent.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent.updated_at IS '更新时间';


--
-- Name: ai_agent_chat_audio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_chat_audio (
    id character varying(32) NOT NULL,
    audio bytea
);


--
-- Name: TABLE ai_agent_chat_audio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_chat_audio IS '智能体聊天音频数据表';


--
-- Name: COLUMN ai_agent_chat_audio.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_audio.id IS '主键ID';


--
-- Name: COLUMN ai_agent_chat_audio.audio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_audio.audio IS '音频opus数据';


--
-- Name: ai_agent_chat_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_chat_history (
    id bigint NOT NULL,
    mac_address character varying(50),
    agent_id character varying(32),
    session_id character varying(50),
    chat_type smallint,
    content text,
    audio_id character varying(32),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE ai_agent_chat_history; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_chat_history IS '智能体聊天记录表';


--
-- Name: COLUMN ai_agent_chat_history.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.id IS '主键ID';


--
-- Name: COLUMN ai_agent_chat_history.mac_address; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.mac_address IS 'MAC地址';


--
-- Name: COLUMN ai_agent_chat_history.agent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.agent_id IS '智能体id';


--
-- Name: COLUMN ai_agent_chat_history.session_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.session_id IS '会话ID';


--
-- Name: COLUMN ai_agent_chat_history.chat_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.chat_type IS '消息类型: 1-用户, 2-智能体';


--
-- Name: COLUMN ai_agent_chat_history.content; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.content IS '聊天内容';


--
-- Name: COLUMN ai_agent_chat_history.audio_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.audio_id IS '音频ID';


--
-- Name: COLUMN ai_agent_chat_history.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.created_at IS '创建时间';


--
-- Name: COLUMN ai_agent_chat_history.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_history.updated_at IS '更新时间';


--
-- Name: ai_agent_chat_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_agent_chat_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_agent_chat_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_agent_chat_history_id_seq OWNED BY public.ai_agent_chat_history.id;


--
-- Name: ai_agent_chat_title; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_chat_title (
    id character varying(32) NOT NULL,
    session_id character varying(255) NOT NULL,
    title character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: TABLE ai_agent_chat_title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_chat_title IS '智能体聊天标题表';


--
-- Name: COLUMN ai_agent_chat_title.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_title.id IS '主键ID';


--
-- Name: COLUMN ai_agent_chat_title.session_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_title.session_id IS '会话ID';


--
-- Name: COLUMN ai_agent_chat_title.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_title.title IS '聊天标题';


--
-- Name: COLUMN ai_agent_chat_title.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_title.created_at IS '创建时间';


--
-- Name: COLUMN ai_agent_chat_title.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_chat_title.updated_at IS '更新时间';


--
-- Name: ai_agent_context_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_context_provider (
    id character varying(32) NOT NULL,
    agent_id character varying(32) NOT NULL,
    context_providers text,
    creator bigint,
    created_at timestamp with time zone,
    updater bigint,
    updated_at timestamp with time zone
);


--
-- Name: TABLE ai_agent_context_provider; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_context_provider IS '智能体上下文源配置表';


--
-- Name: COLUMN ai_agent_context_provider.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_context_provider.id IS '主键';


--
-- Name: COLUMN ai_agent_context_provider.agent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_context_provider.agent_id IS '智能体ID';


--
-- Name: COLUMN ai_agent_context_provider.context_providers; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_context_provider.context_providers IS '上下文源配置';


--
-- Name: COLUMN ai_agent_context_provider.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_context_provider.creator IS '创建者';


--
-- Name: COLUMN ai_agent_context_provider.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_context_provider.created_at IS '创建时间';


--
-- Name: COLUMN ai_agent_context_provider.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_context_provider.updater IS '更新者';


--
-- Name: COLUMN ai_agent_context_provider.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_context_provider.updated_at IS '更新时间';


--
-- Name: ai_agent_correct_word_file; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_correct_word_file (
    id character varying(32) NOT NULL,
    file_name character varying(256) NOT NULL,
    word_count bigint DEFAULT '0'::bigint NOT NULL,
    content text,
    creator bigint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updater bigint,
    updated_at timestamp with time zone
);


--
-- Name: TABLE ai_agent_correct_word_file; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_correct_word_file IS '替换词文件';


--
-- Name: COLUMN ai_agent_correct_word_file.file_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_correct_word_file.file_name IS '原始文件名';


--
-- Name: COLUMN ai_agent_correct_word_file.word_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_correct_word_file.word_count IS '替换词数量';


--
-- Name: COLUMN ai_agent_correct_word_file.content; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_correct_word_file.content IS '文件原始内容';


--
-- Name: ai_agent_correct_word_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_correct_word_item (
    id character varying(32) NOT NULL,
    file_id character varying(32) NOT NULL,
    source_word character varying(128) NOT NULL,
    target_word character varying(128) NOT NULL
);


--
-- Name: TABLE ai_agent_correct_word_item; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_correct_word_item IS '替换词词条';


--
-- Name: COLUMN ai_agent_correct_word_item.file_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_correct_word_item.file_id IS '所属文件ID';


--
-- Name: COLUMN ai_agent_correct_word_item.source_word; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_correct_word_item.source_word IS '原词';


--
-- Name: COLUMN ai_agent_correct_word_item.target_word; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_correct_word_item.target_word IS '替换词';


--
-- Name: ai_agent_correct_word_mapping; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_correct_word_mapping (
    id character varying(32) NOT NULL,
    agent_id character varying(32) NOT NULL,
    file_id character varying(32) NOT NULL,
    creator bigint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updater bigint,
    updated_at timestamp with time zone
);


--
-- Name: TABLE ai_agent_correct_word_mapping; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_correct_word_mapping IS '智能体替换词文件关联';


--
-- Name: ai_agent_plugin_mapping; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_plugin_mapping (
    id bigint NOT NULL,
    agent_id character varying(32) NOT NULL,
    plugin_id character varying(32) NOT NULL,
    param_info text NOT NULL
);


--
-- Name: TABLE ai_agent_plugin_mapping; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_plugin_mapping IS 'Agent与插件的唯一映射表';


--
-- Name: COLUMN ai_agent_plugin_mapping.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_plugin_mapping.id IS '主键';


--
-- Name: COLUMN ai_agent_plugin_mapping.agent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_plugin_mapping.agent_id IS '智能体ID';


--
-- Name: COLUMN ai_agent_plugin_mapping.plugin_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_plugin_mapping.plugin_id IS '插件ID';


--
-- Name: COLUMN ai_agent_plugin_mapping.param_info; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_plugin_mapping.param_info IS '参数信息';


--
-- Name: ai_agent_plugin_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_agent_plugin_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_agent_plugin_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_agent_plugin_mapping_id_seq OWNED BY public.ai_agent_plugin_mapping.id;


--
-- Name: ai_agent_snapshot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_snapshot (
    id character varying(32) NOT NULL,
    agent_id character varying(32) NOT NULL,
    user_id bigint,
    version_no bigint NOT NULL,
    snapshot_data text,
    changed_fields text,
    source character varying(32) DEFAULT 'config'::character varying,
    restore_from_snapshot_id character varying(32),
    restore_from_version_no bigint,
    creator bigint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    redaction_version smallint DEFAULT '0'::smallint NOT NULL
);


--
-- Name: TABLE ai_agent_snapshot; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_snapshot IS '智能体配置快照表';


--
-- Name: COLUMN ai_agent_snapshot.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.id IS '快照ID';


--
-- Name: COLUMN ai_agent_snapshot.agent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.agent_id IS '智能体ID';


--
-- Name: COLUMN ai_agent_snapshot.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.user_id IS '所属用户ID';


--
-- Name: COLUMN ai_agent_snapshot.version_no; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.version_no IS '版本号';


--
-- Name: COLUMN ai_agent_snapshot.snapshot_data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.snapshot_data IS '快照数据';


--
-- Name: COLUMN ai_agent_snapshot.changed_fields; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.changed_fields IS '变更字段';


--
-- Name: COLUMN ai_agent_snapshot.source; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.source IS '快照来源';


--
-- Name: COLUMN ai_agent_snapshot.restore_from_snapshot_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.restore_from_snapshot_id IS '恢复来源快照ID';


--
-- Name: COLUMN ai_agent_snapshot.restore_from_version_no; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.restore_from_version_no IS '恢复来源版本号';


--
-- Name: COLUMN ai_agent_snapshot.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.creator IS '创建者';


--
-- Name: COLUMN ai_agent_snapshot.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.created_at IS '创建时间';


--
-- Name: COLUMN ai_agent_snapshot.redaction_version; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_snapshot.redaction_version IS '快照脱敏规则版本';


--
-- Name: ai_agent_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_tag (
    id character varying(32) NOT NULL,
    tag_name character varying(64) NOT NULL,
    sort bigint DEFAULT '0'::bigint,
    creator bigint,
    created_at timestamp with time zone,
    updater bigint,
    updated_at timestamp with time zone,
    deleted smallint DEFAULT '0'::smallint
);


--
-- Name: TABLE ai_agent_tag; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_tag IS '智能体标签表';


--
-- Name: COLUMN ai_agent_tag.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag.id IS '主键';


--
-- Name: COLUMN ai_agent_tag.tag_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag.tag_name IS '标签名称';


--
-- Name: COLUMN ai_agent_tag.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag.sort IS '排序';


--
-- Name: COLUMN ai_agent_tag.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag.creator IS '创建者';


--
-- Name: COLUMN ai_agent_tag.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag.created_at IS '创建时间';


--
-- Name: COLUMN ai_agent_tag.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag.updater IS '更新者';


--
-- Name: COLUMN ai_agent_tag.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag.updated_at IS '更新时间';


--
-- Name: COLUMN ai_agent_tag.deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag.deleted IS '删除标记';


--
-- Name: ai_agent_tag_relation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_tag_relation (
    id character varying(32) NOT NULL,
    agent_id character varying(32) NOT NULL,
    tag_id character varying(32) NOT NULL,
    creator bigint,
    created_at timestamp with time zone,
    updater bigint,
    updated_at timestamp with time zone,
    sort bigint DEFAULT '0'::bigint
);


--
-- Name: TABLE ai_agent_tag_relation; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_tag_relation IS '智能体标签关联表';


--
-- Name: COLUMN ai_agent_tag_relation.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag_relation.id IS '主键';


--
-- Name: COLUMN ai_agent_tag_relation.agent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag_relation.agent_id IS '智能体ID';


--
-- Name: COLUMN ai_agent_tag_relation.tag_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag_relation.tag_id IS '标签ID';


--
-- Name: COLUMN ai_agent_tag_relation.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag_relation.creator IS '创建者';


--
-- Name: COLUMN ai_agent_tag_relation.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag_relation.created_at IS '创建时间';


--
-- Name: COLUMN ai_agent_tag_relation.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag_relation.updater IS '更新者';


--
-- Name: COLUMN ai_agent_tag_relation.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag_relation.updated_at IS '更新时间';


--
-- Name: COLUMN ai_agent_tag_relation.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_tag_relation.sort IS '排序';


--
-- Name: ai_agent_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_template (
    id character varying(32) NOT NULL,
    agent_code character varying(36),
    agent_name character varying(64),
    asr_model_id character varying(32),
    vad_model_id character varying(64),
    llm_model_id character varying(32),
    vllm_model_id character varying(32) DEFAULT 'VLLM_ChatGLMVLLM'::character varying,
    tts_model_id character varying(32),
    tts_voice_id character varying(32),
    tts_language character varying(50),
    tts_volume bigint,
    tts_rate bigint,
    tts_pitch bigint,
    mem_model_id character varying(32),
    intent_model_id character varying(32),
    system_prompt text,
    summary_memory text,
    chat_history_conf smallint DEFAULT '0'::smallint NOT NULL,
    lang_code character varying(10),
    language character varying(10),
    sort bigint DEFAULT '0'::bigint,
    creator bigint,
    created_at timestamp with time zone,
    updater bigint,
    updated_at timestamp with time zone
);


--
-- Name: TABLE ai_agent_template; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_template IS '智能体配置模板表';


--
-- Name: COLUMN ai_agent_template.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.id IS '智能体唯一标识';


--
-- Name: COLUMN ai_agent_template.agent_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.agent_code IS '智能体编码';


--
-- Name: COLUMN ai_agent_template.agent_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.agent_name IS '智能体名称';


--
-- Name: COLUMN ai_agent_template.asr_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.asr_model_id IS '语音识别模型标识';


--
-- Name: COLUMN ai_agent_template.vad_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.vad_model_id IS '语音活动检测标识';


--
-- Name: COLUMN ai_agent_template.llm_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.llm_model_id IS '大语言模型标识';


--
-- Name: COLUMN ai_agent_template.vllm_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.vllm_model_id IS '视觉模型标识';


--
-- Name: COLUMN ai_agent_template.tts_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.tts_model_id IS '语音合成模型标识';


--
-- Name: COLUMN ai_agent_template.tts_voice_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.tts_voice_id IS '音色标识';


--
-- Name: COLUMN ai_agent_template.tts_language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.tts_language IS '音色语言';


--
-- Name: COLUMN ai_agent_template.tts_volume; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.tts_volume IS 'TTS音量';


--
-- Name: COLUMN ai_agent_template.tts_rate; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.tts_rate IS 'TTS语速';


--
-- Name: COLUMN ai_agent_template.tts_pitch; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.tts_pitch IS 'TTS音调';


--
-- Name: COLUMN ai_agent_template.mem_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.mem_model_id IS '记忆模型标识';


--
-- Name: COLUMN ai_agent_template.intent_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.intent_model_id IS '意图模型标识';


--
-- Name: COLUMN ai_agent_template.system_prompt; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.system_prompt IS '角色设定参数';


--
-- Name: COLUMN ai_agent_template.summary_memory; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.summary_memory IS '总结记忆';


--
-- Name: COLUMN ai_agent_template.chat_history_conf; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.chat_history_conf IS '聊天记录配置（0不记录 1仅记录文本 2记录文本和语音）';


--
-- Name: COLUMN ai_agent_template.lang_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.lang_code IS '语言编码';


--
-- Name: COLUMN ai_agent_template.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.language IS '交互语种';


--
-- Name: COLUMN ai_agent_template.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.sort IS '排序权重';


--
-- Name: COLUMN ai_agent_template.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.creator IS '创建者 ID';


--
-- Name: COLUMN ai_agent_template.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.created_at IS '创建时间';


--
-- Name: COLUMN ai_agent_template.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.updater IS '更新者 ID';


--
-- Name: COLUMN ai_agent_template.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_template.updated_at IS '更新时间';


--
-- Name: ai_agent_voice_print; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_voice_print (
    id character varying(32) NOT NULL,
    agent_id character varying(32) NOT NULL,
    source_name character varying(50) NOT NULL,
    introduce character varying(200),
    create_date timestamp with time zone,
    creator bigint,
    update_date timestamp with time zone,
    updater bigint,
    audio_id character varying(32) NOT NULL
);


--
-- Name: TABLE ai_agent_voice_print; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_agent_voice_print IS '智能体声纹表';


--
-- Name: COLUMN ai_agent_voice_print.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.id IS '声纹ID';


--
-- Name: COLUMN ai_agent_voice_print.agent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.agent_id IS '关联的智能体ID';


--
-- Name: COLUMN ai_agent_voice_print.source_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.source_name IS '声纹来源的人的姓名';


--
-- Name: COLUMN ai_agent_voice_print.introduce; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.introduce IS '描述声纹来源的这个人';


--
-- Name: COLUMN ai_agent_voice_print.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.create_date IS '创建时间';


--
-- Name: COLUMN ai_agent_voice_print.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.creator IS '创建者';


--
-- Name: COLUMN ai_agent_voice_print.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.update_date IS '修改时间';


--
-- Name: COLUMN ai_agent_voice_print.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.updater IS '修改者';


--
-- Name: COLUMN ai_agent_voice_print.audio_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_agent_voice_print.audio_id IS '音频ID';


--
-- Name: ai_device; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_device (
    id character varying(32) NOT NULL,
    user_id bigint,
    mac_address character varying(50),
    last_connected_at timestamp with time zone,
    auto_update smallint DEFAULT '0'::smallint,
    board character varying(50),
    alias character varying(64),
    agent_id character varying(32),
    app_version character varying(20),
    sort bigint DEFAULT '0'::bigint,
    creator bigint,
    create_date timestamp with time zone,
    updater bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE ai_device; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_device IS '设备信息表';


--
-- Name: COLUMN ai_device.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.id IS '设备唯一标识';


--
-- Name: COLUMN ai_device.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.user_id IS '关联用户 ID';


--
-- Name: COLUMN ai_device.mac_address; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.mac_address IS 'MAC 地址';


--
-- Name: COLUMN ai_device.last_connected_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.last_connected_at IS '最后连接时间';


--
-- Name: COLUMN ai_device.auto_update; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.auto_update IS '自动更新开关(0 关闭/1 开启)';


--
-- Name: COLUMN ai_device.board; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.board IS '设备硬件型号';


--
-- Name: COLUMN ai_device.alias; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.alias IS '设备别名';


--
-- Name: COLUMN ai_device.agent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.agent_id IS '智能体 ID';


--
-- Name: COLUMN ai_device.app_version; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.app_version IS '固件版本号';


--
-- Name: COLUMN ai_device.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.sort IS '排序';


--
-- Name: COLUMN ai_device.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.creator IS '创建者';


--
-- Name: COLUMN ai_device.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.create_date IS '创建时间';


--
-- Name: COLUMN ai_device.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.updater IS '更新者';


--
-- Name: COLUMN ai_device.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device.update_date IS '更新时间';


--
-- Name: ai_device_address_book; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_device_address_book (
    mac_address character varying(64) NOT NULL,
    target_mac character varying(64) NOT NULL,
    alias character varying(64),
    has_permission boolean DEFAULT true,
    creator bigint,
    create_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updater bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE ai_device_address_book; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_device_address_book IS '设备通讯录表';


--
-- Name: COLUMN ai_device_address_book.mac_address; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device_address_book.mac_address IS '本设备MAC地址';


--
-- Name: COLUMN ai_device_address_book.target_mac; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device_address_book.target_mac IS '对方设备MAC地址';


--
-- Name: COLUMN ai_device_address_book.alias; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device_address_book.alias IS '别名';


--
-- Name: COLUMN ai_device_address_book.has_permission; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device_address_book.has_permission IS '是否有权限呼叫';


--
-- Name: COLUMN ai_device_address_book.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device_address_book.creator IS '创建人';


--
-- Name: COLUMN ai_device_address_book.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device_address_book.create_date IS '创建时间';


--
-- Name: COLUMN ai_device_address_book.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device_address_book.updater IS '更新人';


--
-- Name: COLUMN ai_device_address_book.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_device_address_book.update_date IS '更新时间';


--
-- Name: ai_model_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_model_config (
    id character varying(32) NOT NULL,
    model_type character varying(20),
    model_code character varying(50),
    model_name character varying(50),
    is_default smallint DEFAULT 0,
    is_enabled smallint DEFAULT 1,
    config_json text,
    doc_link character varying(200),
    remark text,
    sort bigint DEFAULT '0'::bigint,
    creator bigint,
    create_date timestamp with time zone,
    updater bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE ai_model_config; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_model_config IS '模型配置表';


--
-- Name: COLUMN ai_model_config.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.id IS '主键';


--
-- Name: COLUMN ai_model_config.model_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.model_type IS '模型类型(Memory/ASR/VAD/LLM/TTS)';


--
-- Name: COLUMN ai_model_config.model_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.model_code IS '模型编码(如AliLLM、DoubaoTTS)';


--
-- Name: COLUMN ai_model_config.model_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.model_name IS '模型名称';


--
-- Name: COLUMN ai_model_config.is_default; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.is_default IS '是否默认配置(0否 1是)';


--
-- Name: COLUMN ai_model_config.is_enabled; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.is_enabled IS '是否启用';


--
-- Name: COLUMN ai_model_config.config_json; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.config_json IS '模型配置(JSON格式)';


--
-- Name: COLUMN ai_model_config.doc_link; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.doc_link IS '官方文档链接';


--
-- Name: COLUMN ai_model_config.remark; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.remark IS '备注';


--
-- Name: COLUMN ai_model_config.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.sort IS '排序';


--
-- Name: COLUMN ai_model_config.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.creator IS '创建者';


--
-- Name: COLUMN ai_model_config.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.create_date IS '创建时间';


--
-- Name: COLUMN ai_model_config.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.updater IS '更新者';


--
-- Name: COLUMN ai_model_config.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_config.update_date IS '更新时间';


--
-- Name: ai_model_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_model_provider (
    id character varying(32) NOT NULL,
    model_type character varying(20),
    provider_code character varying(50),
    name character varying(50),
    fields text,
    sort bigint DEFAULT '0'::bigint,
    creator bigint,
    create_date timestamp with time zone,
    updater bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE ai_model_provider; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_model_provider IS '模型配置表';


--
-- Name: COLUMN ai_model_provider.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.id IS '主键';


--
-- Name: COLUMN ai_model_provider.model_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.model_type IS '模型类型(Memory/ASR/VAD/LLM/TTS)';


--
-- Name: COLUMN ai_model_provider.provider_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.provider_code IS '供应器类型';


--
-- Name: COLUMN ai_model_provider.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.name IS '供应器名称';


--
-- Name: COLUMN ai_model_provider.fields; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.fields IS '供应器字段列表(JSON格式)';


--
-- Name: COLUMN ai_model_provider.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.sort IS '排序';


--
-- Name: COLUMN ai_model_provider.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.creator IS '创建者';


--
-- Name: COLUMN ai_model_provider.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.create_date IS '创建时间';


--
-- Name: COLUMN ai_model_provider.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.updater IS '更新者';


--
-- Name: COLUMN ai_model_provider.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_model_provider.update_date IS '更新时间';


--
-- Name: ai_ota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_ota (
    id character varying(32) NOT NULL,
    firmware_name character varying(100),
    type character varying(50),
    version character varying(50),
    size bigint,
    remark character varying(500),
    firmware_path character varying(255),
    sort bigint DEFAULT '0'::bigint,
    updater bigint,
    update_date timestamp with time zone,
    creator bigint,
    create_date timestamp with time zone
);


--
-- Name: TABLE ai_ota; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_ota IS '固件信息表';


--
-- Name: COLUMN ai_ota.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.id IS 'ID';


--
-- Name: COLUMN ai_ota.firmware_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.firmware_name IS '固件名称';


--
-- Name: COLUMN ai_ota.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.type IS '固件类型';


--
-- Name: COLUMN ai_ota.version; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.version IS '版本号';


--
-- Name: COLUMN ai_ota.size; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.size IS '文件大小(字节)';


--
-- Name: COLUMN ai_ota.remark; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.remark IS '备注/说明';


--
-- Name: COLUMN ai_ota.firmware_path; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.firmware_path IS '固件路径';


--
-- Name: COLUMN ai_ota.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.sort IS '排序';


--
-- Name: COLUMN ai_ota.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.updater IS '更新者';


--
-- Name: COLUMN ai_ota.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.update_date IS '更新时间';


--
-- Name: COLUMN ai_ota.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.creator IS '创建者';


--
-- Name: COLUMN ai_ota.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_ota.create_date IS '创建时间';


--
-- Name: ai_rag_dataset; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_rag_dataset (
    id character varying(32) NOT NULL,
    dataset_id character varying(64) NOT NULL,
    rag_model_id character varying(64),
    name character varying(100) NOT NULL,
    description text,
    status smallint DEFAULT 1,
    creator bigint,
    created_at timestamp with time zone,
    updater bigint,
    updated_at timestamp with time zone,
    tenant_id character varying(32),
    avatar text,
    embedding_model character varying(50),
    permission character varying(20) DEFAULT 'me'::character varying,
    chunk_method character varying(50),
    parser_config text,
    chunk_count bigint DEFAULT '0'::bigint,
    document_count bigint DEFAULT '0'::bigint,
    token_num bigint DEFAULT '0'::bigint
);


--
-- Name: TABLE ai_rag_dataset; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_rag_dataset IS '知识库表';


--
-- Name: COLUMN ai_rag_dataset.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.id IS '唯一标识';


--
-- Name: COLUMN ai_rag_dataset.dataset_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.dataset_id IS '知识库ID';


--
-- Name: COLUMN ai_rag_dataset.rag_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.rag_model_id IS 'RAG模型配置ID';


--
-- Name: COLUMN ai_rag_dataset.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.name IS '知识库名称';


--
-- Name: COLUMN ai_rag_dataset.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.description IS '知识库描述';


--
-- Name: COLUMN ai_rag_dataset.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.status IS '状态：0停用 1启用';


--
-- Name: COLUMN ai_rag_dataset.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.creator IS '创建者';


--
-- Name: COLUMN ai_rag_dataset.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.created_at IS '创建时间';


--
-- Name: COLUMN ai_rag_dataset.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.updater IS '更新者';


--
-- Name: COLUMN ai_rag_dataset.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.updated_at IS '更新时间';


--
-- Name: COLUMN ai_rag_dataset.tenant_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.tenant_id IS '租户ID';


--
-- Name: COLUMN ai_rag_dataset.avatar; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.avatar IS '知识库头像 (Base64)';


--
-- Name: COLUMN ai_rag_dataset.embedding_model; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.embedding_model IS '嵌入模型名称';


--
-- Name: COLUMN ai_rag_dataset.permission; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.permission IS '权限设置：me/team';


--
-- Name: COLUMN ai_rag_dataset.chunk_method; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.chunk_method IS '分块方法';


--
-- Name: COLUMN ai_rag_dataset.parser_config; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.parser_config IS '解析器配置 (JSON)';


--
-- Name: COLUMN ai_rag_dataset.chunk_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.chunk_count IS '分块总数';


--
-- Name: COLUMN ai_rag_dataset.document_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.document_count IS '文档总数';


--
-- Name: COLUMN ai_rag_dataset.token_num; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_dataset.token_num IS '总 Token 数';


--
-- Name: ai_rag_knowledge_document; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_rag_knowledge_document (
    id character varying(36) NOT NULL,
    dataset_id character varying(36) NOT NULL,
    document_id character varying(64) NOT NULL,
    name character varying(255),
    size bigint,
    type character varying(20),
    chunk_method character varying(50),
    parser_config text,
    status character varying(10) DEFAULT '1'::character varying,
    run character varying(32) DEFAULT 'UNSTART'::character varying,
    progress double precision DEFAULT '0'::double precision,
    thumbnail text,
    process_duration double precision DEFAULT '0'::double precision,
    meta_fields text,
    source_type character varying(32) DEFAULT 'local'::character varying,
    error text,
    chunk_count bigint DEFAULT '0'::bigint,
    token_count bigint DEFAULT '0'::bigint,
    enabled smallint DEFAULT 1,
    creator bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    last_sync_at timestamp with time zone
);


--
-- Name: TABLE ai_rag_knowledge_document; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_rag_knowledge_document IS '知识库文档表';


--
-- Name: COLUMN ai_rag_knowledge_document.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.id IS '本地唯一ID';


--
-- Name: COLUMN ai_rag_knowledge_document.dataset_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.dataset_id IS '知识库ID (关联 ai_rag_dataset)';


--
-- Name: COLUMN ai_rag_knowledge_document.document_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.document_id IS 'RAGFlow文档ID (远程ID)';


--
-- Name: COLUMN ai_rag_knowledge_document.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.name IS '文档名称';


--
-- Name: COLUMN ai_rag_knowledge_document.size; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.size IS '文件大小(Bytes)';


--
-- Name: COLUMN ai_rag_knowledge_document.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.type IS '文件类型';


--
-- Name: COLUMN ai_rag_knowledge_document.chunk_method; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.chunk_method IS '分块方法';


--
-- Name: COLUMN ai_rag_knowledge_document.parser_config; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.parser_config IS '解析配置(JSON)';


--
-- Name: COLUMN ai_rag_knowledge_document.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.status IS '可用状态 (1:启用 0:禁用)';


--
-- Name: COLUMN ai_rag_knowledge_document.run; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.run IS '运行状态 (UNSTART/RUNNING/CANCEL/DONE/FAIL)';


--
-- Name: COLUMN ai_rag_knowledge_document.progress; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.progress IS '解析进度 (0.0 ~ 1.0)';


--
-- Name: COLUMN ai_rag_knowledge_document.thumbnail; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.thumbnail IS '缩略图 (Base64 或 URL)';


--
-- Name: COLUMN ai_rag_knowledge_document.process_duration; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.process_duration IS '解析耗时 (单位: 秒)';


--
-- Name: COLUMN ai_rag_knowledge_document.meta_fields; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.meta_fields IS '自定义元数据 (JSON)';


--
-- Name: COLUMN ai_rag_knowledge_document.source_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.source_type IS '来源类型 (local, s3, url 等)';


--
-- Name: COLUMN ai_rag_knowledge_document.error; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.error IS '错误信息';


--
-- Name: COLUMN ai_rag_knowledge_document.chunk_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.chunk_count IS '分块数量';


--
-- Name: COLUMN ai_rag_knowledge_document.token_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.token_count IS 'Token数量';


--
-- Name: COLUMN ai_rag_knowledge_document.enabled; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.enabled IS '启用状态';


--
-- Name: COLUMN ai_rag_knowledge_document.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.creator IS '创建者';


--
-- Name: COLUMN ai_rag_knowledge_document.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.created_at IS '创建时间';


--
-- Name: COLUMN ai_rag_knowledge_document.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.updated_at IS '更新时间';


--
-- Name: COLUMN ai_rag_knowledge_document.last_sync_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_rag_knowledge_document.last_sync_at IS '最后同步时间';


--
-- Name: ai_tts_voice; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_tts_voice (
    id character varying(32) NOT NULL,
    tts_model_id character varying(32),
    name character varying(20),
    tts_voice character varying(50),
    languages character varying(50),
    voice_demo character varying(500),
    remark character varying(255),
    reference_audio character varying(500),
    reference_text character varying(500),
    sort bigint DEFAULT '0'::bigint,
    creator bigint,
    create_date timestamp with time zone,
    updater bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE ai_tts_voice; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_tts_voice IS 'TTS 音色表';


--
-- Name: COLUMN ai_tts_voice.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.id IS '主键';


--
-- Name: COLUMN ai_tts_voice.tts_model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.tts_model_id IS '对应 TTS 模型主键';


--
-- Name: COLUMN ai_tts_voice.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.name IS '音色名称';


--
-- Name: COLUMN ai_tts_voice.tts_voice; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.tts_voice IS '音色编码';


--
-- Name: COLUMN ai_tts_voice.languages; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.languages IS '语言';


--
-- Name: COLUMN ai_tts_voice.voice_demo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.voice_demo IS '音色 Demo';


--
-- Name: COLUMN ai_tts_voice.remark; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.remark IS '备注';


--
-- Name: COLUMN ai_tts_voice.reference_audio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.reference_audio IS '参考音频路径';


--
-- Name: COLUMN ai_tts_voice.reference_text; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.reference_text IS '参考文本';


--
-- Name: COLUMN ai_tts_voice.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.sort IS '排序';


--
-- Name: COLUMN ai_tts_voice.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.creator IS '创建者';


--
-- Name: COLUMN ai_tts_voice.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.create_date IS '创建时间';


--
-- Name: COLUMN ai_tts_voice.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.updater IS '更新者';


--
-- Name: COLUMN ai_tts_voice.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_tts_voice.update_date IS '更新时间';


--
-- Name: ai_voice_clone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_voice_clone (
    id character varying(32) NOT NULL,
    name character varying(64),
    model_id character varying(32),
    voice_id character varying(32),
    languages character varying(50),
    user_id bigint,
    voice bytea,
    train_status smallint DEFAULT 0,
    train_error character varying(255),
    creator bigint,
    create_date timestamp with time zone
);


--
-- Name: TABLE ai_voice_clone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ai_voice_clone IS '声音克隆表';


--
-- Name: COLUMN ai_voice_clone.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.id IS '唯一标识';


--
-- Name: COLUMN ai_voice_clone.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.name IS '声音名称';


--
-- Name: COLUMN ai_voice_clone.model_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.model_id IS '模型id';


--
-- Name: COLUMN ai_voice_clone.voice_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.voice_id IS '声音id';


--
-- Name: COLUMN ai_voice_clone.languages; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.languages IS '语言';


--
-- Name: COLUMN ai_voice_clone.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.user_id IS '用户 ID（关联用户表）';


--
-- Name: COLUMN ai_voice_clone.voice; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.voice IS '声音';


--
-- Name: COLUMN ai_voice_clone.train_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.train_status IS '训练状态：0待训练 1训练中 2训练成功 3训练失败';


--
-- Name: COLUMN ai_voice_clone.train_error; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.train_error IS '训练错误原因';


--
-- Name: COLUMN ai_voice_clone.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.creator IS '创建者 ID';


--
-- Name: COLUMN ai_voice_clone.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ai_voice_clone.create_date IS '创建时间';


--
-- Name: sys_dict_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_dict_data (
    id bigint NOT NULL,
    dict_type_id bigint NOT NULL,
    dict_label character varying(255) NOT NULL,
    dict_value character varying(255),
    remark character varying(255),
    sort bigint,
    creator bigint,
    create_date timestamp with time zone,
    updater bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE sys_dict_data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.sys_dict_data IS '字典数据';


--
-- Name: COLUMN sys_dict_data.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.id IS 'id';


--
-- Name: COLUMN sys_dict_data.dict_type_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.dict_type_id IS '字典类型ID';


--
-- Name: COLUMN sys_dict_data.dict_label; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.dict_label IS '字典标签';


--
-- Name: COLUMN sys_dict_data.dict_value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.dict_value IS '字典值';


--
-- Name: COLUMN sys_dict_data.remark; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.remark IS '备注';


--
-- Name: COLUMN sys_dict_data.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.sort IS '排序';


--
-- Name: COLUMN sys_dict_data.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.creator IS '创建者';


--
-- Name: COLUMN sys_dict_data.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.create_date IS '创建时间';


--
-- Name: COLUMN sys_dict_data.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.updater IS '更新者';


--
-- Name: COLUMN sys_dict_data.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_data.update_date IS '更新时间';


--
-- Name: sys_dict_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_dict_type (
    id bigint NOT NULL,
    dict_type character varying(100) NOT NULL,
    dict_name character varying(255) NOT NULL,
    remark character varying(255),
    sort bigint,
    creator bigint,
    create_date timestamp with time zone,
    updater bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE sys_dict_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.sys_dict_type IS '字典类型';


--
-- Name: COLUMN sys_dict_type.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.id IS 'id';


--
-- Name: COLUMN sys_dict_type.dict_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.dict_type IS '字典类型';


--
-- Name: COLUMN sys_dict_type.dict_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.dict_name IS '字典名称';


--
-- Name: COLUMN sys_dict_type.remark; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.remark IS '备注';


--
-- Name: COLUMN sys_dict_type.sort; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.sort IS '排序';


--
-- Name: COLUMN sys_dict_type.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.creator IS '创建者';


--
-- Name: COLUMN sys_dict_type.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.create_date IS '创建时间';


--
-- Name: COLUMN sys_dict_type.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.updater IS '更新者';


--
-- Name: COLUMN sys_dict_type.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_dict_type.update_date IS '更新时间';


--
-- Name: sys_params; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_params (
    id bigint NOT NULL,
    param_code character varying(100),
    param_value character varying(2000),
    value_type character varying(20) DEFAULT 'string'::character varying,
    param_type smallint DEFAULT '1'::smallint,
    remark character varying(200),
    creator bigint,
    create_date timestamp with time zone,
    updater bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE sys_params; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.sys_params IS '参数管理';


--
-- Name: COLUMN sys_params.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.id IS 'id';


--
-- Name: COLUMN sys_params.param_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.param_code IS '参数编码';


--
-- Name: COLUMN sys_params.param_value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.param_value IS '参数值';


--
-- Name: COLUMN sys_params.value_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.value_type IS '值类型：string-字符串，number-数字，boolean-布尔，array-数组';


--
-- Name: COLUMN sys_params.param_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.param_type IS '类型   0：系统参数   1：非系统参数';


--
-- Name: COLUMN sys_params.remark; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.remark IS '备注';


--
-- Name: COLUMN sys_params.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.creator IS '创建者';


--
-- Name: COLUMN sys_params.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.create_date IS '创建时间';


--
-- Name: COLUMN sys_params.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.updater IS '更新者';


--
-- Name: COLUMN sys_params.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_params.update_date IS '更新时间';


--
-- Name: sys_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_user (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100),
    super_admin smallint,
    status smallint,
    create_date timestamp with time zone,
    updater bigint,
    creator bigint,
    update_date timestamp with time zone
);


--
-- Name: TABLE sys_user; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.sys_user IS '系统用户';


--
-- Name: COLUMN sys_user.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.id IS 'id';


--
-- Name: COLUMN sys_user.username; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.username IS '用户名';


--
-- Name: COLUMN sys_user.password; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.password IS '密码';


--
-- Name: COLUMN sys_user.super_admin; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.super_admin IS '超级管理员   0：否   1：是';


--
-- Name: COLUMN sys_user.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.status IS '状态  0：停用   1：正常';


--
-- Name: COLUMN sys_user.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.create_date IS '创建时间';


--
-- Name: COLUMN sys_user.updater; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.updater IS '更新者';


--
-- Name: COLUMN sys_user.creator; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.creator IS '创建者';


--
-- Name: COLUMN sys_user.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user.update_date IS '更新时间';


--
-- Name: sys_user_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_user_token (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    token character varying(100) NOT NULL,
    expire_date timestamp with time zone,
    update_date timestamp with time zone,
    create_date timestamp with time zone
);


--
-- Name: TABLE sys_user_token; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.sys_user_token IS '系统用户Token';


--
-- Name: COLUMN sys_user_token.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user_token.id IS 'id';


--
-- Name: COLUMN sys_user_token.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user_token.user_id IS '用户id';


--
-- Name: COLUMN sys_user_token.token; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user_token.token IS '用户token';


--
-- Name: COLUMN sys_user_token.expire_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user_token.expire_date IS '过期时间';


--
-- Name: COLUMN sys_user_token.update_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user_token.update_date IS '更新时间';


--
-- Name: COLUMN sys_user_token.create_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sys_user_token.create_date IS '创建时间';


--
-- Name: ai_agent_chat_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_chat_history ALTER COLUMN id SET DEFAULT nextval('public.ai_agent_chat_history_id_seq'::regclass);


--
-- Name: ai_agent_plugin_mapping id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_plugin_mapping ALTER COLUMN id SET DEFAULT nextval('public.ai_agent_plugin_mapping_id_seq'::regclass);


--
-- Name: ai_agent idx_17334_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent
    ADD CONSTRAINT idx_17334_primary PRIMARY KEY (id);


--
-- Name: ai_agent_chat_audio idx_17342_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_chat_audio
    ADD CONSTRAINT idx_17342_primary PRIMARY KEY (id);


--
-- Name: ai_agent_chat_history idx_17348_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_chat_history
    ADD CONSTRAINT idx_17348_primary PRIMARY KEY (id);


--
-- Name: ai_agent_chat_title idx_17356_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_chat_title
    ADD CONSTRAINT idx_17356_primary PRIMARY KEY (id);


--
-- Name: ai_agent_context_provider idx_17361_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_context_provider
    ADD CONSTRAINT idx_17361_primary PRIMARY KEY (id);


--
-- Name: ai_agent_correct_word_file idx_17366_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_correct_word_file
    ADD CONSTRAINT idx_17366_primary PRIMARY KEY (id);


--
-- Name: ai_agent_correct_word_item idx_17373_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_correct_word_item
    ADD CONSTRAINT idx_17373_primary PRIMARY KEY (id);


--
-- Name: ai_agent_correct_word_mapping idx_17376_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_correct_word_mapping
    ADD CONSTRAINT idx_17376_primary PRIMARY KEY (id);


--
-- Name: ai_agent_plugin_mapping idx_17381_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_plugin_mapping
    ADD CONSTRAINT idx_17381_primary PRIMARY KEY (id);


--
-- Name: ai_agent_snapshot idx_17387_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_snapshot
    ADD CONSTRAINT idx_17387_primary PRIMARY KEY (id);


--
-- Name: ai_agent_tag idx_17395_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_tag
    ADD CONSTRAINT idx_17395_primary PRIMARY KEY (id);


--
-- Name: ai_agent_tag_relation idx_17400_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_tag_relation
    ADD CONSTRAINT idx_17400_primary PRIMARY KEY (id);


--
-- Name: ai_agent_template idx_17404_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_template
    ADD CONSTRAINT idx_17404_primary PRIMARY KEY (id);


--
-- Name: ai_agent_voice_print idx_17412_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_voice_print
    ADD CONSTRAINT idx_17412_primary PRIMARY KEY (id);


--
-- Name: ai_device idx_17415_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_device
    ADD CONSTRAINT idx_17415_primary PRIMARY KEY (id);


--
-- Name: ai_device_address_book idx_17420_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_device_address_book
    ADD CONSTRAINT idx_17420_primary PRIMARY KEY (mac_address, target_mac);


--
-- Name: ai_model_config idx_17425_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_model_config
    ADD CONSTRAINT idx_17425_primary PRIMARY KEY (id);


--
-- Name: ai_model_provider idx_17433_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_model_provider
    ADD CONSTRAINT idx_17433_primary PRIMARY KEY (id);


--
-- Name: ai_ota idx_17439_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_ota
    ADD CONSTRAINT idx_17439_primary PRIMARY KEY (id);


--
-- Name: ai_rag_dataset idx_17445_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_rag_dataset
    ADD CONSTRAINT idx_17445_primary PRIMARY KEY (id);


--
-- Name: ai_rag_knowledge_document idx_17455_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_rag_knowledge_document
    ADD CONSTRAINT idx_17455_primary PRIMARY KEY (id);


--
-- Name: ai_tts_voice idx_17468_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_tts_voice
    ADD CONSTRAINT idx_17468_primary PRIMARY KEY (id);


--
-- Name: ai_voice_clone idx_17474_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_voice_clone
    ADD CONSTRAINT idx_17474_primary PRIMARY KEY (id);


--
-- Name: sys_dict_data idx_17480_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_dict_data
    ADD CONSTRAINT idx_17480_primary PRIMARY KEY (id);


--
-- Name: sys_dict_type idx_17485_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_dict_type
    ADD CONSTRAINT idx_17485_primary PRIMARY KEY (id);


--
-- Name: sys_params idx_17490_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_params
    ADD CONSTRAINT idx_17490_primary PRIMARY KEY (id);


--
-- Name: sys_user idx_17497_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT idx_17497_primary PRIMARY KEY (id);


--
-- Name: sys_user_token idx_17500_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_user_token
    ADD CONSTRAINT idx_17500_primary PRIMARY KEY (id);


--
-- Name: idx_17334_idx_ai_agent_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17334_idx_ai_agent_user_id ON public.ai_agent USING btree (user_id);


--
-- Name: idx_17348_idx_ai_agent_chat_history_agent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17348_idx_ai_agent_chat_history_agent_id ON public.ai_agent_chat_history USING btree (agent_id);


--
-- Name: idx_17348_idx_ai_agent_chat_history_agent_session_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17348_idx_ai_agent_chat_history_agent_session_created ON public.ai_agent_chat_history USING btree (agent_id, session_id, created_at);


--
-- Name: idx_17348_idx_ai_agent_chat_history_audio_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17348_idx_ai_agent_chat_history_audio_id ON public.ai_agent_chat_history USING btree (audio_id);


--
-- Name: idx_17348_idx_ai_agent_chat_history_mac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17348_idx_ai_agent_chat_history_mac ON public.ai_agent_chat_history USING btree (mac_address);


--
-- Name: idx_17348_idx_ai_agent_chat_history_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17348_idx_ai_agent_chat_history_session_id ON public.ai_agent_chat_history USING btree (session_id);


--
-- Name: idx_17356_idx_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17356_idx_session_id ON public.ai_agent_chat_title USING btree (session_id);


--
-- Name: idx_17361_idx_agent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17361_idx_agent_id ON public.ai_agent_context_provider USING btree (agent_id);


--
-- Name: idx_17366_idx_creator; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17366_idx_creator ON public.ai_agent_correct_word_file USING btree (creator);


--
-- Name: idx_17373_idx_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17373_idx_file_id ON public.ai_agent_correct_word_item USING btree (file_id);


--
-- Name: idx_17376_idx_agent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17376_idx_agent_id ON public.ai_agent_correct_word_mapping USING btree (agent_id);


--
-- Name: idx_17376_idx_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17376_idx_file_id ON public.ai_agent_correct_word_mapping USING btree (file_id);


--
-- Name: idx_17376_uk_agent_file; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17376_uk_agent_file ON public.ai_agent_correct_word_mapping USING btree (agent_id, file_id);


--
-- Name: idx_17381_uk_agent_provider; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17381_uk_agent_provider ON public.ai_agent_plugin_mapping USING btree (agent_id, plugin_id);


--
-- Name: idx_17387_idx_agent_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17387_idx_agent_created_at ON public.ai_agent_snapshot USING btree (agent_id, created_at);


--
-- Name: idx_17387_idx_snapshot_redaction_version_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17387_idx_snapshot_redaction_version_id ON public.ai_agent_snapshot USING btree (redaction_version, id);


--
-- Name: idx_17387_idx_snapshot_user_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17387_idx_snapshot_user_created_at ON public.ai_agent_snapshot USING btree (user_id, created_at);


--
-- Name: idx_17387_uk_agent_version; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17387_uk_agent_version ON public.ai_agent_snapshot USING btree (agent_id, version_no);


--
-- Name: idx_17395_idx_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17395_idx_sort ON public.ai_agent_tag USING btree (sort);


--
-- Name: idx_17395_uk_tag_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17395_uk_tag_name ON public.ai_agent_tag USING btree (tag_name);


--
-- Name: idx_17400_idx_agent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17400_idx_agent_id ON public.ai_agent_tag_relation USING btree (agent_id);


--
-- Name: idx_17400_idx_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17400_idx_tag_id ON public.ai_agent_tag_relation USING btree (tag_id);


--
-- Name: idx_17400_uk_agent_tag; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17400_uk_agent_tag ON public.ai_agent_tag_relation USING btree (agent_id, tag_id);


--
-- Name: idx_17415_idx_ai_device_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17415_idx_ai_device_created_at ON public.ai_device USING btree (mac_address);


--
-- Name: idx_17425_idx_ai_model_config_model_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17425_idx_ai_model_config_model_type ON public.ai_model_config USING btree (model_type);


--
-- Name: idx_17433_idx_ai_model_provider_model_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17433_idx_ai_model_provider_model_type ON public.ai_model_provider USING btree (model_type);


--
-- Name: idx_17445_idx_ai_rag_dataset_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17445_idx_ai_rag_dataset_created_at ON public.ai_rag_dataset USING btree (created_at);


--
-- Name: idx_17445_idx_ai_rag_dataset_creator; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17445_idx_ai_rag_dataset_creator ON public.ai_rag_dataset USING btree (creator);


--
-- Name: idx_17445_idx_ai_rag_dataset_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17445_idx_ai_rag_dataset_status ON public.ai_rag_dataset USING btree (status);


--
-- Name: idx_17445_uk_dataset_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17445_uk_dataset_id ON public.ai_rag_dataset USING btree (dataset_id);


--
-- Name: idx_17455_idx_dataset_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17455_idx_dataset_id ON public.ai_rag_knowledge_document USING btree (dataset_id);


--
-- Name: idx_17455_idx_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17455_idx_status ON public.ai_rag_knowledge_document USING btree (status);


--
-- Name: idx_17455_uk_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17455_uk_doc_id ON public.ai_rag_knowledge_document USING btree (document_id);


--
-- Name: idx_17468_idx_ai_tts_voice_tts_model_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17468_idx_ai_tts_voice_tts_model_id ON public.ai_tts_voice USING btree (tts_model_id);


--
-- Name: idx_17474_idx_ai_voice_clone_model_id_voice_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17474_idx_ai_voice_clone_model_id_voice_id ON public.ai_voice_clone USING btree (model_id, voice_id);


--
-- Name: idx_17474_idx_ai_voice_clone_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17474_idx_ai_voice_clone_user_id ON public.ai_voice_clone USING btree (user_id);


--
-- Name: idx_17474_idx_ai_voice_clone_user_id_model_id_train_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17474_idx_ai_voice_clone_user_id_model_id_train_status ON public.ai_voice_clone USING btree (model_id, user_id, train_status);


--
-- Name: idx_17474_idx_ai_voice_clone_voice_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17474_idx_ai_voice_clone_voice_id ON public.ai_voice_clone USING btree (voice_id);


--
-- Name: idx_17480_idx_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_17480_idx_sort ON public.sys_dict_data USING btree (sort);


--
-- Name: idx_17480_uk_dict_type_value; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17480_uk_dict_type_value ON public.sys_dict_data USING btree (dict_type_id, dict_value);


--
-- Name: idx_17485_dict_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17485_dict_type ON public.sys_dict_type USING btree (dict_type);


--
-- Name: idx_17490_uk_param_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17490_uk_param_code ON public.sys_params USING btree (param_code);


--
-- Name: idx_17497_uk_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17497_uk_username ON public.sys_user USING btree (username);


--
-- Name: idx_17500_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17500_token ON public.sys_user_token USING btree (token);


--
-- Name: idx_17500_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_17500_user_id ON public.sys_user_token USING btree (user_id);


--
-- Name: ai_agent_correct_word_file on_update_current_timestamp; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER on_update_current_timestamp BEFORE UPDATE ON public.ai_agent_correct_word_file FOR EACH ROW EXECUTE FUNCTION public.on_update_current_timestamp_ai_agent_correct_word_file();


--
-- Name: ai_agent_correct_word_mapping on_update_current_timestamp; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER on_update_current_timestamp BEFORE UPDATE ON public.ai_agent_correct_word_mapping FOR EACH ROW EXECUTE FUNCTION public.on_update_current_timestamp_ai_agent_correct_word_mapping();


--
-- Name: ai_device_address_book on_update_current_timestamp; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER on_update_current_timestamp BEFORE UPDATE ON public.ai_device_address_book FOR EACH ROW EXECUTE FUNCTION public.on_update_current_timestamp_ai_device_address_book();


--
-- PostgreSQL database dump complete
--
