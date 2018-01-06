/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.24-log : Database - longieb_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`longieb_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cgy`;

/*Table structure for table `analoginput` */

DROP TABLE IF EXISTS `analoginput`;

CREATE TABLE `analoginput` (
  `ID` decimal(10,0) NOT NULL,
  `ALIASNAME` varchar(48) DEFAULT NULL,
  `DESCRIPTION` varchar(96) DEFAULT NULL,
  `NAME` varchar(64) NOT NULL,
  `PATHNAME` varchar(256) DEFAULT NULL,
  `TYPE` decimal(4,0) NOT NULL DEFAULT '0',
  `RTUID` decimal(10,0) NOT NULL DEFAULT '-1',
  `POINTNUM` decimal(10,0) NOT NULL DEFAULT '0',
  `EQUIPMENTCONTAINER_ID` decimal(9,0) DEFAULT '-1',
  `EQUIPMENTCONTAINER_TABLEID` decimal(4,0) DEFAULT '-1',
  `DATASOURCE` decimal(2,0) unsigned DEFAULT '0',
  `VALUE` decimal(10,3) DEFAULT '0.000',
  `QUALITYCODE` decimal(10,0) DEFAULT '2241',
  `TIMESTAMP` datetime DEFAULT NULL,
  `RATEOFCHANGE` decimal(10,3) DEFAULT '0.000',
  `VIOLATIONFLAGS` decimal(4,0) DEFAULT '0',
  `TAGGINGFLAGS` decimal(4,0) DEFAULT '0',
  `CONTROLINHIBITFLAG` decimal(2,0) unsigned DEFAULT '0',
  `ALARMPROCMODE` decimal(2,0) unsigned DEFAULT '1',
  `ALARMPRIORITY` decimal(2,0) unsigned DEFAULT '0',
  `TPINVOLVEDFLAG` decimal(2,0) unsigned DEFAULT '0',
  `ALARMOPTIONFLAGS` decimal(4,0) DEFAULT '0',
  `AUTHORITYAREA` decimal(4,0) DEFAULT '0',
  `LIMITSETID` decimal(10,0) DEFAULT '-1',
  `REPORTDEADBAND` decimal(10,3) DEFAULT '0.000',
  `SENSORMAXIMUM` decimal(10,3) DEFAULT '0.000',
  `SENSORMINIMUM` decimal(10,3) DEFAULT '0.000',
  `ZEROCLAMPPING` decimal(10,7) DEFAULT '0.0000000',
  `SCALEFACTOR` decimal(10,5) DEFAULT '1.00000',
  `SCALEOFFSET` decimal(10,3) DEFAULT '0.000',
  `SMOOTHINGFACTOR` decimal(10,3) DEFAULT '0.000',
  `POINTADDRESS` decimal(4,0) DEFAULT '0',
  `GROUPADDRESS` decimal(4,0) DEFAULT '0',
  `RTUADDRESS` decimal(4,0) DEFAULT '0',
  `ALARMDELAYEDTIME` decimal(4,0) DEFAULT '0',
  `SAVEPERIODICITY` decimal(4,0) DEFAULT '0',
  `MEASIDX` decimal(10,0) DEFAULT '-1',
  `ALARMTYPE` decimal(10,0) DEFAULT '-1',
  `OPERATIONALLOW` decimal(10,3) DEFAULT '0.000',
  `OPERATIONALHIGH` decimal(10,3) DEFAULT '0.000',
  `WARNINGLOW` decimal(10,3) DEFAULT '0.000',
  `WARNINGHIGH` decimal(10,3) DEFAULT '0.000',
  `EMERGENCYLOW` decimal(10,3) DEFAULT '0.000',
  `EMERGENCYHIGH` decimal(10,3) DEFAULT '0.000',
  `RATEOFCHANGELIMIT` decimal(10,3) DEFAULT '0.000',
  `ISPERCENTAGELIMITS` decimal(1,0) unsigned DEFAULT '0',
  `NOMINAL` decimal(10,3) DEFAULT '0.000',
  `DEADBAND` decimal(10,3) DEFAULT '0.000',
  `SUBSTATION_ID` decimal(10,0) DEFAULT '-1',
  `RAWVALUE0` decimal(10,3) DEFAULT '0.000',
  `RAWQUALITYCODE0` decimal(10,0) DEFAULT '2178',
  `RAWTIMESTAMP0` datetime DEFAULT NULL,
  `RAWVALUE1` decimal(10,3) DEFAULT '0.000',
  `RAWQUALITYCODE1` decimal(10,0) DEFAULT '2178',
  `RAWTIMESTAMP1` datetime DEFAULT NULL,
  `RAWVALUE2` decimal(10,3) DEFAULT '0.000',
  `RAWQUALITYCODE2` decimal(10,0) DEFAULT '2178',
  `RAWTIMESTAMP2` datetime DEFAULT NULL,
  `RAWVALUE3` decimal(10,3) DEFAULT '0.000',
  `RAWQUALITYCODE3` decimal(10,0) DEFAULT '2178',
  `RAWTIMESTAMP3` datetime DEFAULT NULL,
  `CURROUTENO` decimal(3,0) DEFAULT '0',
  `ALARMCOUNT` decimal(10,0) DEFAULT '0',
  `RATING` decimal(10,3) DEFAULT '0.000',
  `CYCLE` decimal(10,0) DEFAULT '0',
  `FUNCODE` decimal(10,0) DEFAULT '0',
  `BITCOUNT` decimal(10,0) DEFAULT '0',
  `DATATYPE` decimal(10,0) DEFAULT '0',
  `ALARMSTATUSITEM` decimal(10,0) DEFAULT NULL,
  `COLLECTID` decimal(10,0) DEFAULT NULL,
  `DEVTYPE` decimal(10,0) DEFAULT NULL,
  `DEVID` decimal(10,0) DEFAULT NULL,
  `DEVPOINTNUM` decimal(10,0) DEFAULT NULL,
  `CALCULATETYPE` int(1) DEFAULT '0' COMMENT '测点计算类型（0：scada采集；1：scada计算；2：程序单独计算,3 scada无关测点）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Table structure for table `equipment2measure` */

DROP TABLE IF EXISTS `equipment2measure`;

CREATE TABLE `equipment2measure` (
  `ID` int(11) NOT NULL,
  `equipmenttypeID` int(11) DEFAULT NULL,
  `measurementtypeID` decimal(9,0) DEFAULT NULL,
  `ycyx` int(11) DEFAULT NULL,
  `DESCRIPTION` char(64) DEFAULT NULL,
  `point_sequence` int(3) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `equipmenttypeID` (`equipmenttypeID`) USING BTREE,
  KEY `measurementtypeID` (`measurementtypeID`) USING BTREE,
  CONSTRAINT `equipment2measure_ibfk_1` FOREIGN KEY (`equipmenttypeID`) REFERENCES `equipmenttype` (`ID`),
  CONSTRAINT `equipment2measure_ibfk_2` FOREIGN KEY (`measurementtypeID`) REFERENCES `measurementtype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `equipmenttype` */

DROP TABLE IF EXISTS `equipmenttype`;

CREATE TABLE `equipmenttype` (
  `ID` int(11) NOT NULL,
  `NAME` char(32) DEFAULT NULL,
  `TABLENAME` char(32) DEFAULT NULL,
  `DESCRIPTION` char(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mc_electric_meter` */

DROP TABLE IF EXISTS `mc_electric_meter`;

CREATE TABLE `mc_electric_meter` (
  `ID` decimal(20,0) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `EQUIPMENTTYPEID` decimal(16,0) NOT NULL,
  `DESCRIPTION` text,
  `TYPE` decimal(1,0) NOT NULL,
  `MODEL` varchar(64) NOT NULL,
  `SERIAL_NUMBER` varchar(64) NOT NULL,
  `FARMID` decimal(20,0) NOT NULL,
  `COLLECTOR_ID` decimal(20,0) NOT NULL,
  `PARENT_ID` decimal(20,0) DEFAULT NULL,
  `METER_TYPE` decimal(10,0) DEFAULT NULL COMMENT '1：直流表；2：单相电表；3：三相电表',
  `englishname` varchar(256) DEFAULT NULL COMMENT '英文名称，过长的名称采用简写',
  PRIMARY KEY (`ID`),
  KEY `FARMID` (`FARMID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `mc_grid_cabinet` */

DROP TABLE IF EXISTS `mc_grid_cabinet`;

CREATE TABLE `mc_grid_cabinet` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT NULL,
  `EQUIPMENTTYPEID` int(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `TYPE` int(1) NOT NULL,
  `MODEL` varchar(64) NOT NULL,
  `SERIAL_NUMBER` varchar(64) NOT NULL,
  `FARMID` int(20) NOT NULL,
  `COLLECTOR_ID` int(20) NOT NULL,
  `PARENT_ID` int(20) DEFAULT NULL,
  `METER_TYPE` int(10) DEFAULT NULL COMMENT '1：直流表；2：单相电表；3：三相电表',
  `englishname` varchar(256) DEFAULT NULL COMMENT '英文名称，过长的名称采用简写',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `mc_grid_cabinet_copy` */

DROP TABLE IF EXISTS `mc_grid_cabinet_copy`;

CREATE TABLE `mc_grid_cabinet_copy` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT NULL,
  `EQUIPMENTTYPEID` int(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `TYPE` int(1) NOT NULL,
  `MODEL` varchar(64) NOT NULL,
  `SERIAL_NUMBER` varchar(64) NOT NULL,
  `FARMID` int(20) NOT NULL,
  `COLLECTOR_ID` int(20) NOT NULL,
  `PARENT_ID` int(20) DEFAULT NULL,
  `METER_TYPE` int(10) DEFAULT NULL COMMENT '1：直流表；2：单相电表；3：三相电表',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `mc_inverter` */

DROP TABLE IF EXISTS `mc_inverter`;

CREATE TABLE `mc_inverter` (
  `ID` decimal(20,0) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `EQUIPMENTTYPEID` decimal(16,0) NOT NULL,
  `DESCRIPTION` text,
  `MODEL` varchar(64) NOT NULL,
  `SERIAL_NUMBER` varchar(64) NOT NULL,
  `MANUFACTURER` varchar(64) NOT NULL,
  `FARMID` decimal(20,0) NOT NULL,
  `COLLECTOR_ID` decimal(20,0) NOT NULL,
  `sequence` int(11) DEFAULT '0' COMMENT '排序',
  `englishname` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FARMID` (`FARMID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `mc_iv_device_channel` */

DROP TABLE IF EXISTS `mc_iv_device_channel`;

CREATE TABLE `mc_iv_device_channel` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `equipmenttypeid` int(11) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `farm_id` int(11) DEFAULT NULL,
  `ivdeviceid` int(11) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL COMMENT '设备型号',
  `equipnum` varchar(64) DEFAULT NULL COMMENT '通道编号',
  `englishname` varchar(256) DEFAULT NULL COMMENT '英文名称，过长的名称采用简写'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mc_measurement_box` */

DROP TABLE IF EXISTS `mc_measurement_box`;

CREATE TABLE `mc_measurement_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '测量箱编号',
  `framid` int(11) DEFAULT NULL COMMENT '电站id',
  `inverter_id` int(11) DEFAULT NULL COMMENT '逆变器id',
  `englishname` varchar(256) DEFAULT NULL COMMENT '英文名称，过长的名称采用简写',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

/*Table structure for table `mc_meteor_monitor` */

DROP TABLE IF EXISTS `mc_meteor_monitor`;

CREATE TABLE `mc_meteor_monitor` (
  `ID` decimal(20,0) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `EQUIPMENTTYPEID` decimal(16,0) NOT NULL,
  `DESCRIPTION` text,
  `MODEL` varchar(64) NOT NULL,
  `SERIAL_NUMBER` varchar(64) NOT NULL,
  `MANUFACTURER` varchar(64) NOT NULL,
  `FARMID` decimal(20,0) NOT NULL,
  `COLLECTOR_ID` decimal(20,0) NOT NULL,
  `englishname` varchar(256) DEFAULT NULL COMMENT '英文名称，过长的名称采用简写',
  PRIMARY KEY (`ID`),
  KEY `FARMID` (`FARMID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `mc_track_controll_unit` */

DROP TABLE IF EXISTS `mc_track_controll_unit`;

CREATE TABLE `mc_track_controll_unit` (
  `ID` decimal(20,0) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `EQUIPMENTTYPEID` decimal(16,0) NOT NULL,
  `DESCRIPTION` text,
  `MODEL` varchar(64) NOT NULL,
  `SERIAL_NUMBER` varchar(64) NOT NULL,
  `MANUFACTURER` varchar(64) NOT NULL,
  `FARMID` decimal(20,0) NOT NULL,
  `COLLECTOR_ID` decimal(20,0) NOT NULL,
  `englishname` varchar(256) DEFAULT NULL COMMENT '英文名称，过长的名称采用简写'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `measurementtype` */

DROP TABLE IF EXISTS `measurementtype`;

CREATE TABLE `measurementtype` (
  `ID` decimal(9,0) NOT NULL,
  `ALIASNAME` varchar(48) DEFAULT NULL,
  `DESCRIPTION` varchar(96) DEFAULT NULL,
  `NAME` varchar(64) NOT NULL,
  `PATHNAME` varchar(256) DEFAULT NULL,
  `englishname` varchar(256) DEFAULT NULL COMMENT '英文名称，过长的名称采用简写',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mt_project` */

DROP TABLE IF EXISTS `mt_project`;

CREATE TABLE `mt_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` text NOT NULL,
  `EQUIPMENTTTYPEID` decimal(16,0) DEFAULT NULL,
  `DESCRIPTION` text,
  `COMPANY_ID` decimal(16,0) NOT NULL,
  `CODE` varchar(64) DEFAULT NULL,
  `TYPE` decimal(4,0) DEFAULT NULL,
  `PROVINCE_ID` decimal(8,0) DEFAULT NULL,
  `CITY_ID` decimal(8,0) DEFAULT NULL,
  `COUNTY_ID` decimal(8,0) DEFAULT NULL,
  `LOCATION` text,
  `LNG` decimal(7,4) DEFAULT NULL,
  `LAT` decimal(7,4) DEFAULT NULL,
  `ROOF_TYPE` decimal(2,0) DEFAULT NULL,
  `BUILD_AREA` decimal(16,0) DEFAULT NULL,
  `BUILD_GROUND_AREA` decimal(16,0) DEFAULT NULL,
  `PRO_AVAILABLE_AREA` decimal(16,0) DEFAULT NULL,
  `INSTALL_CAPACITY` decimal(16,0) DEFAULT NULL,
  `IMAGE` text,
  `INVEST_FIRM_NAME` varchar(64) DEFAULT NULL,
  `INVEST_FIRM_CONTACT_NAME` varchar(64) DEFAULT NULL,
  `INVEST_FIRM_CONTACT_POSITION` varchar(64) DEFAULT NULL,
  `INVEST_FIRM_CONTACT_MOBILE` varchar(64) DEFAULT NULL,
  `OWNER_FIRM_NAME` varchar(64) DEFAULT NULL,
  `OWNER_FIRM_CONTACT_NAME` varchar(64) DEFAULT NULL,
  `OWNER_FIRM_CONTACT_POSITION` varchar(64) DEFAULT NULL,
  `OWNER_FIRM_CONTACT_MOBILE` varchar(64) DEFAULT NULL,
  `OPERATOR_NAME` varchar(64) DEFAULT NULL,
  `OPERATOR_MOBILE` varchar(64) DEFAULT NULL,
  `MAINTAINER_NAME` varchar(64) DEFAULT NULL,
  `MAINTAINER_MOBILE` varchar(64) DEFAULT NULL,
  `LAST_OPREATE_TIME` datetime DEFAULT NULL,
  `PICTURE_PATH` text,
  `START_PRUDUCE_TIME` datetime DEFAULT NULL COMMENT '投产日期',
  `effectivity` decimal(1,0) DEFAULT NULL,
  `province_name` varchar(64) DEFAULT NULL,
  `city_name` varchar(64) DEFAULT NULL,
  `county_name` varchar(64) DEFAULT NULL,
  `have_tuopu` int(11) DEFAULT '0',
  `have_buzhi` int(11) DEFAULT '0',
  `monitoring` varchar(1024) DEFAULT NULL,
  `englishname` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `COMPANY_ID` (`COMPANY_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

/*Table structure for table `mt_project1027` */

DROP TABLE IF EXISTS `mt_project1027`;

CREATE TABLE `mt_project1027` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` text NOT NULL,
  `EQUIPMENTTTYPEID` decimal(16,0) DEFAULT NULL,
  `DESCRIPTION` text,
  `COMPANY_ID` decimal(16,0) NOT NULL,
  `CODE` varchar(64) DEFAULT NULL,
  `TYPE` decimal(4,0) DEFAULT NULL,
  `PROVINCE_ID` decimal(8,0) DEFAULT NULL,
  `CITY_ID` decimal(8,0) DEFAULT NULL,
  `COUNTY_ID` decimal(8,0) DEFAULT NULL,
  `LOCATION` text,
  `LNG` decimal(7,4) DEFAULT NULL,
  `LAT` decimal(7,4) DEFAULT NULL,
  `ROOF_TYPE` decimal(2,0) DEFAULT NULL,
  `BUILD_AREA` decimal(16,0) DEFAULT NULL,
  `BUILD_GROUND_AREA` decimal(16,0) DEFAULT NULL,
  `PRO_AVAILABLE_AREA` decimal(16,0) DEFAULT NULL,
  `INSTALL_CAPACITY` decimal(16,0) DEFAULT NULL,
  `IMAGE` text,
  `INVEST_FIRM_NAME` varchar(64) DEFAULT NULL,
  `INVEST_FIRM_CONTACT_NAME` varchar(64) DEFAULT NULL,
  `INVEST_FIRM_CONTACT_POSITION` varchar(64) DEFAULT NULL,
  `INVEST_FIRM_CONTACT_MOBILE` varchar(64) DEFAULT NULL,
  `OWNER_FIRM_NAME` varchar(64) DEFAULT NULL,
  `OWNER_FIRM_CONTACT_NAME` varchar(64) DEFAULT NULL,
  `OWNER_FIRM_CONTACT_POSITION` varchar(64) DEFAULT NULL,
  `OWNER_FIRM_CONTACT_MOBILE` varchar(64) DEFAULT NULL,
  `OPERATOR_NAME` varchar(64) DEFAULT NULL,
  `OPERATOR_MOBILE` varchar(64) DEFAULT NULL,
  `MAINTAINER_NAME` varchar(64) DEFAULT NULL,
  `MAINTAINER_MOBILE` varchar(64) DEFAULT NULL,
  `LAST_OPREATE_TIME` datetime DEFAULT NULL,
  `PICTURE_PATH` text,
  `START_PRUDUCE_TIME` datetime DEFAULT NULL COMMENT '投产日期',
  `effectivity` decimal(1,0) DEFAULT NULL,
  `province_name` varchar(64) DEFAULT NULL,
  `city_name` varchar(64) DEFAULT NULL,
  `county_name` varchar(64) DEFAULT NULL,
  `have_tuopu` int(11) DEFAULT '0',
  `have_buzhi` int(11) DEFAULT '0',
  `monitoring` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `COMPANY_ID` (`COMPANY_ID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_alarm_config` */

DROP TABLE IF EXISTS `pvmts_alarm_config`;

CREATE TABLE `pvmts_alarm_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_id` int(11) NOT NULL COMMENT '测点id',
  `user_id` int(11) DEFAULT NULL COMMENT '创建人',
  `value_one` double DEFAULT NULL COMMENT '报警数值 1级',
  `value_two` double DEFAULT NULL COMMENT '报警数值 2级',
  `value_three` double DEFAULT NULL COMMENT '报警数值 3级',
  `type` int(11) NOT NULL COMMENT '1大于报警数值报警,2小于报警数值报警,3等于报警数值报警 4不等于报警数值报警',
  `message` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '报警信息模板',
  `forbidden` int(11) DEFAULT NULL COMMENT '1 被禁用',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=717 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_alarm_config_20171031` */

DROP TABLE IF EXISTS `pvmts_alarm_config_20171031`;

CREATE TABLE `pvmts_alarm_config_20171031` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_id` int(11) NOT NULL COMMENT '测点id',
  `user_id` int(11) DEFAULT NULL COMMENT '创建人',
  `value_one` double DEFAULT NULL COMMENT '报警数值 1级',
  `value_two` double DEFAULT NULL COMMENT '报警数值 2级',
  `value_three` double DEFAULT NULL COMMENT '报警数值 3级',
  `type` int(11) NOT NULL COMMENT '1大于报警数值报警,2小于报警数值报警,3等于报警数值报警 4不等于报警数值报警',
  `message` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '报警信息模板',
  `forbidden` int(11) DEFAULT NULL COMMENT '1 被禁用',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_alarm_info` */

DROP TABLE IF EXISTS `pvmts_alarm_info`;

CREATE TABLE `pvmts_alarm_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alarm_mid` bigint(20) NOT NULL COMMENT 'stada添加过来的id',
  `alarm_number` varchar(11) DEFAULT NULL,
  `reason_code` int(11) DEFAULT NULL COMMENT '报警原因码-scada',
  `alarm_message` varchar(512) NOT NULL COMMENT '报警信息描述',
  `alarm_grade` int(11) NOT NULL COMMENT '报警级别',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '报警状态',
  `alarm_type` int(11) NOT NULL COMMENT '报警类型',
  `state` varchar(512) DEFAULT NULL COMMENT '说明',
  `equipment_id` int(11) NOT NULL COMMENT '设备ID',
  `equipment_type` int(11) NOT NULL COMMENT '设备类型',
  `power_station_id` int(11) NOT NULL COMMENT '电站ID',
  `event_time` datetime DEFAULT NULL COMMENT '事件发生时间',
  `alarm_value` decimal(10,3) DEFAULT '0.000' COMMENT '报警数值',
  `uid` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL COMMENT '报警对象id',
  `objecttab_id` int(11) DEFAULT NULL COMMENT '报警对象表id(报警对象类型)',
  `handling` varchar(255) DEFAULT NULL,
  `handler` varchar(255) DEFAULT NULL,
  `hand_time` datetime DEFAULT NULL,
  `remaker` varchar(255) DEFAULT NULL,
  `corporation` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `opreate_message` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_alarm_info_0922` */

DROP TABLE IF EXISTS `pvmts_alarm_info_0922`;

CREATE TABLE `pvmts_alarm_info_0922` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alarm_mid` bigint(20) NOT NULL COMMENT 'stada添加过来的id',
  `alarm_number` varchar(11) DEFAULT NULL,
  `reason_code` int(11) DEFAULT NULL COMMENT '报警原因码-scada',
  `alarm_message` varchar(512) NOT NULL COMMENT '报警信息描述',
  `alarm_grade` int(11) NOT NULL COMMENT '报警级别',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '报警状态',
  `alarm_type` int(11) NOT NULL COMMENT '报警类型',
  `state` varchar(512) DEFAULT NULL COMMENT '说明',
  `equipment_id` int(11) NOT NULL COMMENT '设备ID',
  `equipment_type` int(11) NOT NULL COMMENT '设备类型',
  `power_station_id` int(11) NOT NULL COMMENT '电站ID',
  `event_time` datetime DEFAULT NULL COMMENT '事件发生时间',
  `alarm_value` decimal(10,3) DEFAULT '0.000' COMMENT '报警数值',
  `uid` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL COMMENT '报警对象id',
  `objecttab_id` int(11) DEFAULT NULL COMMENT '报警对象表id(报警对象类型)',
  `handling` varchar(255) DEFAULT NULL,
  `handler` varchar(255) DEFAULT NULL,
  `hand_time` datetime DEFAULT NULL,
  `remaker` varchar(255) DEFAULT NULL,
  `corporation` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `opreate_message` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_alarm_info_bak0915` */

DROP TABLE IF EXISTS `pvmts_alarm_info_bak0915`;

CREATE TABLE `pvmts_alarm_info_bak0915` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alarm_mid` bigint(20) NOT NULL COMMENT 'stada添加过来的id',
  `alarm_number` varchar(11) DEFAULT NULL,
  `reason_code` int(11) DEFAULT NULL COMMENT '报警原因码-scada',
  `alarm_message` varchar(512) NOT NULL COMMENT '报警信息描述',
  `alarm_grade` int(11) NOT NULL COMMENT '报警级别',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '报警状态',
  `alarm_type` int(11) NOT NULL COMMENT '报警类型',
  `state` varchar(512) DEFAULT NULL COMMENT '说明',
  `equipment_id` int(11) NOT NULL COMMENT '设备ID',
  `equipment_type` int(11) NOT NULL COMMENT '设备类型',
  `power_station_id` int(11) NOT NULL COMMENT '电站ID',
  `event_time` datetime DEFAULT NULL COMMENT '事件发生时间',
  `alarm_value` decimal(10,3) DEFAULT '0.000' COMMENT '报警数值',
  `uid` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL COMMENT '报警对象id',
  `objecttab_id` int(11) DEFAULT NULL COMMENT '报警对象表id(报警对象类型)',
  `handling` varchar(255) DEFAULT NULL,
  `handler` varchar(255) DEFAULT NULL,
  `hand_time` datetime DEFAULT NULL,
  `remaker` varchar(255) DEFAULT NULL,
  `corporation` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `opreate_message` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2908 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_alarm_info_copy` */

DROP TABLE IF EXISTS `pvmts_alarm_info_copy`;

CREATE TABLE `pvmts_alarm_info_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alarm_mid` bigint(20) NOT NULL COMMENT 'stada添加过来的id',
  `alarm_number` varchar(11) DEFAULT NULL,
  `reason_code` int(11) DEFAULT NULL COMMENT '报警原因码-scada',
  `alarm_message` varchar(512) NOT NULL COMMENT '报警信息描述',
  `alarm_grade` int(11) NOT NULL COMMENT '报警级别',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '报警状态',
  `alarm_type` int(11) NOT NULL COMMENT '报警类型',
  `state` varchar(512) DEFAULT NULL COMMENT '说明',
  `equipment_id` int(11) NOT NULL COMMENT '设备ID',
  `equipment_type` int(11) NOT NULL COMMENT '设备类型',
  `power_station_id` int(11) NOT NULL COMMENT '电站ID',
  `event_time` datetime DEFAULT NULL COMMENT '事件发生时间',
  `alarm_value` decimal(10,3) DEFAULT '0.000' COMMENT '报警数值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_alarm_user` */

DROP TABLE IF EXISTS `pvmts_alarm_user`;

CREATE TABLE `pvmts_alarm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alarm_id` int(11) NOT NULL COMMENT '报警id',
  `user_id` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_attachment` */

DROP TABLE IF EXISTS `pvmts_attachment`;

CREATE TABLE `pvmts_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `filename` varchar(128) DEFAULT NULL COMMENT '附件名称',
  `filepath` varchar(512) DEFAULT NULL COMMENT '服务器端路径',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `upload_user` int(11) DEFAULT NULL COMMENT '上传人员id',
  `filetype` varchar(32) DEFAULT NULL COMMENT '附件类型 physical-电站体检附件 departure-离场申请附件  ',
  `formId` varchar(32) DEFAULT NULL COMMENT '表单编号',
  `remarks` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='公共附件表';

/*Table structure for table `pvmts_color_info` */

DROP TABLE IF EXISTS `pvmts_color_info`;

CREATE TABLE `pvmts_color_info` (
  `id` int(1) NOT NULL AUTO_INCREMENT COMMENT '颜色编号',
  `color_code` varchar(20) DEFAULT NULL COMMENT '颜色代码',
  `name` varchar(20) DEFAULT NULL COMMENT '颜色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_company` */

DROP TABLE IF EXISTS `pvmts_company`;

CREATE TABLE `pvmts_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name` varchar(512) NOT NULL COMMENT '公司名称',
  `address` varchar(512) DEFAULT NULL COMMENT '地址',
  `owner_userName` varchar(64) DEFAULT NULL COMMENT '公司联系人',
  `owner_position` varchar(64) DEFAULT NULL COMMENT '联系人职务',
  `owner_mobile` varchar(64) DEFAULT NULL COMMENT '联系人电话',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(1024) DEFAULT NULL COMMENT '备注',
  `udpate_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_compute_point` */

DROP TABLE IF EXISTS `pvmts_compute_point`;

CREATE TABLE `pvmts_compute_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_point` int(11) DEFAULT NULL COMMENT '触发计算的测点id，此测点更新，触发计算',
  `to_point` int(11) DEFAULT NULL COMMENT '计算结果更新到哪个测点',
  `formula` varchar(1280) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '计算公式如:([测点id1]+[测点id2])/180 只支持+-x/()',
  `description` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_curve_info` */

DROP TABLE IF EXISTS `pvmts_curve_info`;

CREATE TABLE `pvmts_curve_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power_station_id` int(11) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `time_span` int(11) DEFAULT NULL,
  `first_yaxis_name` varchar(256) DEFAULT NULL,
  `second_yaxis_name` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `createuser` int(11) DEFAULT NULL,
  `updateuser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_curve_point_info` */

DROP TABLE IF EXISTS `pvmts_curve_point_info`;

CREATE TABLE `pvmts_curve_point_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curve_id` int(11) DEFAULT NULL,
  `analoginput_id` int(11) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `color_code` varchar(256) DEFAULT NULL,
  `yaxis_type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4294 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_custom_curve` */

DROP TABLE IF EXISTS `pvmts_custom_curve`;

CREATE TABLE `pvmts_custom_curve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power_station_id` int(11) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `time_span` int(11) DEFAULT NULL,
  `first_yaxis_name` varchar(256) DEFAULT NULL,
  `second_yaxis_name` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `curve_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_custom_curve_point` */

DROP TABLE IF EXISTS `pvmts_custom_curve_point`;

CREATE TABLE `pvmts_custom_curve_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curve_id` int(11) DEFAULT NULL,
  `analoginput_id` int(11) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `yaxis_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `line_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_data_check` */

DROP TABLE IF EXISTS `pvmts_data_check`;

CREATE TABLE `pvmts_data_check` (
  `id` int(11) NOT NULL,
  `analoginput_id` int(11) DEFAULT NULL,
  `equipmenttype_id` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `value` decimal(10,6) DEFAULT NULL,
  `is_start` int(11) DEFAULT NULL COMMENT '是否启用',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Table structure for table `pvmts_device_rated_iv` */

DROP TABLE IF EXISTS `pvmts_device_rated_iv`;

CREATE TABLE `pvmts_device_rated_iv` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `equipment_id` varchar(255) DEFAULT NULL,
  `equipment_type` varchar(255) DEFAULT NULL,
  `equipment_description` varchar(255) DEFAULT NULL,
  `rated_power` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=gbk;

/*Table structure for table `pvmts_device_rated_power` */

DROP TABLE IF EXISTS `pvmts_device_rated_power`;

CREATE TABLE `pvmts_device_rated_power` (
  `id` varchar(255) DEFAULT NULL,
  `equipment_id` varchar(255) DEFAULT NULL,
  `equipment_type` varchar(255) DEFAULT NULL,
  `equipment_description` varchar(255) DEFAULT NULL,
  `rated_power` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Table structure for table `pvmts_environment_grossdata_month` */

DROP TABLE IF EXISTS `pvmts_environment_grossdata_month`;

CREATE TABLE `pvmts_environment_grossdata_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `analoginput_id` int(11) DEFAULT NULL COMMENT '测点id',
  `month` int(11) DEFAULT NULL COMMENT 'yyyyMM',
  `last_value` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '环境监测月度累计表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_environment_grossdata_year` */

DROP TABLE IF EXISTS `pvmts_environment_grossdata_year`;

CREATE TABLE `pvmts_environment_grossdata_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `analoginput_id` int(11) DEFAULT NULL COMMENT '测点id',
  `year` int(11) DEFAULT NULL COMMENT 'yyyy',
  `last_value` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_equipment_info` */

DROP TABLE IF EXISTS `pvmts_equipment_info`;

CREATE TABLE `pvmts_equipment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `powerstationid` int(11) DEFAULT NULL,
  `equipment_type` varchar(64) NOT NULL,
  `equipment_model` varchar(64) DEFAULT NULL,
  `equipment_number` varchar(64) DEFAULT NULL,
  `factory` varchar(64) DEFAULT NULL,
  `dept` varchar(64) DEFAULT NULL,
  `produced_date` date DEFAULT NULL,
  `factory_date` date DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `service_expense` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `deprecition` decimal(11,0) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_equipment_info_bak` */

DROP TABLE IF EXISTS `pvmts_equipment_info_bak`;

CREATE TABLE `pvmts_equipment_info_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `powerstationid` int(11) DEFAULT NULL,
  `equipment_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `equipment_model` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `equipment_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `factory` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `produced_date` date DEFAULT NULL,
  `factory_date` date DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `service_expense` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `deprecition` decimal(11,0) DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_fault_info` */

DROP TABLE IF EXISTS `pvmts_fault_info`;

CREATE TABLE `pvmts_fault_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fault_number` varchar(16) NOT NULL,
  `equipment_id` int(11) DEFAULT NULL COMMENT '设备ID',
  `equipment_type` int(11) NOT NULL COMMENT '设备类型',
  `equipment_number` varchar(16) DEFAULT NULL COMMENT '设备编号',
  `fault_grade` int(11) NOT NULL COMMENT '故障级别',
  `fault_message` varchar(512) NOT NULL COMMENT '故障原因',
  `fault_status` int(11) NOT NULL DEFAULT '0' COMMENT '故障状态 0默认未分配 1 已分配  2 已解决 3 未解决',
  `fault_source` int(11) NOT NULL COMMENT '故障来源 1 报警  2 手动',
  `power_station_id` int(11) NOT NULL COMMENT '电站ID',
  `alarm_id` int(11) DEFAULT NULL COMMENT '报警id   当故障已解决  要根据对应的报警ID更改报警状态',
  `user_id` int(11) DEFAULT NULL COMMENT '创建故障人',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `state` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_grossdata_day` */

DROP TABLE IF EXISTS `pvmts_grossdata_day`;

CREATE TABLE `pvmts_grossdata_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_time` int(11) DEFAULT NULL,
  `data_time` int(11) DEFAULT NULL,
  `analoginput_id` int(11) DEFAULT NULL,
  `equipment_type` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `measure_point_type` varchar(64) DEFAULT NULL,
  `start_value` double DEFAULT NULL,
  `day_value` double DEFAULT NULL,
  `end_value` double DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16715 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_grossdata_month` */

DROP TABLE IF EXISTS `pvmts_grossdata_month`;

CREATE TABLE `pvmts_grossdata_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_time` int(11) DEFAULT NULL,
  `data_time` int(11) DEFAULT NULL,
  `analoginput_id` int(11) DEFAULT NULL,
  `equipment_type` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `measure_point_type` varchar(64) DEFAULT NULL,
  `start_value` double DEFAULT NULL,
  `month_value` double DEFAULT NULL,
  `end_value` double DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_grossdata_year` */

DROP TABLE IF EXISTS `pvmts_grossdata_year`;

CREATE TABLE `pvmts_grossdata_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_time` int(11) DEFAULT NULL,
  `data_time` int(11) DEFAULT NULL,
  `analoginput_id` int(11) DEFAULT NULL,
  `equipment_type` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `measure_point_type` varchar(64) DEFAULT NULL,
  `start_value` double DEFAULT NULL,
  `year_value` double DEFAULT NULL,
  `end_value` double DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_inverter_meter` */

DROP TABLE IF EXISTS `pvmts_inverter_meter`;

CREATE TABLE `pvmts_inverter_meter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inverter_id` int(11) DEFAULT NULL COMMENT '逆变器id',
  `meter_id` int(11) DEFAULT NULL COMMENT '电表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_iv_curve_log` */

DROP TABLE IF EXISTS `pvmts_iv_curve_log`;

CREATE TABLE `pvmts_iv_curve_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名',
  `file_update_time` datetime NOT NULL COMMENT '文件修改时间',
  `last_line_time` datetime NOT NULL COMMENT '文件最后一条记录时间',
  `create_time` datetime DEFAULT NULL COMMENT '记录生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_iv_curve_log_20171228` */

DROP TABLE IF EXISTS `pvmts_iv_curve_log_20171228`;

CREATE TABLE `pvmts_iv_curve_log_20171228` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名',
  `file_update_time` datetime NOT NULL COMMENT '文件修改时间',
  `last_line_time` datetime NOT NULL COMMENT '文件最后一条记录时间',
  `create_time` datetime DEFAULT NULL COMMENT '记录生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_iv_equipment` */

DROP TABLE IF EXISTS `pvmts_iv_equipment`;

CREATE TABLE `pvmts_iv_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '测量箱编号',
  `farmid` int(11) DEFAULT NULL COMMENT '电站id',
  `equipnum` varchar(64) DEFAULT NULL COMMENT '设备编号-- 通道编号',
  `model` varchar(64) DEFAULT NULL COMMENT '设备型号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_iv_grossdata` */

DROP TABLE IF EXISTS `pvmts_iv_grossdata`;

CREATE TABLE `pvmts_iv_grossdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetag` int(11) DEFAULT NULL COMMENT '统计的日期如年统计:2017,月统计201701，日：20170101，累计：0',
  `data_time` int(11) DEFAULT NULL,
  `analoginput_id` int(11) DEFAULT NULL,
  `equipment_type` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `measure_point_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_value` double DEFAULT NULL,
  `value` double DEFAULT NULL,
  `end_value` double DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1 日统计，2 月统计 3 年统计 4 累计发电量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2513 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_iv_statistics_log` */

DROP TABLE IF EXISTS `pvmts_iv_statistics_log`;

CREATE TABLE `pvmts_iv_statistics_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '和测点的id一致',
  `year` int(11) DEFAULT NULL COMMENT '数据所属年',
  `month` int(11) DEFAULT NULL COMMENT '数据所属月',
  `day` int(11) DEFAULT NULL COMMENT '数据所属日',
  `type` int(11) DEFAULT NULL COMMENT '1 日统计，2 月统计 3 年统计',
  `data_time` int(11) DEFAULT NULL COMMENT '数据时间',
  `original` float DEFAULT '0' COMMENT '和data_time对应的数值(一般为总的，如总发电量)',
  `value` float DEFAULT '0' COMMENT '数值计算后的数值',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_letter` */

DROP TABLE IF EXISTS `pvmts_letter`;

CREATE TABLE `pvmts_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(256) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `sender_uid` int(11) DEFAULT NULL,
  `consignee_uid` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `sender_name` varchar(256) DEFAULT NULL,
  `consignee_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=gbk;

/*Table structure for table `pvmts_letter_consignee` */

DROP TABLE IF EXISTS `pvmts_letter_consignee`;

CREATE TABLE `pvmts_letter_consignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `letter_id` int(11) NOT NULL COMMENT '信件ID',
  `type` int(1) NOT NULL COMMENT '信件状态',
  `read_time` datetime DEFAULT NULL COMMENT '读取时间',
  `disabled` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1380 DEFAULT CHARSET=gbk;

/*Table structure for table `pvmts_letter_sender` */

DROP TABLE IF EXISTS `pvmts_letter_sender`;

CREATE TABLE `pvmts_letter_sender` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `letter_id` int(11) DEFAULT NULL COMMENT '信件ID',
  `disabled` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=gbk COMMENT='发件人信息表';

/*Table structure for table `pvmts_logs_category` */

DROP TABLE IF EXISTS `pvmts_logs_category`;

CREATE TABLE `pvmts_logs_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_logs_info` */

DROP TABLE IF EXISTS `pvmts_logs_info`;

CREATE TABLE `pvmts_logs_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(64) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL COMMENT '类型',
  `power_station_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `kaleidoscope` varchar(255) DEFAULT NULL COMMENT '所属单位',
  `description` varchar(1024) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `log_status` int(1) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `equipment_type` int(11) DEFAULT NULL,
  `equipment_name` varchar(128) DEFAULT NULL,
  `handler` varchar(255) DEFAULT NULL COMMENT '处理人',
  `handling` varchar(1024) DEFAULT NULL COMMENT '处理办法',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `corporation` varchar(255) DEFAULT NULL COMMENT '责任单位',
  `responsible` varchar(255) DEFAULT NULL COMMENT '所属单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_mailconfig` */

DROP TABLE IF EXISTS `pvmts_mailconfig`;

CREATE TABLE `pvmts_mailconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_path` varchar(128) DEFAULT NULL COMMENT '邮件服务器地址',
  `mail_type` varchar(16) DEFAULT NULL COMMENT '邮件服务器类型 如smtp',
  `mail_port` varchar(8) DEFAULT NULL COMMENT '邮件服务器端口',
  `push_time` int(11) DEFAULT NULL COMMENT '推送周期设置',
  `mail_username` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `mail_password` varchar(64) DEFAULT NULL COMMENT '密码',
  `mail_address` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `usessl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_menus` */

DROP TABLE IF EXISTS `pvmts_menus`;

CREATE TABLE `pvmts_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_message_system` */

DROP TABLE IF EXISTS `pvmts_message_system`;

CREATE TABLE `pvmts_message_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `content` varchar(512) NOT NULL COMMENT '简介',
  `message_type` int(11) NOT NULL COMMENT '消息类型',
  `message_id` int(11) NOT NULL COMMENT '消息id',
  `massage_status` int(11) DEFAULT NULL COMMENT '消息状态',
  `address_user` varchar(64) NOT NULL COMMENT '扩展参数',
  `forced_push` int(11) NOT NULL DEFAULT '0' COMMENT '是否强制推送',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=745 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_message_user` */

DROP TABLE IF EXISTS `pvmts_message_user`;

CREATE TABLE `pvmts_message_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '系统消息id  message_system',
  `user_id` int(11) NOT NULL COMMENT '读取用户',
  `isread` int(11) NOT NULL COMMENT '是否已读',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_news_setting` */

DROP TABLE IF EXISTS `pvmts_news_setting`;

CREATE TABLE `pvmts_news_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `push` int(1) DEFAULT NULL,
  `sound` int(1) DEFAULT NULL,
  `vibrate` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_notice` */

DROP TABLE IF EXISTS `pvmts_notice`;

CREATE TABLE `pvmts_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `publisher` int(11) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `thumbnall_url` varchar(256) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `content_html` varchar(256) DEFAULT NULL,
  `counts` int(11) DEFAULT NULL,
  `publish_status` int(1) DEFAULT NULL,
  `notice_status` int(1) DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_notice_read` */

DROP TABLE IF EXISTS `pvmts_notice_read`;

CREATE TABLE `pvmts_notice_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  `counts` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_notice_type` */

DROP TABLE IF EXISTS `pvmts_notice_type`;

CREATE TABLE `pvmts_notice_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_point_info` */

DROP TABLE IF EXISTS `pvmts_point_info`;

CREATE TABLE `pvmts_point_info` (
  `analoginput_id` int(11) NOT NULL COMMENT 'analoginput里的id',
  `measurementtype_id` int(11) DEFAULT NULL COMMENT '测量类型id',
  `equipmentcontainer_id` int(11) DEFAULT NULL COMMENT '设备id',
  `equipmentcontainer_tableid` int(11) DEFAULT NULL COMMENT '设备类型id',
  `power_station_id` int(11) DEFAULT NULL COMMENT '电站id',
  `description_type` varchar(64) DEFAULT NULL COMMENT '测点类型描述',
  `measurementtype_name` varchar(128) DEFAULT NULL COMMENT '测量类型名称',
  `measurementtype_description` varchar(64) DEFAULT NULL COMMENT '测量类型中文描述',
  `equipmentcontainer_name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `calculate_type` int(4) DEFAULT NULL COMMENT '测点计算类型（0：scada采集；1：scada计算；2：程序单独计算,3 scada无关测点）',
  `update_time` int(11) DEFAULT NULL,
  `point_value` double DEFAULT NULL,
  `point_english_name` varchar(64) DEFAULT NULL,
  `description_type_en` varchar(64) DEFAULT NULL,
  `equipmentcontainer_name_en` varchar(128) DEFAULT NULL,
  `point_original_value` double DEFAULT NULL COMMENT '原始数据',
  `ycyx` int(11) DEFAULT NULL COMMENT '测点类型 104遥信 101 遥测',
  PRIMARY KEY (`analoginput_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_point_info1027` */

DROP TABLE IF EXISTS `pvmts_point_info1027`;

CREATE TABLE `pvmts_point_info1027` (
  `analoginput_id` int(11) NOT NULL COMMENT 'analoginput里的id',
  `measurementtype_id` int(11) DEFAULT NULL COMMENT '测量类型id',
  `equipmentcontainer_id` int(11) DEFAULT NULL COMMENT '设备id',
  `equipmentcontainer_tableid` int(11) DEFAULT NULL COMMENT '设备类型id',
  `power_station_id` int(11) DEFAULT NULL COMMENT '电站id',
  `description_type` varchar(64) DEFAULT NULL COMMENT '测点类型描述',
  `measurementtype_name` varchar(128) DEFAULT NULL COMMENT '测量类型名称',
  `measurementtype_description` varchar(64) DEFAULT NULL COMMENT '测量类型中文描述',
  `equipmentcontainer_name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `calculate_type` int(4) DEFAULT NULL COMMENT '测点计算类型（0：scada采集；1：scada计算；2：程序单独计算,3 scada无关测点）',
  `update_time` int(11) DEFAULT NULL,
  `point_value` double DEFAULT NULL,
  `point_english_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`analoginput_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_point_info_0908` */

DROP TABLE IF EXISTS `pvmts_point_info_0908`;

CREATE TABLE `pvmts_point_info_0908` (
  `analoginput_id` int(11) NOT NULL COMMENT 'analoginput里的id',
  `measurementtype_id` int(11) DEFAULT NULL COMMENT '测量类型id',
  `equipmentcontainer_id` int(11) DEFAULT NULL COMMENT '设备id',
  `equipmentcontainer_tableid` int(11) DEFAULT NULL COMMENT '设备类型id',
  `power_station_id` int(11) DEFAULT NULL COMMENT '电站id',
  `description_type` varchar(64) DEFAULT NULL COMMENT '测点类型描述',
  `measurementtype_name` varchar(128) DEFAULT NULL COMMENT '测量类型名称',
  `measurementtype_description` varchar(64) DEFAULT NULL COMMENT '测量类型中文描述',
  `equipmentcontainer_name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `calculate_type` int(4) DEFAULT NULL COMMENT '测点计算类型（0：scada采集；1：scada计算；2：程序单独计算,3 scada无关测点）',
  `update_time` int(11) DEFAULT NULL,
  `point_value` double DEFAULT NULL,
  PRIMARY KEY (`analoginput_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_point_info_20171020` */

DROP TABLE IF EXISTS `pvmts_point_info_20171020`;

CREATE TABLE `pvmts_point_info_20171020` (
  `analoginput_id` int(11) NOT NULL COMMENT 'analoginput里的id',
  `measurementtype_id` int(11) DEFAULT NULL COMMENT '测量类型id',
  `equipmentcontainer_id` int(11) DEFAULT NULL COMMENT '设备id',
  `equipmentcontainer_tableid` int(11) DEFAULT NULL COMMENT '设备类型id',
  `power_station_id` int(11) DEFAULT NULL COMMENT '电站id',
  `description_type` varchar(64) DEFAULT NULL COMMENT '测点类型描述',
  `measurementtype_name` varchar(128) DEFAULT NULL COMMENT '测量类型名称',
  `measurementtype_description` varchar(64) DEFAULT NULL COMMENT '测量类型中文描述',
  `equipmentcontainer_name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `calculate_type` int(4) DEFAULT NULL COMMENT '测点计算类型（0：scada采集；1：scada计算；2：程序单独计算,3 scada无关测点）',
  `update_time` int(11) DEFAULT NULL,
  `point_value` double DEFAULT NULL,
  PRIMARY KEY (`analoginput_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_point_info_20180104` */

DROP TABLE IF EXISTS `pvmts_point_info_20180104`;

CREATE TABLE `pvmts_point_info_20180104` (
  `analoginput_id` int(11) NOT NULL COMMENT 'analoginput里的id',
  `measurementtype_id` int(11) DEFAULT NULL COMMENT '测量类型id',
  `equipmentcontainer_id` int(11) DEFAULT NULL COMMENT '设备id',
  `equipmentcontainer_tableid` int(11) DEFAULT NULL COMMENT '设备类型id',
  `power_station_id` int(11) DEFAULT NULL COMMENT '电站id',
  `description_type` varchar(64) DEFAULT NULL COMMENT '测点类型描述',
  `measurementtype_name` varchar(128) DEFAULT NULL COMMENT '测量类型名称',
  `measurementtype_description` varchar(64) DEFAULT NULL COMMENT '测量类型中文描述',
  `equipmentcontainer_name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `calculate_type` int(4) DEFAULT NULL COMMENT '测点计算类型（0：scada采集；1：scada计算；2：程序单独计算,3 scada无关测点）',
  `update_time` int(11) DEFAULT NULL,
  `point_value` double DEFAULT NULL,
  `point_english_name` varchar(64) DEFAULT NULL,
  `description_type_en` varchar(64) DEFAULT NULL,
  `equipmentcontainer_name_en` varchar(128) DEFAULT NULL,
  `point_original_value` double DEFAULT NULL COMMENT '原始数据',
  `ycyx` int(11) DEFAULT NULL COMMENT '测点类型 104遥信 101 遥测',
  PRIMARY KEY (`analoginput_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_point_statistics_log` */

DROP TABLE IF EXISTS `pvmts_point_statistics_log`;

CREATE TABLE `pvmts_point_statistics_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '和测点的id一致',
  `year` int(11) DEFAULT NULL COMMENT '数据所属年',
  `month` int(11) DEFAULT NULL COMMENT '数据所属月',
  `day` int(11) DEFAULT NULL COMMENT '数据所属日',
  `type` int(11) DEFAULT NULL COMMENT '1 日统计，2 月统计 3 年统计',
  `data_time` int(11) DEFAULT NULL COMMENT '数据时间',
  `original` float DEFAULT '0' COMMENT '和data_time对应的数值(一般为总的，如总发电量)',
  `value` float DEFAULT '0' COMMENT '数值计算后的数值',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708245679 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_point_statistics_log_2` */

DROP TABLE IF EXISTS `pvmts_point_statistics_log_2`;

CREATE TABLE `pvmts_point_statistics_log_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '和测点的id一致',
  `year` int(11) DEFAULT NULL COMMENT '数据所属年',
  `month` int(11) DEFAULT NULL COMMENT '数据所属月',
  `day` int(11) DEFAULT NULL COMMENT '数据所属日',
  `type` int(11) DEFAULT NULL COMMENT '1 日统计，2 月统计 3 年统计',
  `data_time` int(11) DEFAULT NULL COMMENT '数据时间',
  `original` float DEFAULT '0' COMMENT '和data_time对应的数值(一般为总的，如总发电量)',
  `value` float DEFAULT '0' COMMENT '数值计算后的数值',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708245679 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_pushmail` */

DROP TABLE IF EXISTS `pvmts_pushmail`;

CREATE TABLE `pvmts_pushmail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL COMMENT '角色id',
  `push` int(11) DEFAULT NULL COMMENT '是否推送',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_report_daily` */

DROP TABLE IF EXISTS `pvmts_report_daily`;

CREATE TABLE `pvmts_report_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reportname` varchar(64) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `reporttime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_report_daily_power` */

DROP TABLE IF EXISTS `pvmts_report_daily_power`;

CREATE TABLE `pvmts_report_daily_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power_id` int(11) DEFAULT NULL,
  `iscreate` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_report_points` */

DROP TABLE IF EXISTS `pvmts_report_points`;

CREATE TABLE `pvmts_report_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `analoginputId` int(11) DEFAULT NULL,
  `analoginputColor` varchar(128) DEFAULT NULL,
  `analoginputName` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `reportid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3290 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_resports` */

DROP TABLE IF EXISTS `pvmts_resports`;

CREATE TABLE `pvmts_resports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reportname` varchar(64) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `powerstationid` int(11) DEFAULT NULL,
  `createuser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_role_powerstation` */

DROP TABLE IF EXISTS `pvmts_role_powerstation`;

CREATE TABLE `pvmts_role_powerstation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `powerstation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 COMMENT='角色与电站对应表';

/*Table structure for table `pvmts_roles` */

DROP TABLE IF EXISTS `pvmts_roles`;

CREATE TABLE `pvmts_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `role_type` int(11) NOT NULL COMMENT '角色类型  0-系统角色 1-公司角色 ',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(1024) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Table structure for table `pvmts_roles_menu` */

DROP TABLE IF EXISTS `pvmts_roles_menu`;

CREATE TABLE `pvmts_roles_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `handle_premission` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2584 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_rules_info` */

DROP TABLE IF EXISTS `pvmts_rules_info`;

CREATE TABLE `pvmts_rules_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `version` varchar(128) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `file_name` varchar(128) DEFAULT NULL,
  `file_url` varchar(256) DEFAULT NULL,
  `publish_status` int(1) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `rule_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_rules_read` */

DROP TABLE IF EXISTS `pvmts_rules_read`;

CREATE TABLE `pvmts_rules_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_scaninfo` */

DROP TABLE IF EXISTS `pvmts_scaninfo`;

CREATE TABLE `pvmts_scaninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `equipmentId` int(11) DEFAULT NULL COMMENT '设备id',
  `equipmentType` varchar(32) DEFAULT NULL COMMENT '设备类型',
  `equipmentInfo` varchar(1024) DEFAULT NULL COMMENT '设备信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_setting_push` */

DROP TABLE IF EXISTS `pvmts_setting_push`;

CREATE TABLE `pvmts_setting_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `letter` int(11) DEFAULT NULL,
  `two_alarm` int(11) DEFAULT NULL,
  `three_alarm` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_syncdata_log` */

DROP TABLE IF EXISTS `pvmts_syncdata_log`;

CREATE TABLE `pvmts_syncdata_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '同步标示名称',
  `start_date` datetime DEFAULT NULL COMMENT '同步的数据开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '同步的数据结束时间',
  `status` int(11) DEFAULT NULL COMMENT '状态 0 同步中 1 同步完成',
  `user_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_task` */

DROP TABLE IF EXISTS `pvmts_task`;

CREATE TABLE `pvmts_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_time` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `default_time` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_third_equipments` */

DROP TABLE IF EXISTS `pvmts_third_equipments`;

CREATE TABLE `pvmts_third_equipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_type` int(11) DEFAULT NULL,
  `number` varchar(64) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `power_station_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_third_points` */

DROP TABLE IF EXISTS `pvmts_third_points`;

CREATE TABLE `pvmts_third_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_type` varchar(64) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `equipment_type` int(11) DEFAULT NULL,
  `point_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_thirduser_equipment` */

DROP TABLE IF EXISTS `pvmts_thirduser_equipment`;

CREATE TABLE `pvmts_thirduser_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '第三方用户id',
  `equipment_type` int(11) DEFAULT NULL COMMENT '设备类型id',
  `equipment_id` int(11) DEFAULT NULL COMMENT '设备id',
  `measurementtype_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '测量类型id 气象站专用字段',
  `power_station_id` int(11) DEFAULT NULL COMMENT '电站id',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_umeng_push` */

DROP TABLE IF EXISTS `pvmts_umeng_push`;

CREATE TABLE `pvmts_umeng_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `device_token` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '设备id',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL COMMENT '1  -android  2-ios  ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `pvmts_user` */

DROP TABLE IF EXISTS `pvmts_user`;

CREATE TABLE `pvmts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `nickname` varchar(256) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `headshot` varchar(1024) DEFAULT NULL COMMENT '头像',
  `email` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `wxheadurl` varchar(512) DEFAULT NULL,
  `wxsex` varchar(6) DEFAULT NULL,
  `wxnickname` varchar(128) DEFAULT NULL,
  `wxopenid` varchar(128) DEFAULT NULL,
  `wxunionid` varchar(128) DEFAULT NULL,
  `create_userid` int(11) DEFAULT NULL COMMENT '创建人id',
  `input_company` varchar(256) DEFAULT NULL COMMENT '输入的公司名称',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=548 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Table structure for table `pvmts_user_powerstation` */

DROP TABLE IF EXISTS `pvmts_user_powerstation`;

CREATE TABLE `pvmts_user_powerstation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `powerstation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与电站对应表';

/*Table structure for table `pvmts_user_role` */

DROP TABLE IF EXISTS `pvmts_user_role`;

CREATE TABLE `pvmts_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_user_role_0919` */

DROP TABLE IF EXISTS `pvmts_user_role_0919`;

CREATE TABLE `pvmts_user_role_0919` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_user_track` */

DROP TABLE IF EXISTS `pvmts_user_track`;

CREATE TABLE `pvmts_user_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `lng` varchar(32) DEFAULT NULL COMMENT '经度',
  `lat` varchar(32) DEFAULT NULL COMMENT '纬度',
  `time` datetime DEFAULT NULL COMMENT '时间点',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `address` varchar(512) DEFAULT NULL COMMENT '当前地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_version_info` */

DROP TABLE IF EXISTS `pvmts_version_info`;

CREATE TABLE `pvmts_version_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_type` varchar(64) DEFAULT NULL,
  `version_number` varchar(64) DEFAULT NULL,
  `version_status` int(11) DEFAULT NULL,
  `dowload_url` varchar(512) DEFAULT NULL,
  `version_message` varchar(1024) DEFAULT NULL,
  `craete_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_workorder_contact` */

DROP TABLE IF EXISTS `pvmts_workorder_contact`;

CREATE TABLE `pvmts_workorder_contact` (
  `id` int(11) NOT NULL COMMENT '主键',
  `isneedthird` int(11) DEFAULT NULL COMMENT '是否需要第三方',
  `third_company` varchar(512) DEFAULT NULL COMMENT '第三方接口人单位',
  `third_identity` varchar(128) DEFAULT NULL COMMENT '第三方联系人身份',
  `third_username` varchar(64) DEFAULT NULL COMMENT '第三方联系人姓名',
  `third_position` varchar(512) DEFAULT NULL COMMENT '第三方联系人职务',
  `third_contact` varchar(16) DEFAULT NULL COMMENT '第三方联系人电话',
  `workcontent` varchar(1024) DEFAULT NULL COMMENT '工作内容',
  `workorderNum` varchar(64) DEFAULT NULL COMMENT '工单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方联系单和工单信息映射表';

/*Table structure for table `pvmts_workorder_departmapping` */

DROP TABLE IF EXISTS `pvmts_workorder_departmapping`;

CREATE TABLE `pvmts_workorder_departmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(64) DEFAULT NULL,
  `examineId` int(11) DEFAULT NULL,
  `isQualified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_workorder_departure` */

DROP TABLE IF EXISTS `pvmts_workorder_departure`;

CREATE TABLE `pvmts_workorder_departure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(64) DEFAULT NULL,
  `conclusion` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='离场申请表';

/*Table structure for table `pvmts_workorder_examine` */

DROP TABLE IF EXISTS `pvmts_workorder_examine`;

CREATE TABLE `pvmts_workorder_examine` (
  `id` int(11) NOT NULL,
  `checkup_type` int(11) DEFAULT NULL,
  `checkup_name` varchar(128) DEFAULT NULL,
  `checkup_content` varchar(512) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电站体检检查项目表';

/*Table structure for table `pvmts_workorder_examinedepart` */

DROP TABLE IF EXISTS `pvmts_workorder_examinedepart`;

CREATE TABLE `pvmts_workorder_examinedepart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkup_type` varchar(128) DEFAULT NULL,
  `checkup_content` varchar(512) DEFAULT NULL,
  `checkup_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_workorder_fault` */

DROP TABLE IF EXISTS `pvmts_workorder_fault`;

CREATE TABLE `pvmts_workorder_fault` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `workorderId` varchar(64) DEFAULT NULL COMMENT '工单id',
  `faultId` int(11) DEFAULT NULL COMMENT '故障id',
  `isSolve` int(11) DEFAULT NULL COMMENT '是否已处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工单信息与故障信息映射表';

/*Table structure for table `pvmts_workorder_info` */

DROP TABLE IF EXISTS `pvmts_workorder_info`;

CREATE TABLE `pvmts_workorder_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_number` varchar(64) DEFAULT NULL COMMENT '工单编号',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人员id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `maintenance_user` int(11) DEFAULT NULL COMMENT '运维人员id',
  `allocate_time` datetime DEFAULT NULL COMMENT '分配时间',
  `state` int(11) DEFAULT NULL COMMENT '工单状态',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(512) DEFAULT NULL COMMENT '备注',
  `physicalState` int(11) DEFAULT NULL COMMENT '体检状态',
  `departureState` int(11) DEFAULT NULL COMMENT '离场申请状态',
  `powerStation_id` int(11) DEFAULT NULL COMMENT '电站id',
  `powerStation_name` varchar(512) DEFAULT NULL COMMENT '电站名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工单信息表  调度人员在确认故障信息后选择故障信息并创建工单 分配到运维人员处理';

/*Table structure for table `pvmts_workorder_powerstation` */

DROP TABLE IF EXISTS `pvmts_workorder_powerstation`;

CREATE TABLE `pvmts_workorder_powerstation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examineId` int(11) DEFAULT NULL COMMENT '检查项目id',
  `isSolve` int(11) DEFAULT NULL COMMENT '是否可解决 1-可就地解决 0-需要上报调度中心',
  `explainInfo` varchar(512) DEFAULT NULL,
  `workorderNum` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电站体检表';

/*Table structure for table `pvmts_workorder_solve` */

DROP TABLE IF EXISTS `pvmts_workorder_solve`;

CREATE TABLE `pvmts_workorder_solve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solve_user` int(11) DEFAULT NULL,
  `solve_time` datetime DEFAULT NULL,
  `solve_result` int(11) DEFAULT NULL,
  `solve_info` varchar(512) DEFAULT NULL,
  `workorderNum` varchar(64) DEFAULT NULL,
  `faultId` int(11) DEFAULT NULL,
  `dispatcherId` int(11) DEFAULT NULL,
  `dispatcherState` varchar(512) DEFAULT NULL,
  `dispatcherTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障处理表';

/*Table structure for table `pvmts_workorder_sparepart` */

DROP TABLE IF EXISTS `pvmts_workorder_sparepart`;

CREATE TABLE `pvmts_workorder_sparepart` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sparepart_name` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_workorder_sparepartmap` */

DROP TABLE IF EXISTS `pvmts_workorder_sparepartmap`;

CREATE TABLE `pvmts_workorder_sparepartmap` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sparepartId` int(11) DEFAULT NULL,
  `workorderNum` varchar(64) DEFAULT NULL,
  `receivenum` int(11) DEFAULT NULL,
  `receivetype` int(11) DEFAULT NULL,
  `receiveuser` varchar(64) DEFAULT NULL,
  `specificationId` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pvmts_workorder_specification` */

DROP TABLE IF EXISTS `pvmts_workorder_specification`;

CREATE TABLE `pvmts_workorder_specification` (
  `id` int(11) NOT NULL DEFAULT '0',
  `specification_name` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
