CREATE SCHEMA `serials_catalog` DEFAULT CHARACTER SET utf8;
USE `serials_catalog`;

CREATE TABLE `crew_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `film_crew_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producer` int NOT NULL,
  `director` int NOT NULL,
  `operator` int NOT NULL,
  `crowd` int DEFAULT NULL,
  `makeup` int DEFAULT NULL,
  `special_effects` int DEFAULT NULL,
  FOREIGN KEY (`producer`)        REFERENCES `crew_members` (`id`),
  FOREIGN KEY (`director`)        REFERENCES `crew_members` (`id`),
  FOREIGN KEY (`operator`)        REFERENCES `crew_members` (`id`),
  FOREIGN KEY (`crowd`)           REFERENCES `crew_members` (`id`),
  FOREIGN KEY (`makeup`)          REFERENCES `crew_members` (`id`),
  FOREIGN KEY (`special_effects`) REFERENCES `crew_members` (`id`),
  PRIMARY KEY (`id`)
);

CREATE TABLE `shows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `release_date` date NOT NULL,
  `annotation` varchar(1000) DEFAULT NULL,
  `film_crew_members` int UNIQUE NOT NULL,
  FOREIGN KEY (`film_crew_members`) REFERENCES `film_crew_members` (`id`),
  PRIMARY KEY (`id`)
);

CREATE TABLE `actors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `birth_date` varchar(50) NOT NULL,
  `biography` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `fractions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `biography` varchar(1000) DEFAULT NULL,
  `is_negative` bool DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `seasons` (
  `number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `show` int NOT NULL,
  FOREIGN KEY (`show`) REFERENCES `shows` (`id`),
  PRIMARY KEY (`number`)
);

CREATE TABLE `episodes` (
  `number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `season` int NOT NULL,
  FOREIGN KEY (`season`) REFERENCES `seasons` (`number`),
  PRIMARY KEY (`number`)
);

CREATE TABLE `story_arcs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `season` int NOT NULL,
  FOREIGN KEY (`season`) REFERENCES `seasons` (`number`),
  PRIMARY KEY (`id`)
);

CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `story_arc` int NOT NULL,
  `location` int DEFAULT NULL,
  FOREIGN KEY (`story_arc`) REFERENCES `story_arcs` (`id`),
  FOREIGN KEY (`location`)  REFERENCES `locations` (`id`),
  PRIMARY KEY (`id`)
);

CREATE TABLE `characters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `biography` varchar(1000) DEFAULT NULL,
  `fraction` int DEFAULT NULL,
  `event` int NOT NULL,
  FOREIGN KEY (`fraction`) REFERENCES `fractions` (`id`),
  FOREIGN KEY (`event`)    REFERENCES `events` (`id`),
  PRIMARY KEY (`id`)
);

CREATE TABLE `types_of_actors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voise_actor` int DEFAULT NULL,
  `actor` int NOT NULL,
  `motion_capture_actor` int DEFAULT NULL,
  `character` int NOT NULL,
  FOREIGN KEY (`voise_actor`) 		   REFERENCES `actors` (`id`),
  FOREIGN KEY (`actor`)                REFERENCES `actors` (`id`),
  FOREIGN KEY (`motion_capture_actor`) REFERENCES `actors` (`id`),
  FOREIGN KEY (`character`)            REFERENCES `characters` (`id`),
  PRIMARY KEY (`id`)
);

/* ALTER and UPDATE */
alter table `actors` modify `biography` varchar(1000);
alter table `actors` modify birth_date date;
alter table `types_of_actors` change voise_actor voice_actor int;
alter table `locations` add index `index` (`name`);
alter table `locations` drop index `index`;
alter table `types_of_actors` add constraint `blabla` foreign key (`character`) references `characters` (`id`);
alter table `types_of_actors` drop foreign key `blabla`;
update `locations` set `name` = 'Misty walley' where `id` = 1; 
update `events` set `name` = 'Battle of dolt', `description` = 'труляля' where id = 1;
alter table `locations` add column `etc.` varchar(500) default null;
alter table `locations` drop column `etc.`;

/* INSERT */
INSERT INTO `locations` (`name`) VALUES ('Бамбуковый лес');
INSERT INTO `locations` (`name`) VALUES ('Хоп хей лалалей');
INSERT INTO `actors` (`full_name`, `birth_date`, `biography`) VALUES ('Джеки Чан', '2000-10-5', 'Родился, сыграл миллион ролей и переломал все кости');
INSERT INTO `crew_members` (`name`, `birth_date`) VALUES ('Жора красава', '1900-05-05');
INSERT INTO `film_crew_members` (`producer`, `director`, `operator`) VALUES (1, 1, 1);
INSERT INTO `shows` (`name`, `release_date`, `film_crew_members`) VALUES ('Chernobyle', '1900-05-05', 1);
INSERT INTO `seasons` (`name`, `show`) VALUES ('bla', 1);
INSERT INTO `story_arcs` (`name`, `description`, `season`) VALUES ('Golden age', 'something stupid blablabla...', 1);
INSERT INTO `events` (`name`, `description`, `story_arc`, `location`) VALUES ('Битва бастардов', 'кишки и кровища', 1, 1);
INSERT INTO `characters` (`name`, `photo`, `biography`, `event`) VALUES ('Вася Пупкин', '../привет/блабла.пнг', 'Жил долго и счастливо', 1);
INSERT INTO `types_of_actors` (`voice_actor`, `actor`, `motion_capture_actor`, `character`) VALUES (1, 1, 1, 1);


/* RENAME */
rename table `types_of_actors` to types_offfff_actors;
rename table `types_offfff_actors` to types_of_actors;

/* DROP */
drop table `types_of_actors`;
drop database `serials_catalog`;

