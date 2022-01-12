-- Created by Nisarga Jayaprakash and Nishitha M S Gowda
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `MOVIE` (
  `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `NAME` VARCHAR(200) NOT NULL UNIQUE,
  `RATING` DECIMAL(3, 1),
  `RELEASE` YEAR NOT NULL,
  `LANGUAGE` VARCHAR(50) NOT NULL,
  `DIRECTOR` VARCHAR(100) NOT NULL,
  `LOCATION` VARCHAR(100) NOT NULL,
  `RUNTIME` INT NOT NULL,
  `MPAA_RATING` INT(1),
  `BUDGET` DECIMAL(15,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `CELEBRITY` (
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`NAME` VARCHAR(100) NOT NULL UNIQUE,
	`GENDER` BIT DEFAULT NULL,
	`JOB_TITLES` VARCHAR(100) NOT NULL DEFAULT '',
	`BIO` TEXT(5000) NOT NULL,
  `BIRTH_LOC` VARCHAR(200) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS `ACTED_IN` (
	`CELEB_ID` INT NOT NULL,
	`MOVIE_ID` INT NOT NULL,
	`ROLE` VARCHAR(100) NOT NULL DEFAULT '',
    FOREIGN KEY (`MOVIE_ID`) REFERENCES `MOVIE`(`ID`),
	FOREIGN KEY (`CELEB_ID`) REFERENCES `CELEBRITY`(`ID`)
);

CREATE TABLE IF NOT EXISTS `SCREEN` (
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`NAME` VARCHAR(100) NOT NULL DEFAULT '',
	`LOCATION` VARCHAR(100) NOT NULL DEFAULT '',
	`SERVICES` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `SHOW` (
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`MOVIE_ID` INT NOT NULL,
	`SCREEN_ID` INT NOT NULL,
	`LANGUAGE` VARCHAR(100) NOT NULL DEFAULT '',
    FOREIGN KEY (`MOVIE_ID`) REFERENCES `MOVIE`(`ID`),
	FOREIGN KEY (`SCREEN_ID`) REFERENCES `SCREEN`(`ID`)
);

CREATE TABLE IF NOT EXISTS `SHOWTIME` (
	`SHOW_ID` INT NOT NULL,
	`TIME` DATETIME NOT NULL,
    FOREIGN KEY (`SHOW_ID`) REFERENCES `SHOW`(`ID`)
);

CREATE TABLE IF NOT EXISTS `STUDIO` (
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`NAME` VARCHAR(100) NOT NULL DEFAULT '',
	`HQ` VARCHAR(200) NOT NULL DEFAULT '',
	`CEO` VARCHAR(100) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS `PRODUCTION_CREW` (
	`CREW_NAME` VARCHAR(100) NOT NULL DEFAULT '',
	`JOB_DESCRIPTION` VARCHAR(1000) NOT NULL DEFAULT '' COMMENT 'Contains job done, equipment used and set worked on.'
);


INSERT INTO `MOVIE` VALUES(1, 'The Shallows', 6.3, 2016, 'English', 'Jaume Collet-Serra', 'USA', 86, 4, 18.5);
INSERT INTO `MOVIE` VALUES(2, 'Whiplash', 8.5, 2014, 'English', 'Damien Chazelle', 'USA', 106, 3, 3.3);
INSERT INTO `MOVIE` VALUES(3, 'Top Gun', 6.8, 1986, 'English', 'Tony Scott', 'USA', 110, 3, 15);
INSERT INTO `MOVIE` VALUES(4, 'The Terminal', 7.3, 2004, 'English', 'Steven Spielberg', 'USA', 86, 4, 18.5);
INSERT INTO `MOVIE` VALUES(5, 'The Last of the Mohicans', 7.8, 1992, 'French', 'Michael Mann', 'USA', 112, 3, 40);
INSERT INTO `MOVIE` VALUES(6, 'The Fifth Estate', 6.2, 2013, 'English', 'Bill Condon', 'United Kingdom', 128, 2, 28.5);
INSERT INTO `MOVIE` VALUES(7, 'Interstellar', 8.6, 2014, 'English', 'Christopher Nolan', 'USA', 169, 5, 165.5);
INSERT INTO `MOVIE` VALUES(8, 'Crocodile Dundee', 6.6, 1986, 'English', 'Peter Faiman', 'Australia', 104, 3, 8.5);
INSERT INTO `MOVIE` VALUES(9, 'Raiders of the Lost Ark', 8.5, 1981, 'English', 'Steven Spielberg', 'USA', 115, 4, 18.5);
INSERT INTO `MOVIE` VALUES(10, 'The Good, The Bad and the Ugly', 8.9, 1966, 'English', 'Sergio Leone', 'USA', 177, 5, 1.5);
INSERT INTO `MOVIE` VALUES(11, 'Good Will Hunting', 8.3, 1997, 'English', 'Gus Van-Sant', 'USA', 126, 4, 10.5);
INSERT INTO `MOVIE` VALUES(12, 'Die Hard', 8.2, 1988, 'English', 'John Mctiernan', 'USA', 132, 4, 28.5);

INSERT INTO `CELEBRITY` VALUES(1, 'Blake Lively', 1, 'Actor', 'Known for her role in Gossip Girl', 'USA');
INSERT INTO `CELEBRITY` VALUES(2, 'J.K. Simmons', 0, 'Actor', 'Actor and a Voice Actor', 'USA');
INSERT INTO `CELEBRITY` VALUES(3, 'Miles Teller', 0, 'Actor', 'Alumnus of New York University', 'USA');
INSERT INTO `CELEBRITY` VALUES(4, 'Tom Cruise', 0, 'Actor', 'Mostly credited in Action Movies', 'USA');
INSERT INTO `CELEBRITY` VALUES(5, 'Val Kilmer', 0, 'Actor', 'Also a stage Actor', 'USA');
INSERT INTO `CELEBRITY` VALUES(6, 'Tom Hanks', 0, 'Actor', 'Really Rich guy with a worth of 400 mil', 'USA');
INSERT INTO `CELEBRITY` VALUES(7, 'Catherine Zeta Jones', 1, 'Actor', 'Welsh Actress', 'United Kingdom');
INSERT INTO `CELEBRITY` VALUES(8, 'Daniel Day Lewis', 0, 'Actor', 'Retired ENglish Actor', 'United Kingdom');
INSERT INTO `CELEBRITY` VALUES(9, 'Benedict Cumberbatch', 0, 'Actor', 'Known for portrayal of Sherlock Holmes', 'United Kingdom');
INSERT INTO `CELEBRITY` VALUES(10, 'Daniel Bruhl', 0, 'Actor', 'Worked on German Soap Operas', 'Spain');
INSERT INTO `CELEBRITY` VALUES(11, 'Matthew McConaughey', 0, 'Actor', 'Actor and Producer', 'USA');
INSERT INTO `CELEBRITY` VALUES(12, 'Anne Hathaway', 1, 'Actor', 'Actress and Singer', 'USA');
INSERT INTO `CELEBRITY` VALUES(13, 'Michael Caine', 0, 'Actor', 'Appeared in more than 130 films and is also an author', 'United Kingdom');
INSERT INTO `CELEBRITY` VALUES(14, 'Paul Hogan', 0, 'Actor', 'Australian Comedian', 'Australia');
INSERT INTO `CELEBRITY` VALUES(15, 'Linda Kozlowski', 1, 'Actor', 'Former Actress', 'USA');
INSERT INTO `CELEBRITY` VALUES(16, 'Harrison Ford', 0, 'Actor', 'Known for his portrayal of Han Solo', 'USA');
INSERT INTO `CELEBRITY` VALUES(17, 'Karen Allen', 1, 'Actor', 'Stage Actress', 'USA');
INSERT INTO `CELEBRITY` VALUES(18, 'Clint Eastwood', 0, 'Actor', 'Famous for being Man With no Name', 'USA');
INSERT INTO `CELEBRITY` VALUES(19, 'Eli Wallach', 0, 'Actor', 'Acted in Western Movies', 'USA');
INSERT INTO `CELEBRITY` VALUES(20, 'Matt Damon', 0, 'Actor', 'One of the Most Bankable Stars', 'USA');
INSERT INTO `CELEBRITY` VALUES(21, 'Ben Affleck', 0, 'Actor', 'Actor, producer, screen writer', 'USA');
INSERT INTO `CELEBRITY` VALUES(22, 'Robin Williams', 0, 'Actor', 'Comedian', 'USA');
INSERT INTO `CELEBRITY` VALUES(23, 'Bruce Willis', 0, 'Actor', 'Actor, Producer and Singer', 'Germany');
INSERT INTO `CELEBRITY` VALUES(24, 'Alan Rickman', 0, 'Actor', 'Alumnus of Royal Academy of Dramatic Art', 'United Kingdom');
INSERT INTO `CELEBRITY` VALUES(25, 'Bonnie Bedelia', 1, 'Actor', 'Retired Actress', 'USA');
INSERT INTO `CELEBRITY` VALUES(26, 'Reginald ValJohnson', 0, 'Actor', 'Known for Cop Roles', 'USA');

INSERT INTO `ACTED_IN` VALUES(1,1,'Lead');
INSERT INTO `ACTED_IN` VALUES(2,2,'Antagonist');
INSERT INTO `ACTED_IN` VALUES(3,2,'Lead');
INSERT INTO `ACTED_IN` VALUES(4,3,'Lead');
INSERT INTO `ACTED_IN` VALUES(5,3,'Antagonist');
INSERT INTO `ACTED_IN` VALUES(6,4,'Lead');
INSERT INTO `ACTED_IN` VALUES(7,4,'Supporting');
INSERT INTO `ACTED_IN` VALUES(8,5,'Lead');
INSERT INTO `ACTED_IN` VALUES(9,6,'Antagonist');
INSERT INTO `ACTED_IN` VALUES(10,6,'Antagonist');
INSERT INTO `ACTED_IN` VALUES(11,7,'Lead');
INSERT INTO `ACTED_IN` VALUES(12,7,'Lead');
INSERT INTO `ACTED_IN` VALUES(13,7,'Supporting');
INSERT INTO `ACTED_IN` VALUES(14,8,'Lead');
INSERT INTO `ACTED_IN` VALUES(15,8,'Lead');
INSERT INTO `ACTED_IN` VALUES(16,9,'Lead');
INSERT INTO `ACTED_IN` VALUES(17,9,'Supporting');
INSERT INTO `ACTED_IN` VALUES(18,10,'Lead');
INSERT INTO `ACTED_IN` VALUES(19,10,'Antagonist');
INSERT INTO `ACTED_IN` VALUES(20,11,'Lead');
INSERT INTO `ACTED_IN` VALUES(21,11,'Lead');
INSERT INTO `ACTED_IN` VALUES(22,11,'Lead');
INSERT INTO `ACTED_IN` VALUES(23,12,'Lead');
INSERT INTO `ACTED_IN` VALUES(24,12,'Antagonist');
INSERT INTO `ACTED_IN` VALUES(25,12,'Supporting');
INSERT INTO `ACTED_IN` VALUES(26,12,'Supporting');

INSERT INTO `SCREEN` VALUES(1,'PVR','Forum Mall', 'Food, Drinks, Wi-Fi');
INSERT INTO `SCREEN` VALUES(2,'PVR','Orion Mall', 'Food, Drinks, Wi-Fi');
INSERT INTO `SCREEN` VALUES(3,'PVR','Vega City Mall', 'Food, Drinks, Wi-Fi');
INSERT INTO `SCREEN` VALUES(4,'IMAX','Forum Mall', 'Food, Drinks, Wi-Fi');
INSERT INTO `SCREEN` VALUES(5,'IMAX','Vega City Mall', 'Food, Drinks, Wi-Fi');
INSERT INTO `SCREEN` VALUES(6,'INOX','Garuda Mall', 'Food, Drinks, Wi-Fi');
INSERT INTO `SCREEN` VALUES(7,'INOX','Bangalore Central Mall', 'Food, Drinks');
INSERT INTO `SCREEN` VALUES(8,'INOX','Mantri Square Mall', 'Food, Drinks, Wi-Fi');
INSERT INTO `SCREEN` VALUES(9,'INOX','Garuda Swagath Mall', 'Food, Drinks');

INSERT INTO `SHOW` VALUES(1,1,1,'English');
INSERT INTO `SHOW` VALUES(2,8,1,'English');
INSERT INTO `SHOW` VALUES(3,7,1,'English');
INSERT INTO `SHOW` VALUES(4,4,2,'English');
INSERT INTO `SHOW` VALUES(5,1,2,'English');
INSERT INTO `SHOW` VALUES(6,5,2,'English');
INSERT INTO `SHOW` VALUES(7,9,3,'English');
INSERT INTO `SHOW` VALUES(8,6,3,'English');
INSERT INTO `SHOW` VALUES(9,2,3,'English');
INSERT INTO `SHOW` VALUES(10,12,4,'English');
INSERT INTO `SHOW` VALUES(11,1,4,'English');
INSERT INTO `SHOW` VALUES(12,7,4,'English');
INSERT INTO `SHOW` VALUES(13,2,5,'English');
INSERT INTO `SHOW` VALUES(14,6,5,'English');
INSERT INTO `SHOW` VALUES(15,11,5,'English');
INSERT INTO `SHOW` VALUES(16,5,6,'English');
INSERT INTO `SHOW` VALUES(17,6,6,'English');
INSERT INTO `SHOW` VALUES(18,7,6,'English');
INSERT INTO `SHOW` VALUES(19,9,7,'English');
INSERT INTO `SHOW` VALUES(20,8,7,'English');
INSERT INTO `SHOW` VALUES(21,12,7,'English');
INSERT INTO `SHOW` VALUES(22,8,8,'English');
INSERT INTO `SHOW` VALUES(23,5,8,'English');
INSERT INTO `SHOW` VALUES(24,6,8,'English');
INSERT INTO `SHOW` VALUES(25,6,9,'English');
INSERT INTO `SHOW` VALUES(26,9,9,'English');
INSERT INTO `SHOW` VALUES(27,11,9,'English');

INSERT INTO `SHOWTIME` VALUES(1,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(1,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(1,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(1,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(1,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(1,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(1,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(1,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(1,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(2,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(3,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(4,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(5,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(6,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(7,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(8,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(9,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(10,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(11,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(12,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(13,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(14,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(15,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(16,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(17,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(18,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(19,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(20,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(21,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(22,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(23,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(24,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(25,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(26,'2019-04-03 19:30:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-01 10:15:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-01 14:00:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-01 19:30:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-02 10:15:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-02 14:00:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-02 19:30:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-03 10:15:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-03 14:00:00');
INSERT INTO `SHOWTIME` VALUES(27,'2019-04-03 19:30:00');

INSERT INTO `STUDIO` VALUES(1, 'Warner Brothers', 'Burbank, CA', 'Kevin Tsujihara');
INSERT INTO `STUDIO` VALUES(2, 'Fox', 'Los Angeles, CA', 'Stacey Snider');
INSERT INTO `STUDIO` VALUES(3, 'Paramount Pictures', 'Hollywood, CA', 'Jim Gianopolous');
INSERT INTO `STUDIO` VALUES(4, 'Universal', 'Universal City, CA', 'Ronald Meyer');
INSERT INTO `STUDIO` VALUES(5, 'Sony', 'Culver City, CA', 'Tony Vinciquerra');
INSERT INTO `STUDIO` VALUES(6, 'Walt Disney Studios', 'Burbank, CA', 'Alan Bergman');

INSERT INTO `PRODUCTION_CREW` VALUES('Thorin', 'Crew Leader');
INSERT INTO `PRODUCTION_CREW` VALUES('Fili', 'Mic');
INSERT INTO `PRODUCTION_CREW` VALUES('Kili', 'Lights');
INSERT INTO `PRODUCTION_CREW` VALUES('Óin', 'Equipment');
INSERT INTO `PRODUCTION_CREW` VALUES('Glóin', 'Makeup');
INSERT INTO `PRODUCTION_CREW` VALUES('Balin', 'Sets');
INSERT INTO `PRODUCTION_CREW` VALUES('Dwalin', 'Green Screen');
INSERT INTO `PRODUCTION_CREW` VALUES('Ori', 'Refreshments');
INSERT INTO `PRODUCTION_CREW` VALUES('Dori', 'Makeup');
INSERT INTO `PRODUCTION_CREW` VALUES('Nori', 'Studio Assets');
INSERT INTO `PRODUCTION_CREW` VALUES('Bifur', 'Cameraman');
INSERT INTO `PRODUCTION_CREW` VALUES('Bofur', 'Lights');
INSERT INTO `PRODUCTION_CREW` VALUES('Bombur', 'Mic');
INSERT INTO `PRODUCTION_CREW` VALUES('Bilbo', 'Refreshments');
INSERT INTO `PRODUCTION_CREW` VALUES('Gandalf', 'Special Effects');
INSERT INTO `PRODUCTION_CREW` VALUES('Dave', 'Cameraman');
INSERT INTO `PRODUCTION_CREW` VALUES('Stuart', 'Mic');
INSERT INTO `PRODUCTION_CREW` VALUES('Bob', 'Lights');
INSERT INTO `PRODUCTION_CREW` VALUES('Kevin', 'Equipment');
INSERT INTO `PRODUCTION_CREW` VALUES('Jerry', 'Makeup');
INSERT INTO `PRODUCTION_CREW` VALUES('Mark', 'Sets');
INSERT INTO `PRODUCTION_CREW` VALUES('Phil', 'Green Screen');
INSERT INTO `PRODUCTION_CREW` VALUES('Carl', 'Refreshments');
INSERT INTO `PRODUCTION_CREW` VALUES('Josh', 'Makeup');
INSERT INTO `PRODUCTION_CREW` VALUES('Tim', 'Studio Assets');

UPDATE `MOVIE` SET `RATING` = 6.4 WHERE `ID` = 1;
UPDATE `MOVIE` SET `RATING` = 8.6 WHERE `ID` = 2;
UPDATE `MOVIE` SET `RATING` = 7.0 WHERE `ID` = 3;
UPDATE `MOVIE` SET `RATING` = 7.6 WHERE `ID` = 4;
UPDATE `MOVIE` SET `RATING` = 8.0 WHERE `ID` = 5;
UPDATE `MOVIE` SET `RATING` = 6.1 WHERE `ID` = 6;
UPDATE `MOVIE` SET `RATING` = 8.5 WHERE `ID` = 7;
UPDATE `MOVIE` SET `RATING` = 6.8 WHERE `ID` = 8;
UPDATE `MOVIE` SET `RATING` = 8.6 WHERE `ID` = 9;
UPDATE `MOVIE` SET `RATING` = 8.8 WHERE `ID` = 10;
UPDATE `MOVIE` SET `RATING` = 8.3 WHERE `ID` = 11;
UPDATE `MOVIE` SET `RATING` = 9.9 WHERE `ID` = 12;
