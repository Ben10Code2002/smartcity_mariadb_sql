-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.7.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for smartcity
CREATE DATABASE IF NOT EXISTS `smartcity` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `smartcity`;

-- Dumping structure for table smartcity.central_management
CREATE TABLE IF NOT EXISTS `central_management` (
  `Department_ID` int(11) NOT NULL,
  `Department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.central_management: ~5 rows (approximately)
INSERT INTO `central_management` (`Department_ID`, `Department_name`) VALUES
	(1, 'Road Development Authority'),
	(2, 'Drainage Management'),
	(3, 'Waste Management'),
	(4, 'HR Department'),
	(6, 'Urban Planning Division');

-- Dumping structure for table smartcity.complainer
CREATE TABLE IF NOT EXISTS `complainer` (
  `Complaint_ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Contact_Number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Complaint_ID`),
  CONSTRAINT `complainer_ibfk_1` FOREIGN KEY (`Complaint_ID`) REFERENCES `customer_care_complaints` (`Complaint_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.complainer: ~6 rows (approximately)
INSERT INTO `complainer` (`Complaint_ID`, `Name`, `Contact_Number`) VALUES
	(5001, 'Sunil Bandara', '0771111001'),
	(5002, 'Kamala Rodrigo', '0772222002'),
	(5003, 'Updated Name 1', '0773333003'),
	(5004, 'Priyani Dissanayake', '0774444004'),
	(5005, 'Mahinda Rathnayake', '0777777777');

-- Dumping structure for table smartcity.customer_care_complaints
CREATE TABLE IF NOT EXISTS `customer_care_complaints` (
  `Complaint_ID` int(11) NOT NULL,
  `Complaint_Type` enum('drainage','road','waste') NOT NULL,
  `Complaint_Description` text DEFAULT NULL,
  `Status` enum('Pending','Resolved','In-progress') NOT NULL,
  `Date_Lodged` date DEFAULT NULL,
  `Got_SupervisorID` varchar(11) NOT NULL,
  PRIMARY KEY (`Complaint_ID`),
  KEY `Got_SupervisorID` (`Got_SupervisorID`),
  CONSTRAINT `customer_care_complaints_ibfk_1` FOREIGN KEY (`Got_SupervisorID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.customer_care_complaints: ~5 rows (approximately)
INSERT INTO `customer_care_complaints` (`Complaint_ID`, `Complaint_Type`, `Complaint_Description`, `Status`, `Date_Lodged`, `Got_SupervisorID`) VALUES
	(5001, 'road', 'Pothole on Galle Road near Bambalapitiya causing traffic jam', 'Resolved', '2024-01-05', 'S001'),
	(5002, 'drainage', 'Blocked drainage canal in Wellawatte during monsoon', 'Resolved', '2024-01-10', 'S006'),
	(5003, 'waste', 'Missed garbage collection in Katunayake for three days', 'Resolved', '2024-01-15', 'S003'),
	(5004, 'road', 'Broken street lamp on Kandy Road near Kadawatha junction', 'Resolved', '2024-01-08', 'S002'),
	(5005, 'drainage', 'Updated drainage issue report', 'In-progress', '2024-01-12', 'S007');

-- Dumping structure for table smartcity.drainage_management
CREATE TABLE IF NOT EXISTS `drainage_management` (
  `Drain_ID` int(11) NOT NULL,
  `Area` varchar(100) NOT NULL,
  `Length_Of_Drainage` decimal(10,2) DEFAULT NULL,
  `Last_Cleaned_Date` date DEFAULT NULL,
  `Supervisor_ID` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Drain_ID`),
  KEY `Supervisor_ID` (`Supervisor_ID`),
  CONSTRAINT `drainage_management_ibfk_1` FOREIGN KEY (`Supervisor_ID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.drainage_management: ~5 rows (approximately)
INSERT INTO `drainage_management` (`Drain_ID`, `Area`, `Length_Of_Drainage`, `Last_Cleaned_Date`, `Supervisor_ID`) VALUES
	(4001, 'Beira Lake Area', 3500.00, '2024-01-15', 'S006'),
	(4002, 'Updated Beira Lake', 1800.75, '2023-12-20', 'S006'),
	(4003, 'Kelani River Drainage', 3200.25, '2024-01-08', 'S007'),
	(4004, 'Kirillapone Drainage', 1950.00, '2024-01-25', 'S007'),
	(4005, 'Pettah Market Drainage', 2100.30, '2024-01-12', 'S008');

-- Dumping structure for table smartcity.emergency_contact
CREATE TABLE IF NOT EXISTS `emergency_contact` (
  `Employee_ID` varchar(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Relationship` varchar(50) DEFAULT NULL,
  `Contact_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `emergency_contact_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.emergency_contact: ~5 rows (approximately)
INSERT INTO `emergency_contact` (`Employee_ID`, `Name`, `Relationship`, `Contact_number`) VALUES
	('L001', 'Sunil Silva', 'Husband', '0710000000'),
	('L002', 'Updated Spouse', 'Mother', '0713456789'),
	('L003', 'Sujatha Rajapaksa', 'Wife', '0715678901'),
	('S001', 'Malika Perera', 'Wife', '0711234567'),
	('S002', 'Arjuna Jayawardena', 'Father', '0714567890');

-- Dumping structure for table smartcity.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `Employee_ID` varchar(11) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Contact_number` varchar(20) DEFAULT NULL,
  `Assigned_department` varchar(25) NOT NULL,
  `Team_ID` int(11) DEFAULT NULL,
  `Supervisor_ID` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Employee_ID` (`Employee_ID`,`Email`),
  KEY `Team_ID` (`Team_ID`),
  KEY `Supervisor_ID` (`Supervisor_ID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `teams` (`Team_ID`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`Supervisor_ID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.employees: ~18 rows (approximately)
INSERT INTO `employees` (`Employee_ID`, `First_name`, `Last_name`, `Email`, `Contact_number`, `Assigned_department`, `Team_ID`, `Supervisor_ID`) VALUES
	('L001', 'Nadeeka', 'Silva', 'nadeeka.silva@smartcity.lk', '0772345678', 'Drainage Management', 102, 'S001'),
	('L002', 'Roshan', 'Fernando', 'roshan.fernando@smartcity.lk', '0773456789', 'Wastage Management', 103, 'S001'),
	('L003', 'Dinesh', 'Rajapaksa', 'dinesh.rajapaksa@smartcity.lk', '0775678901', 'Drainage Management', 105, 'S002'),
	('L004', 'Chamila', 'Wickramasinghe', 'chamila.wickramasinghe@smartcity.lk', '0776789012', 'HR Department', 106, 'S001'),
	('L005', 'Chamath', 'Perera', 'chamath.perera@smartcity.lk', '0779998888', 'Wastage Management', 103, 'S003'),
	('L006', 'Dilani', 'Fernando', 'dilani.updated@smartcity.lk', '0778899001', 'Wastage Management', 106, 'S004'),
	('L007', 'Kavindu', 'Bandara', 'kavindu.bandara@smartcity.lk', '0779900112', 'Wastage Management', 106, 'S005'),
	('L008', 'Sajith', 'Weerasinghe', 'sajith.weerasinghe@smartcity.lk', '0771234321', 'Drainage Management', 105, 'S006'),
	('L009', 'Ramesh', 'Gunawardena', 'ramesh.gunawardena@smartcity.lk', '0772345432', 'Drainage Management', 102, 'S007'),
	('S001', 'Kasun', 'Perera', 'kasun.perera.updated@smartcity.lk', '0771234999', 'Road Development', 101, NULL),
	('S002', 'Priyanka', 'Jayawardena', 'priyanka.jayawardena@smartcity.lk', '0774567890', 'Road Development', 104, 'S001'),
	('S003', 'Manoj', 'Senanayake', 'manoj.senanayake@smartcity.lk', '0771122334', 'Wastage Management', 103, NULL),
	('S004', 'Shanika', 'Herath', 'shanika.herath@smartcity.lk', '0772233445', 'Wastage Management', 106, NULL),
	('S005', 'Ruwan', 'Jayalath', 'ruwan.jayalath@smartcity.lk', '0773344556', 'Wastage Management', 106, NULL),
	('S006', 'Nirmala', 'Wijesinghe', 'nirmala.wijesinghe@smartcity.lk', '0774455667', 'Drainage Management', 105, NULL),
	('S007', 'Tharindu', 'Amarasinghe', 'tharindu.amarasinghe@smartcity.lk', '0775566778', 'Drainage Management', 102, NULL),
	('S008', 'Ishara', 'Gunarathne', 'ishara.gunarathne@smartcity.lk', '0776677889', 'Drainage Management', 102, NULL);

-- Dumping structure for table smartcity.hr_department
CREATE TABLE IF NOT EXISTS `hr_department` (
  `Division_ID` int(11) NOT NULL,
  `Division_name` varchar(100) NOT NULL,
  `Division_head` varchar(100) NOT NULL,
  PRIMARY KEY (`Division_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.hr_department: ~5 rows (approximately)
INSERT INTO `hr_department` (`Division_ID`, `Division_name`, `Division_head`) VALUES
	(1, 'Personnel Management Division', 'Updated Head 1'),
	(2, 'Training and Development Division', 'Kumari Perera'),
	(3, 'Employee Relations Division', 'Chaminda Silva'),
	(4, 'Recruitment Division', 'Nimal Fernando'),
	(5, 'Updated Payroll Division', 'Pradeep Jayawardena');

-- Dumping structure for view smartcity.roadsupervisors
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `roadsupervisors` (
	`Employee_ID` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`First_name` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Last_name` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci'
) ENGINE=MyISAM;

-- Dumping structure for table smartcity.road_development
CREATE TABLE IF NOT EXISTS `road_development` (
  `Road_ID` int(11) NOT NULL,
  `Road_name` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Road_type` varchar(50) NOT NULL,
  `Construction_date` date DEFAULT NULL,
  `Last_Maintained_date` date DEFAULT NULL,
  `Status` enum('planned','ongoing','completed','needs maintenance') NOT NULL,
  `Supervisor_ID` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Road_ID`),
  KEY `Supervisor_ID` (`Supervisor_ID`),
  CONSTRAINT `road_development_ibfk_1` FOREIGN KEY (`Supervisor_ID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.road_development: ~6 rows (approximately)
INSERT INTO `road_development` (`Road_ID`, `Road_name`, `Location`, `Road_type`, `Construction_date`, `Last_Maintained_date`, `Status`, `Supervisor_ID`) VALUES
	(2001, 'Galle Road', 'CMB South', 'A-Grade', '2023-03-15', '2024-01-10', 'completed', 'S001'),
	(2002, 'Kandy Road', 'CMB North', 'B-Grade', '2023-06-20', '2023-12-05', 'needs maintenance', 'S001'),
	(2003, 'E01 Expressway', 'CMB West', 'Expressway', '2024-01-08', '2024-01-25', 'completed', 'S002'),
	(2004, 'Jayanthi Mawatha', 'Colombo North', 'C-Grade', '2023-09-12', '2024-02-14', 'completed', 'S002'),
	(2005, 'Highlevel Road', 'CMB South', 'B-Grade', '2024-02-01', NULL, 'planned', 'S001'),
	(2006, 'First Cross Street', 'CMB Central', 'B-Grade', '2023-11-30', '2024-01-20', 'completed', 'S002');

-- Dumping structure for table smartcity.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `Team_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Status` enum('free','work') NOT NULL,
  `Assigned_department` enum('Drainage','Road','Waste') NOT NULL,
  PRIMARY KEY (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.teams: ~6 rows (approximately)
INSERT INTO `teams` (`Team_ID`, `Name`, `Status`, `Assigned_department`) VALUES
	(101, 'CMB East Road', 'free', 'Road'),
	(102, 'Updated Kandy Drainage Team', 'free', 'Drainage'),
	(103, 'CMB South Waste', 'free', 'Waste'),
	(104, 'CMB Central Road', 'free', 'Road'),
	(105, 'CMB North Drainage', 'work', 'Drainage'),
	(106, 'CMB Central Waste', 'free', 'Waste');

-- Dumping structure for table smartcity.team_membership
CREATE TABLE IF NOT EXISTS `team_membership` (
  `Team_ID` int(11) NOT NULL,
  `Employee_ID` varchar(11) NOT NULL,
  PRIMARY KEY (`Team_ID`,`Employee_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `team_membership_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `teams` (`Team_ID`),
  CONSTRAINT `team_membership_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.team_membership: ~6 rows (approximately)
INSERT INTO `team_membership` (`Team_ID`, `Employee_ID`) VALUES
	(102, 'L001'),
	(103, 'L002'),
	(105, 'L003'),
	(101, 'S001'),
	(104, 'S002');

-- Dumping structure for table smartcity.waste_management
CREATE TABLE IF NOT EXISTS `waste_management` (
  `Zone_ID` int(11) NOT NULL,
  `Area_Covered` varchar(100) NOT NULL,
  `Frequency_of_collection` varchar(50) DEFAULT NULL,
  `Collection_days` varchar(50) DEFAULT NULL,
  `Vehicle_ID` varchar(50) DEFAULT NULL,
  `Supervisor_ID` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Zone_ID`),
  KEY `Supervisor_ID` (`Supervisor_ID`),
  CONSTRAINT `waste_management_ibfk_1` FOREIGN KEY (`Supervisor_ID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table smartcity.waste_management: ~6 rows (approximately)
INSERT INTO `waste_management` (`Zone_ID`, `Area_Covered`, `Frequency_of_collection`, `Collection_days`, `Vehicle_ID`, `Supervisor_ID`) VALUES
	(3001, 'Fort Area, Colombo Municipal Council', 'Daily', 'Monday-Sunday', 'CMC-001', 'S003'),
	(3002, 'Dehiwala-Mount Lavinia, Colombo Municipal Council', 'Alternate Days', 'Mon,Wed,Fri', 'DMC-002', 'S003'),
	(3003, 'Katunayake Industrial Zone, Colombo Municipal Council', 'Daily', 'Monday-Saturday', 'IND-003', 'S004'),
	(3004, 'Nugegoda Residential, Colombo Municipal Council', 'Alternate Days', 'Tue,Thu,Sat', 'SJC-004', 'S004'),
	(3005, 'Bambalapitiya Commercial, Colombo Municipal Council', 'Daily', 'Monday-Friday', 'CMC-005', 'S005'),
	(3006, 'Viharamahadevi Park, Colombo Municipal Council', 'Weekly', 'Sunday', 'CMC-006', 'S005');

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `roadsupervisors`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `roadsupervisors` AS SELECT Employee_ID, First_name, Last_name FROM Employees WHERE Assigned_department = 'Road Development' 
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
