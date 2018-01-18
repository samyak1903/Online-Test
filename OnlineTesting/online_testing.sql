-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.41


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema online_testing
--

CREATE DATABASE IF NOT EXISTS online_testing;
USE online_testing;

--
-- Definition of table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams` (
  `ExamName` varchar(40) NOT NULL,
  `Description` varchar(500) NOT NULL,
  PRIMARY KEY (`ExamName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` (`ExamName`,`Description`) VALUES 
 ('.Net','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('Android','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('C & Data Structures','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('IT Fundamentals','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('Java','This exam will test you knowledge about Java concepts.'),
 ('Networking','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('Operating System','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('Oracle','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('Perl','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('PHP','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('Python','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.'),
 ('Web Technologies','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, ut viverra velit eros at augue. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.');
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;


--
-- Definition of table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TestId` int(10) unsigned NOT NULL,
  `QuestionText` varchar(300) NOT NULL,
  `OptionA` varchar(100) NOT NULL,
  `OptionB` varchar(100) NOT NULL,
  `OptionC` varchar(100) NOT NULL,
  `OptionD` varchar(100) NOT NULL,
  `CorrectOption` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`Id`,`TestId`,`QuestionText`,`OptionA`,`OptionB`,`OptionC`,`OptionD`,`CorrectOption`) VALUES 
 (1,1,'Which language is connected with the term WORA','Java','C#','VB.Net','VC++','A'),
 (2,1,'Which of the following is not an RDBMS?','SAP','Derby','SQLite','Sybase','A'),
 (3,1,'Who is the CEO of Microsoft?','Bill Gates','Satya Nadella','Larry Ellison','Steve Jobs','B'),
 (4,1,'Which of the following is not a Mobile Platform?','Android','Symbian','iOS','Azure','D'),
 (5,1,'The IP Address in IPv6 consists of ____ Bytes','6','8','12','16','D'),
 (6,1,'The Base 10 number 65535 is represented in Hexadecimal as','0xFF','0xFFF','0xFFFF','0xFFFFF','C'),
 (7,1,'Which of the following disk drive does not have moving parts','IDE','SCSI','SATA','Solid State','D'),
 (8,1,'The complement of 1  (i.e. ~1) will result in','0','-1','-2','65534','C'),
 (9,1,'Android is','Language','Platform','Script','Database','B'),
 (10,1,'Which of the following in not a Box technique for software testing','Black Box','Grey Box','Blue Box','White Box','C'),
 (11,3,'JDBC stands for','Java Database Connection','Java Database Connectivity','Java Database Correlation','Java Database Catalyst','B');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;


--
-- Definition of table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(40) NOT NULL,
  `ExamName` varchar(40) NOT NULL,
  `TestName` varchar(40) NOT NULL,
  `DateOfExam` date NOT NULL,
  `Score` double NOT NULL,
  `Result` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` (`Id`,`UserName`,`ExamName`,`TestName`,`DateOfExam`,`Score`,`Result`) VALUES 
 (2,'alok','Java','Core Java','2015-04-29',90,'PASS'),
 (3,'alok','Java','Core Java','2015-04-29',80,'PASS'),
 (1,'alok','IT Fundamentals','Number System','2015-04-15',75,'PASS');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;


--
-- Definition of table `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ExamName` varchar(45) NOT NULL,
  `TestName` varchar(45) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `NumberOfQuestions` int(10) unsigned NOT NULL,
  `PassPercentage` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tests`
--

/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` (`Id`,`ExamName`,`TestName`,`Description`,`NumberOfQuestions`,`PassPercentage`) VALUES 
 (1,'Java','Core Java','This is a Java Test',10,60),
 (2,'Java','SWING','This is a Java Test',10,60),
 (3,'Java','JDBC','This is a Java Test',10,60),
 (4,'Java','J2EE','This is a Java Test',10,60),
 (5,'Java','Socket Programming','This is a Java Test',10,60),
 (6,'Java','EJB','This test will evaluate your knowledge about Enterprise Java Beans.',20,65),
 (7,'IT Fundamentals','Number System','This will test your knowledge about binary,octal,hex number system',20,80),
 (8,'IT Fundamentals','Computer Basics','Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus',20,85);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `RoleName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `SecretQuestion` varchar(200) NOT NULL,
  `Answer` varchar(100) NOT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`UserName`,`Password`,`RoleName`,`Email`,`Name`,`SecretQuestion`,`Answer`) VALUES 
 ('alok','*6691484EA6B50DDDE1926A220DA01FA9E575C18A','Member','alok_bisth@gmail.com','Alok Bisht','Favourite Movie','Lagaan'),
 ('nagendra','*6691484EA6B50DDDE1926A220DA01FA9E575C18A','Admin','ndhagarra@gmail.com','Nagendra Dhagarra','Favourite Food','Rajma');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
