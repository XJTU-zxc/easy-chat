CREATE TABLE `users` (
    `id` varchar(24) NOT NULL COMMENT '用户唯一标识',
    `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像URL',
    `phone` varchar(20) NOT NULL COMMENT '手机号码',
    `password` varchar(255) DEFAULT NULL COMMENT '加密后的密码',
    `status` tinyint unsigned NOT NULL DEFAULT 1 COMMENT '状态(0-禁用,1-正常)',
    `sex` tinyint unsigned DEFAULT 0 COMMENT '性别(0-未知,1-男,2-女)',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_phone` (`phone`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';