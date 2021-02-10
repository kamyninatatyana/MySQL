-- Курсовой проект:

-- 1. Текстовое описание БД и решаемые ею задачи.

-- Мы создаем блок Склад - Производство базы данных для Системы Управления Предприятием. В рамках нашего блока 
-- в БД на ежедневной основе вводятся данные о:
-- приходе сырья на склад, передаче его на производство
-- производстве готовой продукции, списании сырья на ее производство
-- сдача ГП на склад, отгрузка ее клиенту

-- Наша аналитика должна позволить нам:
-- увидеть объемы производства готовой продукции по дням/линиям/ассортименту;
-- увидеть расход сырья на произодство готовой продукции;
-- увидеть все движения по конкретному виду сырья и получить его остаток 
-- увидеть сырьевую себестоимость произведенной ГП и сравнить ее с нормативной

-- 2. Структура БД:

CREATE DATABASE ERP;
USE ERP;

-- Наша БД состоит из двух крупных блоков -  таблицы-справочники (классификаторы, обновляются только при 
-- появления новых категорий) и таблицы-журналы операций (новыми записями пополняются ежедневно).

-- ПРИМЕЧАНИЕ: 
-- 1. Я не стала создавать поля created_at, updated_at и прочие системные поля, чтобы не усложнять код. 
-- В моем примере эти поля незначимы, хотя на уровне полноценной БД - безусловно, необходимо отслеживать кем и 
-- когда проводилась та или иная операция с конкретной записью.
-- 2. Я в начале создавала таблицы, проверяла их на корретность структуры и только потом создавала внешние 
-- ключи. Поэтому код на создание внешний ключей - отдельно, но о том, что его можно создавать при создании
-- таблицы - знаю.
-- 3. Вы ничего не рассказывали о том, создаются или нет внешние ключи для VIEW. Я предположила, что нет.
-- 4. По-хорошему, в таблицах, содержащиех данные из справочников, должны находиться не сами значения атрибута,
-- а ссылка на ID соответствующей строки в справочнике, как мы делали во время обучения. Но поскольку мы работаем
-- без интерфейса, а мне нужно было заполнить базу связанными между собой данными и нужно было оценивать корректность
-- составленных запросов - то я для ссылки использовала не id, а сами значения.
-- 5. Поскольку я создала универсальный журнал операций, в рамках блока Склад-Производства - я не смогла придумать
-- 10 таблиц. У меня получилось только 9. Делать таблицу только ради того, чтобы она была 10-й и никак ее не 
-- использовать я не стала.

-- В начале создадим и сразу заполним необходимые нам справочники:

-- 2.1: Справочник единиц измерения (ЕИ):

-- Создадим таблицу:

DROP TABLE IF EXISTS units;
CREATE TABLE units (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  short_name CHAR(3) NOT NULL COMMENT 'Краткое обозначение ЕИ',
  full_name CHAR(50) NOT NULL COMMENT 'Полное обозначение ЕИ',
  PRIMARY KEY (short_name)
  ) COMMENT='Справочник единиц измерения';

-- Внешние ключи и индексы:
-- Это таблица-справочник. Для нее не создается FK, а поля Id и short_name - уже являются ключами.


-- Заполним таблицу:
INSERT INTO units 
VALUES
(NULL, 'КГ', 'Килограммы'),
(NULL, 'РУБ', 'Рубли');

SELECT * FROM units;


-- 2.2: Справочник товарных позиций (справочник для сырья и материалов (СиМ) и готовой продукции (ГП)):

-- Создадим таблицу:

DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  alpha_code CHAR(1) NOT NULL COMMENT 'Буквенная кодировка для товарной позиции',
  num_code CHAR(10) NOT NULL COMMENT 'Цифровая кодировка для товарной позиции',
  article_name varchar(50) COMMENT 'Наименование товарной позиции',
  unit CHAR(3) NOT NULL COMMENT 'Единицы измерения товарной позиции',
  analyt_group1 varchar(50) COMMENT 'Необязательное поле для аналитической группировки',
  analyt_group2 varchar(50) COMMENT 'Необязательное поле для создания аналитической группировки',
  PRIMARY KEY (alpha_code, num_code)
  ) COMMENT='Справочник товарных позиций (СиМ и ГП)';
 
