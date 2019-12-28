/*
 Navicat Premium Data Transfer

 Source Server         : localhost 3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : hrms

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 28/12/2019 20:23:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE DATABASE IF NOT EXISTS `hrms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hrms`;
-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `em_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `em_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_age` int(11) NOT NULL,
  `em_arch_num` bigint(20) NOT NULL,
  `em_bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_bank_account` bigint(20) NOT NULL,
  `em_birth_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_birthday` date NOT NULL,
  `em_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `em_edu_bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_faith` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_family_relation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `em_gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_id_card` bigint(20) NOT NULL,
  `em_img_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_nationality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_phone` bigint(20) NULL DEFAULT NULL,
  `em_political_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_post_code` int(11) NOT NULL,
  `emqq` bigint(20) NULL DEFAULT NULL,
  `em_registrant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `em_resume` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emssn` bigint(20) NULL DEFAULT NULL,
  `em_skill` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_state` int(11) NOT NULL DEFAULT 0,
  `em_years_of_edu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_telphone` bigint(20) NOT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL,
  `p_id` bigint(20) NULL DEFAULT NULL,
  `ws_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`em_id`) USING BTREE,
  INDEX `FKig6dfn3mdu6tqgahd5rlxtqd0`(`p_id`) USING BTREE,
  INDEX `FKqijokd3ck1e6p91m1b9ayp3ap`(`ws_id`) USING BTREE,
  INDEX `FKsiddgte4rd43b99lr7dqvn962`(`org_id`) USING BTREE,
  CONSTRAINT `FKig6dfn3mdu6tqgahd5rlxtqd0` FOREIGN KEY (`p_id`) REFERENCES `position` (`p_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqijokd3ck1e6p91m1b9ayp3ap` FOREIGN KEY (`ws_id`) REFERENCES `wage_standard` (`ws_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsiddgte4rd43b99lr7dqvn962` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'asdasd', 68, 234, '中国很行', 79, 'asdasdasd', '2019-01-12', '2019-01-12 09:06:55', '高中', '121232@qq.com', '我是默认字符串', '我是默认字符串', '男', '打球', 40, NULL, '我是默认字符串', 'sdad', '少数民族', 'asdas', 73, '3', 74, 50, '我是默认字符串', '我是默认字符串', '我是默认字符串', 72, '经营', 1, '12312', 23, 2, 1, 2);
INSERT INTO `employee` VALUES (2, '我是默认', 68, 324, '我是默认字符串', 79, '我是默认字符串', '2019-01-12', '2019-01-12 09:06:55', '高中', '12332132@qq.com', '我是默', '我是默认', '我是默认', '我是默', 40, '\\upload\\images\\test\\2019011216263688591.png', '我是默认字符串', '我是默认字符串', '我是默认字符串', '我是默认字符串', 73, '3', 74, 50, '我是默认字符串', '我是默认字符串', '我是默认字符串', 72, '我是默认字符串', 0, '1233', 23, 3, 2, 2);
INSERT INTO `employee` VALUES (3, '钢管杆', 34, 179, '大萨达萨达', 34, 'rwe ', '2019-01-16', '2019-01-12 15:51:28', '高中', '213412341@qq.com', '撒打算', 'dasdas', '男', '啊实打实', 432423, '\\upload\\images\\test\\2019011221483922811.jpg', '我单位', '撒打算', '少数民族', 'asdasd', 4234, 'sdf ', 32432, 34234, 'admin', 'asdasdasd', 'sdfsdf', 234324, '阿达是', 1, '3244', 123124, 2, 6, 4);
INSERT INTO `employee` VALUES (4, '阿斯顿发生 ', 21, 487, '大萨达萨达', 23, '时光隧道', '2019-01-09', '2019-01-13 15:51:33', '无', '12312312@qq.com', '撒打算', 'vvvvvvvvvvvv', '男', '啊实打实', 21312312, '\\upload\\images\\test\\2019011315513234469.jpg', '我单位', 'cc', '汉族', '徐许星程', 13421234, '', 444, 123412341234, 'admin', 'xxxxxxxxxxxxxxxxxx', 'aaaaaa', 213123123, '阿达是', 0, '', 12412341234, 4, 7, NULL);

-- ----------------------------
-- Table structure for first_org
-- ----------------------------
DROP TABLE IF EXISTS `first_org`;
CREATE TABLE `first_org`  (
  `f_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of first_org
-- ----------------------------
INSERT INTO `first_org` VALUES (1, '集团');
INSERT INTO `first_org` VALUES (2, '政府');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `org_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_id` bigint(20) NOT NULL,
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (2, '集团', '生物科技公司', '市场部', 5);
INSERT INTO `organization` VALUES (3, '集团', '软件公司', '开发组', 1);
INSERT INTO `organization` VALUES (4, '集团', '软件公司', '开发组', 1);

-- ----------------------------
-- Table structure for pay_bills
-- ----------------------------
DROP TABLE IF EXISTS `pay_bills`;
CREATE TABLE `pay_bills`  (
  `pb_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pb_create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `pb_em_sum` int(11) NULL DEFAULT NULL,
  `pb_real_total` double NULL DEFAULT NULL,
  `pb_registrant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pb_state` int(11) NOT NULL DEFAULT 0,
  `pb_total` double NULL DEFAULT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`pb_id`) USING BTREE,
  INDEX `FKrwx5kh1r0ldrc3ssjcnl0ws8m`(`org_id`) USING BTREE,
  CONSTRAINT `FKrwx5kh1r0ldrc3ssjcnl0ws8m` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_bills
-- ----------------------------
INSERT INTO `pay_bills` VALUES (9, '2019-01-13 09:36:35', 2, 0, '', 0, 77.93, 2);
INSERT INTO `pay_bills` VALUES (10, '2019-01-13 09:36:35', 1, 134.465, 'aa', 1, 145.465, 2);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `p_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `p_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `p_wage_standard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, '我是默认字符串', '我是默认字符串', '5', '222');
INSERT INTO `position` VALUES (2, '我是默认字符串', '我是默认字符串', '5', '222');
INSERT INTO `position` VALUES (6, '售前', '啊实打实', '市场销售', '333');
INSERT INTO `position` VALUES (7, 'web前端开发工程师', '324234', '软件开发', '');

-- ----------------------------
-- Table structure for position_job
-- ----------------------------
DROP TABLE IF EXISTS `position_job`;
CREATE TABLE `position_job`  (
  `pj_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pj_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pj_wage_standard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pj_parent` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`pj_id`) USING BTREE,
  INDEX `FKln1o4dhqcud9fm2bv8mip6b99`(`pj_parent`) USING BTREE,
  CONSTRAINT `FKln1o4dhqcud9fm2bv8mip6b99` FOREIGN KEY (`pj_parent`) REFERENCES `position_type` (`pt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position_job
-- ----------------------------
INSERT INTO `position_job` VALUES (1, 'web前端开发工程师', '30K/月', 1);
INSERT INTO `position_job` VALUES (2, '数据库设计师', '10K/月', 1);
INSERT INTO `position_job` VALUES (3, '架构师', '22K/月', 1);
INSERT INTO `position_job` VALUES (4, '后台开发工程师', '34K/月', 1);
INSERT INTO `position_job` VALUES (5, '产品经理', '1K/月', 3);
INSERT INTO `position_job` VALUES (6, '售后', '2K/月', 2);
INSERT INTO `position_job` VALUES (7, '售前', '3K/月', 2);
INSERT INTO `position_job` VALUES (8, '组装', '1K/月', 4);
INSERT INTO `position_job` VALUES (9, '维修', '2K/月', 4);
INSERT INTO `position_job` VALUES (10, '人事经理', '8K/月', 5);
INSERT INTO `position_job` VALUES (11, '人事专员', '4K/月', 5);
INSERT INTO `position_job` VALUES (12, '财务经理', '7K/月', 5);
INSERT INTO `position_job` VALUES (13, '财务专员', '3K/月', 5);

-- ----------------------------
-- Table structure for position_type
-- ----------------------------
DROP TABLE IF EXISTS `position_type`;
CREATE TABLE `position_type`  (
  `pt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pt_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position_type
-- ----------------------------
INSERT INTO `position_type` VALUES (1, '软件开发');
INSERT INTO `position_type` VALUES (2, '市场销售');
INSERT INTO `position_type` VALUES (3, '产品运营');
INSERT INTO `position_type` VALUES (4, '生产劳动');
INSERT INTO `position_type` VALUES (5, '高级管理');

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege`  (
  `pr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pr_handler` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pr_level` int(11) NOT NULL DEFAULT 1,
  `pr_parent` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`pr_id`) USING BTREE,
  INDEX `FK5mwmw5eoj8lqe6v5xnm8td3lr`(`pr_parent`) USING BTREE,
  CONSTRAINT `FK5mwmw5eoj8lqe6v5xnm8td3lr` FOREIGN KEY (`pr_parent`) REFERENCES `privilege` (`pr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `r_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `r_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `r_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, NULL, '人事专员');
INSERT INTO `role` VALUES (2, NULL, '人事经理');
INSERT INTO `role` VALUES (3, NULL, '财务专员');
INSERT INTO `role` VALUES (4, NULL, '财务经理');
INSERT INTO `role` VALUES (5, NULL, '开发者');

-- ----------------------------
-- Table structure for second_org
-- ----------------------------
DROP TABLE IF EXISTS `second_org`;
CREATE TABLE `second_org`  (
  `s_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_parent` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE,
  INDEX `FK90a4g0ta6xycvqmwc69nqkwsb`(`s_parent`) USING BTREE,
  CONSTRAINT `FK90a4g0ta6xycvqmwc69nqkwsb` FOREIGN KEY (`s_parent`) REFERENCES `first_org` (`f_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of second_org
-- ----------------------------
INSERT INTO `second_org` VALUES (1, '软件公司', 1);
INSERT INTO `second_org` VALUES (2, '生物科技公司', 1);

-- ----------------------------
-- Table structure for tb_role_privileges
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_privileges`;
CREATE TABLE `tb_role_privileges`  (
  `r_id` bigint(20) NOT NULL,
  `pr_id` bigint(20) NOT NULL,
  PRIMARY KEY (`r_id`, `pr_id`) USING BTREE,
  INDEX `FKohk2kc6wxp7tnu3oovdbmrix8`(`pr_id`) USING BTREE,
  CONSTRAINT `FKkilx0cbtyixpn1nlpg3doquq2` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKohk2kc6wxp7tnu3oovdbmrix8` FOREIGN KEY (`pr_id`) REFERENCES `privilege` (`pr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for third_org
-- ----------------------------
DROP TABLE IF EXISTS `third_org`;
CREATE TABLE `third_org`  (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_parent` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `FKg31etniewkkj511u5vq7wr2mj`(`t_parent`) USING BTREE,
  CONSTRAINT `FKg31etniewkkj511u5vq7wr2mj` FOREIGN KEY (`t_parent`) REFERENCES `second_org` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of third_org
-- ----------------------------
INSERT INTO `third_org` VALUES (1, '测试组', 1);
INSERT INTO `third_org` VALUES (2, '外包组', 1);
INSERT INTO `third_org` VALUES (3, '开发组', 1);
INSERT INTO `third_org` VALUES (4, '研发部', 2);
INSERT INTO `third_org` VALUES (5, '市场部', 2);
INSERT INTO `third_org` VALUES (6, '生产部', 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE,
  INDEX `FKtfxkjpttrk8watksp7g49obrb`(`em_id`) USING BTREE,
  INDEX `FKn82ha3ccdebhokx3a8fgdqeyy`(`role_id`) USING BTREE,
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtfxkjpttrk8watksp7g49obrb` FOREIGN KEY (`em_id`) REFERENCES `employee` (`em_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2019-01-12 10:42:21', 'admin', 'admin', 1, 5);
INSERT INTO `user` VALUES (2, '2019-01-12 10:43:06', 'hh', 'hh', 2, 1);

-- ----------------------------
-- Table structure for wage
-- ----------------------------
DROP TABLE IF EXISTS `wage`;
CREATE TABLE `wage`  (
  `w_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `w_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `w_fine` double NULL DEFAULT NULL,
  `w_reward` double NULL DEFAULT NULL,
  `w_state` int(11) NOT NULL DEFAULT 0,
  `w_total` double NULL DEFAULT NULL,
  `ws_num` bigint(11) NOT NULL,
  `em_id` bigint(20) NULL DEFAULT NULL,
  `pb_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`w_id`) USING BTREE,
  INDEX `FKl9t6t746winmvh7p9t0ixunxf`(`em_id`) USING BTREE,
  INDEX `FKh7phedy6a1tj1ia5f5jgd5gh0`(`pb_id`) USING BTREE,
  CONSTRAINT `FKh7phedy6a1tj1ia5f5jgd5gh0` FOREIGN KEY (`pb_id`) REFERENCES `pay_bills` (`pb_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl9t6t746winmvh7p9t0ixunxf` FOREIGN KEY (`em_id`) REFERENCES `employee` (`em_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wage
-- ----------------------------
INSERT INTO `wage` VALUES (15, '2019-01-13 09:36:35', 22, 33, 0, 38.965, 222, 1, 9);
INSERT INTO `wage` VALUES (16, '2019-01-13 09:36:35', 0, 0, 0, 38.965, 222, 2, 9);
INSERT INTO `wage` VALUES (17, '2019-01-13 09:36:35', 22, 11, 0, 145.465, 333, 3, 10);

-- ----------------------------
-- Table structure for wage_standard
-- ----------------------------
DROP TABLE IF EXISTS `wage_standard`;
CREATE TABLE `wage_standard`  (
  `ws_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ws_base_wage` double NOT NULL,
  `ws_communication_allowance` decimal(18, 2) NULL DEFAULT 0.00,
  `ws_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ws_endowment_insurance` decimal(18, 2) NULL DEFAULT 0.00,
  `ws_health_insurance` decimal(18, 2) NULL DEFAULT 0.00,
  `ws_housing_fund` decimal(18, 2) NULL DEFAULT 0.00,
  `ws_lunch_allowance` decimal(18, 2) NULL DEFAULT 0.00,
  `ws_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ws_num` bigint(20) NOT NULL,
  `ws_producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ws_registrant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ws_total` double NULL DEFAULT NULL,
  `ws_travel_allowance` decimal(18, 2) NULL DEFAULT 0.00,
  `ws_unemployed_insurance` decimal(18, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`ws_id`) USING BTREE,
  UNIQUE INDEX `www`(`ws_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wage_standard
-- ----------------------------
INSERT INTO `wage_standard` VALUES (1, 59, 13212.00, '2019-01-12 22:48:00', 12312.00, 123.00, 123.00, 123.00, '123', 12312, '213', '123', 32, 123.00, 1233.00);
INSERT INTO `wage_standard` VALUES (2, 11, 11.00, '2019-01-13 00:44:29', 0.88, 3.22, 0.88, 11.00, '发放', 222, '擦', '阿达', 38.965, 11.00, 0.06);
INSERT INTO `wage_standard` VALUES (4, 111, 34.00, '2019-01-13 01:53:14', 8.88, 5.22, 8.88, 2.00, '二c', 333, '擦', '萨达啊', 145.465, 22.00, 0.56);
INSERT INTO `wage_standard` VALUES (5, 111, 5.00, '2019-01-13 13:38:52', 8.88, 5.22, 8.88, 3.00, '工程师奖金', 1000, '我', '我', 97.465, 2.00, 0.56);
INSERT INTO `wage_standard` VALUES (7, 111, 5.00, '2019-01-13 13:45:29', 8.88, 5.22, 8.88, 3.00, '我', 1001, '我', '我', 97.465, 2.00, 0.56);
INSERT INTO `wage_standard` VALUES (8, 233, 3.00, '2019-01-13 13:57:39', 18.64, 7.66, 18.64, 23.00, '1231', 2232, '11', '123', 233.895, 21.00, 1.17);

SET FOREIGN_KEY_CHECKS = 1;
