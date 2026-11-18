-- Rebrand default product name and user-facing assistant persona.

UPDATE public.ai_agent_template
SET agent_code = COALESCE(replace(replace(agent_code, '小凡', '小凡'), '小志', '小凡'), agent_code),
    agent_name = COALESCE(replace(replace(agent_name, '小凡', '小凡'), '小志', '小凡'), agent_name),
    system_prompt = COALESCE(replace(replace(system_prompt, '小凡', '小凡'), '小志', '小凡'), system_prompt)
WHERE agent_code ILIKE '%小凡%' OR agent_code ILIKE '%小志%'
   OR agent_name ILIKE '%小凡%' OR agent_name ILIKE '%小志%'
   OR system_prompt ILIKE '%小凡%' OR system_prompt ILIKE '%小志%';

UPDATE public.ai_agent
SET agent_code = COALESCE(replace(replace(agent_code, '小凡', '小凡'), '小志', '小凡'), agent_code),
    agent_name = COALESCE(replace(replace(agent_name, '小凡', '小凡'), '小志', '小凡'), agent_name),
    system_prompt = COALESCE(replace(replace(system_prompt, '小凡', '小凡'), '小志', '小凡'), system_prompt)
WHERE agent_code ILIKE '%小凡%' OR agent_code ILIKE '%小志%'
   OR agent_name ILIKE '%小凡%' OR agent_name ILIKE '%小志%'
   OR system_prompt ILIKE '%小凡%' OR system_prompt ILIKE '%小志%';

UPDATE public.sys_dict_data
SET dict_label = replace(replace(dict_label, '小凡', '小凡'), '小志', '小凡'),
    remark = COALESCE(replace(replace(remark, '小凡', '小凡'), '小志', '小凡'), remark)
WHERE dict_label ILIKE '%小凡%' OR dict_label ILIKE '%小志%'
   OR remark ILIKE '%小凡%' OR remark ILIKE '%小志%';

UPDATE public.sys_params
SET param_value = CASE param_code
        WHEN 'server.name' THEN 'xiaofan-server'
        WHEN 'wakeup_words' THEN '你好小凡;小爱同学;你好小鑫;你好小新;小美同学;小龙小龙;喵喵同学;小滨小滨;小冰小冰;嘿你好呀'
        ELSE replace(replace(param_value, '小凡', '小凡'), '小志', '小凡')
    END,
    remark = COALESCE(replace(replace(remark, '小凡', '小凡'), '小志', '小凡'), remark)
WHERE param_code IN ('server.name', 'wakeup_words', 'system_error_response', 'xiaofan')
  OR remark ILIKE '%小凡%'
  OR remark ILIKE '%小志%';