-- Внешние ключи и индексы:
ALTER TABLE articles 
  ADD CONSTRAINT articles_unit_fk
    FOREIGN KEY (unit) REFERENCES units(short_name)
      ON DELETE CASCADE;
 
ALTER TABLE articles 
  DROP CONSTRAINT articles_unit_fk;
 
-- Заполним таблицу:
 INSERT INTO articles 
	(alpha_code, num_code, article_name, unit, analyt_group1, analyt_group2)
VALUES
	('A', '1', 'Печенье овсяное Овсянкин класс 230гр', 'КГ', 'Бренд Овсянкин', 'Печенье овсяное'),
	('A', '2', 'Печенье овсяное Овсянкин с клюквой 230гр', 'КГ', 'Бренд Овсянкин', 'Печенье овсяное'),
	('A', '3', 'Печенье овсяное Овсянкин с изюмом 230гр', 'КГ', 'Бренд Овсянкин', 'Печенье овсяное'),
	('A', '4', 'Печенье сдобное Добрянкин класс 210гр', 'КГ', 'Бренд Добрянкин', 'Печенье сдобное'),
	('A', '5', 'Печенье сдобное Добрянкин с шокол 210гр', 'КГ', 'Бренд Добрянкин', 'Печенье сдобное'),
	('A', '6', 'Печенье сдобное Добрянкин с карам 210гр', 'КГ', 'Бренд Добрянкин', 'Печенье сдобное'),
	('A', '7', 'Печенье овсяное весовое', 'КГ', 'Весовое', 'Печенье овсяное'),
	('A', '8', 'Печенье сдобное весовое', 'КГ', 'Весовое', 'Печенье сдобное'),
	('A', '9', 'Печенье творожное Сырник класс 180гр', 'КГ', 'Бренд Сырник', 'Печенье творожное'),
	('A', '10', 'Печенье творожное Сырник с изюмом 180гр', 'КГ', 'Бренд Сырник', 'Печенье творожное'),
	('A', '11', 'Печенье творожное весовое', 'КГ', 'Весовое', 'Печенье творожное'),
	('R', '1', 'Мука пшеничная', 'КГ', 'Мука и крупы', 'Мука'),
	('R', '2', 'Сахар', 'КГ', 'Сахар и сахаристые вещества', 'Сахар'),
	('R', '3', 'Жир кондитерский', 'КГ', 'Масла и жиры', 'Жиры животные'),
	('R', '4', 'Масло сливочное', 'КГ', 'Масла и жиры', 'Жиры животные'),
	('R', '5', 'Творог', 'КГ', 'Молочные и кисломолочные продукты', 'Кисломолочные продукты'),
	('R', '6', 'Клюква', 'КГ', 'Добавки', 'Ягоды'),
	('R', '7', 'Изюм', 'КГ', 'Добавки', 'Сухофрукты'),
	('R', '8', 'Шоколад', 'КГ', 'Добавки', 'Шоколад и какао'),
	('R', '9', 'Карамель', 'КГ', 'Добавки', 'Карамель');

SELECT * FROM articles;

-- 2.3: Справочник мест хранения и производственных линий:

-- Создадим таблицу:

DROP TABLE IF EXISTS stock_location;
CREATE TABLE stock_location (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  location_code CHAR(4) NOT NULL COMMENT 'Код места хранения/производственной линии', 
  location_name VARCHAR(50) NOT NULL COMMENT 'Наименование места хранения/производственной линии',
  if_production_line BOOL NOT NULL COMMENT 'Производственная линия - 1, место хранения - 0',
  PRIMARY KEY (location_code)
) COMMENT='Справочник мест хранения и производственных линий';

-- Внешние ключи и индексы:
-- Это таблица-справочник. Для нее нет нет FK. И не вижу смысла создавать индекс, так как здесь PK сделан по коду 
-- места хранения и UNI на id.

-- Заполним таблицу:

TRUNCATE TABLE stock_location; 

