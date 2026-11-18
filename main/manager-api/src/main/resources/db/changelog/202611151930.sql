-- Configure emotion emojis sent to clients and allowed in LLM replies.
UPDATE public.sys_params SET param_value = 'true', value_type = 'boolean', remark = 'Emoji settings: enable emotion messages' WHERE param_code = 'emoji.enabled';
INSERT INTO public.sys_params (id, param_code, param_value, value_type, param_type, remark)
SELECT 123, 'emoji.enabled', 'true', 'boolean', 1, 'Emoji settings: enable emotion messages'
WHERE NOT EXISTS (SELECT 1 FROM public.sys_params WHERE param_code = 'emoji.enabled');

UPDATE public.sys_params SET param_value = '😶;🙂;😆;😂;😔;😠;😭;😍;😳;😲;😱;🤔;😉;😎;😌;🤤;😘;😏;😴;😜;🙄', value_type = 'array', remark = 'Emoji settings: emoji whitelist' WHERE param_code = 'emoji.list';
INSERT INTO public.sys_params (id, param_code, param_value, value_type, param_type, remark)
SELECT 124, 'emoji.list', '😶;🙂;😆;😂;😔;😠;😭;😍;😳;😲;😱;🤔;😉;😎;😌;🤤;😘;😏;😴;😜;🙄', 'array', 1, 'Emoji settings: emoji whitelist'
WHERE NOT EXISTS (SELECT 1 FROM public.sys_params WHERE param_code = 'emoji.list');

UPDATE public.sys_params SET param_value = '{"😂":"funny","😭":"crying","😠":"angry","😔":"sad","😍":"loving","😲":"surprised","😱":"shocked","🤔":"thinking","😌":"relaxed","😴":"sleepy","😜":"silly","🙄":"confused","😶":"neutral","🙂":"happy","😆":"laughing","😳":"embarrassed","😉":"winking","😎":"cool","🤤":"delicious","😘":"kissy","😏":"confident"}', value_type = 'json', remark = 'Emoji settings: emoji to client expression mapping' WHERE param_code = 'emoji.mapping';
INSERT INTO public.sys_params (id, param_code, param_value, value_type, param_type, remark)
SELECT 125, 'emoji.mapping', '{"😂":"funny","😭":"crying","😠":"angry","😔":"sad","😍":"loving","😲":"surprised","😱":"shocked","🤔":"thinking","😌":"relaxed","😴":"sleepy","😜":"silly","🙄":"confused","😶":"neutral","🙂":"happy","😆":"laughing","😳":"embarrassed","😉":"winking","😎":"cool","🤤":"delicious","😘":"kissy","😏":"confident"}', 'json', 1, 'Emoji settings: emoji to client expression mapping'
WHERE NOT EXISTS (SELECT 1 FROM public.sys_params WHERE param_code = 'emoji.mapping');
