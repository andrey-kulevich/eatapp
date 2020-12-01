------------------------------ Запросы по функциональным требованиям -----------------------------

--Транзакционные:

--1.	Добавить пользователя
INSERT 
INTO `user` (`name`, `age`, `gender`, `preferences`, `status`, `role`, `login`, `password`) 
VALUES ('Андрюша Пикапер 228', '15', '0', '9', 'все сложно', '2', 'demo', '123');

--2.	Создавать публичные и персональные приглашения 

--публичное
INSERT 
INTO `invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) 
VALUES ('2020-11-10 20:20:21', 1, 1, 14, 'хей детка пошли хавать :З', 1, 0);

--персональное
INSERT 
INTO `invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `recipient`, `accepted`) 
VALUES ('2020-11-10 20:20:20', 2, 0, 15, 'хей детка пошли хавать :З', 1, 1, 1);

--3.	Добавлять заведения в список избранных
INSERT INTO `favorite_places` (`user`, `address`) VALUES ('1', '9');

--4.	Добавлять новые заведения в базу
INSERT 
INTO `place` (`name`, `photo`, `cuisine_nationality`, `interior`, `tagline`, `other`) 
VALUES ('McDonalds', '../img/img.jpg', '3', '2', 'вы едите - мы зарабатываем', 'любое примечание');

--5.	Удалять заведения из базы (admin)
DELETE FROM `place` WHERE id = 11;

--6.	Создавать сообщения указанному пользователю
INSERT 
INTO `message` (`datetime`, `content`, `sender`, `recipient`) 
VALUES ('2020-11-10 06:06:06', 'What\'s up bro', '1', '2');

--7.	Принимать приглашения
UPDATE `invitation` SET accepted = true WHERE id = 13;

--8.	Добавлять новые блюда
INSERT 
INTO `dish` (`name`, `dish_type`, `recipe`, `cuisin_nationality`) 
VALUES ('каша из топора', '9', '1.Взять топор.\n 2.Сварить!', '1');

--9.	Редактировать список стилей интерьера (admin)
INSERT INTO `interior` (`value`) VALUES ('бабулин стиль');

--10.	Редактировать список типов еды (admin)
INSERT INTO `dish_type` (`id`, `type`) VALUES ('15', 'макаронное');

--11.	Редактировать список национальностей кухонь (admin)
INSERT INTO `cuisine_nationality` (`value`) VALUES ('африканская');


--Справочные (оперативные):

--1.	Получать список диалогов у пользователя
DELIMITER $$
CREATE PROCEDURE getDialogsList (IN _id INT)
BEGIN
	SELECT name, avatar
	FROM `user` A
	RIGHT JOIN (SELECT DISTINCT recipient FROM `message` WHERE sender = _id) B
	ON A.id = B.recipient;
END $$
DELIMITER ;

CALL getDialogsList(1);


--2.	Получать список сообщений в диалоге у пользователя
SELECT * FROM `message` WHERE sender = 1 AND recipient = 2; 


--3.	Получать список избранных заведений для пользователя
DELIMITER $$
CREATE PROCEDURE getFavoritePlaces (IN _id INT)
BEGIN
	SELECT B.id, country, region, town, mail_index, street, house, apartment, place
	FROM `favorite_places` A
    LEFT JOIN `address` B ON A.address = B.id
    WHERE user = _id;
END $$
DELIMITER ;

CALL getFavoritePlaces(1);


--4.	Получать список персональных приглашений для пользователя
DELIMITER $$
CREATE PROCEDURE getPersonalInvitationsList (IN _id INT)
BEGIN
	SELECT A.id, datetime, country, region, town, mail_index, street, 
		   house, apartment, place, who_will_pay, message, 
		   C.id AS inviting_person_id, C.name AS inviting_person, accepted
	FROM `invitation` A	
	LEFT JOIN `address` B ON A.address = B.id
	LEFT JOIN `user`    C ON A.inviting_person = C.id
	WHERE recipient = _id;
END $$
DELIMITER ;

CALL getPersonalInvitationsList(1);


--5.	Получить список опубликованных пользователем приглашений
DELIMITER $$
CREATE PROCEDURE getInvitationsListMadeByPerson (IN _id INT)
BEGIN
	SELECT A.id, datetime, country, region, town, mail_index, street, 
		   house, apartment, place, who_will_pay, message, 
		   C.id AS recipient_id, C.name AS recipient, accepted
	FROM `invitation` A	
	LEFT JOIN `address` B ON A.address = B.id
	LEFT JOIN `user`    C ON A.recipient = C.id
	WHERE inviting_person = _id;
END $$
DELIMITER ;

CALL getInvitationsListMadeByPerson(1);


--Справочные (аналитические):

