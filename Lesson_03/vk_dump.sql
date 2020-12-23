#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Группы';

INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'at', '2015-08-28 20:34:59', '2019-01-14 03:21:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'et', '2012-10-30 18:17:12', '2020-01-20 09:09:32');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'impedit', '2014-05-26 23:23:44', '2012-03-12 21:33:28');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'enim', '2017-10-31 00:10:21', '2013-10-10 22:10:57');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'animi', '2015-09-19 15:22:49', '2012-08-25 10:47:17');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'voluptate', '2017-09-29 19:49:27', '2014-03-12 17:06:00');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'voluptatum', '2019-08-14 21:50:30', '2014-05-28 21:40:55');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'assumenda', '2013-04-26 22:02:06', '2015-05-24 15:39:42');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'magnam', '2016-07-25 15:42:09', '2011-10-23 20:07:59');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'quis', '2014-02-24 03:02:49', '2015-12-31 08:50:31');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'occaecati', '2016-05-03 17:48:32', '2018-12-16 17:33:08');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'suscipit', '2019-10-19 09:21:30', '2017-09-02 21:42:39');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'debitis', '2018-01-01 12:19:30', '2013-03-21 03:05:24');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'sint', '2012-08-03 09:59:56', '2016-02-17 02:59:54');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'rerum', '2018-06-17 14:14:01', '2011-10-02 08:41:21');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'quaerat', '2019-04-26 21:23:22', '2013-10-01 15:48:38');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'nihil', '2013-03-11 01:51:36', '2018-10-25 10:48:41');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'ut', '2015-11-21 05:14:54', '2016-08-19 02:59:12');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'corporis', '2017-10-09 05:52:05', '2020-06-13 10:52:23');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'quia', '2019-11-04 11:29:04', '2017-02-04 11:44:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (21, 'omnis', '2014-04-05 08:33:06', '2011-09-08 20:18:52');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (22, 'exercitationem', '2017-01-01 07:47:49', '2016-05-03 09:12:11');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (23, 'ratione', '2015-12-25 14:34:24', '2015-04-14 07:11:05');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (24, 'voluptas', '2018-12-04 18:22:15', '2018-08-06 19:16:55');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (25, 'sunt', '2016-06-19 04:47:48', '2013-12-09 12:08:03');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (26, 'sit', '2017-07-17 21:35:30', '2013-04-06 15:02:25');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (27, 'natus', '2017-04-12 14:36:54', '2015-01-12 01:51:31');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (28, 'reiciendis', '2015-08-30 16:42:25', '2014-12-20 22:43:08');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (29, 'nesciunt', '2020-07-14 13:15:59', '2018-05-19 05:47:52');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (30, 'dolorum', '2014-12-20 23:29:12', '2011-08-03 13:24:29');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (31, 'eligendi', '2014-02-28 01:42:27', '2014-01-26 14:45:15');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (32, 'labore', '2012-11-21 17:46:46', '2016-06-28 05:30:16');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (33, 'dignissimos', '2018-06-19 07:25:06', '2020-06-20 03:07:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (34, 'iste', '2016-01-28 13:51:45', '2011-02-21 07:07:25');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (35, 'iusto', '2018-07-19 10:21:14', '2012-06-04 12:30:44');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (36, 'velit', '2019-11-30 19:34:45', '2015-05-12 08:26:00');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (37, 'cumque', '2018-09-16 23:42:00', '2012-01-27 02:44:40');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (38, 'alias', '2016-03-18 12:14:38', '2011-01-04 09:39:37');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (39, 'quidem', '2018-10-11 11:29:02', '2020-09-24 21:21:40');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (40, 'vitae', '2011-11-06 00:54:40', '2012-08-26 10:44:15');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (41, 'eum', '2017-09-03 18:16:40', '2013-07-05 19:55:15');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (42, 'incidunt', '2013-12-21 14:13:30', '2017-08-27 03:03:36');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (43, 'provident', '2019-07-18 08:08:18', '2019-04-02 06:24:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (44, 'dolorem', '2018-04-02 02:54:10', '2020-11-22 11:56:45');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (45, 'molestias', '2015-11-04 18:58:58', '2020-04-25 12:04:21');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (46, 'voluptatem', '2018-10-04 07:06:57', '2017-04-19 04:30:07');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (47, 'esse', '2018-01-14 02:21:58', '2014-10-21 11:47:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (48, 'cum', '2014-09-30 23:15:39', '2017-08-05 13:25:27');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (49, 'iure', '2012-07-26 13:09:52', '2016-02-21 21:56:40');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (50, 'dicta', '2018-06-18 16:56:08', '2019-09-21 12:24:34');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (51, 'accusantium', '2011-09-28 22:10:29', '2014-07-28 16:11:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (52, 'nulla', '2014-11-01 01:52:24', '2014-06-21 06:40:02');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (53, 'repellendus', '2012-04-16 12:34:56', '2019-05-18 22:28:52');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (54, 'perferendis', '2011-11-10 23:58:16', '2016-04-05 14:12:05');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (55, 'possimus', '2017-07-01 01:09:46', '2013-06-02 16:07:26');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (56, 'maiores', '2015-01-26 03:11:20', '2019-07-15 02:08:23');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (57, 'odio', '2011-04-15 00:34:01', '2018-06-02 15:04:00');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (58, 'nobis', '2011-03-29 10:45:33', '2011-03-01 01:31:01');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (59, 'quod', '2015-01-25 04:31:14', '2012-07-06 22:35:43');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (60, 'tempore', '2016-06-25 08:34:07', '2012-07-14 11:10:47');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (61, 'optio', '2019-07-15 09:21:12', '2017-11-10 09:39:49');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (62, 'magni', '2019-07-18 21:18:46', '2012-11-10 17:25:36');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (63, 'qui', '2013-06-02 23:59:03', '2011-04-05 00:47:46');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (64, 'hic', '2013-08-26 00:46:57', '2015-10-01 10:14:01');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (65, 'quisquam', '2015-07-03 15:28:57', '2020-01-13 04:49:46');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (66, 'modi', '2016-10-03 11:02:41', '2018-06-14 16:18:57');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (67, 'tenetur', '2015-08-21 13:22:16', '2020-02-29 10:47:34');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (68, 'in', '2012-12-15 06:52:33', '2014-09-09 06:57:45');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (69, 'expedita', '2020-09-28 15:23:05', '2020-08-29 13:36:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (70, 'accusamus', '2018-04-05 21:29:55', '2014-08-14 16:22:55');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (71, 'voluptatibus', '2019-10-27 11:36:11', '2012-05-20 00:46:42');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (72, 'molestiae', '2019-06-08 02:15:01', '2016-03-20 00:14:35');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (73, 'minima', '2020-03-22 01:16:14', '2013-01-31 17:06:30');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (74, 'consequuntur', '2016-03-20 22:12:15', '2020-01-14 05:19:18');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (75, 'sequi', '2013-12-01 13:50:53', '2012-10-08 13:50:11');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (76, 'eveniet', '2011-10-18 21:59:31', '2016-07-19 01:12:41');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (77, 'aut', '2013-07-28 15:14:36', '2019-04-26 11:49:21');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (78, 'est', '2016-10-01 08:24:13', '2019-09-07 18:05:41');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (79, 'sed', '2016-05-21 09:54:38', '2020-01-14 01:45:46');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (80, 'consequatur', '2016-12-13 11:25:32', '2015-03-29 00:26:15');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (81, 'laboriosam', '2015-06-23 06:14:02', '2016-01-26 22:22:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (82, 'odit', '2013-09-04 10:51:23', '2020-11-01 14:06:01');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (83, 'ipsa', '2018-04-26 16:09:59', '2016-12-24 15:10:01');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (84, 'ipsum', '2016-06-21 01:21:12', '2016-01-16 19:50:30');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (85, 'amet', '2019-06-10 04:38:10', '2018-07-15 20:25:18');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (86, 'libero', '2019-01-27 06:20:55', '2015-12-28 23:46:01');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (87, 'corrupti', '2019-05-16 14:23:05', '2020-05-11 13:16:50');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (88, 'blanditiis', '2016-11-30 14:50:05', '2014-08-31 04:09:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (89, 'soluta', '2017-12-03 03:38:38', '2013-10-27 21:41:37');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (90, 'itaque', '2013-09-11 01:02:39', '2018-07-20 20:45:16');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (91, 'atque', '2017-09-29 02:48:35', '2013-07-04 21:07:50');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (92, 'fuga', '2019-01-24 10:28:48', '2015-05-18 00:50:29');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (93, 'dolor', '2018-01-01 19:06:55', '2011-12-15 17:38:38');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (94, 'dolore', '2019-08-15 05:01:17', '2017-10-09 08:21:16');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (95, 'culpa', '2017-03-27 09:19:55', '2016-05-01 16:02:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (96, 'praesentium', '2020-10-28 22:24:54', '2016-08-23 06:10:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (97, 'unde', '2012-03-14 12:28:22', '2013-10-27 05:13:03');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (98, 'ab', '2011-11-26 19:42:36', '2013-01-21 09:49:22');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (99, 'explicabo', '2018-01-14 12:21:31', '2019-04-15 08:22:15');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (100, 'non', '2013-11-17 05:18:12', '2013-07-17 22:40:32');


#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на группу',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';

INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (1, 1, '2011-01-04 09:18:22');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (2, 2, '2017-05-23 11:00:23');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (3, 3, '2011-12-12 00:48:16');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (4, 4, '2012-05-26 02:34:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (5, 5, '2017-11-13 23:01:57');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (6, 6, '2018-12-10 08:29:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (7, 7, '2017-03-26 18:23:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (8, 8, '2015-05-17 14:25:17');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (9, 9, '2016-04-04 19:14:17');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (10, 10, '2012-03-21 02:45:49');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (11, 11, '2011-05-20 08:14:32');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (12, 12, '2016-12-11 00:04:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (13, 13, '2019-09-05 01:08:27');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (14, 14, '2018-07-26 11:28:34');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (15, 15, '2016-05-26 09:53:36');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (16, 16, '2011-08-13 14:51:05');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (17, 17, '2019-11-18 21:41:39');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (18, 18, '2020-12-04 16:17:49');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (19, 19, '2015-05-30 02:49:30');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (20, 20, '2012-10-21 09:19:09');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (21, 21, '2011-10-23 18:32:05');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (22, 22, '2013-08-19 19:24:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (23, 23, '2016-11-13 22:42:36');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (24, 24, '2012-02-27 11:49:34');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (25, 25, '2015-08-28 03:09:46');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (26, 26, '2011-04-13 11:44:02');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (27, 27, '2015-03-12 04:36:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (28, 28, '2011-04-30 03:24:57');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (29, 29, '2013-05-12 09:26:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (30, 30, '2020-04-07 07:34:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (31, 31, '2011-09-09 18:52:58');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (32, 32, '2018-10-16 01:21:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (33, 33, '2017-09-02 22:48:05');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (34, 34, '2018-05-19 01:46:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (35, 35, '2011-11-28 22:02:50');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (36, 36, '2019-01-13 04:32:53');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (37, 37, '2016-07-19 12:25:34');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (38, 38, '2014-10-24 19:22:49');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (39, 39, '2015-03-20 16:28:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (40, 40, '2016-06-29 16:11:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (41, 41, '2011-10-25 01:44:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (42, 42, '2020-06-06 11:39:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (43, 43, '2013-04-01 14:58:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (44, 44, '2011-04-02 05:37:39');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (45, 45, '2020-02-15 19:01:30');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (46, 46, '2017-10-25 19:59:38');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (47, 47, '2018-04-30 10:36:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (48, 48, '2018-03-12 07:04:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (49, 49, '2020-03-22 00:37:16');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (50, 50, '2014-07-23 09:31:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (51, 51, '2017-01-27 18:02:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (52, 52, '2016-03-22 04:12:36');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (53, 53, '2020-12-20 06:41:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (54, 54, '2018-03-22 17:14:03');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (55, 55, '2015-10-16 14:17:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (56, 56, '2016-08-22 23:50:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (57, 57, '2012-11-25 18:28:48');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (58, 58, '2016-06-24 01:30:32');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (59, 59, '2016-09-19 06:55:41');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (60, 60, '2018-04-10 12:39:50');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (61, 61, '2014-10-18 23:56:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (62, 62, '2012-09-20 17:21:16');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (63, 63, '2020-12-07 07:04:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (64, 64, '2015-07-09 02:14:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (65, 65, '2017-06-06 04:57:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (66, 66, '2011-11-05 13:31:24');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (67, 67, '2013-01-30 07:12:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (68, 68, '2018-04-10 00:21:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (69, 69, '2016-03-07 19:27:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (70, 70, '2018-05-25 00:54:54');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (71, 71, '2016-06-30 14:43:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (72, 72, '2013-08-27 02:34:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (73, 73, '2018-11-09 14:39:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (74, 74, '2018-03-11 01:14:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (75, 75, '2016-07-02 05:37:09');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (76, 76, '2019-07-20 23:19:22');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (77, 77, '2016-04-24 17:00:12');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (78, 78, '2015-08-12 20:28:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (79, 79, '2017-01-17 16:39:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (80, 80, '2019-04-08 06:57:26');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (81, 81, '2019-12-22 13:35:46');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (82, 82, '2015-09-23 19:26:09');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (83, 83, '2016-07-25 20:01:16');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (84, 84, '2019-10-10 06:23:27');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (85, 85, '2017-09-02 10:36:33');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (86, 86, '2015-07-30 18:40:03');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (87, 87, '2018-10-31 21:24:54');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (88, 88, '2019-06-02 17:15:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (89, 89, '2015-08-31 18:49:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (90, 90, '2011-10-22 08:59:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (91, 91, '2020-10-29 10:30:14');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (92, 92, '2018-06-19 16:53:23');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (93, 93, '2020-11-09 23:57:22');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (94, 94, '2017-02-23 07:57:44');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (95, 95, '2020-03-14 18:23:49');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (96, 96, '2012-11-26 21:15:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (97, 97, '2013-08-14 02:19:48');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (98, 98, '2015-02-23 05:59:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (99, 99, '2011-02-27 06:09:30');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (100, 100, '2015-10-27 07:31:12');


#
# TABLE STRUCTURE FOR: friendship
#

DROP TABLE IF EXISTS `friendship`;

CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `status_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на статус (текущее состояние) отношений',
  `requested_at` datetime DEFAULT current_timestamp() COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Таблица дружбы';

INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (1, 1, 1, '2020-07-18 18:33:52', '2015-06-18 22:35:26', '2012-09-07 07:42:46', '2012-02-19 12:56:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (2, 2, 2, '2015-12-14 08:26:36', '2011-09-25 20:45:07', '2011-10-17 12:36:23', '2013-02-16 00:02:38');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (3, 3, 3, '2011-03-04 19:10:47', '2016-07-09 16:13:02', '2018-12-08 04:56:46', '2013-12-18 19:13:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (4, 4, 4, '2012-05-08 17:58:33', '2012-06-26 22:52:37', '2020-10-18 20:37:10', '2012-10-01 16:37:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (5, 5, 5, '2012-01-17 14:25:04', '2013-09-05 04:57:52', '2018-02-26 10:47:23', '2020-02-27 15:34:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (6, 6, 1, '2020-05-11 13:39:39', '2016-04-08 07:39:38', '2016-05-05 21:42:36', '2012-06-13 22:47:29');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (7, 7, 2, '2017-03-24 14:42:28', '2019-05-10 08:45:34', '2011-04-07 21:17:08', '2011-01-17 14:42:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (8, 8, 3, '2016-04-03 19:28:12', '2016-04-15 05:24:27', '2018-08-05 12:49:03', '2016-09-10 13:54:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (9, 9, 4, '2016-10-30 23:47:47', '2011-10-10 03:00:22', '2020-08-29 20:03:08', '2011-03-05 05:54:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (10, 10, 5, '2016-10-25 14:29:54', '2011-02-10 11:06:20', '2014-10-29 12:09:47', '2017-05-20 05:21:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (11, 11, 1, '2019-05-13 23:51:59', '2013-03-28 10:43:58', '2018-09-12 02:02:04', '2013-05-10 11:05:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (12, 12, 2, '2019-03-27 23:33:33', '2017-07-18 15:49:22', '2013-05-08 14:08:39', '2016-06-15 06:13:57');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (13, 13, 3, '2017-03-05 04:35:02', '2020-09-28 21:08:29', '2013-05-09 02:17:34', '2012-07-19 17:37:45');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (14, 14, 4, '2017-03-10 08:45:09', '2016-03-31 17:32:22', '2019-01-20 02:47:58', '2013-12-18 21:13:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (15, 15, 5, '2015-02-14 09:36:46', '2013-03-10 08:23:36', '2019-03-11 21:30:04', '2016-08-18 22:09:01');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (16, 16, 1, '2013-05-18 12:17:01', '2017-12-28 08:10:28', '2012-07-30 07:53:09', '2019-01-18 20:20:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (17, 17, 2, '2017-12-28 06:43:12', '2012-07-07 09:03:12', '2016-05-14 23:12:09', '2014-12-12 10:50:57');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (18, 18, 3, '2011-07-31 17:43:36', '2019-10-22 20:15:16', '2017-05-18 18:09:23', '2017-11-30 04:46:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (19, 19, 4, '2013-01-08 08:07:08', '2020-12-15 07:36:53', '2012-07-09 16:09:18', '2020-02-27 16:58:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (20, 20, 5, '2015-11-16 20:41:33', '2011-07-15 00:25:12', '2013-08-17 17:36:44', '2013-08-03 09:25:16');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (21, 21, 1, '2011-09-13 07:55:26', '2020-01-23 12:50:29', '2020-08-29 19:08:13', '2017-08-14 18:05:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (22, 22, 2, '2018-12-24 16:20:57', '2020-10-16 11:30:22', '2015-03-23 06:53:52', '2019-03-27 22:19:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (23, 23, 3, '2018-10-26 01:14:08', '2014-05-09 14:58:30', '2018-08-20 06:59:13', '2018-10-16 14:17:13');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (24, 24, 4, '2018-11-11 01:31:14', '2019-10-27 00:16:55', '2015-12-29 12:06:08', '2019-07-04 08:53:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (25, 25, 5, '2013-03-26 09:52:04', '2013-10-05 11:51:56', '2014-10-09 12:24:46', '2015-03-14 05:09:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (26, 26, 1, '2018-06-16 09:33:52', '2020-06-10 06:43:37', '2016-09-29 21:55:47', '2019-11-22 07:43:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (27, 27, 2, '2012-03-10 01:41:55', '2012-04-07 15:52:52', '2012-01-13 08:05:21', '2013-05-16 17:06:16');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (28, 28, 3, '2014-02-08 05:03:55', '2016-11-17 17:50:03', '2018-12-04 06:44:25', '2019-05-24 23:00:17');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (29, 29, 4, '2016-04-08 19:18:58', '2017-12-05 04:16:43', '2016-04-19 18:11:35', '2012-12-18 06:43:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (30, 30, 5, '2013-10-08 21:57:32', '2011-05-23 02:43:59', '2020-12-22 15:02:25', '2014-09-16 03:47:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (31, 31, 1, '2018-03-16 04:19:10', '2014-04-28 15:06:51', '2012-06-25 10:01:23', '2014-10-15 13:51:27');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (32, 32, 2, '2013-10-29 02:04:32', '2019-04-10 17:49:51', '2013-02-10 11:09:10', '2013-09-10 19:39:45');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (33, 33, 3, '2016-11-06 01:50:18', '2015-07-04 02:56:16', '2012-09-12 17:35:12', '2016-07-01 00:23:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (34, 34, 4, '2019-08-28 17:39:05', '2020-07-30 18:27:15', '2015-07-15 15:57:43', '2018-12-25 16:55:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (35, 35, 5, '2011-11-05 06:18:18', '2017-03-26 21:23:44', '2016-01-21 01:42:50', '2020-11-28 06:28:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (36, 36, 1, '2019-12-16 07:08:04', '2012-04-16 16:56:18', '2012-01-04 12:10:39', '2011-06-28 17:13:35');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (37, 37, 2, '2017-09-05 05:53:45', '2015-12-24 18:13:00', '2011-07-11 12:00:31', '2016-12-29 04:20:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (38, 38, 3, '2015-02-17 16:25:07', '2017-03-29 20:08:21', '2014-05-11 11:50:08', '2015-01-08 05:12:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (39, 39, 4, '2012-07-30 03:29:10', '2018-01-28 22:52:35', '2013-12-01 01:09:01', '2017-07-29 22:31:13');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (40, 40, 5, '2015-08-15 20:09:31', '2016-03-05 06:55:30', '2020-03-20 15:16:16', '2015-10-03 12:26:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (41, 41, 1, '2013-10-05 14:07:54', '2019-11-18 06:38:41', '2017-11-26 03:46:45', '2017-07-10 13:43:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (42, 42, 2, '2014-04-04 00:04:54', '2017-09-26 03:48:38', '2012-04-03 09:10:10', '2012-06-14 04:19:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (43, 43, 3, '2012-03-15 09:00:40', '2016-06-30 12:45:31', '2014-03-20 03:15:02', '2013-09-18 22:04:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (44, 44, 4, '2017-04-06 23:11:19', '2016-12-10 06:13:20', '2020-01-16 11:25:18', '2011-03-30 08:41:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (45, 45, 5, '2017-01-09 02:40:18', '2014-04-12 09:03:48', '2020-11-04 18:26:16', '2013-09-04 18:52:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (46, 46, 1, '2013-09-03 17:59:15', '2016-10-11 22:23:39', '2019-01-21 13:21:50', '2018-12-24 18:39:35');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (47, 47, 2, '2011-11-26 12:13:52', '2018-03-12 01:25:46', '2015-06-20 09:05:37', '2012-12-22 12:45:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (48, 48, 3, '2016-04-18 18:51:38', '2014-05-22 01:44:10', '2017-06-10 12:29:35', '2012-07-01 11:08:27');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (49, 49, 4, '2013-01-11 04:40:00', '2020-03-09 09:33:19', '2012-07-01 09:16:42', '2011-05-03 03:33:52');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (50, 50, 5, '2012-08-06 15:46:07', '2020-07-04 07:44:42', '2017-03-08 04:32:38', '2018-01-31 11:40:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (51, 51, 1, '2013-11-24 00:16:07', '2019-02-28 19:05:27', '2020-04-03 01:27:17', '2015-10-17 14:44:55');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (52, 52, 2, '2020-05-17 20:52:35', '2019-01-17 05:15:24', '2019-01-24 01:52:56', '2012-11-30 23:29:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (53, 53, 3, '2019-01-01 08:35:09', '2014-10-01 07:07:16', '2011-11-30 10:28:54', '2011-03-10 16:38:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (54, 54, 4, '2013-01-12 02:10:16', '2017-07-06 20:06:03', '2017-11-28 14:54:21', '2014-05-31 11:43:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (55, 55, 5, '2011-04-07 08:43:53', '2011-12-22 09:27:18', '2014-05-25 09:46:42', '2015-10-07 02:13:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (56, 56, 1, '2017-08-31 07:15:06', '2014-04-15 07:48:06', '2018-12-24 10:11:00', '2011-04-23 18:04:17');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (57, 57, 2, '2013-05-24 06:25:08', '2017-05-29 15:19:15', '2017-12-15 11:26:42', '2017-07-21 12:49:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (58, 58, 3, '2013-10-24 01:47:07', '2020-07-28 11:02:59', '2019-05-01 02:06:20', '2017-07-11 14:31:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (59, 59, 4, '2017-02-27 16:25:51', '2013-05-18 01:37:46', '2019-04-13 04:51:16', '2019-07-18 03:24:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (60, 60, 5, '2017-12-19 01:13:06', '2016-02-22 20:20:15', '2015-04-01 04:28:01', '2012-10-24 04:53:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (61, 61, 1, '2018-05-05 10:04:12', '2017-07-27 21:40:12', '2015-05-08 14:56:24', '2011-06-13 12:15:57');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (62, 62, 2, '2015-08-09 07:58:07', '2017-02-03 08:03:50', '2019-07-16 19:43:03', '2013-07-11 09:42:21');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (63, 63, 3, '2018-11-01 02:05:26', '2014-12-01 12:05:11', '2016-08-03 08:47:57', '2011-07-30 16:12:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (64, 64, 4, '2017-07-22 11:50:36', '2014-07-03 18:31:33', '2014-07-22 10:49:57', '2011-06-23 05:42:22');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (65, 65, 5, '2019-03-23 15:35:05', '2012-10-01 03:44:48', '2019-12-20 02:18:48', '2020-06-20 07:46:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (66, 66, 1, '2013-06-26 18:43:21', '2016-09-10 08:25:30', '2018-12-23 23:01:21', '2013-08-20 07:50:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (67, 67, 2, '2014-07-29 23:42:49', '2013-11-30 00:41:56', '2020-04-01 16:55:19', '2016-07-15 14:23:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (68, 68, 3, '2019-12-13 01:39:10', '2017-04-27 02:52:04', '2012-02-12 23:31:41', '2019-03-28 12:27:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (69, 69, 4, '2018-09-09 00:38:49', '2017-03-01 16:31:39', '2013-05-25 02:58:16', '2019-05-06 13:28:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (70, 70, 5, '2014-03-15 13:29:09', '2019-09-24 05:57:42', '2015-12-29 13:57:23', '2015-12-21 15:16:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (71, 71, 1, '2020-01-30 13:55:57', '2015-01-21 02:35:34', '2011-09-14 09:41:23', '2014-07-16 21:33:45');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (72, 72, 2, '2018-04-25 03:26:09', '2013-02-14 02:22:41', '2013-01-16 19:17:14', '2011-11-09 11:33:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (73, 73, 3, '2016-03-06 18:03:34', '2013-10-30 03:10:42', '2020-09-21 18:11:53', '2012-04-10 06:41:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (74, 74, 4, '2020-10-21 20:14:26', '2017-04-29 12:18:13', '2012-05-01 14:10:49', '2018-01-29 05:21:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (75, 75, 5, '2016-09-25 11:40:41', '2017-11-02 05:11:29', '2017-12-15 21:39:32', '2015-02-08 02:02:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (76, 76, 1, '2015-03-14 06:12:31', '2012-09-11 09:32:51', '2012-05-02 06:05:15', '2017-06-14 03:09:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (77, 77, 2, '2012-10-05 12:40:25', '2011-04-20 23:10:12', '2017-08-20 17:05:13', '2020-06-30 02:49:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (78, 78, 3, '2011-07-07 21:58:32', '2020-04-10 18:02:12', '2018-05-08 04:13:06', '2014-09-09 14:49:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (79, 79, 4, '2018-03-17 16:45:19', '2013-12-10 10:39:11', '2019-02-27 21:35:21', '2013-07-21 14:17:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (80, 80, 5, '2012-10-23 18:56:01', '2017-05-22 18:16:48', '2012-08-13 08:02:24', '2019-08-10 20:27:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (81, 81, 1, '2011-10-31 10:50:53', '2011-03-05 13:17:12', '2018-10-19 03:38:24', '2019-09-19 05:28:39');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (82, 82, 2, '2013-09-01 02:18:19', '2015-06-15 19:45:58', '2017-05-07 06:54:27', '2019-01-25 22:53:27');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (83, 83, 3, '2018-01-16 12:18:55', '2020-03-06 13:40:26', '2014-01-11 01:38:19', '2017-10-27 06:39:40');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (84, 84, 4, '2018-12-06 20:18:18', '2011-10-11 15:47:55', '2015-06-30 05:10:53', '2016-12-22 23:13:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (85, 85, 5, '2019-06-07 15:05:12', '2016-07-28 05:49:36', '2016-06-17 02:33:27', '2018-11-02 09:10:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (86, 86, 1, '2018-04-24 22:26:44', '2018-03-25 20:15:25', '2018-09-02 05:08:06', '2011-09-25 15:19:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (87, 87, 2, '2019-01-11 14:14:44', '2020-01-21 22:41:19', '2014-01-02 22:51:40', '2017-12-02 15:33:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (88, 88, 3, '2012-02-04 00:36:27', '2017-11-20 14:05:56', '2011-06-15 09:20:12', '2011-05-09 21:57:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (89, 89, 4, '2012-07-16 13:12:26', '2014-03-31 22:10:46', '2015-01-11 05:55:57', '2019-10-07 21:14:40');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (90, 90, 5, '2018-07-23 12:52:16', '2018-11-06 19:16:14', '2018-12-03 04:16:42', '2014-10-31 03:45:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (91, 91, 1, '2011-12-30 08:30:11', '2019-09-18 07:12:36', '2017-01-06 04:36:32', '2019-01-31 01:06:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (92, 92, 2, '2011-03-24 20:42:53', '2011-05-13 20:18:36', '2015-08-09 09:47:55', '2018-02-01 22:17:15');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (93, 93, 3, '2014-04-24 10:22:19', '2015-10-23 12:18:15', '2017-12-02 00:40:59', '2011-05-20 10:36:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (94, 94, 4, '2011-11-26 14:47:37', '2012-03-31 17:28:24', '2017-01-29 03:19:24', '2020-02-21 18:51:39');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (95, 95, 5, '2014-06-12 19:37:25', '2013-08-26 00:35:58', '2014-02-04 11:52:26', '2012-09-13 02:08:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (96, 96, 1, '2013-08-12 16:49:27', '2017-09-21 19:03:20', '2018-04-21 14:34:17', '2020-11-28 06:48:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (97, 97, 2, '2018-05-23 15:03:00', '2012-06-12 02:51:26', '2018-09-20 22:26:46', '2016-08-15 10:50:01');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (98, 98, 3, '2012-10-08 15:23:50', '2015-03-26 20:10:25', '2014-07-19 05:14:33', '2012-02-08 15:28:39');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (99, 99, 4, '2019-08-15 22:02:17', '2014-02-25 09:49:24', '2014-07-09 01:13:58', '2020-08-31 08:25:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (100, 100, 5, '2011-12-11 19:31:44', '2011-01-28 15:58:25', '2012-07-20 02:24:45', '2013-12-15 16:48:34');


#
# TABLE STRUCTURE FOR: friendship_statuses
#

DROP TABLE IF EXISTS `friendship_statuses`;

CREATE TABLE `friendship_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Статусы дружбы';

INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'in', '2015-10-15 05:53:20', '2015-10-31 02:55:19');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'rem', '2012-06-17 14:31:59', '2017-02-14 04:16:45');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'et', '2020-02-22 12:07:20', '2011-08-26 06:24:33');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'hic', '2019-02-02 03:29:20', '2018-11-18 12:11:29');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'at', '2019-06-01 07:43:34', '2011-05-19 11:46:58');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя, который загрузил файл',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Путь к файлу',
  `size` int(11) NOT NULL COMMENT 'Размер файла',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Метаданные файла' CHECK (json_valid(`metadata`)),
  `media_type_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Медиафайлы';

INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (1, 1, 'et', 51864, NULL, 1, '2017-06-15 03:27:58', '2012-06-02 09:37:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (2, 2, 'ipsam', 43, NULL, 2, '2014-12-20 15:34:20', '2016-11-06 21:24:23');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (3, 3, 'odio', 802322189, NULL, 3, '2011-11-01 04:18:58', '2011-06-08 04:05:56');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (4, 4, 'in', 39, NULL, 4, '2020-11-13 17:17:09', '2013-10-08 08:00:35');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (5, 5, 'voluptates', 1204863, NULL, 5, '2012-03-04 13:25:05', '2016-09-16 09:39:49');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (6, 6, 'et', 3019381, NULL, 6, '2017-01-13 12:44:08', '2012-11-23 13:05:04');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (7, 7, 'pariatur', 4, NULL, 1, '2019-06-01 18:23:16', '2018-11-03 01:02:39');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (8, 8, 'totam', 214917773, NULL, 2, '2013-06-11 15:14:40', '2018-01-19 17:24:58');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (9, 9, 'esse', 31908457, NULL, 3, '2013-07-30 09:04:43', '2015-09-14 21:18:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (10, 10, 'est', 5351855, NULL, 4, '2015-07-10 15:09:02', '2013-05-03 22:15:29');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (11, 11, 'tenetur', 331, NULL, 5, '2020-10-16 20:52:01', '2011-03-30 12:20:19');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (12, 12, 'aut', 66853, NULL, 6, '2015-06-30 15:24:59', '2020-10-04 21:15:53');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (13, 13, 'ipsum', 72, NULL, 1, '2012-12-19 23:42:32', '2014-07-19 07:15:24');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (14, 14, 'ut', 975231898, NULL, 2, '2015-04-11 07:01:49', '2020-02-19 01:56:41');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (15, 15, 'et', 948, NULL, 3, '2014-12-01 07:36:26', '2017-12-08 04:45:59');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (16, 16, 'id', 300213, NULL, 4, '2014-03-31 13:18:48', '2017-04-03 04:43:30');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (17, 17, 'aliquam', 829327822, NULL, 5, '2012-05-26 20:52:33', '2019-09-04 05:10:01');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (18, 18, 'ut', 57806765, NULL, 6, '2013-08-11 01:31:11', '2015-07-11 23:50:15');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (19, 19, 'sit', 524792922, NULL, 1, '2020-08-10 23:11:57', '2011-04-08 09:31:36');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (20, 20, 'fugit', 771963, NULL, 2, '2012-09-03 13:50:45', '2016-11-02 02:57:26');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (21, 21, 'minima', 3198846, NULL, 3, '2014-06-18 02:39:50', '2014-03-28 16:19:44');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (22, 22, 'sit', 2796904, NULL, 4, '2015-01-11 04:46:51', '2014-12-22 14:01:05');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (23, 23, 'praesentium', 8430, NULL, 5, '2012-11-20 09:02:15', '2012-07-02 04:57:20');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (24, 24, 'ipsa', 56989746, NULL, 6, '2014-05-21 03:56:21', '2011-01-15 00:58:52');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (25, 25, 'facere', 1442413, NULL, 1, '2019-07-06 23:29:56', '2015-11-18 14:29:30');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (26, 26, 'officiis', 530574, NULL, 2, '2019-01-21 08:26:04', '2012-12-09 15:25:05');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (27, 27, 'nobis', 7, NULL, 3, '2016-09-09 01:27:37', '2012-12-21 15:07:58');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (28, 28, 'veritatis', 850131, NULL, 4, '2020-10-08 08:09:03', '2011-01-21 12:23:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (29, 29, 'voluptatem', 511040, NULL, 5, '2020-10-13 16:38:20', '2016-08-01 13:05:09');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (30, 30, 'quam', 90300, NULL, 6, '2019-07-05 10:35:51', '2017-02-26 09:01:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (31, 31, 'vel', 5, NULL, 1, '2017-07-17 02:33:17', '2013-03-20 01:41:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (32, 32, 'illum', 3407, NULL, 2, '2015-10-05 16:27:57', '2018-03-11 08:13:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (33, 33, 'quam', 620, NULL, 3, '2020-03-26 18:51:16', '2012-12-31 00:05:56');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (34, 34, 'eveniet', 99183, NULL, 4, '2017-08-07 03:35:14', '2014-06-13 16:17:36');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (35, 35, 'impedit', 6344, NULL, 5, '2012-12-01 08:25:11', '2014-06-24 02:56:21');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (36, 36, 'aspernatur', 12, NULL, 6, '2016-09-16 09:36:55', '2016-08-07 13:10:54');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (37, 37, 'voluptatem', 3, NULL, 1, '2012-01-22 07:59:05', '2012-01-29 00:23:34');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (38, 38, 'consectetur', 32173, NULL, 2, '2018-06-27 14:47:44', '2015-08-25 01:44:14');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (39, 39, 'omnis', 2468674, NULL, 3, '2018-07-23 03:13:01', '2018-07-30 17:28:54');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (40, 40, 'est', 37, NULL, 4, '2018-03-14 08:00:56', '2017-04-14 16:50:35');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (41, 41, 'incidunt', 7, NULL, 5, '2018-12-14 21:27:55', '2019-03-12 11:20:39');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (42, 42, 'distinctio', 288000104, NULL, 6, '2013-03-15 21:43:26', '2014-07-01 11:19:56');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (43, 43, 'dolorem', 6, NULL, 1, '2016-08-14 01:14:07', '2018-06-19 09:44:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (44, 44, 'ad', 1075950, NULL, 2, '2018-04-02 18:06:31', '2016-11-03 13:19:09');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (45, 45, 'voluptatem', 3278069, NULL, 3, '2011-02-11 01:47:39', '2019-01-21 11:20:34');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (46, 46, 'vero', 1853, NULL, 4, '2015-10-10 14:27:01', '2020-10-30 23:10:17');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (47, 47, 'id', 629685, NULL, 5, '2020-01-03 06:20:48', '2011-12-27 12:31:55');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (48, 48, 'praesentium', 192522, NULL, 6, '2018-06-10 05:10:41', '2018-08-31 21:48:30');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (49, 49, 'atque', 3880, NULL, 1, '2015-01-06 10:48:47', '2012-03-15 18:00:45');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (50, 50, 'tenetur', 1825, NULL, 2, '2016-11-23 14:33:00', '2019-10-19 02:27:08');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (51, 51, 'laborum', 1202, NULL, 3, '2018-09-17 12:05:04', '2017-12-27 18:48:26');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (52, 52, 'laboriosam', 2, NULL, 4, '2013-11-15 12:26:25', '2014-10-05 07:58:37');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (53, 53, 'veritatis', 69, NULL, 5, '2012-03-26 22:11:44', '2012-10-05 17:04:54');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (54, 54, 'aut', 677, NULL, 6, '2012-12-27 18:54:22', '2020-07-09 09:39:24');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (55, 55, 'vel', 0, NULL, 1, '2013-10-27 00:06:59', '2012-05-29 11:07:17');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (56, 56, 'tempore', 37819, NULL, 2, '2017-05-18 06:20:15', '2011-06-23 20:57:28');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (57, 57, 'vel', 50, NULL, 3, '2014-08-11 21:47:59', '2014-12-24 22:28:00');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (58, 58, 'totam', 0, NULL, 4, '2013-06-22 12:37:46', '2016-08-23 03:18:38');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (59, 59, 'dolores', 6942, NULL, 5, '2015-03-17 09:55:57', '2018-06-19 23:41:01');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (60, 60, 'dolorum', 0, NULL, 6, '2015-04-06 13:27:42', '2012-03-01 00:25:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (61, 61, 'eum', 0, NULL, 1, '2013-12-22 12:12:39', '2019-01-25 05:13:10');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (62, 62, 'necessitatibus', 876558495, NULL, 2, '2014-01-07 11:20:42', '2017-10-11 17:31:27');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (63, 63, 'corporis', 7511944, NULL, 3, '2020-08-14 12:33:02', '2013-07-09 05:51:24');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (64, 64, 'doloribus', 5399831, NULL, 4, '2011-12-30 19:48:12', '2018-03-09 20:52:36');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (65, 65, 'est', 3586, NULL, 5, '2012-07-10 04:08:40', '2020-06-04 18:58:39');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (66, 66, 'maxime', 174, NULL, 6, '2020-02-20 17:31:24', '2014-12-02 05:12:23');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (67, 67, 'et', 846950, NULL, 1, '2013-01-03 03:58:30', '2019-03-13 23:38:18');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (68, 68, 'excepturi', 35926985, NULL, 2, '2017-08-06 02:25:27', '2020-04-30 02:31:35');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (69, 69, 'sed', 40221, NULL, 3, '2020-08-09 01:10:23', '2017-10-16 08:40:43');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (70, 70, 'sapiente', 5263, NULL, 4, '2012-05-01 08:50:09', '2015-07-04 22:06:38');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (71, 71, 'odio', 581107, NULL, 5, '2017-06-14 12:50:03', '2013-04-13 02:25:00');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (72, 72, 'molestiae', 872210, NULL, 6, '2012-09-13 09:07:13', '2013-12-09 03:40:43');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (73, 73, 'id', 258, NULL, 1, '2017-01-15 13:37:59', '2016-10-26 04:00:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (74, 74, 'rem', 1519, NULL, 2, '2017-06-22 15:03:30', '2011-09-16 00:05:04');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (75, 75, 'aut', 0, NULL, 3, '2015-08-09 15:22:10', '2020-05-07 08:15:01');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (76, 76, 'autem', 83, NULL, 4, '2018-05-09 00:06:35', '2018-10-12 14:58:48');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (77, 77, 'beatae', 756, NULL, 5, '2020-12-05 11:58:20', '2019-06-14 15:42:22');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (78, 78, 'officiis', 92524916, NULL, 6, '2020-01-05 21:21:40', '2012-08-14 11:46:25');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (79, 79, 'ut', 3, NULL, 1, '2012-08-15 00:38:05', '2016-12-27 21:19:38');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (80, 80, 'atque', 0, NULL, 2, '2020-06-30 15:11:57', '2018-11-30 18:50:52');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (81, 81, 'qui', 2288, NULL, 3, '2011-05-17 06:43:24', '2019-06-21 00:54:25');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (82, 82, 'vero', 1, NULL, 4, '2016-05-05 14:06:43', '2020-11-30 23:18:25');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (83, 83, 'et', 653010934, NULL, 5, '2012-08-12 20:49:41', '2016-04-13 07:52:37');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (84, 84, 'deserunt', 53359609, NULL, 6, '2014-07-15 22:12:49', '2014-10-27 21:02:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (85, 85, 'nulla', 0, NULL, 1, '2018-10-16 21:48:45', '2011-03-14 20:38:00');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (86, 86, 'consequatur', 182, NULL, 2, '2012-12-04 09:28:26', '2020-05-24 19:51:44');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (87, 87, 'et', 635, NULL, 3, '2012-12-03 12:06:01', '2012-08-25 19:14:22');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (88, 88, 'exercitationem', 365, NULL, 4, '2015-09-07 07:40:41', '2012-05-22 14:20:53');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (89, 89, 'asperiores', 119084394, NULL, 5, '2013-06-01 02:02:43', '2018-06-23 12:32:08');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (90, 90, 'et', 53006, NULL, 6, '2013-02-26 01:03:27', '2015-06-21 06:01:21');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (91, 91, 'velit', 72472825, NULL, 1, '2012-08-19 00:23:36', '2015-11-08 01:45:52');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (92, 92, 'minima', 0, NULL, 2, '2012-03-15 04:55:35', '2013-09-21 20:56:41');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (93, 93, 'qui', 63079012, NULL, 3, '2011-12-15 23:03:53', '2016-02-23 18:42:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (94, 94, 'non', 595, NULL, 4, '2017-04-25 07:37:58', '2017-04-21 12:26:03');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (95, 95, 'praesentium', 0, NULL, 5, '2013-01-22 06:06:23', '2019-08-05 14:21:13');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (96, 96, 'quos', 75589658, NULL, 6, '2013-10-30 08:42:05', '2013-07-16 00:43:09');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (97, 97, 'fugit', 46, NULL, 1, '2013-10-10 05:51:20', '2011-06-20 19:46:09');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (98, 98, 'voluptas', 0, NULL, 2, '2016-08-06 05:53:15', '2019-10-06 12:14:28');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (99, 99, 'sapiente', 3842, NULL, 3, '2018-03-07 16:44:04', '2018-06-09 16:22:19');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (100, 100, 'porro', 8016353, NULL, 4, '2012-07-15 05:44:09', '2014-05-14 20:19:23');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Типы медиафайлов';

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'reprehenderit', '2014-03-31 20:29:53', '2018-01-20 10:20:38');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'iusto', '2014-10-31 23:17:17', '2012-10-12 19:51:55');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'quas', '2019-11-09 07:48:21', '2012-09-21 06:23:38');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'tenetur', '2020-03-04 11:20:49', '2012-07-11 10:46:42');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'eligendi', '2019-04-22 19:14:46', '2013-06-04 03:01:13');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'sint', '2017-04-24 16:54:38', '2011-02-25 05:33:40');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Сообщения';

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (1, 1, 1, 'Maxime qui suscipit incidunt at pariatur perferendis. Sint quaerat eligendi nam ut et culpa distinctio.', 0, 0, '2018-11-24 12:29:58', '2017-09-25 19:49:55');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (2, 2, 2, 'Quos ab qui reiciendis architecto enim dignissimos quasi aliquid. Accusantium commodi est et minus qui. Dolorem quod fugiat impedit dolorem esse.', 1, 1, '2013-11-05 11:25:42', '2014-04-21 22:33:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (3, 3, 3, 'Molestias odit ut aut illum quod. Pariatur illo ipsa accusantium et ut. Ex repudiandae voluptatem voluptates qui ad enim.', 0, 0, '2013-07-08 22:43:32', '2019-09-27 19:05:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (4, 4, 4, 'Beatae inventore et illum rerum. Totam cupiditate iusto veritatis. Et dolor eum fugiat. Est ex alias voluptatem eos quod.', 0, 0, '2014-08-17 03:00:15', '2011-10-31 22:30:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (5, 5, 5, 'Vero odit consequatur molestias quo voluptatem natus molestias. Sed eum inventore quae dolores repudiandae consectetur. Aspernatur distinctio repudiandae provident adipisci.', 0, 0, '2014-08-12 12:07:07', '2016-06-27 18:35:26');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (6, 6, 6, 'Provident tempore dolores dolor sed. A fuga voluptas laborum a iure. Quia voluptatem labore asperiores totam vel et. Nihil adipisci natus quis perferendis excepturi officia.', 1, 0, '2015-03-16 07:56:42', '2016-10-12 17:28:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (7, 7, 7, 'Nostrum consequatur sit recusandae ipsam excepturi delectus maiores. Culpa iste quia molestiae placeat in perspiciatis est et. Dolores enim dolores esse quia perferendis veniam quaerat iste. Rerum dolorem ratione maiores nemo distinctio quas quasi.', 1, 0, '2014-08-22 00:52:48', '2020-07-05 18:09:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (8, 8, 8, 'Voluptas qui voluptatem ducimus est. Sint fugit ducimus quia. Voluptate ipsam sed fuga molestiae culpa.', 0, 1, '2013-11-16 20:53:43', '2012-09-19 14:57:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (9, 9, 9, 'Eos est voluptatem officiis quam. Aut voluptas omnis fugit est quidem numquam. Molestiae nihil numquam sed dolorem ut.', 1, 0, '2015-07-09 10:04:25', '2016-09-17 19:53:47');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (10, 10, 10, 'Laboriosam commodi hic fugiat labore et rerum. Itaque aliquid in possimus minus laudantium suscipit et. Non quo id dolorum culpa alias sit. Architecto ut laboriosam aliquam ipsum in quae voluptatum.', 1, 1, '2020-02-29 00:07:25', '2015-07-28 09:11:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (11, 11, 11, 'Hic aliquam rerum animi aliquam quo suscipit distinctio. Molestiae omnis ut animi dolorum officia.', 0, 1, '2017-03-22 14:08:34', '2011-12-11 22:32:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (12, 12, 12, 'Iure aperiam vero et velit. Accusamus voluptatem consequuntur dolore vel eligendi veritatis. Consequatur rerum totam eligendi laborum. Quos magnam facere facilis et minus earum aliquam.', 1, 0, '2018-10-23 02:40:55', '2017-08-08 11:07:37');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (13, 13, 13, 'Est incidunt omnis facere. Reprehenderit et tempore ut. Ullam temporibus voluptatem omnis rerum odio architecto temporibus.', 0, 1, '2016-08-16 05:27:48', '2014-03-15 22:28:36');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (14, 14, 14, 'Autem iste molestiae reiciendis dolor voluptatibus. Quis id et minus omnis quod non. Repellat aliquid temporibus perspiciatis illo sed. Et sequi temporibus quos et sunt.', 1, 0, '2014-09-17 01:05:24', '2015-04-14 22:47:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (15, 15, 15, 'Esse sit sunt totam sint adipisci eligendi exercitationem. Molestiae exercitationem autem est. Laborum ipsam deleniti vitae provident illum.', 1, 0, '2011-01-14 15:15:38', '2014-06-29 23:28:47');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (16, 16, 16, 'Eum voluptatem quisquam labore odio id dolores. Tenetur facilis porro ab nemo sunt enim. At rerum blanditiis quia dicta ut nesciunt.', 1, 0, '2013-03-05 12:17:14', '2019-12-08 07:54:35');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (17, 17, 17, 'Eaque est deserunt consectetur molestias omnis eveniet libero. Deleniti soluta vel ut dicta qui et sed. Occaecati voluptas quod nesciunt sed.', 1, 0, '2018-02-07 01:32:26', '2020-12-22 01:05:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (18, 18, 18, 'Labore consectetur voluptatem doloremque quo eos molestiae omnis. Est iste sunt et iste cum autem repellendus. Consequatur accusantium quidem nemo suscipit quia consequatur.', 1, 0, '2015-10-07 05:15:13', '2018-01-14 11:10:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (19, 19, 19, 'Dolor saepe libero officia quam fugit. Necessitatibus odit facere deleniti enim sunt. Omnis vitae ut omnis.', 0, 0, '2014-04-13 20:18:56', '2013-01-19 22:35:35');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (20, 20, 20, 'Corrupti excepturi eligendi esse. Dolorem inventore non rerum id harum vitae reiciendis. Odit eum dolores eos aliquam voluptatem. Rerum quos ut quod aut nisi officia reprehenderit.', 0, 1, '2012-04-26 06:24:21', '2016-06-03 05:03:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (21, 21, 21, 'Ducimus ad molestias quibusdam dolores adipisci aspernatur optio cum. Et earum amet sapiente possimus quas cupiditate minus. Voluptatem expedita sint laborum quo ab.', 0, 1, '2013-07-22 05:47:26', '2014-11-24 13:03:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (22, 22, 22, 'Architecto iusto voluptas aut. Et et dolor aut molestiae qui cupiditate consequatur quam. Temporibus quae consectetur sunt illo. Qui quo dolorem quia suscipit repudiandae quisquam.', 1, 0, '2016-01-31 00:15:33', '2011-12-08 00:58:55');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (23, 23, 23, 'Repellat est sunt adipisci. Et aut eos est eaque omnis. Saepe unde quia dignissimos error nihil. Voluptate architecto quaerat aut aliquid ad.', 1, 0, '2013-02-07 04:18:42', '2020-05-12 07:53:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (24, 24, 24, 'Optio qui nulla nulla voluptatem nihil et repudiandae. Iste et harum in nostrum. Non sit ratione atque eligendi sunt. Illum eveniet explicabo velit nam ut molestiae.', 1, 0, '2016-06-27 00:38:45', '2011-10-16 10:57:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (25, 25, 25, 'Ipsa eius a tempore et voluptas beatae. Maxime nihil ad sit est dignissimos. Pariatur nostrum dolor fugiat saepe.', 1, 0, '2018-05-26 04:30:07', '2018-01-19 16:32:27');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (26, 26, 26, 'Consequatur officia facere architecto rerum dolor rerum. Deserunt magni magni consequatur quisquam.', 0, 0, '2015-01-26 06:26:20', '2020-06-02 18:05:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (27, 27, 27, 'Sint dolore doloremque nostrum illum. Illum rem quia in ut animi laboriosam laborum. Exercitationem tenetur sunt minus magnam.', 0, 0, '2018-09-11 00:36:21', '2014-01-22 22:45:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (28, 28, 28, 'Odit autem debitis cumque sit. Quia beatae enim voluptate quaerat facilis amet. Est similique at ea. Voluptatem molestias illo et libero.', 1, 0, '2011-12-14 08:43:04', '2016-11-22 06:11:23');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (29, 29, 29, 'Voluptas et culpa cupiditate quam et ullam. Perspiciatis impedit quisquam incidunt dignissimos. Incidunt assumenda possimus aut quae voluptas. Eligendi debitis sit aliquid explicabo magnam sit.', 1, 0, '2013-10-08 22:25:25', '2019-03-22 08:42:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (30, 30, 30, 'Et non architecto earum sapiente molestiae dolorem in est. Vel dicta impedit cupiditate eaque. Nihil nobis nulla eveniet rerum illo.', 0, 1, '2013-10-01 21:18:26', '2013-06-23 08:12:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (31, 31, 31, 'Et ipsa consequatur sapiente voluptatem iure blanditiis. Ipsum aperiam cumque fuga et optio excepturi. Qui natus nisi qui iste assumenda. Aut earum rem sed nostrum.', 0, 1, '2017-04-16 02:28:14', '2016-05-12 10:29:08');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (32, 32, 32, 'Sit molestiae id velit quia vero distinctio. Laboriosam ut dolores aperiam cum iste omnis dicta. Est nesciunt animi necessitatibus accusamus quasi odit.', 1, 0, '2017-09-28 01:21:14', '2015-12-20 19:50:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (33, 33, 33, 'Facilis recusandae qui illo eligendi voluptate quia culpa. Omnis rerum placeat voluptates. Saepe fugit blanditiis laudantium architecto enim tempore qui doloribus. Rerum commodi voluptatem qui cum quibusdam.', 1, 0, '2011-05-07 21:45:26', '2011-10-13 04:59:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (34, 34, 34, 'Neque consequatur quam rerum est tenetur nostrum aut. Laborum corrupti fugiat illo ut. Sunt et soluta necessitatibus ut exercitationem illo dolore. Suscipit ut harum autem ut nostrum molestiae voluptatem.', 0, 1, '2012-10-02 01:16:35', '2017-01-01 05:43:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (35, 35, 35, 'Magnam delectus qui tempore voluptates veniam sit quibusdam. Non quis recusandae dolor dicta. Libero qui eum voluptatum officiis officia est eveniet nostrum. Iure non facere accusantium sed amet mollitia at.', 1, 0, '2011-04-23 12:49:31', '2012-06-14 05:37:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (36, 36, 36, 'Voluptas nobis eos debitis saepe quas quo ut. Molestias exercitationem eum illum doloribus. Quisquam quas ut nesciunt accusamus perferendis nisi iste sint.', 1, 0, '2011-07-02 12:31:13', '2020-10-23 21:29:38');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (37, 37, 37, 'Eum sequi temporibus aperiam quis. Recusandae omnis voluptas enim eaque et commodi minima. Optio dignissimos vero eius et et debitis aut voluptatem.', 0, 0, '2012-02-13 15:07:13', '2015-05-10 04:58:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (38, 38, 38, 'Nam ratione quo non ut soluta qui voluptatem. Labore soluta minima illo fugiat aut. Quia fugiat minus ipsam tenetur vitae. Aut explicabo tempore nesciunt ea ut.', 0, 0, '2018-11-16 05:46:41', '2013-02-03 15:33:37');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (39, 39, 39, 'Exercitationem corporis non iste consectetur veritatis. Voluptatum hic labore nobis voluptas quidem. Corrupti et officia aut quae magnam nisi debitis et.', 0, 0, '2014-10-21 08:19:39', '2011-07-06 04:57:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (40, 40, 40, 'Est sed voluptas cumque tempore. Et maxime et rerum laudantium possimus. Est quibusdam doloremque voluptatem distinctio mollitia voluptatum.', 1, 0, '2014-12-21 09:50:14', '2017-08-31 12:41:47');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (41, 41, 41, 'Enim itaque et est. Dolorem ad nesciunt nulla architecto officiis nisi. Doloribus tenetur laudantium ut qui reiciendis dignissimos. Libero fugiat consequatur debitis earum.', 1, 0, '2019-11-23 11:21:12', '2018-02-03 06:31:24');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (42, 42, 42, 'Sint dolorem ut et sed ex quia. Hic qui odit repellendus et nihil et nisi aut. Maiores natus quos nostrum mollitia tempore sequi vel rerum.', 1, 1, '2016-08-08 23:21:47', '2017-05-28 18:51:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (43, 43, 43, 'Excepturi qui et vel deleniti vel. Quis quam deserunt quia eum soluta placeat dolor. Modi et accusamus voluptate voluptatibus necessitatibus similique nam. Numquam voluptatum at amet consequatur.', 0, 1, '2019-01-24 17:16:30', '2016-07-12 15:45:30');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (44, 44, 44, 'Eveniet voluptatum officiis enim. Consectetur quisquam voluptatem tenetur aut reiciendis dolor repudiandae quia.', 1, 1, '2017-06-13 08:54:42', '2013-06-16 18:41:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (45, 45, 45, 'Ea deserunt porro fuga vero rem enim sequi. Repellendus non possimus ducimus exercitationem officia. Et aut dolorum sit ut occaecati omnis dolores. Beatae odit consequatur ea eos.', 1, 1, '2013-10-17 02:16:23', '2019-01-04 18:17:22');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (46, 46, 46, 'Voluptatem et inventore ut. Dolor exercitationem et voluptatem. Soluta incidunt atque quod et asperiores aperiam.', 0, 0, '2013-04-13 15:32:36', '2016-10-12 11:06:21');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (47, 47, 47, 'Perferendis consequatur non culpa excepturi. Et quaerat at quas omnis incidunt fugit iure. Quod sunt rerum consectetur quia eveniet. Rem quaerat eaque necessitatibus consectetur.', 1, 1, '2019-10-20 21:25:46', '2015-03-15 20:05:06');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (48, 48, 48, 'Voluptate consequatur quia ea deserunt dolorem. In repellendus rerum aperiam veritatis. Laudantium sunt fuga molestiae ut eum eius vel. Non quisquam ratione accusamus inventore cumque.', 0, 0, '2012-07-17 01:13:28', '2013-04-11 05:34:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (49, 49, 49, 'Magnam inventore numquam alias neque omnis in dolor. Sit qui non ad dolore. Dolores aspernatur maiores assumenda aut officiis voluptatem. Sint porro voluptate eum beatae.', 0, 0, '2015-09-28 08:21:51', '2016-10-28 20:19:43');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (50, 50, 50, 'Et ducimus eligendi non quo optio dolorum ullam et. Est molestias quia aspernatur omnis. Pariatur autem labore saepe nobis et occaecati.', 1, 0, '2016-11-14 10:35:46', '2017-03-14 11:40:00');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (51, 51, 51, 'Dolor et consequuntur iure error dolorem corrupti. Soluta consequuntur eum nisi sit. Rem ut et in ea quidem placeat qui.', 1, 1, '2011-04-21 22:13:26', '2017-12-03 08:14:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (52, 52, 52, 'Occaecati eos provident qui voluptatem nostrum ea. Nesciunt aspernatur magni et eligendi corporis nemo. Laborum dolores aperiam doloremque illum et et et est.', 1, 1, '2011-07-08 16:46:44', '2014-07-17 22:05:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (53, 53, 53, 'Explicabo illo tenetur quaerat quam. Beatae officia tempora dolor similique dolor dolorem. Consequatur beatae voluptatem quis et aut fugiat.', 0, 1, '2012-09-17 18:39:00', '2015-04-05 04:24:03');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (54, 54, 54, 'Assumenda aut voluptatem id amet praesentium fugiat. Autem quod aperiam velit deleniti consequatur. Esse quasi et ab sit neque aut.', 0, 1, '2018-08-09 23:51:45', '2018-03-09 04:03:30');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (55, 55, 55, 'Reprehenderit repellendus molestias dolorem occaecati delectus vel quidem veniam. Perspiciatis error autem tenetur culpa. Ducimus eius recusandae temporibus soluta et.', 1, 0, '2013-05-02 21:53:39', '2013-01-03 16:13:30');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (56, 56, 56, 'Eos ut asperiores sit quo. Tempore et enim quae.', 1, 0, '2015-08-06 22:03:00', '2013-04-15 21:36:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (57, 57, 57, 'Iusto qui hic dignissimos facere fuga ipsam assumenda. Nihil consequuntur repudiandae ipsa quasi et sed. Provident voluptatem consequatur dolores tenetur minima est. Et incidunt aut alias rerum optio.', 1, 0, '2018-01-28 17:07:44', '2019-04-12 02:10:49');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (58, 58, 58, 'Quidem quisquam veniam sapiente quam necessitatibus vero. Laudantium eum natus quo cupiditate unde odit corrupti. Quaerat doloremque eum ad amet nulla mollitia.', 1, 0, '2011-09-14 06:13:09', '2011-12-06 21:08:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (59, 59, 59, 'Iste maxime sapiente saepe distinctio adipisci distinctio numquam. Laborum incidunt et modi qui magni numquam consequuntur. Eum odio quis esse velit distinctio. Quisquam ipsum esse laboriosam illum.', 0, 0, '2011-06-02 09:23:04', '2012-11-21 17:48:23');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (60, 60, 60, 'At dignissimos voluptatem repellendus placeat suscipit doloremque voluptatem. Consequuntur sunt nemo quas temporibus. Dolorem aut optio illo ullam. Architecto autem rem ut vel quo dolorem et.', 0, 0, '2015-04-17 06:54:38', '2015-08-02 05:26:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (61, 61, 61, 'Dolor voluptas dolores unde minus odio quos. Veniam eos magni ea. Ipsa et vitae perferendis debitis et dicta asperiores.', 1, 0, '2014-06-03 16:40:57', '2011-07-11 01:00:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (62, 62, 62, 'Ut dolorum alias vel ut saepe qui. Eaque pariatur dignissimos qui repellat alias debitis.', 0, 0, '2018-07-20 15:38:47', '2011-05-19 02:36:16');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (63, 63, 63, 'Mollitia est ut laborum qui error. Neque dolores consequatur nihil ut voluptate. Molestias laboriosam voluptatem corrupti enim dignissimos. Quis rerum ut sit quo nostrum dolorem consequuntur enim.', 0, 1, '2018-08-03 16:57:50', '2013-02-15 00:30:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (64, 64, 64, 'Eos hic laborum impedit totam amet voluptas corrupti. Consequatur officiis animi temporibus tenetur dolores sit velit.', 1, 1, '2013-01-28 23:54:06', '2018-04-08 17:16:30');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (65, 65, 65, 'Perspiciatis neque impedit incidunt hic. Omnis repudiandae vel tempore iusto. Aut quo sed possimus maiores sequi.', 0, 1, '2012-12-15 21:06:32', '2016-07-12 01:21:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (66, 66, 66, 'Voluptates incidunt molestias soluta quis dolorem alias illum. Aliquam unde ad amet. Repellendus nam distinctio exercitationem id. Enim est consequuntur veniam blanditiis vero ut commodi.', 0, 0, '2015-12-21 00:42:39', '2015-05-25 16:57:57');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (67, 67, 67, 'Voluptas sed fugiat delectus eius sed. Assumenda et dolor ad ut nobis aperiam. Qui et sit et consectetur quasi. At enim veniam iste.', 0, 0, '2014-12-09 07:16:07', '2015-03-04 14:13:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (68, 68, 68, 'Voluptatem tempora qui iusto voluptas vel aspernatur eum. Ut adipisci ratione sit sed voluptatem quibusdam sunt. Perspiciatis saepe cupiditate earum modi. Voluptatem voluptatem earum saepe aut at quisquam.', 1, 1, '2019-07-23 03:34:56', '2020-07-04 13:35:24');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (69, 69, 69, 'Perspiciatis sit maiores mollitia aut cum odio. Molestiae enim non facilis consequatur perspiciatis vitae.', 0, 0, '2015-02-22 14:42:03', '2016-01-08 06:39:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (70, 70, 70, 'Architecto nemo dolorem omnis ut. Ut accusamus laboriosam omnis qui dolor.', 1, 1, '2012-11-27 20:12:02', '2016-05-28 20:38:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (71, 71, 71, 'Est corrupti voluptas ipsa blanditiis. Saepe nisi est exercitationem et debitis. Modi atque quia itaque accusantium molestiae. Cum et expedita optio totam nemo. Officia non velit deleniti sint sunt.', 1, 1, '2020-09-15 19:58:16', '2013-01-15 04:17:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (72, 72, 72, 'Qui eos voluptatem facere odio. Debitis saepe architecto beatae laborum vero et eum est. Cupiditate error molestiae assumenda ut.', 1, 1, '2014-07-02 23:25:19', '2012-11-20 02:42:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (73, 73, 73, 'Qui atque suscipit dolorem ad. Sint ipsa praesentium aut voluptatem iste enim. Provident aut est aperiam non fugit. Eum rem nam debitis itaque sunt non quo vero.', 0, 0, '2014-09-15 16:46:02', '2016-07-16 08:01:43');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (74, 74, 74, 'Fugit doloremque quia et repellendus ducimus odio. Incidunt aut sint fuga et.', 0, 0, '2011-10-11 21:40:18', '2018-02-22 10:21:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (75, 75, 75, 'Rerum quis ab porro praesentium minima tempora reprehenderit. Deserunt numquam harum enim autem officiis. Vel tempore quia animi.', 1, 0, '2017-05-10 06:53:24', '2015-08-01 03:12:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (76, 76, 76, 'Adipisci velit voluptatem placeat itaque sint iste. Totam quia occaecati eum et. Nihil voluptatum rem possimus error laborum rerum. Et eum magnam nihil quibusdam voluptate aliquid adipisci.', 0, 1, '2012-05-06 10:27:06', '2013-10-23 12:57:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (77, 77, 77, 'Laudantium mollitia qui aut. Et voluptatem vel eveniet tempora corporis tenetur possimus eum. Cumque accusamus voluptates et soluta. Dignissimos asperiores enim ipsam.', 1, 1, '2017-04-09 18:26:00', '2020-08-03 16:50:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (78, 78, 78, 'Sit quo ipsum dignissimos harum labore iure quibusdam. Corrupti voluptas illo fuga. Non ut blanditiis et laboriosam culpa et.', 1, 1, '2014-05-08 07:00:58', '2014-07-13 05:06:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (79, 79, 79, 'Earum nesciunt eos veniam cupiditate quaerat facere et et. Voluptate quam incidunt iure voluptas fugit. Consequatur qui quia id culpa unde. Sit alias adipisci ut quasi molestiae deserunt commodi.', 1, 0, '2014-01-23 06:10:22', '2015-04-09 15:40:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (80, 80, 80, 'Est aut aspernatur error dolor cum. Aut quia nam ipsa repellendus harum ducimus similique. Qui consequatur quaerat tenetur voluptatibus ullam id quisquam.', 0, 0, '2015-06-06 09:53:47', '2019-08-31 10:39:23');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (81, 81, 81, 'Explicabo soluta praesentium nam atque magnam sint. Quo mollitia eveniet aut eum aut aperiam. Sed quis deleniti dolor voluptas occaecati rerum. Ut ut ab ut sequi voluptas tempore neque.', 0, 0, '2016-11-20 18:37:14', '2016-09-02 16:33:41');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (82, 82, 82, 'Qui porro a corrupti nesciunt voluptatem. Sunt nostrum suscipit consequatur mollitia eum. Nihil ut quisquam aspernatur itaque consequatur possimus non maiores. Nesciunt sequi alias autem repellendus. Voluptatem iusto ea quis ratione hic eum nam.', 0, 1, '2013-01-05 23:40:58', '2014-10-27 11:19:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (83, 83, 83, 'Nisi incidunt ut numquam fuga quia. Qui mollitia totam autem rerum ducimus placeat illum. Eveniet consequuntur quam voluptate maxime perspiciatis. Autem occaecati fuga expedita aliquam dolor nesciunt eos.', 0, 0, '2015-03-20 18:19:51', '2020-08-03 11:51:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (84, 84, 84, 'Illo velit at dolorem. Ratione et nobis omnis eaque incidunt voluptatem. Quo eveniet voluptate reprehenderit sed. Iste qui esse optio autem.', 1, 1, '2014-12-17 01:37:06', '2011-09-20 10:38:39');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (85, 85, 85, 'Ex fugit sed corrupti nobis corrupti. Error minima et asperiores non iusto. Autem vel officiis odit nostrum omnis architecto aut eligendi.', 0, 0, '2017-07-24 23:39:22', '2016-01-31 23:17:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (86, 86, 86, 'Possimus sequi enim laboriosam vel sit est. Est autem aut rerum ad voluptas consequuntur. Numquam ullam fuga aut quo.', 0, 1, '2012-01-11 06:17:29', '2016-11-20 02:29:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (87, 87, 87, 'Porro reprehenderit tempora ea mollitia dolores rem rerum. Esse excepturi voluptatem sint quam asperiores blanditiis aperiam. Accusamus et qui ipsam reiciendis voluptate. Doloremque voluptas sit sunt voluptas commodi earum eligendi debitis.', 1, 0, '2018-11-29 14:00:43', '2016-10-12 22:09:17');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (88, 88, 88, 'Et ea qui omnis vitae et natus voluptatem. Quas totam molestias eius quod alias aliquid qui. Commodi nostrum omnis numquam inventore. Voluptatem nostrum autem eaque maxime ut reprehenderit ipsum modi.', 0, 0, '2016-07-28 09:08:52', '2014-02-02 15:39:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (89, 89, 89, 'Officiis blanditiis quisquam ut aut. Velit earum non neque quam et inventore libero. Nihil nam delectus tenetur aut laudantium fuga praesentium.', 0, 0, '2015-09-28 09:53:58', '2015-12-25 01:47:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (90, 90, 90, 'Ut aliquid perspiciatis facilis voluptatibus. Dolores quo est ullam autem consectetur aperiam harum. Occaecati magnam consequatur illo molestiae soluta.', 0, 1, '2013-05-18 21:11:33', '2018-01-01 08:43:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (91, 91, 91, 'Excepturi et necessitatibus incidunt deserunt provident. Quod at et quia dolor consequuntur velit asperiores. Est itaque nihil minima optio quia qui enim.', 0, 0, '2018-07-29 16:44:43', '2017-07-04 08:58:37');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (92, 92, 92, 'Saepe consequatur est ut inventore. Dignissimos explicabo rerum veritatis impedit quia. Et deserunt amet nisi in rerum enim voluptatem.', 0, 1, '2012-01-07 13:34:24', '2018-06-16 16:50:38');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (93, 93, 93, 'Consequatur ea non cupiditate magni minima dicta. Vel fugit dignissimos maxime et et. Cum sit quia quia.', 1, 1, '2016-01-29 09:16:08', '2019-02-12 23:18:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (94, 94, 94, 'Impedit a qui voluptatem ab iste esse iusto sit. Debitis blanditiis aliquid dolores quasi omnis numquam aut. Consequatur qui voluptas reiciendis harum dolor voluptas. Perferendis nemo quia expedita officia quo officia facilis accusamus.', 0, 0, '2011-11-02 02:57:15', '2013-06-27 02:29:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (95, 95, 95, 'Aut dolorum repellendus in temporibus est autem. Omnis et cupiditate aut velit nam aut commodi. Dolorum in libero et tempore ducimus. Molestiae ut voluptatibus veniam et.', 1, 0, '2011-11-19 16:45:30', '2016-06-10 06:49:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (96, 96, 96, 'Sed nostrum adipisci qui amet recusandae occaecati magnam. Quia et perferendis et illum harum quas. Sit temporibus natus amet vel consequatur rerum corporis. Veritatis rerum tempora maxime ratione consequatur non nihil possimus.', 0, 0, '2012-01-03 23:50:27', '2018-01-05 18:47:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (97, 97, 97, 'Iure hic voluptas ullam maxime. Repellendus rerum sed repellendus aut. Minima veniam itaque assumenda occaecati. Similique voluptate quo ut id. Pariatur voluptas illo modi et.', 0, 1, '2015-08-29 23:19:24', '2015-04-06 18:51:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (98, 98, 98, 'Harum omnis aut culpa ut. Deserunt molestiae iure aut aperiam. Repellendus exercitationem consequuntur aut quas.', 1, 0, '2017-04-30 04:37:49', '2014-03-16 13:40:22');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (99, 99, 99, 'Repudiandae molestias molestias nobis voluptatem dolorem aut quisquam itaque. Laboriosam id aut iusto sint. Fugiat a architecto corporis quae et. Dignissimos velit non vitae voluptatem labore debitis.', 1, 0, '2014-06-10 05:40:50', '2019-01-17 12:34:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (100, 100, 100, 'Explicabo nulla optio placeat id ea aut ut. Aut ipsum aut similique possimus aspernatur consequuntur libero. Voluptatem tempora voluptas quis ducimus.', 0, 1, '2015-01-24 15:50:58', '2019-03-18 06:00:25');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Текущий статус',
  `city` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Профили';

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (1, 'f', '1972-06-18', 'Magni non earum tempore laudan', 'West Marcchester', 'Sao Tome and Principe', '2013-04-26 19:11:47', '2011-11-10 22:53:29');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (2, 'm', '1979-02-14', 'Facere minima qui ipsa quia. E', 'New Budmouth', 'Eritrea', '2015-11-30 12:40:14', '2017-03-20 11:38:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (3, 'm', '1993-11-08', 'Repudiandae commodi at earum v', 'Lake Jackiefort', 'Yemen', '2020-04-02 20:36:26', '2017-07-28 03:48:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (4, 'f', '2020-12-12', 'Qui reprehenderit consequuntur', 'New Geoffrey', 'France', '2019-08-18 16:24:24', '2011-03-17 12:46:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (5, 'm', '1991-10-29', 'Sunt vel ea quos sapiente. Imp', 'Quigleyview', 'El Salvador', '2012-06-01 19:05:45', '2014-05-25 19:54:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (6, 'f', '1972-06-17', 'Perspiciatis ea ab ex. Aut aut', 'Kaciland', 'Montserrat', '2017-04-29 18:39:03', '2017-10-04 12:41:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (7, 'm', '2004-03-07', 'Quas repellat est quae qui. Po', 'West Verdieport', 'Russian Federation', '2011-02-23 08:54:32', '2019-05-18 14:55:07');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (8, 'f', '1992-10-06', 'Architecto sit possimus aperia', 'North Alejandra', 'Sudan', '2016-11-29 03:26:37', '2012-10-25 10:57:56');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (9, 'f', '2008-01-10', 'Unde inventore placeat et odit', 'Kiehnborough', 'Philippines', '2019-06-06 00:30:21', '2019-06-04 21:22:19');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (10, 'f', '1995-02-17', 'Eius ea tempore ut exercitatio', 'West Fidel', 'Kyrgyz Republic', '2011-10-11 11:02:51', '2019-08-10 15:20:11');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (11, 'f', '1975-05-06', 'Harum est nisi assumenda. Rem ', 'Lefflerborough', 'Saint Barthelemy', '2019-08-24 06:52:27', '2016-09-15 05:55:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (12, 'f', '1993-05-12', 'Nesciunt non repellat qui mini', 'New Hilton', 'Azerbaijan', '2013-08-26 03:25:19', '2020-08-02 09:25:07');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (13, 'm', '2006-03-04', 'Accusantium natus a cum. Sit e', 'Fayberg', 'Monaco', '2018-05-24 18:05:55', '2016-11-17 19:36:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (14, 'f', '2014-12-04', 'Non excepturi qui culpa id odi', 'Ahmadshire', 'Pitcairn Islands', '2017-03-26 16:29:25', '2011-06-19 23:31:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (15, 'f', '1973-01-17', 'Sunt sunt non earum quibusdam.', 'New Lorna', 'Norway', '2014-03-03 10:29:22', '2020-11-06 07:21:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (16, 'f', '1988-02-26', 'Hic voluptatum eum qui ut. Qui', 'Marlonshire', 'Aruba', '2014-11-30 11:50:01', '2018-10-29 10:36:27');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (17, 'm', '1983-08-24', 'Pariatur earum veritatis hic v', 'Cliftonmouth', 'Botswana', '2018-06-08 03:33:38', '2014-01-18 04:44:20');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (18, 'm', '2004-05-14', 'Ut molestiae quo possimus et e', 'Swaniawskiberg', 'French Polynesia', '2015-11-12 13:35:42', '2014-01-16 21:58:55');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (19, 'm', '1980-05-18', 'Ut est voluptate omnis. Illo r', 'New Elody', 'Sri Lanka', '2016-12-06 23:05:52', '2013-11-25 01:11:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (20, 'm', '1987-05-30', 'In sed adipisci accusantium no', 'Derekmouth', 'Estonia', '2012-09-01 16:57:26', '2012-05-05 04:08:08');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (21, 'f', '1982-12-05', 'Reiciendis optio neque nobis u', 'Elroyport', 'United States Virgin Islands', '2019-05-04 17:49:26', '2019-09-19 19:11:49');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (22, 'f', '1985-10-03', 'Nam sit pariatur facilis porro', 'Cleoview', 'Cook Islands', '2014-11-09 02:07:56', '2011-08-01 22:15:54');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (23, 'f', '1980-06-05', 'Atque inventore deleniti omnis', 'West Nash', 'Trinidad and Tobago', '2012-06-30 00:44:29', '2018-11-10 17:50:45');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (24, 'm', '2005-10-11', 'Commodi vel consequatur est a ', 'Garrytown', 'Guadeloupe', '2013-12-28 03:21:34', '2019-04-15 20:37:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (25, 'f', '1988-06-06', 'Autem eum ea itaque consequatu', 'Bernadetteshire', 'Uganda', '2011-01-12 12:30:33', '2020-02-09 00:16:16');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (26, 'f', '1976-04-25', 'Ratione corrupti ut sunt rerum', 'Connerport', 'Italy', '2013-05-17 00:12:50', '2012-06-18 11:22:23');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (27, 'f', '2010-10-13', 'Quisquam laudantium alias cons', 'East Dewitt', 'Guinea', '2017-12-24 18:47:46', '2015-10-19 10:39:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (28, 'f', '1993-10-07', 'Aperiam id expedita non id. Au', 'South Moises', 'Palau', '2017-10-03 18:31:49', '2016-08-06 22:11:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (29, 'f', '2007-07-16', 'Vel perferendis debitis eius s', 'West Queenie', 'Heard Island and McDonald Islands', '2012-05-14 10:14:25', '2013-11-28 06:25:07');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (30, 'm', '2015-06-28', 'Non nostrum harum explicabo ma', 'Luciusport', 'Ukraine', '2012-12-15 14:02:46', '2012-07-09 19:30:07');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (31, 'f', '1979-01-31', 'Cupiditate magnam quae quas no', 'South Helga', 'Solomon Islands', '2020-01-31 07:39:43', '2011-07-27 07:51:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (32, 'f', '1970-09-08', 'Sit qui inventore sit tempora ', 'Pricestad', 'Macedonia', '2012-02-05 23:27:00', '2016-03-17 11:39:47');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (33, 'f', '1978-07-05', 'Et labore sequi libero aut nat', 'Schoenbury', 'Ireland', '2015-06-10 21:15:10', '2017-10-10 05:41:06');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (34, 'f', '1971-04-23', 'Blanditiis unde officia beatae', 'East Mandyberg', 'Iran', '2020-04-21 10:40:20', '2011-09-06 00:28:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (35, 'm', '1999-02-25', 'Quo eos enim dolorem voluptatu', 'South Edwardton', 'Pakistan', '2017-07-26 14:10:32', '2013-01-27 23:53:58');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (36, 'm', '2005-11-10', 'Quae et omnis qui corporis. Fa', 'Lake Edafort', 'Oman', '2016-11-04 19:27:39', '2014-07-20 15:47:18');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (37, 'f', '1976-01-27', 'Voluptas iusto dolorum dolorib', 'East Harold', 'India', '2017-05-10 13:26:20', '2016-04-21 17:21:34');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (38, 'm', '1993-03-10', 'Tenetur nemo accusamus volupta', 'Weissnattown', 'Falkland Islands (Malvinas)', '2020-11-11 11:58:33', '2018-01-29 00:34:26');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (39, 'm', '2001-03-06', 'Beatae necessitatibus voluptat', 'Lake Moriah', 'San Marino', '2016-04-01 17:37:04', '2019-08-07 06:50:01');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (40, 'f', '1981-05-22', 'Veritatis est minus labore cum', 'New Donnell', 'Chad', '2014-03-11 12:02:34', '2020-03-17 21:41:06');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (41, 'f', '1973-06-11', 'Neque doloremque minima modi. ', 'Kundetown', 'Lesotho', '2014-04-19 08:37:53', '2014-02-03 22:47:07');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (42, 'f', '1991-07-12', 'Ut aut aperiam quasi in. Aut s', 'Malikaborough', 'Finland', '2014-10-07 20:49:08', '2017-08-23 04:56:24');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (43, 'm', '2012-03-03', 'Non ut natus sit qui. Officia ', 'Considinefort', 'United States Minor Outlying Islands', '2013-06-05 18:43:41', '2011-04-18 15:04:06');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (44, 'm', '1976-09-08', 'Omnis numquam perferendis non ', 'New Tre', 'Egypt', '2015-02-28 19:17:16', '2020-12-12 05:13:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (45, 'm', '2002-11-26', 'Consequatur est voluptas sit a', 'Lake Felix', 'Taiwan', '2012-05-17 01:12:07', '2012-10-18 12:50:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (46, 'f', '2017-09-09', 'Voluptatibus possimus dolores ', 'South Hermann', 'Ghana', '2015-01-24 15:58:41', '2011-03-30 10:07:13');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (47, 'm', '2015-01-11', 'Quidem qui voluptatibus et del', 'Port Madelynshire', 'Kuwait', '2018-04-09 10:59:19', '2017-02-25 07:00:02');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (48, 'f', '2005-02-24', 'Quae rem a nihil sunt. Non at ', 'Lake Queenieton', 'Belize', '2017-12-15 06:23:51', '2015-12-18 18:28:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (49, 'f', '1996-05-11', 'Officia distinctio doloribus m', 'West Tristonhaven', 'Hungary', '2012-09-22 01:53:43', '2012-02-28 00:25:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (50, 'm', '1983-08-10', 'Sapiente eos atque eaque et od', 'Marvinburgh', 'Cape Verde', '2018-01-15 13:22:12', '2012-10-24 11:22:15');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (51, 'm', '1980-06-24', 'Harum rem non unde. Quis non a', 'West Chloechester', 'Libyan Arab Jamahiriya', '2011-03-25 06:32:25', '2017-02-14 05:25:25');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (52, 'm', '1992-11-21', 'Et consectetur maiores archite', 'South Karinebury', 'United States Minor Outlying Islands', '2013-11-20 09:07:40', '2016-01-27 13:30:32');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (53, 'm', '1973-06-19', 'Error qui qui quod eum. Molest', 'West Percivalfurt', 'Nepal', '2017-02-20 18:17:48', '2015-08-25 08:48:35');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (54, 'm', '1990-12-18', 'Voluptates nobis ut sint autem', 'North Katrina', 'Mali', '2018-09-30 08:17:16', '2019-12-02 18:20:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (55, 'f', '1973-11-12', 'Accusamus cumque possimus est.', 'Tristinhaven', 'Angola', '2016-01-25 09:01:14', '2019-01-16 05:32:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (56, 'm', '2006-07-28', 'Vel non voluptatum id id optio', 'New Edna', 'Serbia', '2013-10-18 07:06:49', '2017-01-31 19:23:17');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (57, 'f', '2017-12-01', 'In ex qui voluptas non qui inc', 'North Ella', 'Brazil', '2014-07-08 11:35:24', '2015-07-29 11:35:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (58, 'm', '1995-08-19', 'Architecto impedit a voluptati', 'Lolaton', 'Equatorial Guinea', '2019-02-14 23:09:29', '2013-07-13 23:10:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (59, 'm', '2005-03-10', 'Eius perferendis aut quibusdam', 'West Lesliemouth', 'Panama', '2015-08-11 17:49:51', '2016-05-14 22:01:01');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (60, 'm', '1976-10-18', 'Quia dolore voluptatem totam s', 'East Shanehaven', 'Netherlands', '2018-09-17 19:29:34', '2011-10-23 22:00:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (61, 'm', '2007-12-27', 'Minus totam porro sit est eius', 'Shanahanfurt', 'Lithuania', '2016-04-09 21:06:49', '2018-07-23 08:16:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (62, 'f', '1994-01-22', 'Amet eos voluptatem in quia qu', 'Bauchmouth', 'Bermuda', '2014-06-26 10:12:11', '2019-12-29 17:07:08');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (63, 'f', '1973-02-24', 'Sunt omnis id provident volupt', 'Fritschbury', 'Bosnia and Herzegovina', '2020-06-02 20:07:52', '2011-07-27 13:17:23');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (64, 'f', '1972-02-08', 'Non consectetur sint suscipit ', 'Lucybury', 'Tajikistan', '2016-06-27 07:07:47', '2018-02-12 03:41:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (65, 'm', '1996-05-11', 'Quos autem ea quidem labore ve', 'Lake Dedrictown', 'Spain', '2016-10-26 04:53:19', '2011-05-30 17:16:27');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (66, 'f', '2010-01-30', 'Voluptas quod rerum et necessi', 'East Isaac', 'British Virgin Islands', '2018-05-20 02:31:55', '2016-02-11 16:01:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (67, 'f', '1974-03-28', 'Aliquid accusamus libero in su', 'Yostberg', 'Serbia', '2017-04-02 08:23:59', '2020-05-22 21:59:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (68, 'f', '1981-09-08', 'Architecto eveniet sunt enim e', 'Albertafort', 'United States of America', '2017-05-25 04:41:09', '2016-01-16 15:57:14');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (69, 'f', '1991-08-12', 'Nesciunt autem eos eum. Aut qu', 'Zettaview', 'Denmark', '2019-09-13 12:07:48', '2017-09-08 01:38:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (70, 'f', '1970-05-10', 'Non sit accusantium laborum fu', 'Starkburgh', 'Gibraltar', '2020-10-04 21:39:32', '2017-12-25 19:10:07');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (71, 'm', '1998-03-06', 'Non atque consequatur ut archi', 'South Fiona', 'Switzerland', '2013-12-28 18:38:42', '2014-01-11 07:55:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (72, 'm', '2020-02-06', 'Et sunt ea nihil sunt animi vo', 'Lake Emelie', 'Guyana', '2012-09-23 01:01:51', '2017-06-11 23:43:24');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (73, 'm', '2001-12-17', 'Velit animi quis ut totam accu', 'Sanfordview', 'Iraq', '2014-10-04 18:03:56', '2014-11-24 21:54:20');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (74, 'm', '1991-12-14', 'Non est atque aut. Similique v', 'Erdmanside', 'Belarus', '2017-06-18 12:11:55', '2016-05-21 23:09:43');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (75, 'f', '2006-12-04', 'Rerum ipsam earum nemo optio d', 'Tryciaview', 'Greenland', '2013-07-27 21:17:06', '2018-05-19 04:19:04');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (76, 'f', '1970-02-19', 'Omnis nam doloremque nihil non', 'Karlmouth', 'Taiwan', '2011-12-02 20:26:05', '2014-09-30 06:31:36');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (77, 'f', '2017-10-31', 'Voluptatum placeat reiciendis ', 'South Tomas', 'Albania', '2016-05-10 18:40:39', '2013-05-14 20:07:32');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (78, 'f', '2006-07-12', 'Suscipit molestiae corporis is', 'Zemlakville', 'Suriname', '2020-10-09 04:15:37', '2016-11-30 15:32:06');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (79, 'f', '1977-02-16', 'Necessitatibus autem id esse n', 'Damarisburgh', 'Tajikistan', '2011-04-06 02:43:01', '2017-02-18 22:20:51');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (80, 'm', '1983-11-21', 'Doloribus quos vel tenetur seq', 'West Lela', 'Mauritius', '2016-06-10 08:07:41', '2020-03-11 13:36:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (81, 'f', '1988-05-16', 'Reprehenderit sint hic corrupt', 'North Rahsaan', 'Guyana', '2014-07-01 17:11:57', '2012-04-02 16:15:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (82, 'f', '1984-04-22', 'Velit qui architecto voluptate', 'Klington', 'Mayotte', '2011-08-31 14:21:17', '2014-03-22 14:21:26');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (83, 'f', '2004-10-23', 'Natus voluptate temporibus opt', 'Rowanborough', 'Mauritius', '2012-08-07 15:46:23', '2015-02-18 08:11:54');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (84, 'm', '1978-10-15', 'Est voluptas molestiae minima ', 'Anthonyfurt', 'Canada', '2016-06-11 00:00:00', '2016-11-20 17:25:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (85, 'm', '1977-07-17', 'Itaque tempore exercitationem ', 'Arnoville', 'Comoros', '2011-11-05 01:53:57', '2019-10-11 11:44:08');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (86, 'm', '1999-02-18', 'Ducimus id iure eveniet esse s', 'Port Kyle', 'Egypt', '2018-05-20 10:14:42', '2014-09-26 13:43:56');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (87, 'm', '1978-04-16', 'Et provident id sequi qui aper', 'Lylabury', 'Niue', '2019-02-14 13:56:50', '2011-08-16 19:03:04');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (88, 'f', '1977-06-18', 'Ex est voluptas ea adipisci. U', 'Markstown', 'French Southern Territories', '2014-12-14 01:21:12', '2015-10-14 11:40:04');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (89, 'f', '2008-05-13', 'Tempore soluta nihil aut corru', 'Port Twila', 'Marshall Islands', '2011-05-23 18:06:24', '2014-04-02 10:28:35');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (90, 'm', '2017-11-09', 'Voluptatem vero qui nihil et. ', 'East Geraldineborough', 'Papua New Guinea', '2016-10-03 07:01:41', '2015-08-17 11:04:10');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (91, 'm', '1971-08-28', 'Fugit voluptatem non sequi qua', 'Ankundingchester', 'Faroe Islands', '2014-06-23 22:18:55', '2012-06-24 05:07:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (92, 'm', '2011-11-25', 'Explicabo quia dignissimos sim', 'Anahifort', 'Aruba', '2011-06-22 15:44:22', '2014-04-10 16:42:16');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (93, 'f', '1992-09-09', 'A ut ipsam porro voluptas cons', 'Port Viviennehaven', 'Dominica', '2018-04-01 08:59:06', '2018-08-25 14:44:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (94, 'f', '1997-05-30', 'Optio ipsam et modi molestiae ', 'West Jaleel', 'Sri Lanka', '2011-08-12 08:15:07', '2019-01-17 05:37:32');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (95, 'm', '2018-06-28', 'Ipsam est qui enim laudantium.', 'North Marcia', 'Niger', '2016-02-20 16:26:12', '2013-05-14 20:52:19');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (96, 'f', '1973-10-02', 'Et sed sit ipsam consequatur. ', 'Kertzmannland', 'Vietnam', '2013-02-23 02:45:16', '2020-04-23 22:00:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (97, 'm', '1989-05-26', 'Et nulla eum at magnam aut in.', 'North Lorena', 'Korea', '2013-10-08 00:55:24', '2012-10-15 00:59:49');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (98, 'f', '2007-12-02', 'Et accusantium sequi voluptati', 'North Nicolette', 'Guernsey', '2011-11-29 05:02:21', '2017-12-06 01:59:10');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (99, 'm', '2008-03-16', 'Quos ut aut et ad. Amet aut ut', 'Corkerystad', 'Madagascar', '2018-12-04 17:47:45', '2018-10-05 03:56:27');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (100, 'f', '2016-09-25', 'Laboriosam repudiandae tempora', 'Effertzmouth', 'Portugal', '2013-02-05 06:27:59', '2013-06-27 17:48:45');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользователи';

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (1, 'Marjorie', 'Langosh', 'hodkiewicz.juanita@example.com', '08954167652', '2020-01-02 23:33:51', '2013-07-23 11:17:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (2, 'Cale', 'Kris', 'vonrueden.margarita@example.org', '(533)164-8228x1152', '2013-02-20 03:05:55', '2016-03-09 12:38:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (3, 'Rylee', 'Stamm', 'clara.cronin@example.org', '1-858-365-3720x22545', '2014-06-01 13:32:04', '2012-08-10 00:47:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (4, 'Melisa', 'Will', 'carolanne58@example.net', '1-923-883-9993x64669', '2015-06-06 02:29:20', '2012-06-15 01:01:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (5, 'Luna', 'Hudson', 'sydnie.marvin@example.org', '(239)729-0231', '2016-06-01 10:13:48', '2020-12-12 13:49:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (6, 'Dimitri', 'Gaylord', 'tkoelpin@example.org', '396.673.8695', '2020-11-06 02:07:38', '2019-05-27 00:36:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (7, 'Skylar', 'Robel', 'adams.jan@example.org', '868-386-5458x5277', '2017-06-01 11:20:50', '2018-10-03 21:08:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (8, 'Ima', 'Berge', 'vonrueden.jamir@example.org', '06806475387', '2020-02-08 12:48:54', '2018-06-30 22:46:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (9, 'Darius', 'Anderson', 'gusikowski.maurine@example.net', '(809)532-8515', '2011-01-10 07:15:14', '2016-11-06 00:45:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (10, 'Teresa', 'Purdy', 'mromaguera@example.net', '06988033732', '2018-07-26 13:29:29', '2019-03-16 23:35:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (11, 'Leola', 'Kunze', 'faye36@example.net', '(687)481-8240', '2017-05-24 13:42:31', '2020-02-05 06:49:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (12, 'Macy', 'DuBuque', 'rocio46@example.com', '416.508.4528', '2018-12-14 20:00:23', '2012-11-16 21:53:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (13, 'Nestor', 'Kirlin', 'uschmeler@example.org', '+86(0)6477467409', '2015-03-20 17:56:36', '2017-06-04 23:56:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (14, 'Meggie', 'Kirlin', 'dcollier@example.org', '1-027-643-1962x389', '2015-11-20 05:50:28', '2014-02-13 08:28:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (15, 'Hailie', 'Hand', 'kaley.bailey@example.net', '(619)187-9818', '2012-06-14 23:15:02', '2015-06-04 18:12:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (16, 'Dudley', 'Boehm', 'joey95@example.org', '333-036-6822', '2019-12-14 18:11:54', '2015-09-02 23:12:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (17, 'Kimberly', 'Wisoky', 'edmond31@example.com', '(943)255-8208', '2016-11-14 00:36:47', '2018-07-12 07:07:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (18, 'Hipolito', 'Hickle', 'mariah90@example.net', '835.486.8774x0467', '2019-10-11 19:36:12', '2020-04-25 06:14:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (19, 'Heather', 'Little', 'jcummerata@example.net', '182-749-8090', '2016-08-31 07:16:09', '2012-06-23 16:34:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (20, 'Roxanne', 'Koch', 'runolfsdottir.jacky@example.net', '768.494.9853x7606', '2019-07-17 04:48:29', '2018-01-12 10:54:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (21, 'Meda', 'Kris', 'kihn.annie@example.net', '487-818-8480', '2019-03-03 05:11:01', '2016-01-30 05:59:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (22, 'Dannie', 'Bins', 'leon.bruen@example.org', '1-907-634-4345x5442', '2013-11-06 15:07:14', '2015-02-15 03:54:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (23, 'Titus', 'Sanford', 'nikolas.gerhold@example.org', '+25(4)0403103565', '2016-02-05 00:35:57', '2017-11-14 23:24:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (24, 'Wilton', 'Simonis', 'garrison86@example.com', '458-195-4373', '2014-10-25 05:07:40', '2012-01-14 06:39:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (25, 'Dax', 'Keebler', 'lottie72@example.org', '1-998-623-0607', '2020-10-14 14:53:50', '2018-12-05 20:17:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (26, 'Solon', 'McLaughlin', 'pietro85@example.net', '160.076.8393x173', '2020-08-24 20:15:44', '2018-12-16 12:50:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (27, 'Greg', 'Halvorson', 'garrick10@example.net', '(075)563-6635', '2015-10-02 16:41:36', '2017-06-25 05:26:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (28, 'Cory', 'Rowe', 'keith52@example.net', '305.268.6871x524', '2013-02-06 17:21:36', '2019-05-04 01:32:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (29, 'Lemuel', 'Goyette', 'roslyn00@example.net', '(721)618-1837x705', '2016-05-07 09:14:09', '2018-11-26 08:50:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (30, 'Domenico', 'Blick', 'xo\'connell@example.com', '+19(8)1531216207', '2015-12-29 00:56:23', '2016-11-27 11:58:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (31, 'Onie', 'Gusikowski', 'alexander45@example.org', '(724)000-4764', '2018-05-28 15:32:55', '2016-06-06 02:30:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (32, 'Eva', 'Stiedemann', 'schmitt.ransom@example.com', '04160250069', '2013-04-16 08:03:04', '2017-07-25 00:26:48');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (33, 'Gloria', 'Prosacco', 'thompson.ron@example.com', '1-273-851-1179', '2016-11-29 16:08:44', '2014-08-02 04:32:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (34, 'Jeffery', 'Beahan', 'margaretta.kerluke@example.com', '1-222-503-7489', '2013-01-08 10:58:23', '2015-08-06 12:21:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (35, 'Bernita', 'Zboncak', 'giles.batz@example.org', '(481)887-6261x3670', '2016-11-14 04:54:51', '2018-02-18 01:07:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (36, 'Deshawn', 'Murray', 'evert20@example.org', '(424)792-8492', '2015-01-19 19:05:34', '2015-10-21 13:09:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (37, 'Philip', 'Roob', 'seth.jones@example.com', '601.897.0175x090', '2011-09-30 16:14:58', '2013-05-16 23:34:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (38, 'Granville', 'Collier', 'dane.cronin@example.org', '1-325-809-5039x1889', '2018-05-12 20:56:24', '2012-03-23 13:49:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (39, 'Emmanuelle', 'Welch', 'gdicki@example.org', '(674)824-1293x335', '2020-11-17 10:41:42', '2011-09-02 01:14:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (40, 'Genesis', 'Sauer', 'icartwright@example.org', '1-245-161-4307x088', '2018-07-26 15:57:15', '2014-07-21 01:42:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (41, 'Moriah', 'Schulist', 'steuber.henri@example.org', '298.841.6878', '2015-08-19 19:05:20', '2016-05-17 18:35:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (42, 'Lizzie', 'Zulauf', 'crona.major@example.com', '(039)043-0996x65427', '2011-11-27 11:18:31', '2019-08-22 09:49:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (43, 'Paxton', 'DuBuque', 'manley59@example.net', '1-122-100-7745', '2014-11-04 14:06:08', '2012-11-23 20:58:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (44, 'Jerod', 'Stiedemann', 'beer.zelda@example.net', '794.617.6499', '2020-05-19 03:16:21', '2014-11-24 23:52:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (45, 'Kenyon', 'Conn', 'fkutch@example.com', '1-809-302-6559x104', '2020-11-05 03:00:27', '2016-03-01 07:02:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (46, 'Zechariah', 'Hyatt', 'willa46@example.net', '(867)306-5496x11149', '2014-04-30 12:45:16', '2020-06-18 06:45:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (47, 'Vada', 'Hettinger', 'bednar.herta@example.com', '951-280-4133x333', '2020-06-02 22:43:55', '2011-12-18 07:53:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (48, 'Felipe', 'Bogan', 'hessel.aliza@example.org', '615-147-8729', '2020-10-14 03:22:52', '2018-03-07 02:43:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (49, 'Reba', 'Lang', 'lennie97@example.com', '01964122782', '2011-04-13 16:42:44', '2011-08-15 23:22:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (50, 'Kelly', 'Marquardt', 'kozey.frank@example.org', '655.699.0767x17248', '2011-01-31 19:42:33', '2014-10-10 13:28:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (51, 'Olaf', 'O\'Kon', 'tkilback@example.com', '09037026987', '2012-08-31 01:16:25', '2018-01-28 03:46:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (52, 'Gabriella', 'Schuppe', 'sschmeler@example.org', '07747334111', '2012-07-27 06:33:33', '2015-03-10 06:24:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (53, 'Tamia', 'Oberbrunner', 'hermiston.geraldine@example.org', '876.480.4704x2654', '2014-08-30 14:42:00', '2012-06-08 22:39:48');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (54, 'Virginie', 'Ledner', 'clemens64@example.org', '+56(1)9405413832', '2015-03-08 22:30:17', '2020-07-31 15:55:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (55, 'Agustin', 'Stokes', 'ludwig.abernathy@example.org', '+55(1)0839748836', '2016-08-09 09:55:51', '2017-04-03 14:59:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (56, 'Angel', 'Monahan', 'gleason.ellie@example.net', '(851)431-5921', '2011-08-09 08:36:23', '2019-11-30 12:14:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (57, 'Asha', 'Nicolas', 'patience13@example.com', '1-060-180-6396', '2016-12-04 00:50:19', '2016-10-22 03:24:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (58, 'Ross', 'Walter', 'gus.purdy@example.com', '537-296-4234x4088', '2015-12-19 05:52:47', '2011-12-03 10:34:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (59, 'Bryon', 'Lockman', 'telly20@example.com', '1-680-730-2943x0955', '2020-02-02 21:51:20', '2018-07-13 00:53:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (60, 'Paula', 'Sipes', 'stan.olson@example.com', '1-880-791-9665', '2015-04-30 04:22:08', '2015-05-11 02:34:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (61, 'Alvina', 'Vandervort', 'sandrine.conn@example.org', '048.486.3474x1130', '2011-06-18 18:14:28', '2015-08-01 18:30:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (62, 'Cortez', 'Cronin', 'tiffany.daniel@example.net', '+93(5)9216676595', '2013-05-04 23:57:41', '2016-09-05 11:09:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (63, 'Gust', 'Abbott', 'roman15@example.net', '(553)739-2679', '2013-05-30 19:23:12', '2016-03-22 02:13:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (64, 'Carmela', 'Cummerata', 'qferry@example.net', '1-610-132-3420x976', '2018-01-10 22:03:09', '2020-08-02 21:06:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (65, 'Chasity', 'Bednar', 'langosh.narciso@example.org', '1-527-460-8763', '2017-08-09 03:38:37', '2012-07-28 23:45:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (66, 'Luis', 'Murphy', 'emetz@example.org', '+91(8)4462438941', '2016-10-11 17:13:14', '2011-01-24 21:54:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (67, 'Tevin', 'Weber', 'wkoch@example.com', '391-501-1919x75147', '2019-07-24 18:15:13', '2011-01-26 11:18:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (68, 'Reymundo', 'Johns', 'pschumm@example.com', '(309)948-2844', '2018-05-23 10:54:55', '2015-09-25 05:38:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (69, 'Sid', 'Labadie', 'mthompson@example.org', '1-640-104-2032x87298', '2012-10-08 18:13:32', '2017-08-19 10:30:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (70, 'Marcelle', 'Marquardt', 'verona.effertz@example.org', '309-651-4482x0074', '2014-08-09 10:48:02', '2013-06-29 13:19:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (71, 'Ivah', 'Wyman', 'shanelle93@example.org', '050-344-3365x708', '2020-08-08 07:02:09', '2020-08-18 06:08:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (72, 'Retha', 'Gibson', 'mills.ned@example.com', '+56(0)9358542849', '2016-12-29 16:47:07', '2014-10-30 09:00:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (73, 'Vincenzo', 'Bergstrom', 'angelita.goodwin@example.net', '1-301-729-7968x36018', '2012-07-21 03:22:59', '2020-02-03 04:23:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (74, 'Gerson', 'Lemke', 'nienow.tessie@example.net', '1-111-751-5707x31914', '2015-07-28 12:18:21', '2014-12-12 18:27:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (75, 'Trent', 'Romaguera', 'jody17@example.net', '1-110-662-8196x172', '2012-09-08 10:28:06', '2019-01-01 18:56:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (76, 'Tatum', 'Ernser', 'stiedemann.sarina@example.com', '275.805.1146x0328', '2013-01-05 13:53:47', '2020-06-18 08:15:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (77, 'Modesta', 'Tromp', 'lyric.kunde@example.net', '996.096.6373x81683', '2017-12-20 20:55:41', '2017-05-23 15:26:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (78, 'Estefania', 'Brekke', 'gerry.gaylord@example.com', '005-944-8580x85451', '2013-10-22 06:17:46', '2012-05-12 15:21:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (79, 'Rico', 'Fay', 'uriah.bayer@example.com', '406.899.6710', '2019-01-31 04:55:51', '2013-11-15 15:42:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (80, 'Amari', 'Boehm', 'iliana35@example.org', '597.992.1784', '2019-09-15 13:36:37', '2019-10-11 13:02:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (81, 'Whitney', 'Grimes', 'angelita25@example.org', '157-868-9710x002', '2016-08-11 11:41:50', '2012-07-17 09:12:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (82, 'Herminia', 'Morar', 'tromp.carolyne@example.org', '(503)703-4718x16691', '2013-03-25 13:31:33', '2012-04-05 02:42:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (83, 'Emile', 'Schaefer', 'okey22@example.org', '136.501.8790', '2016-04-18 13:50:00', '2011-04-18 06:41:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (84, 'Rachael', 'Stark', 'fatima.goyette@example.net', '444-225-3364x437', '2011-12-15 19:42:50', '2020-07-03 00:27:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (85, 'Geovany', 'Sauer', 'brionna.schmitt@example.com', '00266671431', '2020-05-21 23:22:31', '2011-05-14 09:10:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (86, 'Chase', 'Klein', 'jd\'amore@example.com', '(194)570-7828', '2020-02-01 11:39:18', '2014-11-04 22:09:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (87, 'Bernardo', 'Waters', 'lcollins@example.org', '750-310-4928x3297', '2014-01-25 06:28:53', '2017-12-02 15:02:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (88, 'Kathlyn', 'Goodwin', 'rocky.effertz@example.org', '(401)747-4402', '2018-10-06 14:02:34', '2013-01-11 00:33:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (89, 'Tiffany', 'Zemlak', 'casimir95@example.net', '523.393.9382x8711', '2013-04-16 05:57:41', '2018-07-10 12:34:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (90, 'Nils', 'Kris', 'spouros@example.net', '(885)996-6083x455', '2018-06-16 21:29:18', '2013-07-22 21:04:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (91, 'Levi', 'Marquardt', 'bdach@example.com', '377.148.5934x9185', '2019-02-13 11:43:43', '2012-02-02 17:42:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (92, 'Melody', 'Bashirian', 'mckenzie.derick@example.org', '(383)990-7383x1815', '2014-10-22 06:39:40', '2016-06-28 09:04:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (93, 'Brian', 'Beer', 'lhuel@example.com', '1-830-349-5032x76089', '2016-05-19 16:40:23', '2012-06-23 15:33:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (94, 'Greta', 'Weber', 'coty53@example.org', '144-792-9859x7263', '2012-04-12 03:35:40', '2017-06-27 12:56:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (95, 'Gaetano', 'Pagac', 'wuckert.elyssa@example.net', '07015556685', '2020-11-30 05:22:37', '2019-03-07 03:36:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (96, 'Cydney', 'Wolff', 'wprice@example.com', '455-886-1262', '2011-02-07 18:52:59', '2013-11-05 18:22:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (97, 'Porter', 'Huel', 'qschumm@example.org', '559.819.5789x219', '2015-04-08 01:07:59', '2011-10-31 06:11:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (98, 'Dorothy', 'Mills', 'eva51@example.net', '081-311-6198x4764', '2018-06-03 10:47:21', '2014-07-03 08:19:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (99, 'Joanny', 'Feil', 'kirstin01@example.net', '972.524.1403x31515', '2013-01-29 15:30:39', '2012-06-01 19:06:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (100, 'Pierre', 'Hills', 'xwaelchi@example.org', '1-991-265-0241x26364', '2014-06-08 04:24:17', '2014-08-27 17:59:31');


