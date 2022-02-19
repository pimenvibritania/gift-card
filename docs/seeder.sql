# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: rest-api
# Generation Time: 2022-02-19 12:03:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table gift_rateds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gift_rateds`;

CREATE TABLE `gift_rateds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gift_redeemed_id` bigint(20) unsigned NOT NULL,
  `rating` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gift_rateds_gift_redeemed_id_foreign` (`gift_redeemed_id`),
  CONSTRAINT `gift_rateds_gift_redeemed_id_foreign` FOREIGN KEY (`gift_redeemed_id`) REFERENCES `gift_redeemeds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `gift_rateds` WRITE;
/*!40000 ALTER TABLE `gift_rateds` DISABLE KEYS */;

INSERT INTO `gift_rateds` (`id`, `gift_redeemed_id`, `rating`, `created_at`, `updated_at`)
VALUES
	(1,8,0.20,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(2,4,2.13,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(3,6,3.00,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(4,15,0.42,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(5,5,4.17,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(6,7,0.71,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(7,10,4.32,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(8,20,4.09,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(9,9,4.74,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(10,16,0.51,'2022-02-19 12:02:42','2022-02-19 12:02:42');

/*!40000 ALTER TABLE `gift_rateds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gift_redeemeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gift_redeemeds`;

CREATE TABLE `gift_redeemeds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gift_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gift_redeemeds_gift_id_foreign` (`gift_id`),
  KEY `gift_redeemeds_user_id_foreign` (`user_id`),
  CONSTRAINT `gift_redeemeds_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gift_redeemeds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `gift_redeemeds` WRITE;
/*!40000 ALTER TABLE `gift_redeemeds` DISABLE KEYS */;

INSERT INTO `gift_redeemeds` (`id`, `gift_id`, `user_id`, `quantity`, `created_at`, `updated_at`)
VALUES
	(1,5,1,7,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(2,37,2,3,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(3,85,2,9,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(4,77,1,7,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(5,63,1,8,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(6,49,1,9,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(7,4,2,3,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(8,38,2,1,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(9,63,2,9,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(10,8,2,6,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(11,63,2,8,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(12,22,1,3,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(13,35,1,10,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(14,98,1,8,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(15,26,2,6,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(16,77,1,9,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(17,96,2,1,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(18,10,1,8,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(19,76,1,3,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(20,48,1,10,'2022-02-19 12:02:42','2022-02-19 12:02:42');

/*!40000 ALTER TABLE `gift_redeemeds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gifts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gifts`;

CREATE TABLE `gifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) NOT NULL,
  `published` tinyint(1) DEFAULT '0',
  `stock` int(11) NOT NULL,
  `rating` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;

INSERT INTO `gifts` (`id`, `name`, `description`, `price`, `published`, `stock`, `rating`, `created_at`, `updated_at`)
VALUES
	(1,'Lourdes Beer','Non aut sunt perferendis est. Officiis natus inventore est voluptatem suscipit nisi ipsum. Qui sit rerum est est. Aut distinctio aut eum aut sit. Et odio quia alias est quo ut a dolorum.',42.56,1,5,0.22,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(2,'Dr. Uriah Denesik DVM','Rerum modi et odit. Possimus veniam neque suscipit vero veniam dolores ut. Sit est sunt rerum voluptatem.',21.86,0,1,3.23,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(3,'Leonora Rau','Dolorum placeat nostrum in et reprehenderit. Sunt voluptatem beatae delectus repellendus reiciendis rerum. Dolorem laborum sunt qui occaecati consectetur quaerat.',67.13,0,1,4.84,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(4,'Clementine Nikolaus','Pariatur est amet impedit. Dicta sint delectus quae possimus quis. A vel est consequuntur consequatur tenetur excepturi corporis. Earum corporis debitis corporis saepe.',46.84,1,0,0.71,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(5,'Melisa Mueller','Necessitatibus qui est voluptas earum ullam sint. Eligendi a voluptates reiciendis vel adipisci dolore. Perferendis amet ullam hic corporis.',40.07,0,4,0.00,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(6,'Haylee Heidenreich Jr.','Ut vel itaque ipsam. Quia ipsum aliquid facilis mollitia et. Porro ut rerum qui maxime ipsum quae quisquam. Voluptas a dolor non assumenda omnis nesciunt quibusdam.',8.50,1,3,3.93,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(7,'Harold Johnson','Libero beatae nostrum deserunt temporibus. Ipsa perspiciatis consequatur doloremque. Dolorem ut esse aspernatur facilis. Vel qui vel ut.',11.00,0,8,2.76,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(8,'Eriberto McClure Jr.','Dicta voluptas eaque nostrum officiis consectetur accusantium officia. Voluptatem magni saepe doloremque dicta sed dignissimos. Nesciunt consequatur et fugit repellat dolores. Ut nemo nisi deleniti.',9.70,1,4,4.32,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(9,'Julio Mayert','Earum est fugiat quis tempora quo. Impedit molestiae impedit hic ut. Et dolore omnis eos eum aut vitae accusamus.',23.35,1,1,0.28,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(10,'Weldon Mohr I','Magnam ut molestiae maiores rerum. Voluptates et sint illo earum ut. In delectus sequi nostrum explicabo recusandae consectetur. Neque voluptatem excepturi qui qui.',10.63,0,9,0.00,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(11,'Rocky Corwin','Totam eaque quo unde voluptas consequatur voluptatibus tempore. Quae labore quis unde vitae. Aspernatur corporis vel est facilis.',87.38,0,0,0.07,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(12,'Mr. Virgil Davis','Culpa qui incidunt accusamus corporis omnis voluptatem. Hic et sit voluptas culpa dignissimos. Similique adipisci perferendis cum odit. Officiis odit iusto qui minus.',7.51,0,2,1.52,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(13,'Cyrus Wunsch','Harum ipsa occaecati assumenda quasi eos aut. Autem ducimus pariatur autem quod mollitia dolores esse rem. Odit nisi consequatur rerum nemo.',28.34,0,5,1.31,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(14,'Mr. Shawn Wiegand PhD','Qui rerum nihil quia dolor in tenetur unde. Repellat hic eos reprehenderit cum. Autem aliquam quis incidunt odit reiciendis consectetur.',42.10,0,4,3.44,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(15,'Miss Alva Beahan III','Hic aut tenetur aut consequatur doloribus eius itaque. Rerum amet vero pariatur libero. Dolorem non commodi laboriosam omnis doloremque et iste. Quidem numquam distinctio et dicta nobis mollitia aut.',68.88,1,1,2.03,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(16,'Josie Dicki','Dolorem et rerum sed sequi repellendus. Et vitae qui quod cum exercitationem. Autem pariatur debitis cumque rerum.',36.25,0,8,3.58,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(17,'Gustave Kunze','Consectetur unde magni reiciendis dolores earum. Ut nemo totam et recusandae qui est rerum. Et et facilis non repellat. Et corrupti non excepturi omnis. Illo perferendis ut architecto sequi vel.',48.13,0,2,4.73,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(18,'Jeffry Swift','Quo similique nam dicta nobis dolorem vel. Eos qui quo rerum voluptates. Et voluptatem et ut est.',82.86,0,5,2.63,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(19,'Anjali Rosenbaum','Iste itaque error voluptatem quisquam dolores. Aut est non aspernatur aut amet minus. Illo illum autem cum quae. Nihil pariatur illo pariatur.',70.23,0,6,4.61,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(20,'Dr. Clyde Morar','Quia enim possimus occaecati nobis maiores ipsa. Et molestiae sunt maxime ducimus eum. At reprehenderit similique quas exercitationem. Perferendis ea laborum et hic unde mollitia sed.',90.54,1,1,2.77,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(21,'Ms. Kylee Mills','Nam facere ut est. Nam saepe dolorem est voluptas aspernatur voluptate. Et et esse ut eaque nihil qui et. Debitis maiores omnis optio eaque et.',44.01,1,8,1.00,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(22,'Dr. Amani Raynor IV','Officiis repellendus consequuntur laboriosam porro aliquid sint sit. Voluptate aperiam quo distinctio cumque inventore eveniet quisquam vitae. Ad dolorum nihil culpa vel ipsa architecto iusto sit.',21.54,1,0,0.00,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(23,'Abagail Gleichner','Est minus molestias dolorem dicta id nobis. Mollitia nesciunt hic sed vitae aut et voluptates. At quos id tenetur praesentium et quod.',60.30,1,4,2.02,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(24,'Shaniya Kuphal','Excepturi nostrum aut libero eum. Eum ut qui nobis nulla eum. Consequuntur sit delectus nulla non sint. Magnam enim nam beatae facere omnis ut doloribus.',30.80,0,2,2.63,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(25,'Micheal Quitzon DDS','Molestias quia aut sunt. Quia natus maiores distinctio cumque non sunt corrupti. Molestiae quae autem aut nulla tempore eligendi asperiores reprehenderit. Animi qui exercitationem ex et.',78.12,0,0,2.18,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(26,'Dr. Percy Cassin','Et et omnis fuga recusandae laboriosam totam. Ut quo error aut suscipit molestiae et repellendus. Dolorem nihil occaecati optio labore tempore ut.',99.45,1,3,0.42,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(27,'Nickolas Prohaska','Commodi pariatur sed consectetur laborum. Dolore tempora quis unde at. Aperiam totam nihil ipsa. Libero quia sit consequatur natus aut tempora suscipit.',62.21,1,4,1.78,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(28,'Roosevelt Hartmann','Aut dolorem quis quia ad. Magni laborum voluptatum accusamus corrupti adipisci qui id. Saepe ut sunt molestias nihil commodi quia et.',60.82,1,0,3.09,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(29,'Eileen Renner DVM','Consequatur deserunt reprehenderit beatae eaque. Dolor iste vero impedit. Et quia repellat aut cumque.',40.42,0,2,0.37,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(30,'Mr. Mohammed Nicolas','Aspernatur omnis dolores nobis. Explicabo et sapiente porro sit quis. Perferendis et nemo sunt debitis velit. Optio nesciunt quisquam sit mollitia aut ut.',33.95,1,8,1.32,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(31,'Prof. Bill Larkin','Hic ut velit voluptas quia non. Sapiente expedita voluptas qui voluptates reprehenderit. Voluptatem saepe sint occaecati dolor maxime non. Iusto voluptatem eos eos quo similique.',52.36,1,9,3.22,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(32,'Mrs. Claudia Hermann I','Asperiores et fugiat aliquam in fugiat sed id. Eveniet reiciendis quis quae in expedita deserunt sit ut.',0.19,1,7,1.90,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(33,'Jackeline Ullrich','Fuga tempora et perferendis doloribus error rerum nostrum. Voluptatem id magnam eos magni.',22.05,1,5,4.90,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(34,'Prof. Maria Klocko Jr.','Aut temporibus dolores soluta voluptatem occaecati. Quos et quia aliquam vitae. Eligendi harum et accusantium deserunt inventore illum itaque.',87.25,0,1,3.49,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(35,'Mr. Schuyler Romaguera','Quam deserunt ut eos tempora. Doloremque illo ab repellendus expedita consectetur incidunt. Consectetur nihil accusamus et facilis quos aperiam nobis.',64.82,0,9,0.00,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(36,'Hailie Collier','Consequatur a voluptate veniam asperiores deserunt modi. Iste ea laudantium enim sed nobis ut ea. Aliquid aperiam minus ex ullam libero iusto fuga. Praesentium totam inventore quia odit atque illum.',67.12,0,3,2.68,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(37,'Armando Macejkovic','Ut et dicta accusantium officiis neque. Velit sed enim aliquid molestiae officiis. Quia ratione dolorem voluptatem ea minima sint dicta. Aut omnis corrupti molestiae odit.',15.09,0,6,0.00,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(38,'Dr. Dameon Labadie','Eveniet autem qui autem id maiores iure. Itaque harum ratione beatae sed temporibus quis.',80.36,1,0,0.20,'2022-02-19 12:02:41','2022-02-19 12:02:42'),
	(39,'Ms. Beatrice Reynolds','Nemo laborum maxime distinctio recusandae totam est. Commodi ea sed et dolor temporibus et aliquid. Sit ipsa ea doloremque sunt voluptatem fugiat.',98.85,0,9,0.38,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(40,'Dock Boyer','Perferendis porro alias dicta. Beatae aspernatur dolor sunt.',68.05,1,3,4.80,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(41,'Margaret Dickens','Dolorem voluptatem voluptas maiores. Totam autem quibusdam a rerum. In non dolores quo eos. Error ex nobis excepturi maxime.',29.44,0,3,2.17,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(42,'Penelope Kassulke','Assumenda qui non et dicta nihil. Cumque enim aut est voluptatibus eligendi. Ipsum qui aliquid id voluptas pariatur harum esse. Asperiores quos in provident vel aut.',85.35,1,2,2.25,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(43,'Verlie Murazik V','In libero labore illo sint. Repudiandae nihil reiciendis et distinctio. Atque porro quae et exercitationem quos voluptatem consequuntur.',21.78,0,3,0.72,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(44,'Katelyn Schuster','In id vitae repellat ad. Ad et quo odit voluptas dolor sed. Ut ut et et omnis. Animi dicta ad eaque adipisci consequatur rerum in.',80.34,0,0,4.94,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(45,'Shayna Doyle','Sed modi culpa eveniet totam dolorem. Tempore in accusantium beatae blanditiis corrupti iure. Voluptatem quo necessitatibus fuga omnis provident quia.',94.33,0,0,2.62,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(46,'Eloise Leuschke III','Ut amet eum eum. Quas culpa iste unde nesciunt. Sint quibusdam dicta qui quia rerum aliquam eos. Qui quidem perspiciatis itaque adipisci non. Consequatur provident aliquam eum optio.',21.17,0,3,1.50,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(47,'Tania Dickinson','Reiciendis in id officiis officia sunt iusto et consectetur. Ipsum in voluptas delectus provident. Laudantium nesciunt ipsum corrupti soluta. Et repellendus pariatur tempore eveniet non aliquid.',86.72,0,5,4.37,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(48,'Oliver Christiansen','Distinctio doloremque fugiat enim alias praesentium. Sit nihil a dicta. A nisi eos minus repellendus maxime. Eaque ut odio aut suscipit vitae.',57.35,0,7,4.09,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(49,'Mr. Darren Kshlerin Jr.','Ut est repellat dolores ut soluta saepe. Maiores quidem quos et odit voluptas et non. Laudantium eligendi ut vitae non maiores iure corporis sit.',15.07,0,7,3.00,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(50,'Jammie Daugherty','Quo mollitia quia animi ut repellendus minima ab. Corrupti temporibus explicabo quo itaque quia similique itaque. Distinctio possimus iure et voluptatem voluptas eum voluptate.',52.41,1,1,2.25,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(51,'Dr. Kattie Jones','Est consequatur sit provident magnam facere nobis. Voluptas sunt pariatur saepe omnis laudantium occaecati. Omnis accusantium cupiditate dolorum ut magni.',92.00,1,4,0.42,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(52,'Santos Johnson','Ab non debitis ratione rerum. Incidunt vero perferendis repellendus nisi. Voluptatibus dolor molestias consequatur perferendis.',37.00,0,1,3.99,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(53,'Cale Cremin','Voluptas quas perspiciatis dicta ad sit. Temporibus illum omnis vero consequuntur. Illo omnis in sequi optio eius. Impedit similique voluptatem sit ad dignissimos voluptate.',2.48,1,9,2.11,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(54,'Judson Gaylord','Dolore repudiandae dolor quo beatae distinctio ut iure. Ad doloribus nostrum delectus eligendi deleniti aut et. Harum qui doloribus nisi. Itaque illo culpa ut nam ipsum optio dolores.',99.38,0,5,3.25,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(55,'Bennett Ward','Reiciendis minus culpa quasi dolores. Neque ut et at odit esse est nostrum ut. Error qui eligendi placeat adipisci et illum odit. Dolorem totam nobis molestiae impedit voluptatum assumenda rem.',92.49,0,0,4.09,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(56,'Faustino Feeney MD','Modi dolore mollitia nam eveniet. Est quos aperiam ut pariatur. Veniam impedit et repudiandae id sunt voluptatibus.',33.75,0,1,3.11,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(57,'Samara Mitchell I','Soluta porro magni est sed magnam. Atque animi quae sint. Perspiciatis fugit tenetur qui pariatur et delectus. Non at impedit non molestiae eius expedita.',48.94,1,5,4.20,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(58,'Prof. Toy Corkery IV','Qui qui ut cumque rem ut architecto officia. Quibusdam suscipit tempora dolorem eos. Illo possimus aliquid sed tenetur et aspernatur aliquid dolore.',17.48,0,8,4.60,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(59,'Toy Gislason','Veritatis magni nulla ipsum alias. Corrupti est quis repellat doloribus. Qui sit veritatis ut porro voluptatem natus.',8.44,0,6,3.09,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(60,'Magdalena Bashirian','Laudantium autem autem incidunt. Eveniet dolor reprehenderit consequuntur esse molestiae dolor. Qui qui qui rerum. Praesentium accusamus dolorum sed blanditiis. Excepturi quo quaerat quia iure natus.',43.71,0,3,4.17,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(61,'Santos Collins PhD','Error quae vel animi. Dolor illo unde odit voluptas at. Sequi sapiente odio est quia rem praesentium impedit.',80.88,1,9,4.04,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(62,'Sam Olson','Omnis minima iusto tempore vero laboriosam quis ducimus. Laboriosam aut modi perspiciatis possimus fuga nostrum enim. Saepe provident voluptates dicta corporis quidem sunt enim iure.',30.21,0,9,4.77,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(63,'Elwyn Padberg','Sit enim porro soluta eos laboriosam qui error. Accusamus qui fugit et soluta at. Minus velit reprehenderit saepe labore. Aut atque eveniet laudantium numquam inventore aut doloremque.',49.33,0,2,2.97,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(64,'Hilma Hammes Jr.','Quidem quia et velit eius ad. Vero ab dignissimos voluptatem veritatis aspernatur velit. Qui nulla assumenda id facere accusantium quasi molestias. Deleniti quasi qui possimus culpa quibusdam velit.',62.22,0,3,2.80,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(65,'Graham Gusikowski','Molestiae animi ut quo et dolorum magnam. Ratione expedita consectetur illo officia nulla est nulla. Repellat soluta consectetur enim consequuntur assumenda perferendis.',80.44,0,5,2.00,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(66,'Christopher Baumbach','Tempora porro dolor earum enim enim. Est iste officia iusto aut et inventore. Quibusdam rem et exercitationem culpa exercitationem vero. Consequatur officiis asperiores qui.',39.96,1,9,0.99,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(67,'Prof. Stone Cummerata MD','Enim explicabo enim quo qui voluptatem hic quae corrupti. Beatae et omnis sapiente voluptatem nulla. Voluptates similique nihil vitae eos labore sit iure.',4.29,0,7,3.62,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(68,'Roman Leannon','Autem dolore omnis velit qui eos suscipit blanditiis in. Modi repellendus molestiae unde minus et. Voluptatem consequatur praesentium quos maiores fugit et.',88.40,0,2,1.23,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(69,'Prof. Karson Becker','Aut consequatur ratione autem corrupti cum quam in qui. Repellendus aut ipsam fuga ipsum tenetur. Eum illum enim voluptas qui sunt.',18.01,0,5,4.55,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(70,'Dana Medhurst','Et et cumque fuga dolore quam sed veritatis. Id enim a omnis nam. Optio in accusantium est consequuntur.',29.89,0,0,0.31,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(71,'Kallie Schneider','Cupiditate dignissimos cum voluptatem labore sed. Porro quos id nam dolorem dicta fugit rem. Alias architecto rerum cumque consectetur.',67.40,1,1,4.49,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(72,'Hollis Dickens','Dicta et hic et excepturi. Ex in molestias libero odio omnis est ipsum quisquam. Et quibusdam aut non quidem id eum.',57.00,1,3,0.83,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(73,'Kelly Renner','Dolor voluptatem sint quis maiores autem culpa ea. Sapiente qui tempore voluptatem. Est qui est nesciunt consequatur. Cumque officia rerum sint id.',73.99,1,2,3.94,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(74,'Justina Murray','Eum autem assumenda velit ipsam ipsum fugiat rem. Autem aspernatur molestiae aliquam nihil rerum fugiat aliquam odio. Doloribus aut dolorem et quaerat. Sequi accusamus hic sint ut ad ut dolor ut.',2.41,1,3,4.89,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(75,'Dr. Jessie Hoeger','Ducimus officiis et ullam doloribus accusamus recusandae. Nemo accusantium sint unde facere. Dolorem voluptates velit est.',61.21,1,6,0.45,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(76,'Prof. Giovanni Jakubowski V','Soluta dolores inventore expedita maiores veniam fugiat rerum. Minima dolorem et dignissimos. Dolorum quas totam sint omnis suscipit eligendi vel.',60.36,1,4,0.00,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(77,'Dr. Elenora Hessel','Et necessitatibus enim sit odio. Vel unde rerum et esse. Qui id omnis molestiae vel. Sit voluptate at autem dolores modi velit esse.',69.56,0,0,1.32,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(78,'Mrs. Sandy Skiles Jr.','Voluptates esse id magnam laudantium aut. Voluptas quas doloribus quasi temporibus dolorem et. Quasi ea vero impedit ut.',81.31,1,9,4.02,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(79,'Clarissa Rempel','Alias repellat voluptas ab totam. Culpa iste facere labore optio. Ab illo ex quae vel esse. Natus incidunt maiores et cum.',94.34,0,3,0.59,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(80,'Prof. Nicklaus Collins','Quia asperiores quis voluptatum id. Odio dolor nihil quibusdam ut consequatur fugiat laudantium. Qui odio aut pariatur molestiae non aut.',60.96,0,0,4.47,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(81,'Garrett Wisoky','Dicta praesentium et ut et. Est accusamus quia saepe a voluptates. Dolorem et itaque ab.',66.02,1,3,1.82,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(82,'Mr. Lucas Daniel II','Cupiditate nobis qui animi sapiente facere. Ut facilis est a consequatur. Culpa aliquid possimus pariatur est ipsa cum velit vel. Eos aut explicabo fugiat dolorem.',54.63,0,8,0.38,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(83,'Bobby Smith','Veritatis dolor neque et cupiditate veniam suscipit enim. Ipsam velit et repellat officia ipsa aliquam. Saepe ipsa rem nam culpa dolores molestias. Minima quaerat omnis nam at.',47.38,0,4,4.38,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(84,'Sallie Schroeder','Dignissimos distinctio cupiditate rem nihil. Ut sed error dolor in. Aliquam dolorem repudiandae distinctio officiis eius excepturi.',25.78,1,7,3.71,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(85,'Heidi Kunze V','Laudantium accusamus ullam expedita ipsa. Ipsa et eum id mollitia numquam eius voluptatem.',91.98,1,8,0.00,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(86,'Miss Mathilde Christiansen','Quas consequatur non voluptatem deserunt non. Ut nemo praesentium culpa doloribus. Sed velit rerum ab occaecati.',1.84,0,9,1.61,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(87,'Winston Frami','Quas maxime voluptas quia molestiae. Et quia architecto quis magnam. Repellat deserunt et occaecati eum.',44.84,1,4,3.35,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(88,'Dr. Leo Mueller','Porro laboriosam doloribus excepturi recusandae eum ullam. Aut assumenda officia sed et. Officiis voluptate voluptatum doloremque. Cumque dolores iste blanditiis distinctio corrupti quas ullam.',27.27,0,9,3.77,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(89,'Antonietta Carter','Eos aliquam itaque praesentium deleniti est. Consectetur aut omnis et architecto quisquam asperiores. Et incidunt consequatur blanditiis qui distinctio harum.',12.07,1,3,3.35,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(90,'Lenora Ullrich I','Quo est eveniet repudiandae officiis similique voluptatem enim. Qui saepe harum itaque hic id assumenda. Nesciunt velit suscipit cumque sunt maiores. Odio officiis ea ullam dolor ipsum.',83.05,0,8,4.96,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(91,'Giovanni Oberbrunner III','Facere eveniet alias natus. Rerum voluptas et odit in et beatae voluptate. Itaque a quis sapiente provident. Eum at sed dolorem vel aut cumque.',42.50,1,8,1.21,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(92,'Tristin Haley','Eum sed aliquam et quidem non aut. Vel fugit debitis voluptatem sit et doloribus. Incidunt illo reprehenderit enim in officiis. Eligendi quae ut et.',41.19,0,2,3.33,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(93,'Athena McKenzie II','Quo aut sit aut facilis. Autem at occaecati maiores amet nam quam illum. Soluta mollitia incidunt omnis quia qui reiciendis. Totam voluptatibus laboriosam consequatur ut enim fuga.',50.63,1,1,2.76,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(94,'Sasha Hamill','Non voluptatem vel est quo quo. Sed non et quas enim unde. Illum quam soluta alias dicta. Et sint soluta accusantium unde aut velit et.',67.40,0,3,1.25,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(95,'Anabelle Russel','Assumenda non iusto et ut incidunt. Sit et doloremque qui praesentium sapiente temporibus accusamus. Eos ex excepturi qui neque qui et. Quis assumenda fuga sed et odit quae.',74.29,1,9,3.76,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(96,'Ms. Estella Hoeger Sr.','Animi cum ut labore. Unde aut sequi sint hic. Molestiae error eveniet consequatur voluptas quas dicta.',17.38,0,5,0.00,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(97,'Gus Thiel PhD','Ab voluptatem vero possimus quibusdam animi eum. Beatae dolor dolorem quasi reiciendis. Id aut ipsam alias rerum harum. Ipsa molestias sed maxime et ex eum voluptates.',71.28,0,7,1.05,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(98,'Dr. Keaton Heller I','Illum asperiores delectus provident aut similique. Et dolorem voluptas est omnis. Non quia et aliquam tempore cumque veniam vero voluptas.',77.33,1,4,0.00,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(99,'Frieda Shanahan','Aut aut facere non possimus ad omnis et dolores. Officiis illum autem quidem est. Aut omnis pariatur aut nostrum odio perspiciatis.',55.71,1,4,0.96,'2022-02-19 12:02:42','2022-02-19 12:02:42'),
	(100,'Abdullah Beer','Autem qui qui ut voluptates aut nam odit. Qui similique sunt aut. Facilis saepe animi nemo minima aut sint quia sit. Iure in illo ut ipsum. Ipsum sequi ipsum quo sed consequatur qui natus eos.',66.52,1,0,1.84,'2022-02-19 12:02:42','2022-02-19 12:02:42');

/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2022_02_18_193307_create_permission_tables',1),
	(6,'2022_02_18_204821_create_gifts_table',1),
	(7,'2022_02_18_214854_create_gift_redeemeds_table',1),
	(8,'2022_02_18_215026_create_gift_rateds_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\Models\\User',1),
	(2,'App\\Models\\User',2);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','api','2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(2,'member','api','2022-02-19 12:02:41','2022-02-19 12:02:41');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin@mail.com',NULL,'$2y$10$mUyCFpi32eB15AC3O4SbRukG9brygU/9rrWMBYGyBEMcQpbQ3RF6.',NULL,'2022-02-19 12:02:41','2022-02-19 12:02:41'),
	(2,'Member','member@mail.com',NULL,'$2y$10$FCkG86NgfxCqrfwExP9IEeMoYA6GpBTW9hNM6cKexdZi4II7d0fwO',NULL,'2022-02-19 12:02:41','2022-02-19 12:02:41');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
