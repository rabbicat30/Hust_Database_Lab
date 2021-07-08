SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `user_table`;
DROP TABLE IF EXISTS `flight_table`;
DROP TABLE IF EXISTS `seat_table`;
DROP TABLE IF EXISTS `notification_table`;
DROP TABLE IF EXISTS `bill_table`;
DROP TABLE IF EXISTS `flight_reserve_table`;


CREATE TABLE `user_table` (
  `U_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_bin NOT NULL,
  `U_NAME` varchar(255) COLLATE utf8_bin ,
  `ID_CARD` varchar(255) COLLATE utf8_bin ,
  `U_TYPE` int(11) ,
  PRIMARY KEY (`U_ID`),
  UNIQUE KEY `U_CK_USERNAME` (`USERNAME`),
  UNIQUE KEY `U_CK_ID_CARD` (`ID_CARD`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `user_table` VALUES('1','root','root','超级管理员','123456','1');
INSERT INTO `user_table`VALUES('2','a','a','张三','123457','0');


CREATE TABLE `flight_table` (
  `F_ID` int(11) NOT NULL AUTO_INCREMENT,
  `F_NAME` varchar(255) COLLATE utf8_bin,
  `START_TIME` varchar(255) COLLATE utf8_bin,
  `END_TIME` varchar(255) COLLATE utf8_bin ,
  `START_CITY` varchar(255) COLLATE utf8_bin ,
  `END_CITY` varchar(255) COLLATE utf8_bin,
  `PRICE` int(11) ,
  `CAPACITY` int(11),
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `flight_table` VALUES('1','Boeing 747','2021-06-13 14:11:00','2021-06-13 21:20:00','北京','上海','450','20');
INSERT INTO `flight_table`VALUES('2','Airbus A380','2021-06-13 13:30:00','2021-06-13 20:30:00','北京','上海','340','5');
INSERT INTO `flight_table`VALUES('3','Airbus A380','2021-06-13 17:30:00','2021-06-13 23:30:00','北京','上海','340','5');
INSERT INTO `flight_table`VALUES('4','Y20','2021-06-13 14:00:00','2021-06-13 21:00:00','北京','上海','360','10');
INSERT INTO `flight_table`VALUES('5','Boeing 767','2021-06-14 07:10:00','2021-06-14 16:00:00','北京','广州','800','15');
INSERT INTO `flight_table`VALUES('6','Boeing 747','2021-06-14 12:00:00','2021-06-14 21:00:00','北京','广州','820','20');
INSERT INTO `flight_table`VALUES('7','Boeing 747','2021-06-20 15:30:00','2021-06-20 21:00:00','武汉','北京','360','20');
INSERT INTO `flight_table`VALUES('8','Y20','2021-06-20 16:00:00','2021-06-20 21:00:00','武汉','北京','300','10');
INSERT INTO `flight_table`VALUES('9','Y20','2021-06-20 17:00:00','2021-06-20 22:00:00','武汉','北京','300','10');


CREATE TABLE `seat_table` (
  `F_ID` int(11)  ,
  `S_ID` int(11) ,
  `S_STATUS` int(11),
  CONSTRAINT `S_FK_F_ID` FOREIGN KEY(F_ID) REFERENCES `flight_table`(`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `notification_table` (
  `U_ID` int(11) ,
  `F_ID` int(11) ,
  `S_ID` int(11),
  `S_PRICE` int(11),
  `S_TIME` varchar(255) COLLATE utf8_bin ,
  `L_TIME` varchar(255) COLLATE utf8_bin,
  CONSTRAINT `N_FK_F_ID` FOREIGN KEY(`F_ID`) REFERENCES `flight_table`(`F_ID`),
  CONSTRAINT `N_FK_U_ID` FOREIGN KEY(`U_ID`) REFERENCES `user_table`(`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



CREATE TABLE `bill_table` (
  `U_ID` int(11) ,
  `F_ID` int(11) ,
  `S_ID` int(11) ,
  `S_PRICE`int(11) ,
  `OP` int(5) ,
  CONSTRAINT `B_FK_F_ID` FOREIGN KEY(`F_ID`) REFERENCES `flight_table`(`F_ID`),
  CONSTRAINT `B_FK_U_ID` FOREIGN KEY(`U_ID`) REFERENCES `user_table`(`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




CREATE TABLE `flight_reserve_table` (
  `T_ID` int(11) AUTO_INCREMENT NOT NULL,
  `U_ID` int(11) , 
  `F_ID` int(11) ,
  `S_ID` int(11) ,
  `S_PRICE` int(11) ,
  PRIMARY KEY (`T_ID`),
  CONSTRAINT `FR_FK_F_ID` FOREIGN KEY(`F_ID`) REFERENCES `flight_table`(`F_ID`),
  CONSTRAINT `FR_FK_U_ID` FOREIGN KEY(`U_ID`) REFERENCES `user_table`(`U_ID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

