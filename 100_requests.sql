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
														IN _cuisin_nationality INT,
														IN _interior INT)
BEGIN
	SELECT A.id, name, photo, country, region, town, mail_index, street, 
		   house, apartment, cuisin_nationality, interior, tagline, other
	FROM `address` A	
	LEFT JOIN 
		(SELECT * FROM `place` B 
		 LEFT JOIN `cuisin_nationality` C ON B.cuisin_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON A.place = E.id
	WHERE (cuisin_nationality = _cuisin_nationality AND interior = _interior AND
		   ((_requestArea = "country" AND country = _userLocation) OR 
		    (_requestArea = "region"  AND region  = _userLocation) OR
		    (_requestArea = "town"    AND town    = _userLocation) OR 
		    (_requestArea = "street"  AND street  = _userLocation) OR 
		    (_requestArea = "house"   AND house   = _userLocation)));
END $$
DELIMITER ;

CALL getPlacesListByLocationAndPreferences("country", "Россия", 1, 1);


--5.	Получить кол-во посещений заведения
SELECT COUNT(*) FROM `invitation` WHERE address = 1;


--6.	Получить рейтинг заведения
SELECT ROUND(AVG(score), 2) AS rating FROM `place_reviews`; 
