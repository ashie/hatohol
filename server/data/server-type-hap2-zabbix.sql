INSERT INTO server_types (type, name, parameters, plugin_path, plugin_sql_version, plugin_enabled, uuid)
  VALUES (7, 'Zabbix (HAPI2) [experimental]', '[{"id": "nickname", "label": "Nickname"}, {"hint": "http://localhost/zabbix/api_jsonrpc.php", "id": "baseURL", "label": "Zabbix API URL"}, {"id": "userName", "label": "User name"}, {"inputStyle": "password", "id": "password", "label": "Password"}, {"default": "30", "id": "pollingInterval", "label": "Polling interval (sec)"}, {"default": "10", "id": "retryInterval", "label": "Retry interval (sec)"}, {"inputStyle": "checkBox", "id": "passiveMode", "label": "Passive mode"}, {"hint": "amqp://user:password@localhost/vhost", "id": "brokerUrl", "label": "Broker URL"}, {"hint": "(empty: Default)", "allowEmpty": true, "id": "staticQueueAddress", "label": "Static queue address"}]', 'start-stop-hap2-zabbix-api.sh', 1, 1, '8e632c14-d1f7-11e4-8350-d43d7e3146fb')
  ON DUPLICATE KEY UPDATE name='Zabbix (HAPI2) [experimental]', parameters='[{"id": "nickname", "label": "Nickname"}, {"hint": "http://localhost/zabbix/api_jsonrpc.php", "id": "baseURL", "label": "Zabbix API URL"}, {"id": "userName", "label": "User name"}, {"inputStyle": "password", "id": "password", "label": "Password"}, {"default": "30", "id": "pollingInterval", "label": "Polling interval (sec)"}, {"default": "10", "id": "retryInterval", "label": "Retry interval (sec)"}, {"inputStyle": "checkBox", "id": "passiveMode", "label": "Passive mode"}, {"hint": "amqp://user:password@localhost[:port]/vhost", "id": "brokerUrl", "label": "Broker URL"}, {"hint": "(empty: Default)", "allowEmpty": true, "id": "staticQueueAddress", "label": "Static queue address"}, {"allowEmpty": true, "id": "tlsCertificatePath", "label": "TLS client certificate path"}, {"allowEmpty": true, "id": "tlsKeyPath", "label": "TLS client key path"}, {"allowEmpty": true, "id": "tlsCACertificatePath", "label": "TLS CA certificate path"}, {"inputStyle": "checkBox", "allowEmpty": true, "id": "tlsEnableVerify", "label": "TLS: Enable verify"}]', plugin_path='start-stop-hap2-zabbix-api.sh', plugin_sql_version='1', plugin_enabled='1';