--1.	Получать список публичных приглашений для пользователя в заданном диапазоне
--2.	Получать список публичных приглашений для пользователя в зависимости от предпочтений пользователя
DELIMITER $$
CREATE PROCEDURE getInvitationsListByLocation (IN _requestArea VARCHAR(10), IN _userLocation VARCHAR(30))
BEGIN
	SELECT A.id, datetime, country, region, town, mail_index, street, 
		   house, apartment, place, who_will_pay, message, 
		   C.id AS inviting_person_id, C.name AS inviting_person, accepted
	FROM `invitation` A	
	LEFT JOIN `address` B ON A.address = B.id
	LEFT JOIN `user`    C ON A.inviting_person = C.id
	WHERE ((_requestArea = "country" AND country = _userLocation) OR 
		   (_requestArea = "region"  AND region  = _userLocation) OR
		   (_requestArea = "town"    AND town    = _userLocation) OR 
		   (_requestArea = "street"  AND street  = _userLocation) OR 
		   (_requestArea = "house"   AND house   = _userLocation));
END $$
DELIMITER ;

CALL getInvitationsListByLocation("country", "Россия");


--3.	Получать список заведений в заданном диапазоне
--4.	Получать список заведений в зависимости от предпочтений пользователя
DELIMITER $$
CREATE PROCEDURE getPlacesListByLocationAndPreferences (IN _requestArea VARCHAR(10), 
														IN _userLocation VARCHAR(30), 
														IN _cuisine_nationality VARCHAR(30),
														IN _interior VARCHAR(30))
