ALTER TABLE `client` CHANGE `web_servers` `web_servers` TEXT NULL DEFAULT NULL;
ALTER TABLE `client` CHANGE `mail_servers` `mail_servers` TEXT NULL DEFAULT NULL;
ALTER TABLE `client` CHANGE `xmpp_servers` `xmpp_servers` TEXT NULL DEFAULT NULL;
ALTER TABLE `client` CHANGE `db_servers` `db_servers` TEXT NULL DEFAULT NULL;
ALTER TABLE `client` CHANGE `dns_servers` `dns_servers` TEXT NULL DEFAULT NULL;
UPDATE client SET web_servers = default_webserver WHERE (web_servers = '' OR web_servers IS NULL);
UPDATE client SET mail_servers = default_mailserver WHERE (mail_servers = '' OR mail_servers IS NULL);
UPDATE client SET xmpp_servers = default_xmppserver WHERE (xmpp_servers = '' OR xmpp_servers IS NULL);
UPDATE client SET db_servers = default_dbserver WHERE (db_servers = '' OR db_servers IS NULL);
UPDATE client SET dns_servers = default_dnsserver WHERE (dns_servers = '' OR dns_servers IS NULL);
ALTER TABLE `client_template` ADD `default_slave_dnsserver` INT NOT NULL DEFAULT '0' AFTER `limit_dns_slave_zone`;
ALTER TABLE `client_template` ADD `mail_servers` TEXT NULL DEFAULT NULL AFTER `template_type`;
ALTER TABLE `client_template` ADD `web_servers` TEXT NULL DEFAULT NULL AFTER `limit_xmpp_httparchive`;
ALTER TABLE `client_template` ADD `dns_servers` TEXT NULL DEFAULT NULL AFTER `limit_aps`;
ALTER TABLE `client_template` ADD `db_servers` TEXT NULL DEFAULT NULL AFTER `limit_dns_record`;