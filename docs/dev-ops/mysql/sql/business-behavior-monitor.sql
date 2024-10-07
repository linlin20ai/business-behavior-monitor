# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: business-behavior-monitor
# 生成时间: 2024-06-30 01:58:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `business-behavior-monitor` default character set utf8mb4 ;
use `business-behavior-monitor`;

# 转储表 monitor_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data`;

CREATE TABLE `monitor_data` (
                                `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                `monitor_name` varchar(64) DEFAULT NULL COMMENT '监控名称',
                                `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
                                `system_name` varchar(64) NOT NULL COMMENT '系统名称',
                                `clazz_name` varchar(256) NOT NULL COMMENT '类的名称',
                                `method_name` varchar(128) NOT NULL COMMENT '方法名称',
                                `attribute_name` varchar(32) NOT NULL COMMENT '属性名称',
                                `attribute_field` varchar(8) NOT NULL COMMENT '属性字段',
                                `attribute_value` varchar(128) NOT NULL COMMENT '属性的值',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据';

LOCK TABLES `monitor_data` WRITE;
/*!40000 ALTER TABLE `monitor_data` DISABLE KEYS */;


/*!40000 ALTER TABLE `monitor_data` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 monitor_data_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map`;

CREATE TABLE `monitor_data_map` (
                                    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                    `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                    `monitor_name` varchar(64) NOT NULL COMMENT '监控名称',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图配置';

LOCK TABLES `monitor_data_map` WRITE;
/*!40000 ALTER TABLE `monitor_data_map` DISABLE KEYS */;


/*!40000 ALTER TABLE `monitor_data_map` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 monitor_data_map_node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node`;

CREATE TABLE `monitor_data_map_node` (
                                         `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                         `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
                                         `monitor_node_name` varchar(32) NOT NULL COMMENT '节点名称',
                                         `gather_system_name` varchar(64) NOT NULL COMMENT '采集，系统名称',
                                         `gather_clazz_name` varchar(256) NOT NULL COMMENT '采集，类的名称',
                                         `gather_method_name` varchar(128) NOT NULL COMMENT '采集，方法名称',
                                         `loc` varchar(32) NOT NULL COMMENT '渲染节点坐标',
                                         `color` varchar(8) NOT NULL DEFAULT '#2ECC40' COMMENT '节点颜色',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点配置';

LOCK TABLES `monitor_data_map_node` WRITE;
/*!40000 ALTER TABLE `monitor_data_map_node` DISABLE KEYS */;


/*!40000 ALTER TABLE `monitor_data_map_node` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 monitor_data_map_node_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node_field`;

CREATE TABLE `monitor_data_map_node_field` (
                                               `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                               `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                               `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
                                               `log_name` varchar(64) NOT NULL COMMENT '日志名称；执行抽奖开始 userId',
                                               `log_index` int(11) NOT NULL DEFAULT '0' COMMENT '解析顺序；第几个字段',
                                               `log_type` varchar(8) NOT NULL DEFAULT 'Object' COMMENT '字段类型；Object、String',
                                               `attribute_name` varchar(32) NOT NULL COMMENT '属性名称',
                                               `attribute_field` varchar(8) NOT NULL COMMENT '属性字段',
                                               `attribute_ognl` varchar(16) NOT NULL COMMENT '解析公式',
                                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点字段配置';

LOCK TABLES `monitor_data_map_node_field` WRITE;
/*!40000 ALTER TABLE `monitor_data_map_node_field` DISABLE KEYS */;


/*!40000 ALTER TABLE `monitor_data_map_node_field` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 monitor_data_map_node_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node_link`;

CREATE TABLE `monitor_data_map_node_link` (
                                              `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                              `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                              `from_monitor_node_id` varchar(8) NOT NULL COMMENT 'from 监控ID',
                                              `to_monitor_node_id` varchar(8) NOT NULL COMMENT 'to 监控ID',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点链路配置';

LOCK TABLES `monitor_data_map_node_link` WRITE;
/*!40000 ALTER TABLE `monitor_data_map_node_link` DISABLE KEYS */;


/*!40000 ALTER TABLE `monitor_data_map_node_link` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
