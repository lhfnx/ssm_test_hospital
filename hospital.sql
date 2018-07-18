/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 18/07/2018 13:06:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `admin_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`admin_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for bed
-- ----------------------------
DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed`  (
  `bed_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '床位号，主键',
  `bed_stat` int(1) NOT NULL DEFAULT 1 COMMENT '床位状态，空闲为1，非空为0',
  `ward_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病房编号，外键',
  PRIMARY KEY (`bed_id`) USING BTREE,
  INDEX `ward_id`(`ward_id`) USING BTREE,
  CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`ward_id`) REFERENCES `ward` (`ward_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bed
-- ----------------------------
INSERT INTO `bed` VALUES ('200101', 0, '2001');
INSERT INTO `bed` VALUES ('200102', 0, '2001');
INSERT INTO `bed` VALUES ('200103', 1, '2001');
INSERT INTO `bed` VALUES ('200104', 1, '2001');
INSERT INTO `bed` VALUES ('200201', 1, '2002');
INSERT INTO `bed` VALUES ('200202', 1, '2002');
INSERT INTO `bed` VALUES ('200203', 1, '2002');
INSERT INTO `bed` VALUES ('200204', 1, '2002');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室编号，主键',
  `department_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室名称',
  `department_ph` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室电话',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1001', 'nx', '12312313');
INSERT INTO `department` VALUES ('1002', 'lf', '12313144');
INSERT INTO `department` VALUES ('1003', 'zyw', '5464889');
INSERT INTO `department` VALUES ('1004', '张云玮', '54798746');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctor_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生编号，主键',
  `doctor_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生姓名',
  `doctor_sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `doctor_age` decimal(3, 0) NOT NULL COMMENT '年龄',
  `doctor_ph` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人简介',
  `department_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室编号，外键',
  PRIMARY KEY (`doctor_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('100101', '阿达a1', '男', 31, '21414231', '沙发是的发送到发发发沙发啊1法发大水', '1001');
INSERT INTO `doctor` VALUES ('100102', '刘恒峰', '男', 21, '56213123', '是打发的说法是的发生法撒旦法师法水电费水电费\r\n阿打算发生大发发到付\r\n大发送到发送\r\nasdfsdaf', '1001');
INSERT INTO `doctor` VALUES ('100103', '奥术大', '女', 36, '21312313', '额发阿发玩法', '1001');
INSERT INTO `doctor` VALUES ('100201', '爱国福', '女', 23, '4654584', '阿打算给对方合同如何', '1002');

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors`  (
  `doctor_username` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doctor_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`doctor_username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctors
-- ----------------------------
INSERT INTO `doctors` VALUES ('100101', '100101');
INSERT INTO `doctors` VALUES ('100102', '100102');
INSERT INTO `doctors` VALUES ('100103', '100103');
INSERT INTO `doctors` VALUES ('100201', '100201');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `count_id` int(4) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resident_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `patient_sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `patient_age` decimal(3, 0) NULL DEFAULT NULL,
  `patient_ph` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `in_time` date NULL DEFAULT NULL,
  `out_time` date NULL DEFAULT NULL,
  `doctor_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bed_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`count_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (3, 'LHFF', 'sadasdas', '男', 21, '56942150', '2018-04-03', '2018-04-03', '阿达a', '200101');

-- ----------------------------
-- Table structure for outhospital
-- ----------------------------
DROP TABLE IF EXISTS `outhospital`;
CREATE TABLE `outhospital`  (
  `count_id` int(4) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `submit_date` date NULL DEFAULT NULL,
  `postscript` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `stat` int(1) NOT NULL,
  PRIMARY KEY (`count_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  CONSTRAINT `outhospital_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of outhospital
-- ----------------------------
INSERT INTO `outhospital` VALUES (1, '15130118', '2018-04-08', 'erterterterte', 2);
INSERT INTO `outhospital` VALUES (2, '15130118', '2018-04-10', '是范德萨发放', 2);
INSERT INTO `outhospital` VALUES (3, '15130118', '2018-04-10', '是范德萨发放asdasdasdasda', 2);
INSERT INTO `outhospital` VALUES (4, '15130118', '2018-04-11', 'dasffads', 2);
INSERT INTO `outhospital` VALUES (5, '15130118', '2018-06-29', '黑乎乎', 2);
INSERT INTO `outhospital` VALUES (6, '15130118', '2018-06-29', '录酷交流交流', 2);

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `patient_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病人编号，主键',
  `resident_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号，唯一',
  `patient_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `patient_sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `patient_age` decimal(3, 0) NOT NULL COMMENT '年龄',
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '住址',
  `patient_ph` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `register_price` decimal(8, 2) NOT NULL COMMENT '挂号费',
  `in_time` date NOT NULL COMMENT '入院时间',
  `out_time` date NOT NULL COMMENT '出院时间',
  `host_ex` decimal(8, 2) NOT NULL COMMENT '住院费用',
  `doctor_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主治医生编号，外键',
  `bed_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病床编号，外键',
  PRIMARY KEY (`patient_id`) USING BTREE,
  UNIQUE INDEX `resident_id`(`resident_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `bed_id`(`bed_id`) USING BTREE,
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`bed_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('15130117', 'sadasdasss', 'LHFF', '男', 21, '4尔尕尔尕个人噶', '56942150', 100.00, '2018-04-03', '2018-04-03', 1000.00, '100101', '200101');
INSERT INTO `patient` VALUES ('15130118', 'sadasdas', 'LHFF', '男', 21, '4尔尕尔尕个人噶', '56942150', 100.00, '2018-04-03', '2018-04-03', 1000.00, '100101', '200102');

-- ----------------------------
-- Table structure for prescribe
-- ----------------------------
DROP TABLE IF EXISTS `prescribe`;
CREATE TABLE `prescribe`  (
  `prescribe_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处方编号，主键',
  `prescribe_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处方内容',
  `create_time` date NOT NULL COMMENT '开具时间',
  `treat_ex` decimal(8, 2) NOT NULL COMMENT '治疗费用',
  `doctor_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主治医生编号，外键',
  `patient_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病人编号，外键',
  PRIMARY KEY (`prescribe_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  CONSTRAINT `prescribe_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prescribe_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prescribe
-- ----------------------------
INSERT INTO `prescribe` VALUES ('201804031001', 'adadsadasdad沃尔沃二无', '2018-04-18', 100.00, '100101', '15130118');

-- ----------------------------
-- Table structure for register_doc
-- ----------------------------
DROP TABLE IF EXISTS `register_doc`;
CREATE TABLE `register_doc`  (
  `count_id` int(4) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doctor_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `submit_date` date NULL DEFAULT NULL,
  `stat` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`count_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `register_doc_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `register_doc_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of register_doc
-- ----------------------------
INSERT INTO `register_doc` VALUES (1, '15130118', '100101', '2018-04-04', 2);
INSERT INTO `register_doc` VALUES (2, '15130118', '100101', '2018-04-10', 1);
INSERT INTO `register_doc` VALUES (3, '15130118', '100101', '2018-04-10', 2);
INSERT INTO `register_doc` VALUES (4, '15130118', '100201', '2018-06-29', 0);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `report_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告编号，主键',
  `create_time` date NOT NULL COMMENT '报告日期',
  `report_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '报告内容',
  `report_ex` decimal(8, 2) NOT NULL COMMENT '检验费用',
  `department_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室编号，外键',
  `patient_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病人编号，外键',
  PRIMARY KEY (`report_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('201804032001', '2018-04-03', 'aes fsdf asf we waer wef', 199.45, '1001', '15130118');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('15130117', '15130117');
INSERT INTO `users` VALUES ('15130118', '15130118');

-- ----------------------------
-- Table structure for ward
-- ----------------------------
DROP TABLE IF EXISTS `ward`;
CREATE TABLE `ward`  (
  `ward_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病房编号，主键',
  `ward_nurse` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '护理护士姓名',
  `bed_num` decimal(2, 0) NOT NULL COMMENT '空闲床位数',
  `doctor_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值班医生编号，外键',
  PRIMARY KEY (`ward_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `ward_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ward
-- ----------------------------
INSERT INTO `ward` VALUES ('2001', 'lhf', 2, '100101');
INSERT INTO `ward` VALUES ('2002', 'lhf', 4, '100101');

-- ----------------------------
-- Table structure for ward_ex
-- ----------------------------
DROP TABLE IF EXISTS `ward_ex`;
CREATE TABLE `ward_ex`  (
  `count_id` int(4) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `submit_date` date NULL DEFAULT NULL,
  `o_bed_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bed_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stat` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`count_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `ward_ex_ibfk_2`(`bed_id`) USING BTREE,
  CONSTRAINT `ward_ex_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ward_ex_ibfk_2` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`bed_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ward_ex
-- ----------------------------
INSERT INTO `ward_ex` VALUES (1, '15130118', '2018-04-04', '200101', '200202', 1);
INSERT INTO `ward_ex` VALUES (2, '15130118', '2018-04-10', '200202', '200101', 2);
INSERT INTO `ward_ex` VALUES (3, '15130118', '2018-04-10', '200202', '200101', 1);
INSERT INTO `ward_ex` VALUES (4, '15130118', '2018-04-10', '200101', '200201', 1);
INSERT INTO `ward_ex` VALUES (5, '15130118', '2018-04-11', '200101', '200102', 2);

-- ----------------------------
-- Triggers structure for table bed
-- ----------------------------
DROP TRIGGER IF EXISTS `bed_in`;
delimiter ;;
CREATE TRIGGER `bed_in` AFTER UPDATE ON `bed` FOR EACH ROW BEGIN
UPDATE ward set bed_num=bed_num+new.bed_stat-old.bed_stat WHERE ward_id=old.ward_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table doctor
-- ----------------------------
DROP TRIGGER IF EXISTS `doctor_add`;
delimiter ;;
CREATE TRIGGER `doctor_add` AFTER INSERT ON `doctor` FOR EACH ROW BEGIN
INSERT INTO doctors
VALUES(new.doctor_id,new.doctor_id);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table outhospital
-- ----------------------------
DROP TRIGGER IF EXISTS `out_hospital`;
delimiter ;;
CREATE TRIGGER `out_hospital` AFTER UPDATE ON `outhospital` FOR EACH ROW BEGIN
IF new.stat=1 THEN
DELETE FROM users WHERE username=old.patient_id;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table patient
-- ----------------------------
DROP TRIGGER IF EXISTS `patient_in`;
delimiter ;;
CREATE TRIGGER `patient_in` AFTER INSERT ON `patient` FOR EACH ROW BEGIN
UPDATE bed SET bed_stat=0 WHERE bed_id=new.bed_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table patient
-- ----------------------------
DROP TRIGGER IF EXISTS `users_add`;
delimiter ;;
CREATE TRIGGER `users_add` AFTER INSERT ON `patient` FOR EACH ROW BEGIN
INSERT INTO users
VALUES(new.patient_id,new.patient_id);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table patient
-- ----------------------------
DROP TRIGGER IF EXISTS `bed_change`;
delimiter ;;
CREATE TRIGGER `bed_change` AFTER UPDATE ON `patient` FOR EACH ROW BEGIN
UPDATE bed SET bed.bed_stat=1 WHERE bed.bed_id=old.bed_id;
UPDATE bed SET bed.bed_stat=0 WHERE bed.bed_id=new.bed_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table patient
-- ----------------------------
DROP TRIGGER IF EXISTS `patient_out`;
delimiter ;;
CREATE TRIGGER `patient_out` AFTER DELETE ON `patient` FOR EACH ROW BEGIN
UPDATE bed SET bed_stat=1 WHERE bed_id=old.bed_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table patient
-- ----------------------------
DROP TRIGGER IF EXISTS `history_in`;
delimiter ;;
CREATE TRIGGER `history_in` AFTER DELETE ON `patient` FOR EACH ROW BEGIN
DECLARE doc_name varchar(30);
SET doc_name=(SELECT doctor_name FROM doctor WHERE doctor_id=old.doctor_id);
INSERT INTO history
VALUES(0,old.patient_name,old.resident_id,old.patient_sex,old.patient_age,old.patient_ph,old.in_time,old.out_time,doc_name,old.bed_id);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table patient
-- ----------------------------
DROP TRIGGER IF EXISTS `users_del`;
delimiter ;;
CREATE TRIGGER `users_del` AFTER DELETE ON `patient` FOR EACH ROW BEGIN
DELETE FROM users
WHERE username=old.patient_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ward
-- ----------------------------
DROP TRIGGER IF EXISTS `ward_add`;
delimiter ;;
CREATE TRIGGER `ward_add` AFTER INSERT ON `ward` FOR EACH ROW BEGIN
DECLARE room_num INT DEFAULT 1;
DECLARE room VARCHAR(6);
WHILE room_num<=new.bed_num DO
SET room=CONCAT(new.ward_id,'0',room_num);
INSERT INTO bed VALUES(room,1,new.ward_id);
SET room_num=room_num+1;
END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ward_ex
-- ----------------------------
DROP TRIGGER IF EXISTS `accept_change`;
delimiter ;;
CREATE TRIGGER `accept_change` AFTER UPDATE ON `ward_ex` FOR EACH ROW BEGIN
IF new.stat=1 THEN
UPDATE patient SET patient.bed_id=old.bed_id WHERE patient.patient_id=old.patient_id;
END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
