-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: cs336.ctrr9ro7iyao.us-east-2.rds.amazonaws.com    Database: cs336
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `Account_No` varchar(12) NOT NULL DEFAULT '',
  `ID_No` varchar(12) DEFAULT NULL,
  `Acc_Date` date DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Account_No`),
  KEY `Account_ibfk_1` (`ID_No`),
  CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`ID_No`) REFERENCES `Customer` (`ID_No`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aircrafts`
--

DROP TABLE IF EXISTS `Aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aircrafts` (
  `Aircraft_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Aircraft_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Airline`
--

DROP TABLE IF EXISTS `Airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airline` (
  `Airline_ID` char(2) NOT NULL DEFAULT '',
  `Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Airline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airport` (
  `Airport_ID` char(3) NOT NULL DEFAULT '',
  `Name` varchar(40) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Airport_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Credit_Card`
--

DROP TABLE IF EXISTS `Credit_Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Credit_Card` (
  `Card_No` varchar(16) NOT NULL DEFAULT '',
  `Type` varchar(15) DEFAULT NULL,
  `Billing_Address` varchar(50) DEFAULT NULL,
  `First_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `expire` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Card_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `ID_No` varchar(12) NOT NULL DEFAULT '',
  `Meal_Preference` varchar(10) DEFAULT NULL,
  `Seating_Preference` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Emp_CustomerRep`
--

DROP TABLE IF EXISTS `Emp_CustomerRep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Emp_CustomerRep` (
  `ID` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  CONSTRAINT `Emp_CustomerRep_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Person` (`ID_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Emp_Manager`
--

DROP TABLE IF EXISTS `Emp_Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Emp_Manager` (
  `ID` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  CONSTRAINT `Emp_Manager_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Person` (`ID_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `ID_No` varchar(12) NOT NULL DEFAULT '',
  `password` varchar(20) DEFAULT NULL,
  `SSN` char(9) DEFAULT NULL,
  `Hourly_Rate` double DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  PRIMARY KEY (`ID_No`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`ID_No`) REFERENCES `Person` (`ID_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight` (
  `Airline_ID` char(2) NOT NULL DEFAULT '',
  `Flight_No` char(4) NOT NULL DEFAULT '',
  `depAirID` char(3) DEFAULT NULL,
  `arrAirID` char(3) DEFAULT NULL,
  `depDate` date NOT NULL DEFAULT '0000-00-00',
  `depTime` time DEFAULT '00:00:00',
  `arrTime` time DEFAULT '00:00:00',
  `arrDate` date DEFAULT '0000-00-00',
  `Num_Seats` int(11) DEFAULT NULL,
  `Fare` double DEFAULT NULL,
  `First_Fare` int(11) DEFAULT NULL,
  `Aircraft` varchar(30) DEFAULT NULL,
  `Num_Stops` int(11) DEFAULT NULL,
  PRIMARY KEY (`Airline_ID`,`Flight_No`,`depDate`),
  KEY `From_Airport_ID` (`depAirID`),
  KEY `To_Airport_ID` (`arrAirID`),
  CONSTRAINT `Flight_ibfk_1` FOREIGN KEY (`Airline_ID`) REFERENCES `Airline` (`Airline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Leg`
--

DROP TABLE IF EXISTS `Leg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Leg` (
  `Departure_Date_Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Res_No` char(8) NOT NULL DEFAULT '',
  `Airline_ID` char(2) DEFAULT NULL,
  `Flight_Number` char(4) DEFAULT NULL,
  `From_Airport_ID` char(3) DEFAULT NULL,
  `To_Airport_ID` char(3) DEFAULT NULL,
  PRIMARY KEY (`Departure_Date_Time`,`Res_No`),
  KEY `Res_No` (`Res_No`),
  KEY `From_Airport_ID` (`From_Airport_ID`),
  KEY `To_Airport_ID` (`To_Airport_ID`),
  KEY `Leg_ibfk_2_idx` (`Airline_ID`,`Flight_Number`),
  CONSTRAINT `Leg_ibfk_1` FOREIGN KEY (`Res_No`) REFERENCES `Reservation` (`Res_No`),
  CONSTRAINT `Leg_ibfk_2` FOREIGN KEY (`Airline_ID`, `Flight_Number`) REFERENCES `Flight` (`Airline_ID`, `Flight_No`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Leg_ibfk_3` FOREIGN KEY (`From_Airport_ID`) REFERENCES `Airport` (`Airport_ID`),
  CONSTRAINT `Leg_ibfk_4` FOREIGN KEY (`To_Airport_ID`) REFERENCES `Airport` (`Airport_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `resNo` char(8) NOT NULL DEFAULT '',
  `firstName` varchar(20) NOT NULL DEFAULT '',
  `lastName` varchar(20) NOT NULL DEFAULT '',
  `mealPref` varchar(10) DEFAULT NULL,
  `seatPref` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`resNo`,`firstName`,`lastName`),
  CONSTRAINT `Passenger_ibfk_1` FOREIGN KEY (`resNo`) REFERENCES `Reservation` (`Res_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `ID_No` varchar(12) NOT NULL DEFAULT '',
  `First_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip_Code` char(5) DEFAULT NULL,
  `Telephone_No` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `Res_No` char(8) NOT NULL DEFAULT '',
  `Account_No` varchar(12) DEFAULT NULL,
  `CR_ID` varchar(5) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Total_Fare` double DEFAULT NULL,
  `Booking_Fee` double DEFAULT NULL,
  `class` varchar(30) DEFAULT NULL,
  `Waiting_List` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Res_No`),
  KEY `Reservation_ibfk_1` (`CR_ID`),
  KEY `Reservation_ibfk_2` (`Account_No`),
  CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`Account_No`) REFERENCES `Account` (`Account_No`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-11 22:30:28
