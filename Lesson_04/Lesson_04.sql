USE vk;

CREATE TABLE contacts (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  user_id int(10) UNSIGNED NOT NULL COMMENT 'Ссылка на профиль пользователя',
  contact_type varchar(30) COMMENT 'Тип контакта',
  contact_info varchar(1000) COMMENT 'контактная информация',
  created_at datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  updated_at datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (id)
) COMMENT='Контактная информация';

ALTER TABLE profiles
  ADD first_name varchar(100) NOT NULL COMMENT 'Имя пользователя' AFTER country,
  ADD last_name varchar(100)  NOT NULL COMMENT 'Фамилия пользователя' AFTER first_name
;

CREATE TABLE gender (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  gender VARCHAR(25) COMMENT "Название пола",
  gender_info VARCHAR(150) COMMENT "Информация о поле",
  active BOOLEAN COMMENT "Активен/Неактивен. Доступность для выбора",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Варианты полов";

INSERT INTO gender (gender, gender_info) VALUES
 ('M', 'Male'),
 ('F', 'Female')
;

ALTER TABLE profiles
ADD gender_id INT NOT NULL COMMENT "Ссылка на пол" AFTER gender;

CREATE TABLE user_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "Название статуса (уникально)",
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник статусов";  

UPDATE profiles SET status = null;
ALTER TABLE profiles RENAME COLUMN status TO user_status_id;
ALTER TABLE profiles MODIFY COLUMN user_status_id INT UNSIGNED; 

-- DONE 1. Коррекция таблицы users DONE --

UPDATE users SET updated_at = CURRENT_TIMESTAMP() 
WHERE updated_at < created_at; 

ALTER TABLE users DROP COLUMN first_name, DROP COLUMN last_name;

-- DONE 2. Коррекция таблицы profiles DONE --

UPDATE profiles SET gender_id = (SELECT id FROM gender ORDER BY rand() LIMIT 1);
ALTER TABLE profiles DROP COLUMN gender;

UPDATE profiles SET user_status_id = (SELECT id FROM user_statuses ORDER BY rand() LIMIT 1);

UPDATE profiles p SET p.first_name  = 
(SELECT u.first_name FROM users u WHERE u.id = p.user_id );

UPDATE profiles p SET p.last_name = 
(SELECT u.last_name FROM users u WHERE u.id = p.user_id );

SELECT * FROM profiles p WHERE birthday > DATE_SUB(CURRENT_DATE(), INTERVAL 14 YEAR);

UPDATE profiles SET birthday = DATE_SUB((DATE_SUB(CURRENT_DATE(), INTERVAL 14 YEAR)), INTERVAL FLOOR(1 + RAND() * 100) DAY) 
WHERE birthday > DATE_SUB(CURRENT_DATE(), INTERVAL 14 YEAR); 


-- DATE_SUB(CURRENT_DATE(), INTERVAL 14 YEAR) - дата рождения 14 лет назад

-- DONE 3. Коррекция таблицы communities DONE --

UPDATE communities SET updated_at = CURRENT_TIMESTAMP() 
WHERE updated_at < created_at; 

-- DONE 4. Коррекция таблицы communities_users DONE --

UPDATE communities_users SET community_id = (SELECT id FROM communities ORDER BY rand() LIMIT 1);

-- DONE 5. Коррекция таблицы contacts DONE -- 

INSERT INTO contacts (user_id, contact_type, contact_info)
SELECT id, 'e-mail', email FROM users 
UNION ALL
SELECT id, 'phone', phone FROM users 

-- DONE 6. Коррекция таблицы friendship DONE --

UPDATE friendship SET friend_id = (SELECT id FROM users ORDER BY rand() LIMIT 1);
UPDATE friendship SET status_id = (SELECT id FROM friendship_statuses ORDER BY rand() LIMIT 1);
UPDATE friendship SET confirmed_at = NULL WHERE status_id != 2;

-- DONE 7. Коррекция таблицы friendship_statuses DONE --

TRUNCATE TABLE friendship_statuses; 

INSERT INTO friendship_statuses (name) VALUES
 ('Applied for friendship'),
 ('Friendship approved'),
 ('Friendship declined');

-- DONE 8. Коррекция таблицы gender DONE --

-- DONE 9. Коррекция таблицы media DONE --

UPDATE media SET
	media_type_id = FLOOR(1 + RAND() * 3);

ALTER TABLE media 
	ADD filename_prefix VARCHAR(150) AFTER user_id;

UPDATE media SET filename_prefix = 'http://';

ALTER TABLE media 
	ADD filename_ending VARCHAR(10) AFTER filename;

UPDATE media SET filename_ending = '.com';

ALTER TABLE media 
	ADD filename_test VARCHAR(150) AFTER user_id;

UPDATE media SET filename_test = CONCAT(filename_prefix, filename, filename_ending); 

ALTER TABLE media 
	DROP COLUMN filename_ending,
	DROP COLUMN filename,
	DROP COLUMN filename_prefix;

ALTER TABLE media
 	RENAME COLUMN filename_test to filename;
 
UPDATE media SET
	`size` = FLOOR(1000 + RAND()*(2000000 - 1000 + 1)) WHERE media_type_id = 1;

UPDATE media SET
	`size` = FLOOR(420 + RAND()*(11720 - 420 + 1)) WHERE media_type_id = 2;

UPDATE media SET
	`size` = FLOOR(100 + RAND()*(500 - 100 + 1)) WHERE media_type_id = 3;

UPDATE media SET user_id = (SELECT id FROM users ORDER BY rand() LIMIT 1);

-- DONE 10. Коррекция таблицы media_types DONE --
-- изменили непосредственно в редакторе

-- DONE 11. Коррекция таблицы messages DONE --
UPDATE messages SET
	from_user_id = FLOOR(1 + RAND() * 100),
	to_user_id = FLOOR(1 + RAND() * 100)
;
-- DONE 12. Коррекция таблицы user_statuses DONE --

DESC communities_users ;
SELECT * FROM user_statuses us  ;