INSERT INTO stock_location (location_code, location_name, if_production_line)
VALUES
('1100', 'Склад сырья и материалов', FALSE),
('1200', 'Склад упаковочных материалов', FALSE),
('2100', 'Производственый склад', FALSE),
('2101', 'Производственная линия 1', TRUE),
('2102', 'Производственная линия 2', TRUE),
('5100', 'Склад готовой продукции', FALSE),
('8001', 'Внешний поставщик', FALSE),
('8002', 'Внешний поставщик', FALSE),
('8003', 'Внешний поставщик', FALSE),
('8004', 'Внешний поставщик', FALSE),
('8005', 'Внешний поставщик', FALSE),
('9001', 'Внешний клиент 1', FALSE),
('9002', 'Внешний клиент 1', FALSE),
('9003', 'Внешний клиент 1', FALSE);

SELECT * FROM stock_location;

-- 2.4: Справочник хозяйственных операций:

-- Создадим таблицу:

DROP TABLE IF EXISTS transaction_directory;
CREATE TABLE transaction_directory (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  transaction_code CHAR(4) NOT NULL UNIQUE COMMENT 'Код транзакции', 
  transaction_name VARCHAR(50) NOT NULL COMMENT 'Наименование транзакции'
 ) COMMENT='Справочник хозяйственных операций';

-- Внешние ключи и индексы:
-- Это таблица-справочник. Для нее нет FK. И ключами уже являются два поля - id и transaction_code.
-- Других полей для индексации не вижу.

-- Заполним таблицу:
 
 INSERT INTO transaction_directory (transaction_code, transaction_name)
VALUES
('1000', 'Приход на склад'),
('1020', 'Передача на производство'),
('2020', 'Расход'),
('2021', 'Производство ГП'),
('2050', 'Передача ГП на склад'),
('5000', 'Отгрузка клиенту');

SELECT * FROM transaction_directory;

 
-- 2.5: Справочник рецептур:

-- Создадим таблицу:

DROP TABLE IF EXISTS recipies;
CREATE TABLE recipies (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fp_alpha_code CHAR(1) NOT NULL COMMENT 'Буквенная кодировка ГП из справочника ТП',
  fp_num_code CHAR(10) NOT NULL COMMENT 'Цифровая кодировка для ГП из справочника ТП',
  rp_alpha_code CHAR(1) NOT NULL COMMENT 'Буквенная кодировка СиМ из справочника ТП',
  rp_num_code CHAR(10) NOT NULL COMMENT 'Цифровая кодировка СиМ из справочника ТП',
  quantity_per_tn INT NOT NULL COMMENT 'Количество СиМ для производства 1 тн ГП в базовых ЕИ СиМ'
) COMMENT='Справочник рецептур';

-- Внешние ключи и индексы:
ALTER TABLE recipies 
  ADD CONSTRAINT recipies_fp_code_fk
    FOREIGN KEY (fp_alpha_code, fp_num_code) REFERENCES articles(alpha_code, num_code)
      ON DELETE CASCADE;

CREATE INDEX recipies_articles_idx ON recipies(fp_alpha_code, fp_num_code, rp_alpha_code, rp_num_code);     
     
-- Заполним таблицу:

TRUNCATE TABLE recipies; 

INSERT INTO recipies (fp_alpha_code, fp_num_code, rp_alpha_code, rp_num_code, quantity_per_tn)
VALUES
-- 'A', '4', 'Печенье сдобное Добрянкин класс 210гр'
('A', '4', 'R', '1', 400),
('A', '4', 'R', '2', 200),
('A', '4', 'R', '4', 200),
-- 'A', '10', 'Печенье творожное Сырник с изюмом 180гр'
('A', '10', 'R', '1', 300),
('A', '10', 'R', '2', 150),
('A', '10', 'R', '4', 150),
('A', '10', 'R', '5', 150),
('A', '10', 'R', '7', 50);

SELECT * FROM recipies;


-- 2.6: Производственные линии:

-- Создадим таблицу: 

