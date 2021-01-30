-- УРОК 10:

-- На БД vk:

-- 1. Проанализировать, какие запросы могут выполняться наиболее часто в процессе работы приложения, 
-- и добавить необходимые индексы.

USE vk;

-- Я исходила из следующего предположения: если на поле уже установлен PK или FK, то смысла делать для него
-- индекс - нет. Также если на два поля, для которых хотелось бы сделать составной индекс установлены два
-- индивидуальных FK - то делать составной индекс также нет смысла.

-- 1. Таблица communities:

SELECT * FROM communities;

-- формально - у нас здесь единственное поле, по которому можно было бы создать индекс - это название группы. 
-- Но я бы не стала создавать индекс в этой таблице в принципе, так как вероятность того, что мы будем анализировать
-- какую-то конкретную группу (для чего нам бы понадобилось ее найти по имени) - невысока. Скорее нас будут 
-- интересовать группы с наибольшей активностью или, например, самые старые действующие группы, то есть группы,
-- с конкретными параметрами, а не именем. 

-- 2. Таблица communities_users:
 
SELECT * FROM communities_users;
DESC communities_users;

-- здесь составной PRIMARY KEY из полей community_id и user_id.

-- 3. Таблица contacts:

SELECT * FROM contacts;

-- можно создать ключ по полю contact_info:
DESC contacts; 
-- у меня поле contact_info почему то имеет длину varchar(1000). Не знаю, почему так получилось. 
-- Видимо, рука дрогнула. На такое поле индекс не создастся. Поэтому нужно его поменять:

ALTER TABLE contacts 
	MODIFY COLUMN contact_info VARCHAR(50);

-- теперь можно создать индекс:

CREATE INDEX contacts_info_idx ON contacts(contact_info);

-- 4. Таблица friendship:

SELECT * FROM friendship;

-- у нас уже создан PK по полю user_id и FK для полей friend_id и status_id. Других полей, для которых 
-- стоило бы создавать ключ нет.

-- 5. Таблица friendship_statuses:
  
SELECT * FROM friendship_statuses;
DESC friendship_statuses;

-- PK - id, UNI - name. Других полей для индексации нет.

-- 6. Таблица gender:

SELECT * FROM gender;

-- я не вижу смысла здесь что-то индексировать.

-- 7. Таблица likes:

SELECT * FROM likes;

-- PK - id, FK - target_type_id, user_id. В принципе можно создать индекс по полю target_id:

CREATE INDEX likes_targ_id_idx ON likes(target_id);

-- 8. Таблица media:
 
SELECT * FROM media;

-- PK - id, FK - type_id, user_id. Гипотетически можно создать индекс по полю filename, но я не думаю, что 
-- ситуации, когда нам нужно найти файл с конкретным именем среди миллиона пользователей случаются часто. 
-- Думаю, если такие частные задачи случаются, то они решаются иначе.

-- 9. Таблица media_types:

SELECT * FROM media_types;

-- в этой таблице нет смысла создавать индексы.

-- 10. Таблица messages:

SELECT * FROM messages;

-- PK - id, FK - from_user_id, to_user_id. Я не вижу здесь больше столбцов, для которых стоило бы создать индекс.
-- (Гипотетически можно для is_important и is_delivered, но смысла не вижу).

-- 11. Таблица posts:

SELECT * FROM posts;

-- PK - id, FK - community_id, media_id, user_id. Я не вижу других полей, для которых имело бы смысл сделать индексы.

-- 12. Таблица profiles:

SELECT * FROM profiles;

-- PK - user_id, FK - gender_id, photo_id, user_status_id. Может потребоваться аналитика по странам или городам.
-- Создадим два ключе:

CREATE INDEX pr_country_idx ON profiles(country);
CREATE INDEX pr_city_idx ON profiles(city);

-- 13. Таблица target_types:

SELECT * FROM target_types;

-- PK - id, UNI - name. Нет столбцов, чтобы сделать индекс.

-- 14. Таблица user_statuses:

SELECT * FROM user_statuses;

-- Если я правильно понимаю, то конкретно в этой таблице нет смысла ставить индекс на name (так как это справочник), а в справочник - маловероятно, что мы будем что-то искать. Мы скорее будем искать что-то в 
-- profiles, по id статуса. Но можно сделать это поле UNIQUE, что как я поняла тоже - индекс. 

DESC user_statuses; 

ALTER TABLE user_statuses 
	MODIFY COLUMN name VARCHAR(50) UNIQUE;

-- 15. Таблица users:

SELECT * FROM users;
DESC users;

-- у меня в этой таблице поля email и phone - UNI. Других полей для создания индекса нет.

-- 2. Задание на оконные функции. Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах
-- самый молодой пользователь в группе
-- самый старший пользователь в группе
-- общее количество пользователей в группе
-- всего пользователей в системе
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

SELECT * FROM communities;
SELECT * FROM communities_users;

-- я специально удалила одну запись в communities_users - чтобы число записей в этой таблице не совпадало с 
-- общим количеством пользователей

SELECT 
	DISTINCT c.name as community, 
	COUNT(*) OVER () / (SELECT COUNT(*) FROM communities c) AS avg_users_in_group,
	first_value(CONCAT(p.first_name, ' ', p.last_name)) 
		OVER (PARTITION BY cu.community_id ORDER BY p.birthday DESC) AS yangest_in_group,
	last_value(CONCAT(p.first_name, ' ', p.last_name)) 
		OVER (PARTITION BY cu.community_id ORDER BY p.birthday DESC 
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS oldest_in_group,
	(COUNT(*) OVER (PARTITION BY cu.community_id)) AS users_in_group,
	(SELECT COUNT(p.user_id) FROM profiles p) AS users_in_system,
	(COUNT(*) OVER (PARTITION BY cu.community_id)) / (SELECT COUNT(p.user_id) FROM profiles p) * 100 AS '%' 
FROM communities_users cu 
JOIN profiles p ON cu.user_id = p.user_id
JOIN communities c ON c.id = cu.community_id; 

