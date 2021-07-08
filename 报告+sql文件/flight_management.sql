/*
 Navicat Premium Data Transfer

 Source Server         : mysql3308
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3308
 Source Schema         : flight_management

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 19/06/2021 19:35:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill_table
-- ----------------------------
DROP TABLE IF EXISTS `bill_table`;
CREATE TABLE `bill_table`  (
  `U_ID` int(11) NULL DEFAULT NULL,
  `F_ID` int(11) NULL DEFAULT NULL,
  `S_ID` int(11) NULL DEFAULT NULL,
  `S_PRICE` int(11) NULL DEFAULT NULL,
  `OP` int(11) NULL DEFAULT NULL,
  INDEX `B_FK_F_ID`(`F_ID`) USING BTREE,
  INDEX `B_FK_U_ID`(`U_ID`) USING BTREE,
  CONSTRAINT `B_FK_F_ID` FOREIGN KEY (`F_ID`) REFERENCES `flight_table` (`F_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `B_FK_U_ID` FOREIGN KEY (`U_ID`) REFERENCES `user_table` (`U_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill_table
-- ----------------------------
INSERT INTO `bill_table` VALUES (2, 7, 3, 360, 0);
INSERT INTO `bill_table` VALUES (2, 8, 1, 300, 0);
INSERT INTO `bill_table` VALUES (2, 7, 3, 360, 1);
INSERT INTO `bill_table` VALUES (3, 2, 1, 340, 0);
INSERT INTO `bill_table` VALUES (3, 2, 1, 340, 1);
INSERT INTO `bill_table` VALUES (3, 7, 1, 360, 0);
INSERT INTO `bill_table` VALUES (3, 7, 2, 360, 0);
INSERT INTO `bill_table` VALUES (3, 7, 3, 360, 0);
INSERT INTO `bill_table` VALUES (3, 7, 4, 360, 0);
INSERT INTO `bill_table` VALUES (3, 7, 5, 360, 0);
INSERT INTO `bill_table` VALUES (3, 2, 1, 340, 0);
INSERT INTO `bill_table` VALUES (3, 7, 1, 360, 1);
INSERT INTO `bill_table` VALUES (3, 7, 2, 360, 1);
INSERT INTO `bill_table` VALUES (3, 7, 3, 360, 1);
INSERT INTO `bill_table` VALUES (3, 7, 4, 360, 1);
INSERT INTO `bill_table` VALUES (3, 7, 5, 360, 1);
INSERT INTO `bill_table` VALUES (3, 2, 1, 340, 1);
INSERT INTO `bill_table` VALUES (3, 2, 1, 340, 0);
INSERT INTO `bill_table` VALUES (3, 12, 1, 1000, 0);
INSERT INTO `bill_table` VALUES (3, 7, 1, 360, 0);
INSERT INTO `bill_table` VALUES (3, 2, 1, 340, 1);
INSERT INTO `bill_table` VALUES (3, 12, 2, 1000, 0);
INSERT INTO `bill_table` VALUES (3, 12, 3, 1000, 0);
INSERT INTO `bill_table` VALUES (3, 13, 1, 1000, 0);
INSERT INTO `bill_table` VALUES (3, 12, 1, 1000, 1);
INSERT INTO `bill_table` VALUES (3, 13, 1, 1000, 1);

-- ----------------------------
-- Table structure for flight_reserve_table
-- ----------------------------
DROP TABLE IF EXISTS `flight_reserve_table`;
CREATE TABLE `flight_reserve_table`  (
  `T_ID` int(11) NOT NULL AUTO_INCREMENT,
  `U_ID` int(11) NULL DEFAULT NULL,
  `F_ID` int(11) NULL DEFAULT NULL,
  `S_ID` int(11) NULL DEFAULT NULL,
  `S_PRICE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`T_ID`) USING BTREE,
  INDEX `FR_FK_F_ID`(`F_ID`) USING BTREE,
  INDEX `FR_FK_U_ID`(`U_ID`) USING BTREE,
  CONSTRAINT `FR_FK_F_ID` FOREIGN KEY (`F_ID`) REFERENCES `flight_table` (`F_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FR_FK_U_ID` FOREIGN KEY (`U_ID`) REFERENCES `user_table` (`U_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight_reserve_table
-- ----------------------------
INSERT INTO `flight_reserve_table` VALUES (3, 2, 8, 1, 300);
INSERT INTO `flight_reserve_table` VALUES (13, 3, 7, 1, 360);
INSERT INTO `flight_reserve_table` VALUES (14, 3, 12, 2, 1000);
INSERT INTO `flight_reserve_table` VALUES (15, 3, 12, 3, 1000);

-- ----------------------------
-- Table structure for flight_table
-- ----------------------------
DROP TABLE IF EXISTS `flight_table`;
CREATE TABLE `flight_table`  (
  `F_ID` int(11) NOT NULL AUTO_INCREMENT,
  `F_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_TIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRICE` int(11) NULL DEFAULT NULL,
  `CAPACITY` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight_table
-- ----------------------------
INSERT INTO `flight_table` VALUES (1, 'Boeing 747', '2021-06-13 14:11:00', '2021-06-13 21:20:00', '北京', '上海', 450, 20);
INSERT INTO `flight_table` VALUES (2, 'Airbus A380', '2021-06-13 13:30:00', '2021-06-13 20:30:00', '北京', '上海', 340, 5);
INSERT INTO `flight_table` VALUES (3, 'Airbus A380', '2021-06-13 17:30:00', '2021-06-13 23:30:00', '北京', '上海', 340, 5);
INSERT INTO `flight_table` VALUES (4, 'Y20', '2021-06-13 14:00:00', '2021-06-13 21:00:00', '北京', '上海', 360, 10);
INSERT INTO `flight_table` VALUES (5, 'Boeing 767', '2021-06-14 07:10:00', '2021-06-14 16:00:00', '北京', '广州', 800, 15);
INSERT INTO `flight_table` VALUES (6, 'Boeing 747', '2021-06-14 12:00:00', '2021-06-14 21:00:00', '北京', '广州', 820, 20);
INSERT INTO `flight_table` VALUES (7, 'Boeing 747', '2021-06-20 15:30:00', '2021-06-20 21:00:00', '武汉', '北京', 360, 20);
INSERT INTO `flight_table` VALUES (8, 'Y20', '2021-06-20 16:00:00', '2021-06-20 21:00:00', '武汉', '北京', 300, 10);
INSERT INTO `flight_table` VALUES (12, 'Boeing 747', '2021-06-17 10:10:00', '2021-06-17 15:20:00', '长沙', '北京', 1000, 20);
INSERT INTO `flight_table` VALUES (13, 'Boeing 747', '2021-06-17 12:10:00', '2021-06-17 15:20:00', '武汉', '北京', 1000, 20);
INSERT INTO `flight_table` VALUES (14, 'Y20', '2021-06-19 14:00:00', '2021-06-18 10:00:00', '武汉', '北京', 500, 10);

-- ----------------------------
-- Table structure for notification_table
-- ----------------------------
DROP TABLE IF EXISTS `notification_table`;
CREATE TABLE `notification_table`  (
  `U_ID` int(11) NULL DEFAULT NULL,
  `F_ID` int(11) NULL DEFAULT NULL,
  `S_ID` int(11) NULL DEFAULT NULL,
  `S_PRICE` int(11) NULL DEFAULT NULL,
  `S_TIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `L_TIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  INDEX `N_FK_F_ID`(`F_ID`) USING BTREE,
  INDEX `N_FK_U_ID`(`U_ID`) USING BTREE,
  CONSTRAINT `N_FK_F_ID` FOREIGN KEY (`F_ID`) REFERENCES `flight_table` (`F_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `N_FK_U_ID` FOREIGN KEY (`U_ID`) REFERENCES `user_table` (`U_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification_table
-- ----------------------------
INSERT INTO `notification_table` VALUES (2, 8, 1, 300, NULL, NULL);
INSERT INTO `notification_table` VALUES (3, 7, 1, 360, NULL, NULL);

-- ----------------------------
-- Table structure for seat_table
-- ----------------------------
DROP TABLE IF EXISTS `seat_table`;
CREATE TABLE `seat_table`  (
  `F_ID` int(11) NULL DEFAULT NULL,
  `S_ID` int(11) NULL DEFAULT NULL,
  `S_STATUS` int(11) NULL DEFAULT NULL,
  INDEX `S_FK_F_ID`(`F_ID`) USING BTREE,
  CONSTRAINT `S_FK_F_ID` FOREIGN KEY (`F_ID`) REFERENCES `flight_table` (`F_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat_table
-- ----------------------------
INSERT INTO `seat_table` VALUES (1, 1, 0);
INSERT INTO `seat_table` VALUES (1, 2, 0);
INSERT INTO `seat_table` VALUES (1, 3, 0);
INSERT INTO `seat_table` VALUES (1, 4, 0);
INSERT INTO `seat_table` VALUES (1, 5, 0);
INSERT INTO `seat_table` VALUES (1, 6, 0);
INSERT INTO `seat_table` VALUES (1, 7, 0);
INSERT INTO `seat_table` VALUES (1, 8, 0);
INSERT INTO `seat_table` VALUES (1, 9, 0);
INSERT INTO `seat_table` VALUES (1, 10, 0);
INSERT INTO `seat_table` VALUES (1, 11, 0);
INSERT INTO `seat_table` VALUES (1, 12, 0);
INSERT INTO `seat_table` VALUES (1, 13, 0);
INSERT INTO `seat_table` VALUES (1, 14, 0);
INSERT INTO `seat_table` VALUES (1, 15, 0);
INSERT INTO `seat_table` VALUES (1, 16, 0);
INSERT INTO `seat_table` VALUES (1, 17, 0);
INSERT INTO `seat_table` VALUES (1, 18, 0);
INSERT INTO `seat_table` VALUES (1, 19, 0);
INSERT INTO `seat_table` VALUES (1, 20, 0);
INSERT INTO `seat_table` VALUES (2, 1, 0);
INSERT INTO `seat_table` VALUES (2, 2, 0);
INSERT INTO `seat_table` VALUES (2, 3, 0);
INSERT INTO `seat_table` VALUES (2, 4, 0);
INSERT INTO `seat_table` VALUES (2, 5, 0);
INSERT INTO `seat_table` VALUES (3, 1, 0);
INSERT INTO `seat_table` VALUES (3, 2, 0);
INSERT INTO `seat_table` VALUES (3, 3, 0);
INSERT INTO `seat_table` VALUES (3, 4, 0);
INSERT INTO `seat_table` VALUES (3, 5, 0);
INSERT INTO `seat_table` VALUES (4, 1, 0);
INSERT INTO `seat_table` VALUES (4, 2, 0);
INSERT INTO `seat_table` VALUES (4, 3, 0);
INSERT INTO `seat_table` VALUES (4, 4, 0);
INSERT INTO `seat_table` VALUES (4, 5, 0);
INSERT INTO `seat_table` VALUES (4, 6, 0);
INSERT INTO `seat_table` VALUES (4, 7, 0);
INSERT INTO `seat_table` VALUES (4, 8, 0);
INSERT INTO `seat_table` VALUES (4, 9, 0);
INSERT INTO `seat_table` VALUES (4, 10, 0);
INSERT INTO `seat_table` VALUES (5, 1, 0);
INSERT INTO `seat_table` VALUES (5, 2, 0);
INSERT INTO `seat_table` VALUES (5, 3, 0);
INSERT INTO `seat_table` VALUES (5, 4, 0);
INSERT INTO `seat_table` VALUES (5, 5, 0);
INSERT INTO `seat_table` VALUES (5, 6, 0);
INSERT INTO `seat_table` VALUES (5, 7, 0);
INSERT INTO `seat_table` VALUES (5, 8, 0);
INSERT INTO `seat_table` VALUES (5, 9, 0);
INSERT INTO `seat_table` VALUES (5, 10, 0);
INSERT INTO `seat_table` VALUES (5, 11, 0);
INSERT INTO `seat_table` VALUES (5, 12, 0);
INSERT INTO `seat_table` VALUES (5, 13, 0);
INSERT INTO `seat_table` VALUES (5, 14, 0);
INSERT INTO `seat_table` VALUES (5, 15, 0);
INSERT INTO `seat_table` VALUES (6, 1, 0);
INSERT INTO `seat_table` VALUES (6, 2, 0);
INSERT INTO `seat_table` VALUES (6, 3, 0);
INSERT INTO `seat_table` VALUES (6, 4, 0);
INSERT INTO `seat_table` VALUES (6, 5, 0);
INSERT INTO `seat_table` VALUES (6, 6, 0);
INSERT INTO `seat_table` VALUES (6, 7, 0);
INSERT INTO `seat_table` VALUES (6, 8, 0);
INSERT INTO `seat_table` VALUES (6, 9, 0);
INSERT INTO `seat_table` VALUES (6, 10, 0);
INSERT INTO `seat_table` VALUES (6, 11, 0);
INSERT INTO `seat_table` VALUES (6, 12, 0);
INSERT INTO `seat_table` VALUES (6, 13, 0);
INSERT INTO `seat_table` VALUES (6, 14, 0);
INSERT INTO `seat_table` VALUES (6, 15, 0);
INSERT INTO `seat_table` VALUES (6, 16, 0);
INSERT INTO `seat_table` VALUES (6, 17, 0);
INSERT INTO `seat_table` VALUES (6, 18, 0);
INSERT INTO `seat_table` VALUES (6, 19, 0);
INSERT INTO `seat_table` VALUES (6, 20, 0);
INSERT INTO `seat_table` VALUES (7, 1, 1);
INSERT INTO `seat_table` VALUES (7, 2, 0);
INSERT INTO `seat_table` VALUES (7, 3, 0);
INSERT INTO `seat_table` VALUES (7, 4, 0);
INSERT INTO `seat_table` VALUES (7, 5, 0);
INSERT INTO `seat_table` VALUES (7, 6, 0);
INSERT INTO `seat_table` VALUES (7, 7, 0);
INSERT INTO `seat_table` VALUES (7, 8, 0);
INSERT INTO `seat_table` VALUES (7, 9, 0);
INSERT INTO `seat_table` VALUES (7, 10, 0);
INSERT INTO `seat_table` VALUES (7, 11, 0);
INSERT INTO `seat_table` VALUES (7, 12, 0);
INSERT INTO `seat_table` VALUES (7, 13, 0);
INSERT INTO `seat_table` VALUES (7, 14, 0);
INSERT INTO `seat_table` VALUES (7, 15, 0);
INSERT INTO `seat_table` VALUES (7, 16, 0);
INSERT INTO `seat_table` VALUES (7, 17, 0);
INSERT INTO `seat_table` VALUES (7, 18, 0);
INSERT INTO `seat_table` VALUES (7, 19, 0);
INSERT INTO `seat_table` VALUES (7, 20, 0);
INSERT INTO `seat_table` VALUES (8, 1, 1);
INSERT INTO `seat_table` VALUES (8, 2, 0);
INSERT INTO `seat_table` VALUES (8, 3, 0);
INSERT INTO `seat_table` VALUES (8, 4, 0);
INSERT INTO `seat_table` VALUES (8, 5, 0);
INSERT INTO `seat_table` VALUES (8, 6, 0);
INSERT INTO `seat_table` VALUES (8, 7, 0);
INSERT INTO `seat_table` VALUES (8, 8, 0);
INSERT INTO `seat_table` VALUES (8, 9, 0);
INSERT INTO `seat_table` VALUES (8, 10, 0);
INSERT INTO `seat_table` VALUES (12, 1, 0);
INSERT INTO `seat_table` VALUES (12, 2, 1);
INSERT INTO `seat_table` VALUES (12, 3, 1);
INSERT INTO `seat_table` VALUES (12, 4, 0);
INSERT INTO `seat_table` VALUES (12, 5, 0);
INSERT INTO `seat_table` VALUES (12, 6, 0);
INSERT INTO `seat_table` VALUES (12, 7, 0);
INSERT INTO `seat_table` VALUES (12, 8, 0);
INSERT INTO `seat_table` VALUES (12, 9, 0);
INSERT INTO `seat_table` VALUES (12, 10, 0);
INSERT INTO `seat_table` VALUES (12, 11, 0);
INSERT INTO `seat_table` VALUES (12, 12, 0);
INSERT INTO `seat_table` VALUES (12, 13, 0);
INSERT INTO `seat_table` VALUES (12, 14, 0);
INSERT INTO `seat_table` VALUES (12, 15, 0);
INSERT INTO `seat_table` VALUES (12, 16, 0);
INSERT INTO `seat_table` VALUES (12, 17, 0);
INSERT INTO `seat_table` VALUES (12, 18, 0);
INSERT INTO `seat_table` VALUES (12, 19, 0);
INSERT INTO `seat_table` VALUES (12, 20, 0);
INSERT INTO `seat_table` VALUES (13, 1, 0);
INSERT INTO `seat_table` VALUES (13, 2, 0);
INSERT INTO `seat_table` VALUES (13, 3, 0);
INSERT INTO `seat_table` VALUES (13, 4, 0);
INSERT INTO `seat_table` VALUES (13, 5, 0);
INSERT INTO `seat_table` VALUES (13, 6, 0);
INSERT INTO `seat_table` VALUES (13, 7, 0);
INSERT INTO `seat_table` VALUES (13, 8, 0);
INSERT INTO `seat_table` VALUES (13, 9, 0);
INSERT INTO `seat_table` VALUES (13, 10, 0);
INSERT INTO `seat_table` VALUES (13, 11, 0);
INSERT INTO `seat_table` VALUES (13, 12, 0);
INSERT INTO `seat_table` VALUES (13, 13, 0);
INSERT INTO `seat_table` VALUES (13, 14, 0);
INSERT INTO `seat_table` VALUES (13, 15, 0);
INSERT INTO `seat_table` VALUES (13, 16, 0);
INSERT INTO `seat_table` VALUES (13, 17, 0);
INSERT INTO `seat_table` VALUES (13, 18, 0);
INSERT INTO `seat_table` VALUES (13, 19, 0);
INSERT INTO `seat_table` VALUES (13, 20, 0);
INSERT INTO `seat_table` VALUES (14, 1, 0);
INSERT INTO `seat_table` VALUES (14, 2, 0);
INSERT INTO `seat_table` VALUES (14, 3, 0);
INSERT INTO `seat_table` VALUES (14, 4, 0);
INSERT INTO `seat_table` VALUES (14, 5, 0);
INSERT INTO `seat_table` VALUES (14, 6, 0);
INSERT INTO `seat_table` VALUES (14, 7, 0);
INSERT INTO `seat_table` VALUES (14, 8, 0);
INSERT INTO `seat_table` VALUES (14, 9, 0);
INSERT INTO `seat_table` VALUES (14, 10, 0);

-- ----------------------------
-- Table structure for user_table
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table`  (
  `U_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `U_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ID_CARD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `U_TYPE` int(11) NOT NULL,
  PRIMARY KEY (`U_ID`) USING BTREE,
  UNIQUE INDEX `U_CK_USERNAME`(`USERNAME`) USING BTREE,
  UNIQUE INDEX `U_CK_ID_CARD`(`ID_CARD`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_table
-- ----------------------------
INSERT INTO `user_table` VALUES (1, 'root', 'root', '超级管理员', '123456', 1);
INSERT INTO `user_table` VALUES (2, 'a', 'aa', '王五', '123457', 1);
INSERT INTO `user_table` VALUES (3, 'b', 'bb', '李四', '123', 0);

-- ----------------------------
-- Procedure structure for add_new_seats
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_new_seats`;
delimiter ;;
CREATE PROCEDURE `add_new_seats`(IN flightid INT(11), IN capacity INT(11))
BEGIN 
DECLARE num INT(11);
SET num=1;
WHILE num<capacity+1 DO
INSERT INTO `seat_table` VALUES(flightid,num,0);
SET num=num+1;
END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for boot_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `boot_insert`;
delimiter ;;
CREATE PROCEDURE `boot_insert`(IN userid INT(11),IN flightid INT(11),IN seatid INT(11),IN PRICE INT(11))
BEGIN    
 DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING ROLLBACK ;
 START TRANSACTION;
		UPDATE `seat_table` SET `S_STATUS` = 1
		WHERE `F_ID` = flightid and `S_ID` =seatid;
	  INSERT INTO `flight_reserve_table`(`U_ID`, `F_ID` , `S_ID` , `S_PRICE` )VALUES(userid,flightid,seatid,price);
		INSERT INTO `notification_table` (`U_ID`,`F_ID`,`S_ID`,`S_PRICE`)VALUES(userid,flightid,seatid,price);
		INSERT INTO `bill_table` VALUES(userid,flightid,seatid,price,0);
		COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_boot
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_boot`;
delimiter ;;
CREATE PROCEDURE `delete_boot`(IN Reserveid INT(11),IN Userid INT(11), IN Flightid INT(11), IN Seatid INT(11), IN Price INT(11))
BEGIN 
 DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING ROLLBACK ;
 START TRANSACTION;
UPDATE `seat_table`  SET `S_STATUS`  = 0 WHERE `F_ID`  = Flightid and `S_ID`  = Seatid;
DELETE FROM `flight_reserve_table`  WHERE `T_ID`  = Reserveid;
DELETE FROM `notification_table` WHERE `F_ID` = Flightid and `S_ID` = Seatid; 
INSERT INTO `bill_table` VALUES (Userid, Flightid, Seatid, Price, 1); 
COMMIT;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
