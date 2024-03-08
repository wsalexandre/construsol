/*
SQLyog Enterprise v8.71 
MySQL - 11.2.0-MariaDB : Database - construsol
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`construsol` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `construsol`;

/*Table structure for table `produto` */

DROP TABLE IF EXISTS `produto`;

CREATE TABLE `produto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `preco` decimal(13,3) DEFAULT 0.000,
  `categoria` int(11) DEFAULT NULL,
  `estoque` decimal(13,3) DEFAULT 0.000,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `produto` */

insert  into `produto`(`ID`,`nome`,`preco`,`categoria`,`estoque`) values (1,'teste giva','56.000',3,'10.000'),(2,'cimento','45.000',2,'50.000');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `pswd` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`ID`,`nome`,`pswd`) values (1,'admin','81dc9bdb52d04dc20036dbd8313ed055');

/*Table structure for table `vendadetail` */

DROP TABLE IF EXISTS `vendadetail`;

CREATE TABLE `vendadetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `vendaID` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `quantidade` decimal(13,3) DEFAULT NULL,
  `valor` decimal(13,2) DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `cancelado` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `vendadetail` */

insert  into `vendadetail`(`ID`,`vendaID`,`produto`,`data`,`quantidade`,`valor`,`total`,`cancelado`) values (1,0,1,'2024-03-08','10.000','56.00','560.00','0');

/*Table structure for table `vendamaster` */

DROP TABLE IF EXISTS `vendamaster`;

CREATE TABLE `vendamaster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCliente` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `cancelado` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `vendamaster` */

insert  into `vendamaster`(`ID`,`codigoCliente`,`data`,`total`,`cancelado`) values (5,1,'2024-03-08','0.00','0'),(6,1,'2024-03-08','0.00','0'),(7,1,'2024-03-08','0.00','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