DROP TABLE IF EXISTS production_lines;
CREATE TABLE production_lines (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  location_code CHAR(4) NOT NULL COMMENT 'Код производственной линии (из справочника Места хранения)', 
  output_per_hour INT COMMENT 'Производительность линии в час', 
  units CHAR(4) COMMENT 'ЕИ',
  employees_num INT COMMENT 'Количество персонала на линии',
  hours_in_shift INT COMMENT 'Продолжительность смены'
 ) COMMENT='Справочник производственных линий с нормативными значениями производительности';
-- некоторые поля могут иметь значение NULL, если не планируется использовать эти параметры.

-- Внешние ключи:
ALTER TABLE production_lines 
  ADD CONSTRAINT pr_lines_location_code_fk
    FOREIGN KEY (location_code) REFERENCES stock_location(location_code) 	
      ON DELETE CASCADE,
  ADD CONSTRAINT pr_lines_unit_fk
    FOREIGN KEY (units) REFERENCES units(short_name)
      ON DELETE CASCADE;

-- Заполним таблицу:

TRUNCATE TABLE production_lines; 

INSERT INTO production_lines (location_code, output_per_hour, units, employees_num, hours_in_shift)
VALUES
('2101', 2000, 'КГ', 5, 11),
('2102', 1500, 'КГ', 7, 11);

SELECT * FROM production_lines;

-- Теперь приступим к созданию журналов. 

-- 2.7. В журнале transactions у нас будут храниться практически все операции, отражающие движение СиМ и ГП, 
-- за исключением факта производства ГП и списания СиМ на производство ГП (эти операции будут отражаться в 
-- следующей таблице shift_report). Создадим эту таблицу и сразу ее заполним.

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  transaction_date DATE NOT NULL COMMENT 'Дата транзакции',
  transaction_code CHAR(4) NOT NULL COMMENT 'Код транзакции',
  location_from CHAR(4) NOT NULL COMMENT 'Откуда',
  loсation_to CHAR(4) NOT NULL COMMENT 'Куда',
  alpha_code CHAR(1) NOT NULL COMMENT 'Буквенная кодировка Товарной позиции',
  num_code CHAR(10) NOT NULL COMMENT 'Цифровая кодировка Товарной позиции',
  quantity INT NOT NULL COMMENT 'Количество ТП'  
) COMMENT='Журнал транзакций';

