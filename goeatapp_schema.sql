CREATE SCHEMA `goeatapp` DEFAULT CHARACTER SET utf8;

CREATE TABLE `goeatapp`.`interior` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `goeatapp`.`gender` (
  `id` int NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `goeatapp`.`role` (
  `id` int NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `goeatapp`.`cuisine_nationality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `goeatapp`.`dish_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `goeatapp`.`dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `dish_type` int DEFAULT NULL,
  `recipe` varchar(500) DEFAULT NULL,
  `cuisin_nationality` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`dish_type`)          REFERENCES `dish_type` (`id`),
  FOREIGN KEY (`cuisin_nationality`) REFERENCES `cuisine_nationality` (`id`)
);

CREATE TABLE `goeatapp`.`place` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `cuisine_nationality` int DEFAULT NULL,
  `interior` int DEFAULT NULL,
  `tagline` varchar(100) DEFAULT NULL,
  `other` varchar(700) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`interior`)            REFERENCES `interior` (`id`),
  FOREIGN KEY (`cuisine_nationality`) REFERENCES `cuisine_nationality` (`id`)
);

CREATE TABLE `goeatapp`.`address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `town` varchar(45) NOT NULL,
  `mail_index` varchar(45) DEFAULT NULL,
  `street` varchar(45) NOT NULL,
  `house` varchar(45) NOT NULL,
  `apartment` varchar(45) DEFAULT NULL,
  `place` int UNIQUE DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`place`) REFERENCES `place` (`id`)
);

CREATE TABLE `goeatapp`.`food_assortment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `place` int NOT NULL,
  `dish` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`dish`)  REFERENCES `dish` (`id`),
  FOREIGN KEY (`place`) REFERENCES `place` (`id`)
);

CREATE TABLE `goeatapp`.`preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuisine_nationality` int DEFAULT NULL,
  `interior` int DEFAULT NULL,
  `tips_percentage` float DEFAULT NULL,
  `is_vegan` BOOLEAN DEFAULT NULL,
  `is_raw_food` BOOLEAN DEFAULT NULL,
  `best_drink` int DEFAULT NULL,
  `best_first_meal` int DEFAULT NULL,
  `best_second_meal` int DEFAULT NULL,
  `best_dessert` int DEFAULT NULL,
  `other` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`best_drink`)          REFERENCES `dish` (`id`),
  FOREIGN KEY (`best_first_meal`)     REFERENCES `dish` (`id`),
  FOREIGN KEY (`best_second_meal`)    REFERENCES `dish` (`id`),
  FOREIGN KEY (`best_dessert`)        REFERENCES `dish` (`id`),
  FOREIGN KEY (`interior`)            REFERENCES `interior` (`id`),
  FOREIGN KEY (`cuisine_nationality`) REFERENCES `cuisine_nationality` (`id`)
);

CREATE TABLE `goeatapp`.`user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` int NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `preferences` int UNIQUE DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `role` int NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`preferences`) REFERENCES `preferences` (`id`),
  FOREIGN KEY (`gender`)      REFERENCES `gender` (`id`),
  FOREIGN KEY (`role`)        REFERENCES `role` (`id`)
);

CREATE TABLE `goeatapp`.`favorite_places` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `address` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user`)    REFERENCES `user` (`id`),
  FOREIGN KEY (`address`) REFERENCES `address` (`id`)
);

CREATE TABLE `goeatapp`.`invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `place` int NOT NULL,
  `who_will_pay` tinyint(4) DEFAULT NULL,
  `preferences` int DEFAULT NULL,
  `message` varchar(200) NOT NULL,
  `inviting_person` int NOT NULL,
  `pecipient` int DEFAULT NULL,
  `accepted` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`inviting_person`) REFERENCES `user` (`id`),
  FOREIGN KEY (`pecipient`)       REFERENCES `user` (`id`),
  FOREIGN KEY (`place`)           REFERENCES `address` (`id`)
);

CREATE TABLE `goeatapp`.`message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `content` varchar(1000) NOT NULL,
  `sender` int NOT NULL,
  `recipient` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`sender`)    REFERENCES `user` (`id`),
  FOREIGN KEY (`recipient`) REFERENCES `user` (`id`)
);

INSERT INTO `goeatapp`.`role` (`id`, `value`) VALUES ('0', 'admin');
INSERT INTO `goeatapp`.`role` (`id`, `value`) VALUES ('1', 'moderator');
INSERT INTO `goeatapp`.`role` (`id`, `value`) VALUES ('2', 'guest');

INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('0', 'male');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('1', 'female');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('2', 'undefined');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('3', 'transgender');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('4', 'gender neutral');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('5', 'non-binary');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('6', 'agender');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('7', 'pangender');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('8', 'genderqueer');
INSERT INTO `goeatapp`.`gender` (`id`, `value`) VALUES ('9', 'two-spirit');

INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('1', 'напиток');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('2', 'алкоголь');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('3', 'коктейль');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('4', 'выпечка');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('5', 'десерт');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('6', 'завтрак');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('7', 'закуска');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('8', 'морепродукт');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('9', 'основное блюдо');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('10', 'паста');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('11', 'салат');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('12', 'сладкое');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('13', 'смузи');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('14', 'соус');
INSERT INTO `goeatapp`.`dish_type` (`id`, `type`) VALUES ('15', 'суп');

INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('русская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('американская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('японская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('китайская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('французская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('итальянская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('грузинская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('казахская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('испанская');
INSERT INTO `goeatapp`.`cuisine_nationality` (`value`) VALUES ('корейская');

INSERT INTO `goeatapp`.`dish` (`name`, `dish_type`, `recipe`, `cuisin_nationality`) VALUES ('пельмени', '9', 'какой-нибудь', '1');
INSERT INTO `goeatapp`.`dish` (`name`, `photo`, `dish_type`, `cuisin_nationality`) VALUES ('водка', '../img/vodka.jpg', '2', '1');
INSERT INTO `goeatapp`.`dish` (`name`, `dish_type`, `recipe`, `cuisin_nationality`) VALUES ('борщ', '15', 'сложный и длинный', '2');
INSERT INTO `goeatapp`.`dish` (`name`, `dish_type`, `recipe`, `cuisin_nationality`) VALUES ('баварские колбаски', '7', '', '8');
INSERT INTO `goeatapp`.`dish` (`name`, `dish_type`, `cuisin_nationality`) VALUES ('паста с томатным соусом', '10', '6');
INSERT INTO `goeatapp`.`dish` (`name`, `dish_type`, `cuisin_nationality`) VALUES ('торт прага', '5', '1');
INSERT INTO `goeatapp`.`dish` (`name`, `photo`, `dish_type`) VALUES ('чай пуэр', '///', '1');
INSERT INTO `goeatapp`.`dish` (`name`, `photo`, `dish_type`, `recipe`, `cuisin_nationality`) VALUES ('плов', '.', '9', 'берем пучек укропу...', '3');
INSERT INTO `goeatapp`.`dish` (`name`, `dish_type`, `cuisin_nationality`) VALUES ('вино', '2', '7');
INSERT INTO `goeatapp`.`dish` (`name`, `dish_type`, `recipe`, `cuisin_nationality`) VALUES ('пицца', '7', 'режем все подряд и сбрасываем на блин из теста, посыпав сыром', '6');

INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('авангард');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('ампир');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('барокко');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('арабский');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('английский');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('брутализм');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('венецианский');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('индустриальный');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('китайский');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('конструктивизм');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('лофт');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('лаундж');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('модерн');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('ренессанс');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('рококо');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('стимпанк');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('техно');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('футуризм');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('хай-тек');
INSERT INTO `goeatapp`.`interior` (`value`) VALUES ('этнический');

INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `tips_percentage`, `is_vegan`, `is_raw_food`, `best_drink`, `best_first_meal`, `best_second_meal`, `best_dessert`) VALUES ('1', '6', '10', '1', '0', '2', '4', '8', '6');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `tips_percentage`, `is_vegan`, `is_raw_food`, `best_drink`, `best_first_meal`, `best_second_meal`, `other`) VALUES ('1', '2', '5', '0', '0', '2', '4', '5', 'тут может быть любой текст');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `tips_percentage`, `is_vegan`, `is_raw_food`, `best_drink`, `best_first_meal`, `best_second_meal`) VALUES ('10', '3', '0', '0', '0', '7', '4', '2');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `tips_percentage`, `is_vegan`, `is_raw_food`, `best_drink`, `best_second_meal`, `best_dessert`) VALUES ('4', '4', '1', '1', '1', '2', '8', '6');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `tips_percentage`, `is_vegan`, `is_raw_food`, `best_drink`, `best_first_meal`, `best_second_meal`) VALUES ('5', '3', '100', '0', '0', '2', '4', '5');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `tips_percentage`, `is_vegan`, `is_raw_food`, `best_drink`) VALUES ('6', '1', '2', '0', '0', '7');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `tips_percentage`, `is_vegan`, `is_raw_food`, `best_drink`, `best_second_meal`, `other`) VALUES ('2', '7', '2', '1', '0', '2', '5', 'тут тоже может быть любой текст любого размера');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `is_vegan`, `is_raw_food`, `best_drink`, `best_first_meal`, `best_second_meal`, `best_dessert`) VALUES ('1', '8', '0', '0', '7', '4', '8', '6');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `is_vegan`, `is_raw_food`, `best_second_meal`) VALUES ('9', '9', '0', '0', '8');
INSERT INTO `goeatapp`.`preferences` (`cuisine_nationality`, `interior`, `tips_percentage`, `is_vegan`, `is_raw_food`, `best_dessert`) VALUES ('3', '13', '5', '0', '0', '6');