BEGIN
	SELECT A.id, name, photo, country, region, town, mail_index, street, 
		   house, apartment, cuisine_nationality, interior, tagline, other
	FROM `address` A	
	LEFT JOIN 
		(SELECT B.id, name, photo, C.value AS cuisine_nationality, D.value AS interior, tagline, other 
         FROM `place` B 
		 LEFT JOIN `cuisine_nationality` C ON B.cuisine_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON A.place = E.id
	WHERE (cuisine_nationality = _cuisine_nationality AND interior = _interior AND
		   ((_requestArea = "country" AND country = _userLocation) OR 
		    (_requestArea = "region"  AND region  = _userLocation) OR
		    (_requestArea = "town"    AND town    = _userLocation) OR 
		    (_requestArea = "street"  AND street  = _userLocation) OR 
		    (_requestArea = "house"   AND house   = _userLocation)));
END $$
DELIMITER ;

CALL getPlacesListByLocationAndPreferences("town", "Угандийск", "японская", "ампир");


--5.	Получить кол-во посещений заведения
SELECT COUNT(*) FROM `invitation` WHERE address = 1;


--6.	Получить рейтинг заведения
SELECT ROUND(AVG(score), 2) AS rating FROM `place_reviews`; 



-------------------------------- Прочие запросы -----------------------------------

-- SELECT 
SELECT DISTINCT * FROM `message` WHERE sender = 1;
SELECT * FROM `user` WHERE id = 1;
SELECT * FROM `user` WHERE name = "Вася Пупкин" AND preferences = 9;
SELECT * FROM `user` WHERE name = "Вася Пупкин" OR name = "Андрюха" AND preferences = 9;
SELECT * FROM `user` WHERE gender = 1 OR role = 2;
SELECT * FROM `user` WHERE NOT gender = 0;
SELECT name FROM `user` WHERE login = "god";
SELECT * FROM `user` WHERE gender IN (1,4);
SELECT * FROM `address` WHERE town IN ("Волгоград","Вашингтон","Берлин");
SELECT * FROM `preferences` WHERE id BETWEEN 3 AND 9;
SELECT * FROM `place_reviews` WHERE score BETWEEN 4 AND 5;
SELECT name AS "имя" FROM `user` WHERE id = 1;
SELECT * FROM `preferences` WHERE best_dessert IS NULL;
SELECT * FROM `user` WHERE avatar IS NOT NULL;
SELECT age AS vozrast FROM `user`;

-- LIKE
SELECT * FROM `address` WHERE region LIKE '%область%';
SELECT * FROM `address` WHERE country LIKE '%ия';
SELECT * FROM `address` WHERE country LIKE '___';
SELECT * FROM `message` WHERE content LIKE '% % % % % %';
SELECT * FROM `address` WHERE country LIKE '_a_%';

-- COUNT, MAX, MIN, SUM, AVG
SELECT COUNT(*) FROM `preferences` WHERE is_vegan = 1;
SELECT AVG(score) AS rating FROM `place_reviews`; 
SELECT MAX(tips_percentage) FROM `preferences`;
SELECT MIN(id) FROM `preferences`;
SELECT SUM(*) FROM `message` WHERE sender = 1;

-- GROUP BY, HAVING
SELECT name, gender, SUM(age) AS sum_age FROM user GROUP BY gender;
SELECT place, MAX(dish) AS max_dish FROM food_assortment GROUP BY place;
SELECT who_will_pay, MIN(accepted) FROM invitation GROUP BY who_will_pay;
SELECT name, gender, SUM(age) AS sum_age FROM user GROUP BY gender HAVING SUM(age) > 25;
SELECT place, MAX(dish) AS max_dish FROM food_assortment GROUP BY place HAVING MAX(dish) < 5;

-- ORDER BY, ASC|DESC
SELECT * FROM `user` ORDER BY name;
SELECT * FROM `user` ORDER BY name DESC;
SELECT * FROM `invitation` ORDER BY datetime;
SELECT * FROM `invitation` ORDER BY datetime DESC;
SELECT * FROM `message` ORDER BY sender;

-- Вложенные SELECT
SELECT * FROM (SELECT * FROM `user`) AS T WHERE id = 1;
SELECT country FROM (SELECT * FROM (SELECT * FROM `address`) AS T) AS T;

-- SELECT INTO
SELECT * INTO newtable FROM user;
SELECT town INTO newtable FROM address WHERE house = 28;

-- UNION
SELECT name FROM user UNION SELECT age FROM user;

-- UPDATE 
UPDATE `invitation` SET accepted = true WHERE id = 13;
UPDATE `user` SET gender = 0 WHERE id = 7;
UPDATE `user` SET age = 7 WHERE id = 1 AND preferences = 9;
UPDATE `message` SET datetime = '2020-10-10 23:13:13', recipient = 4 WHERE id = 1;
UPDATE `message` SET content = "ыыыы привет" WHERE id = 1;

-- INSERT SELECT 
INSERT INTO `place_reviews` (user, place, score, review) 
SELECT user, place, score, review FROM `place_reviews` WHERE id = 1;

-- JOIN
SELECT name, value FROM `user` A JOIN `role` B ON A.role = B.id;

SELECT name, value FROM `user` A INNER JOIN `gender` B ON A.gender = B.id;

SELECT A.id, datetime, country, region, town, mail_index, street, 
		   house, apartment, place, who_will_pay, message, 
		   C.id AS inviting_person_id, C.name AS inviting_person, accepted
	FROM `invitation` A	
	LEFT JOIN `address` B ON A.address = B.id
	LEFT JOIN `user`    C ON A.inviting_person = C.id;

SELECT name, status, tips_percentage FROM `user` A LEFT JOIN `preferences` B ON A.preferences = B.id
UNION
SELECT name, status, tips_percentage FROM `user` A RIGHT JOIN `preferences` B ON A.preferences = B.id;

SELECT B.id, country, region, town, mail_index, street, house, apartment, place
	FROM `favorite_places` A
    LEFT JOIN `address` B ON A.address = B.id;
	
SELECT A.id, datetime, country, region, town, mail_index, street, 
		   house, apartment, place, who_will_pay, message, 
		   C.id AS recipient_id, C.name AS recipient, accepted
	FROM `invitation` A	
	LEFT JOIN `address` B ON A.address = B.id
	LEFT JOIN `user`    C ON A.recipient = C.id;
	
SELECT name, avatar FROM `user` A
	RIGHT JOIN (SELECT DISTINCT recipient FROM `message` WHERE sender = 1) B
	ON A.id = B.recipient;
	
SELECT B.name, C.name FROM `food_assortment` A 
	LEFT JOIN `place` B ON A.place = B.id
	LEFT JOIN `dish` C ON A.dish = C.id;
	
SELECT name, status, tips_percentage FROM `user` A LEFT OUTER JOIN `preferences` B ON A.preferences = B.id;

SELECT datetime, content, name FROM `message` CROSS JOIN `user`;

SELECT name, address FROM `favorite_places` CROSS JOIN `user`;
	
SELECT datetime, content, name FROM `message` NATURAL JOIN `user`;

SELECT place, name FROM `food_assortment` NATURAL JOIN `dish`;

SELECT name, dish FROM `food_assortment` NATURAL JOIN `place`;

SELECT A.name, B.value, C.value FROM `place` A 
	RIGHT JOIN `cuisine_nationality` B ON A.cuisine_nationality = B.id
	LEFT JOIN `interior` C ON A.interior = C.id;
	
SELECT A.id, B.name, C.name FROM `preferences` A 
	LEFT JOIN `dish` B ON A.best_dessert = B.id
	LEFT JOIN `dish` C ON A.best_drink = C.id;
	
SELECT content, B.name FROM `message` A RIGHT JOIN `user` B ON A.sender = B.id;
