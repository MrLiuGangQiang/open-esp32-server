-- Configure externally advertised HTTPS/WSS endpoints for this deployment.
UPDATE sys_params
SET param_value = 'https://frp.lfans.cn:28002/'
WHERE param_code = 'server.fronted_url';

UPDATE sys_params
SET param_value = 'wss://frp.lfans.cn:28003/xiaofan/v1/'
WHERE param_code = 'server.websocket';

UPDATE sys_params
SET param_value = 'https://frp.lfans.cn:28002/xiaofan/ota/'
WHERE param_code = 'server.ota';