INSERT INTO `goeatapp`.`place` (`name`, `photo`, `cuisine_nationality`, `interior`, `tagline`, `other`) VALUES ('додо', '...', '3', '2', 'вы едите - мы зарабатываем', 'любое примечание');
INSERT INTO `goeatapp`.`place` (`name`, `cuisine_nationality`) VALUES ('аик бистро', '1');
INSERT INTO `goeatapp`.`place` (`name`, `photo`, `interior`) VALUES ('бабулин дом', './', '3');
INSERT INTO `goeatapp`.`place` (`name`, `cuisine_nationality`, `interior`, `tagline`, `other`) VALUES ('шашлычная у володи', '3', '2', 'вы травитесь - мы зарабатываем', 'кошек не используем');
INSERT INTO `goeatapp`.`place` (`name`, `interior`, `other`) VALUES ('садко', '8', '.');
INSERT INTO `goeatapp`.`place` (`name`, `cuisine_nationality`, `interior`) VALUES ('братница', '4', '6');
INSERT INTO `goeatapp`.`place` (`name`, `cuisine_nationality`) VALUES ('old school', '10');
INSERT INTO `goeatapp`.`place` (`name`, `tagline`, `other`) VALUES ('шаурмичная дяди Рамзана', 'лучшее место во вселенной', 'примечание');
INSERT INTO `goeatapp`.`place` (`name`, `interior`) VALUES ('просто пельменная', '2');
INSERT INTO `goeatapp`.`place` (`name`, `cuisine_nationality`) VALUES ('Римини', '7');

INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `mail_index`, `street`, `house`, `apartment`, `place`) VALUES ('Россия', 'Волгоградская область', 'Волгоград', '228666', 'Ленина', '28', 'В903', '2');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `mail_index`, `street`, `house`, `apartment`, `place`) VALUES ('Уганда', 'какой-то регион в Уганде', 'Угандийск', '222222', 'Красного человечка', '1', '9', '1');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `street`, `house`, `apartment`, `place`) VALUES ('Парагвай', 'далекий', 'Парагвайск', 'кого-то', '2', '8', '3');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `street`, `house`, `apartment`, `place`) VALUES ('Германия', 'Бавария', 'Берлин', 'Фридриха Ницше', '3', '7', '4');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `street`, `house`, `apartment`, `place`) VALUES ('Сомали', 'не знаю', 'Сомалийск', 'а', '4', '6', '5');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `street`, `house`, `apartment`, `place`) VALUES ('Украина', 'Луганская область', 'Юкрэйн Таун', 'б', '5', '33', '6');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `mail_index`, `street`, `house`, `apartment`, `place`) VALUES ('Исландия', '..', 'Исландийск', '11001', 'в', '6', '24', '7');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `street`, `house`, `apartment`, `place`) VALUES ('Гренландия', '....', 'Гренландскбург', 'г', '6', '5', '8');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `street`, `house`, `apartment`, `place`) VALUES ('США', 'Вашингтон', 'Вашингтон', 'Джорджа флойда', '7', '67', '10');
INSERT INTO `goeatapp`.`address` (`country`, `region`, `town`, `street`, `house`, `apartment`, `place`) VALUES ('Бельгия', 'эээ', 'Труляля', 'Эркюля Пуаро', '8', '1', '9');

INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `preferences`, `status`, `role`, `login`, `password`) VALUES ('Вася Пупкин', '15', '0', '9', 'все сложно', '2', 'demo', '123');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `avatar`, `preferences`, `status`, `role`, `login`, `password`) VALUES ('Андрюха', '20', '0', '...', '8', 'все просто', '2', 'god', '321');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `preferences`, `role`, `login`, `password`) VALUES ('Серый', '1', '0', '3', '2', 'bear666', 'dfv');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `preferences`, `role`, `login`, `password`) VALUES ('Оля', '2', '1', '10', '2', 'solomon', 'srgb3');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `preferences`, `role`, `login`, `password`) VALUES ('Ксюша Петровна', '3', '4', '7', '2', 'tankist228', 'bhd');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `preferences`, `status`, `role`, `login`, `password`) VALUES ('Владос', '20', '1', '6', 'ходит с Андреем хавать между пар', '0', 'Abricos', '4bdh_');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `avatar`, `preferences`, `role`, `login`, `password`) VALUES ('Соломон Олегович', '5', '0', '?', '5', '1', 'Salam', 'hnbvc345');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `preferences`, `role`, `login`, `password`) VALUES ('Жора', '6', '0', '2', '2', 'greg', 'vvdgj32');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `preferences`, `role`, `login`, `password`) VALUES ('Витя', '7', '0', '1', '2', 'leon', '3456');
INSERT INTO `goeatapp`.`user` (`name`, `age`, `gender`, `preferences`, `role`, `login`, `password`) VALUES ('Саша', '70', '0', '4', '2', 'serafim34', '2345324');

INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-10-11 13:14:15', 'Привет', '1', '2');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-10-10 13:13:13', 'Здарова', '2', '1');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-10-10 23:13:13', 'Верни сотку', '4', '7');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-10-10 13:13:13', 'не верну', '7', '4');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-10-10 13:13:59', 'ты быканул? Все я выехал за тобой, гад!', '1', '10');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('1973-10-10 13:13:13', 'ты не знаешь, где я живу, петушок', '1', '9');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-10-10 13:13:13', 'знаю, мы у тебя встречались на ужин...', '2', '8');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-10-10 13:13:13', 'ах ты', '4', '8');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-12-10 13:13:13', 'лучше сразу выпрыгивай в окно', '7', '4');
INSERT INTO `goeatapp`.`message` (`datetime`, `content`, `sender`, `recipient`) VALUES ('2020-10-10 13:13:14', 'я на первом этаже живу, не прокаттит(', '1', '2');

INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('1', '10');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('4', '8');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('2', '9');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('10', '7');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('10', '6');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('7', '5');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('10', '4');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('2', '1');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('2', '2');
INSERT INTO `goeatapp`.`favorite_places` (`user`, `address`) VALUES ('1', '3');

INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('1', '4');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('2', '4');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('1', '3');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('7', '7');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('9', '2');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('6', '5');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('4', '9');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('8', '10');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('5', '10');
INSERT INTO `goeatapp`.`food_assortment` (`place`, `dish`) VALUES ('10', '4');

INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) VALUES ('2020-01-01 15:15:56', '2', '0', '15', 'привет', '1', '1');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) VALUES ('2015-01-01 13:12:51', '1', '0', '9', 'пошли', '4', '0');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) VALUES ('2020-01-01 15:15:20', '3', '1', '10', 'хавать', '2', '1');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `pecipient`, `accepted`) VALUES ('2020-01-01 15:15:56', '4', '0', '11', 'бро', '7', '1', '1');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) VALUES ('2020-01-01 15:15:56', '5', '0', '12', 'хей', '8', '0');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) VALUES ('2020-09-01 23:15:56', '6', '1', '13', 'любое сообщение', '9', '1');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) VALUES ('2020-01-01 15:15:56', '7', '0', '14', 'лалала', '2', '1');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `pecipient`, `accepted`) VALUES ('2020-01-01 15:15:56', '8', '0', '8', '', '4', '10', '1');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `pecipient`, `accepted`) VALUES ('2020-01-01 01:15:56', '9', '0', '16', '', '1', '10', '1');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) VALUES ('2020-01-01 15:15:56', '10', '1', '17', '', '2', '0');
INSERT INTO `goeatapp`.`invitation` (`datetime`, `place`, `who_will_pay`, `preferences`, `message`, `inviting_person`, `accepted`) VALUES ('2020-01-01 15:15:56', '1', '0', '18', 'сообщаю', '4', '1');





