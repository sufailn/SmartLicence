/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.1.32-community : Database - smartlicense
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smartlicense` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `smartlicense`;

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) DEFAULT NULL,
  `complaint` varchar(300) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `replay` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

/*Table structure for table `licence_registration` */

DROP TABLE IF EXISTS `licence_registration`;

CREATE TABLE `licence_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Licence_No` varchar(15) NOT NULL,
  `Authorization_To_Drive` varchar(6) NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Date_of_Issue` date NOT NULL,
  `validity` date NOT NULL,
  `Blood_Group` varchar(5) NOT NULL,
  `relation` varchar(30) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(30) NOT NULL,
  `Permanent_Address` varchar(50) NOT NULL,
  `Present_Address` varchar(50) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `qr` varchar(250) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `adharnumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `licence_registration` */

insert  into `licence_registration`(`id`,`Name`,`Licence_No`,`Authorization_To_Drive`,`Phone`,`Email`,`Date_of_Issue`,`validity`,`Blood_Group`,`relation`,`DOB`,`Gender`,`Permanent_Address`,`Present_Address`,`photo`,`qr`,`status`,`adharnumber`) values 
(1,'ravi','9834556677','LMV',9562026070,'sidh@gmail.com','2023-04-23','0202-12-23','o +ve','rajan','2020-03-12','Male','pattayil house\r\nkadalundi nagaram post\r\n673314\r\n','pattayil house\r\nkadalundi nagaram post\r\n673314','aa.jpg','1.png','blocked','3245667788'),
(2,'shameer','Kl124433421','LMV',9072388838,'shameer@gmail.com','2005-05-20','2025-05-20','o +ve','shamsu','2001-07-20','Male','kunnath house feroke','kunnath house feroke','download.jpg','2.png','pending','3245667788');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` varchar(20) DEFAULT NULL,
  `adhar_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`usertype`,`adhar_number`) values 
(1,'admin','admin@123*','admin','0000000'),
(2,'trycodeanaswara@gmail.com','qwerty@123Q','traffic','3245667788');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(50) DEFAULT NULL,
  `licence_number` varchar(50) DEFAULT NULL,
  `Date` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notification` */

/*Table structure for table `traffic_reg` */

DROP TABLE IF EXISTS `traffic_reg`;

CREATE TABLE `traffic_reg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Badge_Number` varchar(25) NOT NULL,
  `Gender` varchar(250) NOT NULL,
  `DOB` date NOT NULL,
  `Profile_Photo` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `loginid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `traffic_reg` */

insert  into `traffic_reg`(`id`,`Name`,`Badge_Number`,`Gender`,`DOB`,`Profile_Photo`,`email`,`loginid`) values 
(1,'Vijila Vk','2345','Female','1999-03-12','vdo.jpg','trycodeanaswara@gmail.com',2);

/*Table structure for table `vechiclestatus` */

DROP TABLE IF EXISTS `vechiclestatus`;

CREATE TABLE `vechiclestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_number` varchar(50) DEFAULT NULL,
  `Licence_Number` varchar(50) DEFAULT NULL,
  `speed` varchar(50) DEFAULT NULL,
  `alcohol` varchar(50) DEFAULT NULL,
  `latitude` bigint(20) DEFAULT NULL,
  `longitude` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `vechiclestatus` */

insert  into `vechiclestatus`(`id`,`Vehicle_number`,`Licence_Number`,`speed`,`alcohol`,`latitude`,`longitude`,`date`,`time`) values 
(1,'KL1234','LNO2345','80','NO',11,12,'2024-04-17','00:00:12'),
(2,'KL3456','LNO4567','50','YES',11,12,'2024-04-19','00:00:11');

/*Table structure for table `vehicle_registration` */

DROP TABLE IF EXISTS `vehicle_registration`;

CREATE TABLE `vehicle_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Registration_number` varchar(20) NOT NULL,
  `Brief_discription` varchar(50) NOT NULL,
  `Address` text NOT NULL,
  `Makers_Name` varchar(20) NOT NULL,
  `Name_of_Regd_Owner` varchar(25) NOT NULL,
  `relation` varchar(25) NOT NULL,
  `Temporary_address` text NOT NULL,
  `Class_of_vechicle` varchar(20) NOT NULL,
  `Makers_Classification` varchar(20) NOT NULL,
  `Type_of_body` varchar(10) NOT NULL,
  `Chassis_Number` varchar(30) NOT NULL,
  `Engine_Number` bigint(30) NOT NULL,
  `Fuel` varchar(20) NOT NULL,
  `Colour` varchar(20) NOT NULL,
  `Month_of_Manufacture` varchar(15) NOT NULL,
  `Year_of_Manufacture` int(15) NOT NULL,
  `Horse_Power` int(15) NOT NULL,
  `Weight` varchar(56) NOT NULL,
  `Number_of_cilinders` int(10) NOT NULL,
  `Seating_Capacity` int(10) NOT NULL,
  `Tax_licence_No` varchar(15) NOT NULL,
  `Date_of_Delivery` date NOT NULL,
  `licnum` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `adharnumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `vehicle_registration` */

insert  into `vehicle_registration`(`id`,`Registration_number`,`Brief_discription`,`Address`,`Makers_Name`,`Name_of_Regd_Owner`,`relation`,`Temporary_address`,`Class_of_vechicle`,`Makers_Classification`,`Type_of_body`,`Chassis_Number`,`Engine_Number`,`Fuel`,`Colour`,`Month_of_Manufacture`,`Year_of_Manufacture`,`Horse_Power`,`Weight`,`Number_of_cilinders`,`Seating_Capacity`,`Tax_licence_No`,`Date_of_Delivery`,`licnum`,`email`,`status`,`adharnumber`) values 
(1,'kl54367','maruthi','pattayil house\r\nkadalundi nagaram post\r\n673314','maruthi','sreejith','kuttan p','pattayil house\r\nkadalundi nagaram post\r\n673314','A','abc','silver','6',4,'petrol','white','2023-02-23',2015,2,'500 kg',2,5,'TNO12345','2022-02-23','LNO23456','sreejith@gmail.com','pending','3245667788'),
(2,'KL 85 2812','black 110 cc scooter','Kunnath house feroke','Honda','shameer pv','Shamsu','Kunnath house feroke','MWOG','Honda1','solo','kb66389',2234,'petrol','black','2024-03-22',2024,8,'100',1,2,'TNO12345','2024-05-10','Kl124433421','shameer@gmail.com','pending','3245667788');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