-- Создадим внешние ключи:
ALTER TABLE transactions 
  ADD CONSTRAINT transactions_transaction_code_fk
    FOREIGN KEY (transaction_code) REFERENCES transaction_directory(transaction_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT transactions_location_from_fk
    FOREIGN KEY (location_from) REFERENCES stock_location(location_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT transactions_location_to_fk
    FOREIGN KEY (loсation_to) REFERENCES stock_location(location_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT transactions_article_code_fk
    FOREIGN KEY (alpha_code, num_code) REFERENCES articles(alpha_code, num_code)
      ON DELETE CASCADE;
     
-- Заполним таблицу:
     
TRUNCATE TABLE transactions; 

INSERT INTO transactions (transaction_date, transaction_code, location_from, loсation_to, alpha_code, num_code,
  quantity)
VALUES
	('2021-01-11', '1000', '8001', '1100', 'R', '1', 100000),
	('2021-01-11', '1000', '8002', '1100', 'R', '2', 50000),
	('2021-01-11', '1000', '8004', '1100', 'R', '4', 50000),
	('2021-01-11', '1000', '8005', '1100', 'R', '5', 25000),
	('2021-01-11', '1000', '8003', '1100', 'R', '7', 10000),
	('2021-01-12', '1020', '1100', '2100', 'R', '1', 25000),
	('2021-01-12', '1020', '1100', '2100', 'R', '2', 15000),
	('2021-01-12', '1020', '1100', '2100', 'R', '4', 15000),
	('2021-01-12', '1020', '1100', '2100', 'R', '5', 7000),
	('2021-01-12', '1020', '1100', '2100', 'R', '7', 4000),
	('2021-01-13', '2050', '2100', '5100', 'A', '4', 20000),
	('2021-01-14', '2050', '2100', '5100', 'A', '10', 15000),
	('2021-01-19', '2050', '2100', '5100', 'A', '4', 21000),
	('2021-01-20', '2050', '2100', '5100', 'A', '10', 16000),
	('2021-01-26', '2050', '2100', '5100', 'A', '4', 22000),
	('2021-01-27', '2050', '2100', '5100', 'A', '10', 16500),
	('2021-01-15', '5000', '5100', '9001', 'A', '4', 5000),
	('2021-01-15', '5000', '5100', '9001', 'A', '10', 13000),
	('2021-01-21', '5000', '5100', '9002', 'A', '4', 20000),
	('2021-01-21', '5000', '5100', '9002', 'A', '10', 16000),
	('2021-01-28', '5000', '5100', '9003', 'A', '4', 18500),
	('2021-01-28', '5000', '5100', '9003', 'A', '10', 8000);

SELECT * FROM transactions; 

-- 2.8. Таблица отчет за смену (ahift_report). Основная причина ее возникновения отдельно от журнала операций
-- в том, что когда мы вносим запись о производстве готовой продукции, нам также необходимо отчитаться о том,
-- какое сырье и в каком количестве мы потратили. При этом это сырье должно появиться на линии (передача со склада
-- производства непосредственно на линию). И я бы хотела, чтобы эта транзакция формировалась автоматически (то есть
-- у нас будет создан триггер, который при появлении записи в shift_report будет добавлять запись о перемещении 
-- сырья в transactions. Для этого нам также нужно сделать такую структуру shift_report, которая позволит отчитаться
-- не только о производстве готовой продукции, но и о расходе сырья в привязке к конкретному факту производства. 

DROP TABLE IF EXISTS shift_report;
CREATE TABLE shift_report (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  transaction_date DATE NOT NULL COMMENT 'Дата транзакции',
  transaction_code CHAR(4) NOT NULL COMMENT 'Код транзакции',
  location_code CHAR(4) NOT NULL COMMENT 'Код производственной линии (из справочника Места хранения)',
  alpha_code CHAR(1) NOT NULL COMMENT 'Буквенный код ТП',
  num_code CHAR(10) NOT NULL COMMENT 'Цифровой код ТП',
  unicode VARCHAR(250) NOT NULL COMMENT 'Уникальный (уникален для каждого факта производства, но не для 
  таблицы в целом) код, который присваивается каждой операции по производству ГП (это позволит затем 
  привязать операции списания сырья в расход к конкретной операции по производству ГП).' ,
  production INT COMMENT 'Произведено продукции в смену в ЕИ линии', 
  employees_act INT COMMENT 'Фактическое количество людей на линиии',
  hours_act INT COMMENT 'Фактическая продолжительность смены'
) COMMENT='Отчет за смену (смена сообщает когда, какую продукцию, в каком объеме, на каких линиях, за какое время 
и каким количеством людей произвели, а также какое количество какого сырья и в каком объеме потратили)';
-- некоторые поля могут иметь значение NULL, если не планируется использовать эти параметры.

-- Создадим внешние ключи:
ALTER TABLE shift_report 
  ADD CONSTRAINT shr_transaction_code_fk
    FOREIGN KEY (transaction_code) REFERENCES transaction_directory(transaction_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT shr_location_code_fk
    FOREIGN KEY (location_code) REFERENCES stock_location(location_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT shr_article_code_fk
    FOREIGN KEY (alpha_code, num_code) REFERENCES articles(alpha_code, num_code)
      ON DELETE CASCADE;

-- Заполним таблицу:

TRUNCATE TABLE shift_report; 

INSERT INTO shift_report (location_code, transaction_date, transaction_code, alpha_code, num_code, unicode, production, employees_act, hours_act)
VALUES
-- A4
('2101', '2021-01-12', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 20000, 5, 11),
('2101', '2021-01-12', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-01-12', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-01-12', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
-- A10
('2102', '2021-01-13', '2021', 'A', '10', CONCAT(location_code, transaction_date, alpha_code, num_code), 15000, 8, 11),
('2102', '2021-01-13', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(250 + RAND()*350)/1000), NULL, NULL),
('2102', '2021-01-13', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-13', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-13', '2020', 'R', '5', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-13', '2020', 'R', '7', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(45 + RAND()*55)/1000), NULL, NULL),
-- A4
('2101', '2021-01-18', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 21000, 5, 11),
('2101', '2021-01-18', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 21000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-01-18', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 21000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-01-18', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 21000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
-- A10
('2102', '2021-01-19', '2021', 'A', '10', CONCAT(location_code, transaction_date, alpha_code, num_code), 16000, 8, 11),
('2102', '2021-01-19', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(250 + RAND()*350)/1000), NULL, NULL),
('2102', '2021-01-19', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-19', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-19', '2020', 'R', '5', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-19', '2020', 'R', '7', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(45 + RAND()*55)/1000), NULL, NULL),
-- A4
('2101', '2021-01-25', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 22000, 6, 11),
('2101', '2021-01-25', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 22000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-01-25', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 22000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-01-25', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 22000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
-- A10
('2102', '2021-01-26', '2021', 'A', '10', CONCAT(location_code, transaction_date, alpha_code, num_code), 16500, 7, 11),
('2102', '2021-01-26', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(250 + RAND()*350)/1000), NULL, NULL),
('2102', '2021-01-26', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-26', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-26', '2020', 'R', '5', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-26', '2020', 'R', '7', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(45 + RAND()*55)/1000), NULL, NULL),
-- A4
('2101', '2021-02-01', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 19000, 5, 11),
('2101', '2021-02-01', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 19000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-02-01', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 19000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-02-01', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 19000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
-- A10
('2102', '2021-02-02', '2021', 'A', '10', CONCAT(location_code, transaction_date, alpha_code, num_code), 14000, 7, 11),
('2102', '2021-02-02', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(250 + RAND()*350)/1000), NULL, NULL),
('2102', '2021-02-02', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-02-02', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-02-02', '2020', 'R', '5', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-02-02', '2020', 'R', '7', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(45 + RAND()*55)/1000), NULL, NULL);

SELECT * FROM shift_report;

-- И сразу создадим триггер, который будет перемещать указанное в отчете количество сырья со склада производства
-- непосредственно на линию, а произведенную продукцию с линии на склад производства.
 
DROP TRIGGER IF EXISTS add_transfer;
CREATE TRIGGER add_transfer AFTER INSERT ON shift_report
FOR EACH ROW 
BEGIN 
IF (NEW.alpha_code = 'R') THEN
  	INSERT INTO transactions (transaction_code, transaction_date, location_from, loсation_to, alpha_code, num_code,
  		quantity)
  	VALUES
  	('2020', NEW.transaction_date, '2100', NEW.location_code, NEW.alpha_code, NEW.num_code, NEW.production);
END IF;
IF (NEW.alpha_code = 'A') THEN
  	INSERT INTO transactions (transaction_code, transaction_date, location_from, loсation_to, alpha_code, num_code,
  		quantity)
  	VALUES
  	('2021', NEW.transaction_date, NEW.location_code, '2100', NEW.alpha_code, NEW.num_code, NEW.production);
END IF;
END;

-- Проверим работу триггера:
INSERT INTO shift_report (location_code, transaction_date, transaction_code, alpha_code, num_code, unicode, production, employees_act, hours_act)
VALUES
-- A4
('2101', '2021-01-29', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 20000, 5, 11),
('2101', '2021-01-29', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-01-29', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-01-29', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL);

SELECT * FROM transactions;

-- По хорошему - было бы неплохо также сделать триггеры на обновление и удаление.

-- 2.9: Таблица цен (prices):
-- Безусловно, это упрощенная модель. Цены не являются статичными. Цены на сырье должны формироваться из документов 
-- оплаты поставщику, а цены на готовую продукцию - достаточно часто актуализироваться. Но мы возьмем простую 
-- модель, в которой цены - статичны.
 
DROP TABLE IF EXISTS prices;
CREATE TABLE prices (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  alpha_code CHAR(1) NOT NULL COMMENT 'Буквенный код ТП',
  num_code CHAR(10) NOT NULL COMMENT 'Цифровой код ТП',
  article_unit_id INT UNSIGNED NOT NULL COMMENT 'ID ЕИ для наименования', 
  price FLOAT COMMENT 'Цена за единицу измерения',
  price_unit_id INT UNSIGNED NOT NULL COMMENT 'ID ЕИ для цены'
  ) COMMENT='Цены';

 -- Создадим внешние ключи:
ALTER TABLE prices 
  ADD CONSTRAINT prices_article_code_fk
    FOREIGN KEY (alpha_code, num_code) REFERENCES articles(alpha_code, num_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT prices_article_unit_id_fk
    FOREIGN KEY (article_unit_id) REFERENCES units(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT prices_price_unit_id_fk
    FOREIGN KEY (price_unit_id) REFERENCES units(id)
      ON DELETE CASCADE; 

ALTER TABLE prices 
  DROP CONSTRAINT prices_article_code_fk,
  DROP CONSTRAINT prices_article_unit_id_fk,
  DROP CONSTRAINT prices_price_unit_id_fk;  
 
 -- Заполним таблицу:
 
 INSERT INTO prices 
	(alpha_code, num_code, article_unit_id, price, price_unit_id)
VALUES
	('A', '1', 1, 23.00, 2),
	('A', '2', 1, 24.50, 2),
	('A', '3', 1, 25.25, 2),
	('A', '4', 1, 28.00, 2),
	('A', '5', 1, 30.00, 2),
	('A', '6', 1, 30.00, 2),
	('A', '7', 1, 18.00, 2),
	('A', '8', 1, 20.00, 2),
	('A', '9', 1, 27.15, 2),
	('A', '10', 1, 28.45, 2),
	('A', '11', 1, 24.50, 2),
	('R', '1', 1, 15.00, 2),
	('R', '2', 1, 20.00, 2),
	('R', '3', 1, 40.00, 2),
	('R', '4', 1, 80.00, 2),
	('R', '5', 1, 25.00, 2),
	('R', '6', 1, 1500.00, 2),
	('R', '7', 1, 800.00, 2),
	('R', '8', 1, 150.00, 2),
	('R', '9', 1, 80.00, 2);

SELECT * FROM prices;

-- 3. Аналитика: 

-- 3.1 Анализ объемов производства готовой продукции по периодам/линиям/ассортименту

-- Для упрощения построения последующих выборок по этому разделу сделаем VIEW.

SELECT * FROM shift_report; 

DROP VIEW IF EXISTS shift_analytics;
CREATE VIEW shift_analytics AS
	SELECT 
		shr.transaction_date AS 'pr_date',
		WEEK(shr.transaction_date) AS 'week_num',
		shr.location_code AS 'line',
		CONCAT(alpha_code, num_code) AS 'article', 
		pl.output_per_hour * shr.hours_act AS 'output_plan',
		shr.production AS 'output_act',
		pl.employees_num AS 'empl_plan',
		shr.employees_act AS 'empl_act'
	FROM shift_report shr
	JOIN production_lines pl ON shr.location_code = pl.location_code
	WHERE shr.alpha_code = 'A';

SELECT * FROM shift_analytics;


-- 3.1.1. Посмотрим фактическое производство по каждой линии по неделям и сравним его с нормативным
-- значением:

SELECT * FROM shift_analytics; 

SELECT 
	IF(GROUPING(line) = 1, 'Все линии', line) AS line,
	IF(GROUPING(week_num) = 1, 'Итого', week_num) AS 'Week №',
	SUM(output_plan) AS 'Plan, kg',
	SUM(output_act) AS 'Actual,kg',
	ROUND((SUM(output_act)/ SUM(output_plan) * 100),1) AS '%'
FROM shift_analytics
GROUP BY line, week_num
WITH ROLLUP;

-- 3.1.2 Посмотрим объемы производства по линии 2101 по неделям за январь и сравним их 
-- с нормативным выпуском:

SELECT 
	IF(GROUPING(week_num)=1,'Total', week_num) AS week_num,
	SUM(output_plan) AS Output_plan,
	SUM(output_act) AS Output_act,
	ROUND((SUM(Output_act)/ SUM(Output_plan) * 100),2) AS 'Output, %'
FROM shift_analytics
WHERE Line = '2101' AND MONTH(pr_date) = 01
GROUP BY week_num
WITH ROLLUP;

-- 3.1.3 Посмотрим объемы производства готовой продукции по дням за январь:

SELECT 
	IF(GROUPING(article) = 1, 'Все наименования', article) AS article,
	IF(GROUPING(pr_date) = 1, 'Итого', pr_date) AS pr_date,
	SUM(output_act) AS 'Actual,kg'	
FROM shift_analytics
GROUP BY article, pr_date
WITH ROLLUP;

-- 3.2. Посмотрим расход сырья на производство ГП и сравним его с нормативным:

-- Для упрощения построения последующей аналитики, создадим VIEW:

SELECT * FROM shift_report; 

DROP VIEW IF EXISTS production;
CREATE VIEW production AS
	SELECT 
		transaction_date, 
		CONCAT(alpha_code, num_code) AS product, 
		production,
		unicode
FROM shift_report
WHERE alpha_code = 'A'; 

SELECT * FROM production;

DROP VIEW IF EXISTS material_usage;
CREATE VIEW material_usage AS
	SELECT 
		CONCAT(alpha_code, num_code) AS material, 
		production AS material_usage,
		unicode
FROM shift_report
WHERE alpha_code = 'R'; 

SELECT * FROM material_usage;

-- а таперь сделаем саму выборку:
SELECT 
	transaction_date,
	product,
	material,
	r2.quantity_per_tn * production/1000 AS normative_usage , 
	material_usage AS actual_usage,
	ROUND((1 - material_usage / (r2.quantity_per_tn * production/1000))*100,1) AS 'difference, %'
FROM production p
JOIN material_usage mu ON p.unicode = mu.unicode
JOIN recipies r2 ON CONCAT(r2.fp_alpha_code, r2.fp_num_code) = product 
	AND CONCAT(r2.rp_alpha_code, r2.rp_num_code) = material
ORDER BY transaction_date; 

-- 3.3. Движение по конкретному наименование и его остаток

-- для этого в начале сделаем VIEW:
DROP VIEW IF EXISTS stock_calculation;
CREATE VIEW stock_calculation AS
SELECT 
	tr.transaction_date AS op_date, 
	tr.transaction_code AS operation_code,
	td.transaction_name AS operation,
	tr.location_from AS location_from,
	tr.loсation_to AS location_to, 
	CONCAT(tr.alpha_code, tr.num_code) AS article, 
	article_name AS article_name, 
	tr.quantity AS quantity,
	CASE WHEN tr.transaction_code = '1000' OR tr.transaction_code = '2021'  THEN tr.quantity ELSE
		CASE WHEN tr.transaction_code = '2020' OR tr.transaction_code = '5000' THEN tr.quantity * -1 ELSE 
		0 
		END 
	END AS stock_movement
FROM transactions tr 
JOIN transaction_directory td ON td.transaction_code = tr.transaction_code
JOIN articles ar ON CONCAT(ar.alpha_code, ar.num_code) = CONCAT(tr.alpha_code, tr.num_code) 
ORDER BY tr.transaction_date ;

SELECT * FROM stock_calculation WHERE article = 'R1';

-- 3.3.1. Теперь посмотрим отчет о движении и остатках, например, по пшеничной муке:

SELECT 
	op_date,
	operation,
	quantity,
	COALESCE(SUM(stock_movement) OVER (ORDER BY op_date 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) AS stock 
FROM stock_calculation
WHERE article = 'R1';

-- 3.4. Посмотрим фактическую сырьевую себестоимость и сравним ее с нормативной:

SELECT 
	transaction_date,
	product,
	SUM(r2.quantity_per_tn * price / 1000) AS norm_cost_per_kg ,
	ROUND(SUM(material_usage * price / production),2) AS act_cost_per_kg
FROM production p
JOIN material_usage mu ON p.unicode = mu.unicode
JOIN recipies r2 ON CONCAT(r2.fp_alpha_code, r2.fp_num_code) = product 
	AND CONCAT(r2.rp_alpha_code, r2.rp_num_code) = material
JOIN prices pr ON CONCAT(pr.alpha_code, pr.num_code) = material
GROUP BY transaction_date, product
ORDER BY transaction_date; 

