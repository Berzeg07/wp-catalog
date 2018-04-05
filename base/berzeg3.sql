-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 05 2018 г., 10:36
-- Версия сервера: 5.5.53
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `berzeg3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Автор комментария', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-03-05 14:14:24', '2018-03-05 11:14:24', 'Привет! Это комментарий.\nЧтобы начать модерировать, редактировать и удалять комментарии, перейдите на экран «Комментарии» в консоли.\nАватары авторов комментариев загружаются с сервиса <a href=\"https://ru.gravatar.com\">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_duplicator_packages`
--

CREATE TABLE `wp_duplicator_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner` varchar(60) NOT NULL,
  `package` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wp_duplicator_packages`
--

INSERT INTO `wp_duplicator_packages` (`id`, `name`, `hash`, `status`, `created`, `owner`, `package`) VALUES
(2, '20180316_katalog', '95cd521389eb317d6559180316130934', 100, '2018-03-16 13:09:52', 'admin', 0x4f3a31313a224455505f5061636b616765223a32333a7b733a373a2243726561746564223b733a31393a22323031382d30332d31362031333a30393a3334223b733a373a2256657273696f6e223b733a363a22312e322e3334223b733a393a2256657273696f6e5750223b733a353a22342e392e34223b733a393a2256657273696f6e4442223b733a363a22352e352e3533223b733a31303a2256657273696f6e504850223b733a363a22352e352e3338223b733a393a2256657273696f6e4f53223b733a353a2257494e4e54223b733a323a224944223b693a323b733a343a224e616d65223b733a31363a2232303138303331365f6b6174616c6f67223b733a343a2248617368223b733a33323a223935636435323133383965623331376436353539313830333136313330393334223b733a383a224e616d6548617368223b733a34393a2232303138303331365f6b6174616c6f675f3935636435323133383965623331376436353539313830333136313330393334223b733a343a2254797065223b693a303b733a353a224e6f746573223b733a303a22223b733a393a2253746f726550617468223b733a35303a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f67322f77702d736e617073686f74732f746d70223b733a383a2253746f726555524c223b733a33323a22687474703a2f2f77702d636174616c6f67322f77702d736e617073686f74732f223b733a383a225363616e46696c65223b733a35393a2232303138303331365f6b6174616c6f675f39356364353231333839656233313764363535393138303331363133303933345f7363616e2e6a736f6e223b733a373a2252756e74696d65223b733a31313a223139362e3535207365632e223b733a373a2245786553697a65223b733a383a223434352e32344b42223b733a373a225a697053697a65223b733a363a2236352e344d42223b733a363a22537461747573223b4e3b733a363a22575055736572223b733a353a2261646d696e223b733a373a2241726368697665223b4f3a31313a224455505f41726368697665223a31393a7b733a31303a2246696c74657244697273223b733a303a22223b733a31313a2246696c74657246696c6573223b733a303a22223b733a31303a2246696c74657245787473223b733a303a22223b733a31333a2246696c74657244697273416c6c223b613a303a7b7d733a31343a2246696c74657246696c6573416c6c223b613a303a7b7d733a31333a2246696c74657245787473416c6c223b613a303a7b7d733a383a2246696c7465724f6e223b693a303b733a31323a224578706f72744f6e6c794442223b693a303b733a343a2246696c65223b733a36313a2232303138303331365f6b6174616c6f675f39356364353231333839656233313764363535393138303331363133303933345f617263686976652e7a6970223b733a363a22466f726d6174223b733a333a225a4950223b733a373a225061636b446972223b733a33333a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f6732223b733a343a2253697a65223b693a36383538313833343b733a343a2244697273223b613a303a7b7d733a353a2246696c6573223b613a303a7b7d733a31303a2246696c746572496e666f223b4f3a32333a224455505f417263686976655f46696c7465725f496e666f223a383a7b733a343a2244697273223b4f3a33343a224455505f417263686976655f46696c7465725f53636f70655f4469726563746f7279223a343a7b733a373a225761726e696e67223b613a303a7b7d733a31303a22556e7265616461626c65223b613a303a7b7d733a343a22436f7265223b613a303a7b7d733a383a22496e7374616e6365223b613a303a7b7d7d733a353a2246696c6573223b4f3a32393a224455505f417263686976655f46696c7465725f53636f70655f46696c65223a353a7b733a343a2253697a65223b613a303a7b7d733a373a225761726e696e67223b613a303a7b7d733a31303a22556e7265616461626c65223b613a303a7b7d733a343a22436f7265223b613a303a7b7d733a383a22496e7374616e6365223b613a303a7b7d7d733a343a2245787473223b4f3a32393a224455505f417263686976655f46696c7465725f53636f70655f42617365223a323a7b733a343a22436f7265223b613a303a7b7d733a383a22496e7374616e6365223b613a303a7b7d7d733a393a2255446972436f756e74223b693a303b733a31303a225546696c65436f756e74223b693a303b733a393a2255457874436f756e74223b693a303b733a383a225472656553697a65223b613a303a7b7d733a31313a22547265655761726e696e67223b613a303a7b7d7d733a31343a225265637572736976654c696e6b73223b613a303a7b7d733a31303a22002a005061636b616765223b723a313b733a32393a22004455505f4172636869766500746d7046696c74657244697273416c6c223b613a303a7b7d733a32343a22004455505f41726368697665007770436f72655061746873223b613a363a7b693a303b733a34323a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f67322f77702d61646d696e223b693a313b733a35323a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f67322f77702d636f6e74656e742f75706c6f616473223b693a323b733a35343a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f67322f77702d636f6e74656e742f6c616e677561676573223b693a333b733a35323a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f67322f77702d636f6e74656e742f706c7567696e73223b693a343b733a35313a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f67322f77702d636f6e74656e742f7468656d6573223b693a353b733a34353a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f67322f77702d696e636c75646573223b7d7d733a393a22496e7374616c6c6572223b4f3a31333a224455505f496e7374616c6c6572223a373a7b733a343a2246696c65223b733a36333a2232303138303331365f6b6174616c6f675f39356364353231333839656233313764363535393138303331363133303933345f696e7374616c6c65722e706870223b733a343a2253697a65223b693a3435353932323b733a31303a224f7074734442486f7374223b733a303a22223b733a31303a224f7074734442506f7274223b733a303a22223b733a31303a224f70747344424e616d65223b733a303a22223b733a31303a224f707473444255736572223b733a303a22223b733a31303a22002a005061636b616765223b723a313b7d733a383a224461746162617365223b4f3a31323a224455505f4461746162617365223a31333a7b733a343a2254797065223b733a353a224d7953514c223b733a343a2253697a65223b693a3732393438343b733a343a2246696c65223b733a36323a2232303138303331365f6b6174616c6f675f39356364353231333839656233313764363535393138303331363133303933345f64617461626173652e73716c223b733a343a2250617468223b4e3b733a31323a2246696c7465725461626c6573223b733a303a22223b733a383a2246696c7465724f6e223b693a303b733a343a224e616d65223b4e3b733a31303a22436f6d70617469626c65223b733a303a22223b733a383a22436f6d6d656e7473223b733a32383a224d7953514c20436f6d6d756e69747920536572766572202847504c29223b733a31303a22002a005061636b616765223b723a313b733a32353a22004455505f446174616261736500646253746f726550617468223b733a3131333a22443a2f4f70656e5365727665722f646f6d61696e732f77702d636174616c6f67322f77702d736e617073686f74732f746d702f32303138303331365f6b6174616c6f675f39356364353231333839656233313764363535393138303331363133303933345f64617461626173652e73716c223b733a32333a22004455505f446174616261736500454f464d61726b6572223b733a303a22223b733a32363a22004455505f4461746162617365006e6574776f726b466c757368223b623a303b7d7d);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://wp-catalog2', 'yes'),
(2, 'home', 'http://wp-catalog2', 'yes'),
(3, 'blogname', 'Каталог', 'yes'),
(4, 'blogdescription', 'Ещё один сайт на WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'berezg86@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%category%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:93:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:31:\".+?/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\".+?/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:37:\".+?/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"(.+?)/([^/]+)/embed/?$\";s:63:\"index.php?category_name=$matches[1]&name=$matches[2]&embed=true\";s:26:\"(.+?)/([^/]+)/trackback/?$\";s:57:\"index.php?category_name=$matches[1]&name=$matches[2]&tb=1\";s:46:\"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:41:\"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:34:\"(.+?)/([^/]+)/page/?([0-9]{1,})/?$\";s:70:\"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]\";s:41:\"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:70:\"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]\";s:30:\"(.+?)/([^/]+)(?:/([0-9]+))?/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]\";s:20:\".+?/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:30:\".+?/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:50:\".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:26:\".+?/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:38:\"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:33:\"(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:14:\"(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:26:\"(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:33:\"(.+?)/comment-page-([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&cpage=$matches[2]\";s:8:\"(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:8:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";i:2;s:49:\"category-seo-meta-tags/category-seo-meta-tags.php\";i:3;s:25:\"duplicator/duplicator.php\";i:4;s:41:\"ns-category-widget/ns-category-widget.php\";i:5;s:33:\"rich-text-tags/rich-text-tags.php\";i:6;s:23:\"rustolat/rus-to-lat.php\";i:7;s:39:\"single-post-template/post_templates.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:73:\"D:/OpenServer/domains/wp-catalog2/wp-content/themes/catalog/functions.php\";i:1;s:70:\"D:/OpenServer/domains/wp-catalog2/wp-content/themes/catalog/header.php\";i:2;s:69:\"D:/OpenServer/domains/wp-catalog2/wp-content/themes/catalog/index.php\";i:4;s:69:\"D:/OpenServer/domains/wp-catalog2/wp-content/themes/catalog/style.css\";i:5;s:83:\"D:/OpenServer/domains/wp-catalog2/wp-content/plugins/advanced-custom-fields/acf.php\";}', 'no'),
(40, 'template', 'catalog', 'yes'),
(41, 'stylesheet', 'catalog', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:16:\"aiosp_manage_seo\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'WPLANG', 'ru_RU', 'yes'),
(95, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'sidebars_widgets', 'a:6:{s:8:\"footer-1\";a:1:{i:0;s:13:\"custom_html-2\";}s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:11:\"footer-cont\";a:1:{i:0;s:13:\"custom_html-3\";}s:15:\"product-contact\";a:1:{i:0;s:13:\"custom_html-4\";}s:16:\"homepage-sidebar\";a:1:{i:0;s:20:\"ns-category-widget-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(101, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'nonce_key', 'UV5K<Z$HqG!~`[E-#9+g+-2i,7*!M:AcvE.x50_rWV*L-pt^quOCtj~EmwCkPGjs', 'no'),
(108, 'nonce_salt', '[h,w.PC|W.1l3u/wfzb-h 9YGBFOb|v`)V5V91z*s@r_bn,YC;.oTt[-%HGFq5!=', 'no'),
(109, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:4:{i:2;a:2:{s:5:\"title\";s:16:\"Контакты\";s:7:\"content\";s:183:\"<span class=\"product-page_phone\">+7(988)929-45-11</span><br>\r\n			<span class=\"product-page_inst\">printhouse07</span><br>\r\n			<span class=\"product-page_email\">test@gmail.com</span><br>\";}i:3;a:2:{s:5:\"title\";s:16:\"Контакты\";s:7:\"content\";s:183:\"<span class=\"product-page_phone\">+7(988)929-45-11</span><br>\r\n			<span class=\"product-page_inst\">printhouse07</span><br>\r\n			<span class=\"product-page_email\">test@gmail.com</span><br>\";}i:4;a:2:{s:5:\"title\";s:85:\"Для заказа обращайтесь по указанным контактам\";s:7:\"content\";s:318:\"<span class=\"product-page_phone\">+7(928)077-88-46</span><br>\r\n<span class=\"product-page_inst\">printius</span><br>\r\n<span class=\"product-page_email\">test@mail.ru</span><br>\r\n<p class=\"product-page_contact__discounts\">Индивидуальная система скидок при заказе от 3 изделий</p>\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'cron', 'a:5:{i:1522926865;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1522926886;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1522938061;a:1:{s:19:\"wpseo-reindex-links\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1522997873;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(113, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1520253658;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(124, 'auth_key', 'Sp$Wtpq]PQI4K!Tq$)n;d?Z+C#%lPLv@(_SsFH#ObrL>1A-f=e,s5%f;dvigvR_i', 'no'),
(125, 'auth_salt', 'b?}^CRaA8m}eZ#=9>s*s&wBCZPD0`#N%y_6KVI3kQdDy?L_}]1=e.EfIH 7Zi]kF', 'no'),
(126, 'logged_in_key', 't}k`j=@HmY9EQMJu3$n&w+M#;#$=M%*$LR^9_~kdb%$fVzJ~FHJd:K$F6pug^,s2', 'no'),
(127, 'logged_in_salt', 'zo1YojzB;@uWi_18UHY)vKPWh6ga&d^IU;dMd4IDNlrI9!R!6Uj!kUqXGoZO]yO~', 'no'),
(133, 'can_compress_scripts', '1', 'no'),
(149, 'current_theme', 'Katalog', 'yes'),
(150, 'theme_mods_catalog', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:10:\"FooterMenu\";i:8;s:4:\"menu\";i:2;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(151, 'theme_switched', '', 'yes'),
(170, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(190, 'recently_activated', 'a:1:{s:47:\"post-tags-and-categories-for-pages/post-tag.php\";i:1521467451;}', 'yes'),
(197, 'acf_version', '4.4.12', 'yes'),
(288, 'wpseo', 'a:18:{s:15:\"ms_defaults_set\";b:0;s:7:\"version\";s:5:\"7.0.1\";s:20:\"disableadvanced_meta\";b:1;s:19:\"onpage_indexability\";b:1;s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:22:\"show_onboarding_notice\";b:1;s:18:\"first_activated_on\";i:1520432461;}', 'yes'),
(289, 'wpseo_titles', 'a:64:{s:10:\"title_test\";i:0;s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Author at %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:63:\"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:35:\"Page not found %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:53:\"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:20:\"breadcrumbs-404crumb\";s:25:\"Error 404: Page not found\";s:23:\"breadcrumbs-blog-remove\";b:0;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:12:\"Archives for\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:16:\"You searched for\";s:15:\"breadcrumbs-sep\";s:7:\"&raquo;\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:0:\"\";s:17:\"stripcategorybase\";b:0;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:18:\"title-tax-category\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:18:\"title-tax-post_tag\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:21:\"title-tax-post_format\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;s:23:\"post_types-post-maintax\";i:0;}', 'yes'),
(291, 'wpseo_social', 'a:20:{s:9:\"fb_admins\";a:0:{}s:12:\"fbconnectkey\";s:32:\"45c81cc1048e35f6b2cbfb97bc9ebdb1\";s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:14:\"plus-publisher\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:15:\"google_plus_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}', 'yes'),
(292, 'wpseo_flush_rewrite', '1', 'yes'),
(302, 'csmt_options', 'a:5:{s:12:\"csmt_enabled\";s:1:\"1\";s:21:\"csmt_cat_title_format\";N;s:21:\"csmt_cat_paged_format\";N;s:21:\"csmt_tag_title_format\";N;s:21:\"csmt_tag_paged_format\";N;}', 'yes'),
(322, 'new_admin_email', 'berezg86@gmail.com', 'yes'),
(407, 'duplicator_version_plugin', '1.2.34', 'yes'),
(410, 'duplicator_exe_safe_mode', '0', 'yes'),
(411, 'duplicator_settings', 'a:10:{s:7:\"version\";s:6:\"1.2.34\";s:18:\"uninstall_settings\";b:1;s:15:\"uninstall_files\";b:1;s:16:\"uninstall_tables\";b:1;s:13:\"package_debug\";b:0;s:17:\"package_mysqldump\";b:1;s:22:\"package_mysqldump_path\";s:0:\"\";s:24:\"package_phpdump_qrylimit\";s:3:\"100\";s:17:\"package_zip_flush\";b:0;s:20:\"storage_htaccess_off\";b:0;}', 'yes'),
(427, 'aioseop_options', 'a:80:{s:16:\"aiosp_home_title\";N;s:22:\"aiosp_home_description\";s:0:\"\";s:20:\"aiosp_togglekeywords\";i:1;s:19:\"aiosp_home_keywords\";N;s:26:\"aiosp_use_static_home_info\";i:0;s:9:\"aiosp_can\";i:1;s:30:\"aiosp_no_paged_canonical_links\";i:0;s:31:\"aiosp_customize_canonical_links\";i:0;s:20:\"aiosp_rewrite_titles\";i:1;s:20:\"aiosp_force_rewrites\";i:1;s:24:\"aiosp_use_original_title\";i:0;s:28:\"aiosp_home_page_title_format\";s:12:\"%page_title%\";s:23:\"aiosp_page_title_format\";s:27:\"%page_title% | %blog_title%\";s:23:\"aiosp_post_title_format\";s:27:\"%post_title% | %blog_title%\";s:27:\"aiosp_category_title_format\";s:31:\"%category_title% | %blog_title%\";s:26:\"aiosp_archive_title_format\";s:30:\"%archive_title% | %blog_title%\";s:23:\"aiosp_date_title_format\";s:21:\"%date% | %blog_title%\";s:25:\"aiosp_author_title_format\";s:23:\"%author% | %blog_title%\";s:22:\"aiosp_tag_title_format\";s:20:\"%tag% | %blog_title%\";s:25:\"aiosp_search_title_format\";s:23:\"%search% | %blog_title%\";s:24:\"aiosp_description_format\";s:13:\"%description%\";s:22:\"aiosp_404_title_format\";s:33:\"Nothing found for %request_words%\";s:18:\"aiosp_paged_format\";s:14:\" - Part %page%\";s:17:\"aiosp_enablecpost\";s:2:\"on\";s:17:\"aiosp_cpostactive\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:19:\"aiosp_cpostadvanced\";i:0;s:18:\"aiosp_cpostnoindex\";a:0:{}s:19:\"aiosp_cpostnofollow\";a:0:{}s:17:\"aiosp_cposttitles\";i:0;s:21:\"aiosp_posttypecolumns\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:19:\"aiosp_google_verify\";s:0:\"\";s:17:\"aiosp_bing_verify\";s:0:\"\";s:22:\"aiosp_pinterest_verify\";s:0:\"\";s:22:\"aiosp_google_publisher\";s:0:\"\";s:28:\"aiosp_google_disable_profile\";i:0;s:29:\"aiosp_google_sitelinks_search\";N;s:26:\"aiosp_google_set_site_name\";N;s:30:\"aiosp_google_specify_site_name\";N;s:28:\"aiosp_google_author_advanced\";i:0;s:28:\"aiosp_google_author_location\";a:1:{i:0;s:3:\"all\";}s:29:\"aiosp_google_enable_publisher\";s:2:\"on\";s:30:\"aiosp_google_specify_publisher\";N;s:25:\"aiosp_google_analytics_id\";N;s:25:\"aiosp_ga_advanced_options\";s:2:\"on\";s:15:\"aiosp_ga_domain\";N;s:21:\"aiosp_ga_multi_domain\";i:0;s:21:\"aiosp_ga_addl_domains\";N;s:21:\"aiosp_ga_anonymize_ip\";N;s:28:\"aiosp_ga_display_advertising\";N;s:22:\"aiosp_ga_exclude_users\";N;s:29:\"aiosp_ga_track_outbound_links\";i:0;s:25:\"aiosp_ga_link_attribution\";i:0;s:27:\"aiosp_ga_enhanced_ecommerce\";i:0;s:20:\"aiosp_use_categories\";i:0;s:26:\"aiosp_use_tags_as_keywords\";i:1;s:32:\"aiosp_dynamic_postspage_keywords\";i:1;s:22:\"aiosp_category_noindex\";i:1;s:26:\"aiosp_archive_date_noindex\";i:1;s:28:\"aiosp_archive_author_noindex\";i:1;s:18:\"aiosp_tags_noindex\";i:0;s:20:\"aiosp_search_noindex\";i:0;s:17:\"aiosp_404_noindex\";i:0;s:17:\"aiosp_tax_noindex\";a:0:{}s:23:\"aiosp_paginated_noindex\";i:0;s:24:\"aiosp_paginated_nofollow\";i:0;s:27:\"aiosp_generate_descriptions\";i:0;s:18:\"aiosp_skip_excerpt\";i:0;s:20:\"aiosp_run_shortcodes\";i:0;s:33:\"aiosp_hide_paginated_descriptions\";i:0;s:32:\"aiosp_dont_truncate_descriptions\";i:0;s:19:\"aiosp_schema_markup\";i:1;s:20:\"aiosp_unprotect_meta\";i:0;s:33:\"aiosp_redirect_attachement_parent\";i:0;s:14:\"aiosp_ex_pages\";s:0:\"\";s:20:\"aiosp_post_meta_tags\";s:0:\"\";s:20:\"aiosp_page_meta_tags\";s:0:\"\";s:21:\"aiosp_front_meta_tags\";s:0:\"\";s:20:\"aiosp_home_meta_tags\";s:0:\"\";s:12:\"aiosp_do_log\";N;s:19:\"last_active_version\";s:7:\"2.4.5.1\";}', 'yes'),
(630, 'nscw_plugin_options', 'a:3:{s:36:\"nscw_field_enable_ns_category_widget\";i:1;s:29:\"nscw_field_enable_tree_script\";i:1;s:28:\"nscw_field_enable_tree_style\";i:1;}', 'yes'),
(631, 'widget_ns-category-widget', 'a:2:{i:2;a:15:{s:5:\"title\";s:18:\"Категории\";s:15:\"parent_category\";i:0;s:8:\"taxonomy\";s:8:\"category\";s:5:\"depth\";i:0;s:7:\"orderby\";s:2:\"ID\";s:5:\"order\";s:3:\"asc\";s:10:\"hide_empty\";i:1;s:15:\"show_post_count\";i:0;s:6:\"number\";s:0:\"\";s:16:\"include_category\";s:0:\"\";s:16:\"exclude_category\";s:0:\"\";s:11:\"enable_tree\";i:0;s:15:\"tree_show_icons\";i:0;s:14:\"tree_show_dots\";i:1;s:15:\"tree_save_state\";i:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(700, 'duplicator_package_active', 'O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2018-03-16 13:09:34\";s:7:\"Version\";s:6:\"1.2.34\";s:9:\"VersionWP\";s:5:\"4.9.4\";s:9:\"VersionDB\";s:6:\"5.5.53\";s:10:\"VersionPHP\";s:6:\"5.5.38\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:16:\"20180316_katalog\";s:4:\"Hash\";s:32:\"95cd521389eb317d6559180316130934\";s:8:\"NameHash\";s:49:\"20180316_katalog_95cd521389eb317d6559180316130934\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:50:\"D:/OpenServer/domains/wp-catalog2/wp-snapshots/tmp\";s:8:\"StoreURL\";s:32:\"http://wp-catalog2/wp-snapshots/\";s:8:\"ScanFile\";s:59:\"20180316_katalog_95cd521389eb317d6559180316130934_scan.json\";s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";N;s:6:\"WPUser\";N;s:7:\"Archive\";O:11:\"DUP_Archive\":19:{s:10:\"FilterDirs\";s:0:\"\";s:11:\"FilterFiles\";s:0:\"\";s:10:\"FilterExts\";s:0:\"\";s:13:\"FilterDirsAll\";a:0:{}s:14:\"FilterFilesAll\";a:0:{}s:13:\"FilterExtsAll\";a:0:{}s:8:\"FilterOn\";i:0;s:12:\"ExportOnlyDB\";i:0;s:4:\"File\";N;s:6:\"Format\";s:3:\"ZIP\";s:7:\"PackDir\";s:33:\"D:/OpenServer/domains/wp-catalog2\";s:4:\"Size\";i:0;s:4:\"Dirs\";a:0:{}s:5:\"Files\";a:0:{}s:10:\"FilterInfo\";O:23:\"DUP_Archive_Filter_Info\":8:{s:4:\"Dirs\";O:34:\"DUP_Archive_Filter_Scope_Directory\":4:{s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:5:\"Files\";O:29:\"DUP_Archive_Filter_Scope_File\":5:{s:4:\"Size\";a:0:{}s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:4:\"Exts\";O:29:\"DUP_Archive_Filter_Scope_Base\":2:{s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:9:\"UDirCount\";i:0;s:10:\"UFileCount\";i:0;s:9:\"UExtCount\";i:0;s:8:\"TreeSize\";a:0:{}s:11:\"TreeWarning\";a:0:{}}s:14:\"RecursiveLinks\";a:0:{}s:10:\"\0*\0Package\";O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2018-03-16 13:09:34\";s:7:\"Version\";s:6:\"1.2.34\";s:9:\"VersionWP\";s:5:\"4.9.4\";s:9:\"VersionDB\";s:6:\"5.5.53\";s:10:\"VersionPHP\";s:6:\"5.5.38\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:16:\"20180316_katalog\";s:4:\"Hash\";s:32:\"95cd521389eb317d6559180316130934\";s:8:\"NameHash\";s:49:\"20180316_katalog_95cd521389eb317d6559180316130934\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:50:\"D:/OpenServer/domains/wp-catalog2/wp-snapshots/tmp\";s:8:\"StoreURL\";s:32:\"http://wp-catalog2/wp-snapshots/\";s:8:\"ScanFile\";N;s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";N;s:6:\"WPUser\";N;s:7:\"Archive\";r:22;s:9:\"Installer\";O:13:\"DUP_Installer\":7:{s:4:\"File\";N;s:4:\"Size\";i:0;s:10:\"OptsDBHost\";s:0:\"\";s:10:\"OptsDBPort\";s:0:\"\";s:10:\"OptsDBName\";s:0:\"\";s:10:\"OptsDBUser\";s:0:\"\";s:10:\"\0*\0Package\";r:58;}s:8:\"Database\";O:12:\"DUP_Database\":13:{s:4:\"Type\";s:5:\"MySQL\";s:4:\"Size\";N;s:4:\"File\";N;s:4:\"Path\";N;s:12:\"FilterTables\";s:0:\"\";s:8:\"FilterOn\";i:0;s:4:\"Name\";N;s:10:\"Compatible\";s:0:\"\";s:8:\"Comments\";s:28:\"MySQL Community Server (GPL)\";s:10:\"\0*\0Package\";r:58;s:25:\"\0DUP_Database\0dbStorePath\";N;s:23:\"\0DUP_Database\0EOFMarker\";s:0:\"\";s:26:\"\0DUP_Database\0networkFlush\";b:0;}}s:29:\"\0DUP_Archive\0tmpFilterDirsAll\";a:0:{}s:24:\"\0DUP_Archive\0wpCorePaths\";a:6:{i:0;s:42:\"D:/OpenServer/domains/wp-catalog2/wp-admin\";i:1;s:52:\"D:/OpenServer/domains/wp-catalog2/wp-content/uploads\";i:2;s:54:\"D:/OpenServer/domains/wp-catalog2/wp-content/languages\";i:3;s:52:\"D:/OpenServer/domains/wp-catalog2/wp-content/plugins\";i:4;s:51:\"D:/OpenServer/domains/wp-catalog2/wp-content/themes\";i:5;s:45:\"D:/OpenServer/domains/wp-catalog2/wp-includes\";}}s:9:\"Installer\";r:80;s:8:\"Database\";r:88;}', 'yes'),
(718, '_transient_timeout_aioseop_feed', '1521500288', 'no'),
(758, 'category_children', 'a:2:{i:18;a:2:{i:0;i:19;i:1;i:20;}i:1;a:2:{i:0;i:21;i:1;i:22;}}', 'yes'),
(761, '_site_transient_timeout_theme_roots', '1522915405', 'no'),
(762, '_site_transient_theme_roots', 'a:5:{s:7:\"catalog\";s:7:\"/themes\";s:5:\"files\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(765, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-4.9.5.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-4.9.5.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.5\";s:7:\"version\";s:5:\"4.9.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.5-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.9.5-partial-4.zip\";s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.5\";s:7:\"version\";s:5:\"4.9.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:5:\"4.9.4\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-4.9.5.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-4.9.5.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.5\";s:7:\"version\";s:5:\"4.9.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1522913610;s:15:\"version_checked\";s:5:\"4.9.4\";s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"core\";s:4:\"slug\";s:7:\"default\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"4.9.4\";s:7:\"updated\";s:19:\"2018-03-22 15:56:45\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.4/ru_RU.zip\";s:10:\"autoupdate\";b:1;}}}', 'no'),
(766, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1522913611;s:7:\"checked\";a:4:{s:7:\"catalog\";s:3:\"1.0\";s:13:\"twentyfifteen\";s:3:\"1.9\";s:15:\"twentyseventeen\";s:3:\"1.4\";s:13:\"twentysixteen\";s:3:\"1.4\";}s:8:\"response\";a:1:{s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.1.5.zip\";}}s:12:\"translations\";a:0:{}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(767, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1522913613;s:7:\"checked\";a:12:{s:30:\"advanced-custom-fields/acf.php\";s:6:\"4.4.12\";s:19:\"akismet/akismet.php\";s:5:\"4.0.2\";s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";s:7:\"2.4.5.1\";s:49:\"category-seo-meta-tags/category-seo-meta-tags.php\";s:3:\"2.5\";s:25:\"duplicator/duplicator.php\";s:6:\"1.2.34\";s:9:\"hello.php\";s:3:\"1.6\";s:41:\"ns-category-widget/ns-category-widget.php\";s:5:\"3.0.0\";s:47:\"post-tags-and-categories-for-pages/post-tag.php\";s:5:\"1.4.1\";s:33:\"rich-text-tags/rich-text-tags.php\";s:3:\"1.8\";s:23:\"rustolat/rus-to-lat.php\";s:3:\"0.3\";s:39:\"single-post-template/post_templates.php\";s:5:\"1.4.4\";s:24:\"wordpress-seo/wp-seo.php\";s:5:\"7.0.1\";}s:8:\"response\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.3.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:7:\"default\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";s:7:\"default\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:33:\"w.org/plugins/all-in-one-seo-pack\";s:4:\"slug\";s:19:\"all-in-one-seo-pack\";s:6:\"plugin\";s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";s:11:\"new_version\";s:3:\"2.5\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/all-in-one-seo-pack/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/all-in-one-seo-pack.2.5.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:71:\"https://ps.w.org/all-in-one-seo-pack/assets/icon-128x128.png?rev=979908\";s:2:\"2x\";s:71:\"https://ps.w.org/all-in-one-seo-pack/assets/icon-256x256.png?rev=979908\";s:7:\"default\";s:71:\"https://ps.w.org/all-in-one-seo-pack/assets/icon-256x256.png?rev=979908\";}s:7:\"banners\";a:3:{s:2:\"2x\";s:75:\"https://ps.w.org/all-in-one-seo-pack/assets/banner-1544x500.png?rev=1354894\";s:2:\"1x\";s:74:\"https://ps.w.org/all-in-one-seo-pack/assets/banner-772x250.png?rev=1354894\";s:7:\"default\";s:75:\"https://ps.w.org/all-in-one-seo-pack/assets/banner-1544x500.png?rev=1354894\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:3:\"7.2\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/wordpress-seo.7.2.zip\";s:5:\"icons\";a:4:{s:2:\"1x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-128x128.png?rev=1834347\";s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=1834347\";s:3:\"svg\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1834347\";s:7:\"default\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1834347\";}s:7:\"banners\";a:3:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=1843435\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=1843435\";s:7:\"default\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=1843435\";}s:11:\"banners_rtl\";a:3:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=1843435\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=1843435\";s:7:\"default\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=1843435\";}s:6:\"tested\";s:5:\"4.9.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:19:\"all-in-one-seo-pack\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:7:\"2.4.5.1\";s:7:\"updated\";s:19:\"2018-02-19 14:51:53\";s:7:\"package\";s:88:\"https://downloads.wordpress.org/translation/plugin/all-in-one-seo-pack/2.4.5.1/ru_RU.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:9:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:6:\"4.4.12\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.4.4.12.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:7:\"default\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";}s:7:\"banners\";a:3:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:7:\"default\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:11:\"banners_rtl\";a:0:{}}s:49:\"category-seo-meta-tags/category-seo-meta-tags.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/category-seo-meta-tags\";s:4:\"slug\";s:22:\"category-seo-meta-tags\";s:6:\"plugin\";s:49:\"category-seo-meta-tags/category-seo-meta-tags.php\";s:11:\"new_version\";s:3:\"2.5\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/category-seo-meta-tags/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/category-seo-meta-tags.zip\";s:5:\"icons\";a:0:{}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:25:\"duplicator/duplicator.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:24:\"w.org/plugins/duplicator\";s:4:\"slug\";s:10:\"duplicator\";s:6:\"plugin\";s:25:\"duplicator/duplicator.php\";s:11:\"new_version\";s:6:\"1.2.34\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/duplicator/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/duplicator.1.2.34.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:63:\"https://ps.w.org/duplicator/assets/icon-128x128.png?rev=1298463\";s:2:\"2x\";s:63:\"https://ps.w.org/duplicator/assets/icon-256x256.png?rev=1298463\";s:7:\"default\";s:63:\"https://ps.w.org/duplicator/assets/icon-256x256.png?rev=1298463\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:65:\"https://ps.w.org/duplicator/assets/banner-772x250.png?rev=1645055\";s:7:\"default\";s:65:\"https://ps.w.org/duplicator/assets/banner-772x250.png?rev=1645055\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:7:\"default\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";s:7:\"default\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}s:41:\"ns-category-widget/ns-category-widget.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:32:\"w.org/plugins/ns-category-widget\";s:4:\"slug\";s:18:\"ns-category-widget\";s:6:\"plugin\";s:41:\"ns-category-widget/ns-category-widget.php\";s:11:\"new_version\";s:5:\"3.0.0\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/ns-category-widget/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/ns-category-widget.3.0.0.zip\";s:5:\"icons\";a:0:{}s:7:\"banners\";a:2:{s:2:\"1x\";s:73:\"https://ps.w.org/ns-category-widget/assets/banner-772x250.png?rev=1077718\";s:7:\"default\";s:73:\"https://ps.w.org/ns-category-widget/assets/banner-772x250.png?rev=1077718\";}s:11:\"banners_rtl\";a:0:{}}s:47:\"post-tags-and-categories-for-pages/post-tag.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:48:\"w.org/plugins/post-tags-and-categories-for-pages\";s:4:\"slug\";s:34:\"post-tags-and-categories-for-pages\";s:6:\"plugin\";s:47:\"post-tags-and-categories-for-pages/post-tag.php\";s:11:\"new_version\";s:5:\"1.4.1\";s:3:\"url\";s:65:\"https://wordpress.org/plugins/post-tags-and-categories-for-pages/\";s:7:\"package\";s:83:\"https://downloads.wordpress.org/plugin/post-tags-and-categories-for-pages.1.4.1.zip\";s:5:\"icons\";a:0:{}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:33:\"rich-text-tags/rich-text-tags.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/rich-text-tags\";s:4:\"slug\";s:14:\"rich-text-tags\";s:6:\"plugin\";s:33:\"rich-text-tags/rich-text-tags.php\";s:11:\"new_version\";s:3:\"1.8\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/rich-text-tags/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/rich-text-tags.zip\";s:5:\"icons\";a:4:{s:2:\"1x\";s:67:\"https://ps.w.org/rich-text-tags/assets/icon-128x128.jpg?rev=1392598\";s:2:\"2x\";s:67:\"https://ps.w.org/rich-text-tags/assets/icon-256x256.jpg?rev=1392598\";s:0:\"\";s:67:\"https://ps.w.org/rich-text-tags/assets/icon-512x512.jpg?rev=1392598\";s:7:\"default\";s:67:\"https://ps.w.org/rich-text-tags/assets/icon-256x256.jpg?rev=1392598\";}s:7:\"banners\";a:3:{s:2:\"2x\";s:70:\"https://ps.w.org/rich-text-tags/assets/banner-1544x500.jpg?rev=1392598\";s:2:\"1x\";s:69:\"https://ps.w.org/rich-text-tags/assets/banner-772x250.jpg?rev=1392598\";s:7:\"default\";s:70:\"https://ps.w.org/rich-text-tags/assets/banner-1544x500.jpg?rev=1392598\";}s:11:\"banners_rtl\";a:0:{}}s:23:\"rustolat/rus-to-lat.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:22:\"w.org/plugins/rustolat\";s:4:\"slug\";s:8:\"rustolat\";s:6:\"plugin\";s:23:\"rustolat/rus-to-lat.php\";s:11:\"new_version\";s:3:\"0.3\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/rustolat/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/rustolat.0.3.zip\";s:5:\"icons\";a:0:{}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:39:\"single-post-template/post_templates.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:34:\"w.org/plugins/single-post-template\";s:4:\"slug\";s:20:\"single-post-template\";s:6:\"plugin\";s:39:\"single-post-template/post_templates.php\";s:11:\"new_version\";s:5:\"1.4.4\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/single-post-template/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/single-post-template.1.4.4.zip\";s:5:\"icons\";a:0:{}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1520261345:1'),
(3, 4, '_wp_attached_file', '2018/03/cat-img2.jpg'),
(4, 4, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:196;s:6:\"height\";i:188;s:4:\"file\";s:20:\"2018/03/cat-img2.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"cat-img2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:10:\"Аслан\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1519985875\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(5, 1, '_edit_last', '1'),
(6, 1, '_thumbnail_id', '4'),
(7, 6, '_menu_item_type', 'custom'),
(8, 6, '_menu_item_menu_item_parent', '0'),
(9, 6, '_menu_item_object_id', '6'),
(10, 6, '_menu_item_object', 'custom'),
(11, 6, '_menu_item_target', ''),
(12, 6, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(13, 6, '_menu_item_xfn', ''),
(14, 6, '_menu_item_url', 'http://wp-catalog2/'),
(25, 8, '_edit_last', '1'),
(26, 8, '_edit_lock', '1520416925:1'),
(27, 10, '_edit_last', '1'),
(28, 10, '_edit_lock', '1520410736:1'),
(29, 12, '_menu_item_type', 'post_type'),
(30, 12, '_menu_item_menu_item_parent', '0'),
(31, 12, '_menu_item_object_id', '10'),
(32, 12, '_menu_item_object', 'page'),
(33, 12, '_menu_item_target', ''),
(34, 12, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(35, 12, '_menu_item_xfn', ''),
(36, 12, '_menu_item_url', ''),
(38, 13, '_menu_item_type', 'post_type'),
(39, 13, '_menu_item_menu_item_parent', '0'),
(40, 13, '_menu_item_object_id', '8'),
(41, 13, '_menu_item_object', 'page'),
(42, 13, '_menu_item_target', ''),
(43, 13, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(44, 13, '_menu_item_xfn', ''),
(45, 13, '_menu_item_url', ''),
(47, 14, '_edit_last', '1'),
(48, 14, '_edit_lock', '1520424282:1'),
(49, 14, '_thumbnail_id', '55'),
(52, 16, '_edit_last', '1'),
(53, 16, '_edit_lock', '1520338648:1'),
(56, 18, '_edit_last', '1'),
(57, 18, '_edit_lock', '1520340386:1'),
(60, 20, '_edit_last', '1'),
(63, 20, '_edit_lock', '1520340451:1'),
(64, 22, '_edit_last', '1'),
(65, 22, '_edit_lock', '1520411210:1'),
(68, 24, '_edit_last', '1'),
(69, 24, '_edit_lock', '1520414307:1'),
(70, 26, '_edit_last', '1'),
(71, 26, 'field_5a9ecaeb6be7c', 'a:11:{s:3:\"key\";s:19:\"field_5a9ecaeb6be7c\";s:5:\"label\";s:20:\"Описание ACF\";s:4:\"name\";s:8:\"desc_acf\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";s:3:\"yes\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),
(73, 26, 'position', 'normal'),
(74, 26, 'layout', 'no_box'),
(75, 26, 'hide_on_screen', ''),
(76, 26, '_edit_lock', '1520356942:1'),
(80, 26, 'rule', 'a:5:{s:5:\"param\";s:11:\"ef_taxonomy\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:8:\"category\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),
(81, 26, '_wp_trash_meta_status', 'publish'),
(82, 26, '_wp_trash_meta_time', '1520358662'),
(83, 26, '_wp_desired_post_slug', 'acf_%d0%be%d0%bf%d0%b8%d1%81%d0%b0%d0%bd%d0%b8%d0%b5-%d0%ba%d0%b0%d1%82%d0%b5%d0%b3%d0%be%d1%80%d0%b8%d0%b8'),
(92, 2, '_edit_lock', '1520412008:1'),
(93, 2, '_edit_last', '1'),
(94, 33, '_menu_item_type', 'post_type'),
(95, 33, '_menu_item_menu_item_parent', '0'),
(96, 33, '_menu_item_object_id', '2'),
(97, 33, '_menu_item_object', 'page'),
(98, 33, '_menu_item_target', ''),
(99, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(100, 33, '_menu_item_xfn', ''),
(101, 33, '_menu_item_url', ''),
(103, 34, '_edit_last', '1'),
(104, 34, '_edit_lock', '1520412484:1'),
(105, 36, '_menu_item_type', 'post_type'),
(106, 36, '_menu_item_menu_item_parent', '0'),
(107, 36, '_menu_item_object_id', '34'),
(108, 36, '_menu_item_object', 'page'),
(109, 36, '_menu_item_target', ''),
(110, 36, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(111, 36, '_menu_item_xfn', ''),
(112, 36, '_menu_item_url', ''),
(114, 37, '_edit_last', '1'),
(115, 37, 'field_5a9fae0c7ccbb', 'a:14:{s:3:\"key\";s:19:\"field_5a9fae0c7ccbb\";s:5:\"label\";s:13:\"Хар-ка 1\";s:4:\"name\";s:6:\"field1\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),
(117, 37, 'position', 'normal'),
(118, 37, 'layout', 'no_box'),
(119, 37, 'hide_on_screen', ''),
(120, 37, '_edit_lock', '1521021009:1'),
(123, 38, 'product', 'доп поле'),
(124, 38, '_product', 'field_5a9fae0c7ccbb'),
(125, 14, 'product', 'доп поле работает'),
(126, 14, '_product', 'field_5a9fae0c7ccbb'),
(129, 39, 'product', 'ыкапяачмячаим'),
(130, 39, '_product', 'field_5a9fae0c7ccbb'),
(131, 8, 'product', 'ыкапяачмячаим'),
(132, 8, '_product', 'field_5a9fae0c7ccbb'),
(133, 40, 'product', 'ыкапяачмячаим'),
(134, 40, '_product', 'field_5a9fae0c7ccbb'),
(138, 41, 'product', 'доп поле работает'),
(139, 41, '_product', 'field_5a9fae0c7ccbb'),
(141, 37, 'field_5a9fb98b06bd1', 'a:14:{s:3:\"key\";s:19:\"field_5a9fb98b06bd1\";s:5:\"label\";s:13:\"Хар-ка 2\";s:4:\"name\";s:6:\"field2\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:1;}'),
(142, 37, 'field_5a9fb9a606bd2', 'a:14:{s:3:\"key\";s:19:\"field_5a9fb9a606bd2\";s:5:\"label\";s:13:\"Хар-ка 3\";s:4:\"name\";s:6:\"field3\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:2;}'),
(143, 37, 'field_5a9fb9c406bd3', 'a:14:{s:3:\"key\";s:19:\"field_5a9fb9c406bd3\";s:5:\"label\";s:13:\"Хар-ка 4\";s:4:\"name\";s:6:\"field4\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:3;}'),
(147, 37, 'field_5a9fba4798c02', 'a:15:{s:3:\"key\";s:19:\"field_5a9fba4798c02\";s:5:\"label\";s:8:\"Цена\";s:4:\"name\";s:5:\"price\";s:4:\"type\";s:6:\"number\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"1\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:4:\"step\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:6;}'),
(149, 37, 'field_5a9fba7cbd598', 'a:14:{s:3:\"key\";s:19:\"field_5a9fba7cbd598\";s:5:\"label\";s:13:\"Хар-ка 5\";s:4:\"name\";s:6:\"field5\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:4;}'),
(155, 42, 'material', 'материал'),
(156, 42, '_material', 'field_5a9fae0c7ccbb'),
(157, 42, 'color', 'какой то цвет'),
(158, 42, '_color', 'field_5a9fb98b06bd1'),
(159, 42, 'tip_pechati', 'какой то тип'),
(160, 42, '_tip_pechati', 'field_5a9fb9a606bd2'),
(161, 42, 'format_pechati', 'что то там'),
(162, 42, '_format_pechati', 'field_5a9fb9c406bd3'),
(163, 42, 'phone', '87777777'),
(164, 42, '_phone', 'field_5a9fb9e006bd4'),
(165, 42, 'email', 'jhjhkjhj@mail.ru'),
(166, 42, '_email', 'field_5a9fba0606bd5'),
(167, 42, 'price', '99999'),
(168, 42, '_price', 'field_5a9fba4798c02'),
(169, 42, 'razmer', 'какой то размер'),
(170, 42, '_razmer', 'field_5a9fba7cbd598'),
(171, 14, 'material', '100% Хлопок'),
(172, 14, '_material', 'field_5a9fae0c7ccbb'),
(173, 14, 'color', 'Черный'),
(174, 14, '_color', 'field_5a9fb98b06bd1'),
(175, 14, 'tip_pechati', '3D'),
(176, 14, '_tip_pechati', 'field_5a9fb9a606bd2'),
(177, 14, 'format_pechati', 'А4'),
(178, 14, '_format_pechati', 'field_5a9fb9c406bd3'),
(179, 14, 'phone', '89287778756'),
(180, 14, '_phone', 'field_5a9fb9e006bd4'),
(181, 14, 'email', 'print@mail.ru'),
(182, 14, '_email', 'field_5a9fba0606bd5'),
(183, 14, 'price', '1899'),
(184, 14, '_price', 'field_5a9fba4798c02'),
(185, 14, 'razmer', 'xs , s , m , l, xl '),
(186, 14, '_razmer', 'field_5a9fba7cbd598'),
(191, 43, 'material', 'материал'),
(192, 43, '_material', 'field_5a9fae0c7ccbb'),
(193, 43, 'color', 'какой то цвет'),
(194, 43, '_color', 'field_5a9fb98b06bd1'),
(195, 43, 'tip_pechati', 'какой то тип'),
(196, 43, '_tip_pechati', 'field_5a9fb9a606bd2'),
(197, 43, 'format_pechati', 'что то там'),
(198, 43, '_format_pechati', 'field_5a9fb9c406bd3'),
(199, 43, 'phone', '87777777'),
(200, 43, '_phone', 'field_5a9fb9e006bd4'),
(201, 43, 'email', 'jhjhkjhj@mail.ru'),
(202, 43, '_email', 'field_5a9fba0606bd5'),
(203, 43, 'price', '99999'),
(204, 43, '_price', 'field_5a9fba4798c02'),
(205, 43, 'razmer', 'какой то размер'),
(206, 43, '_razmer', 'field_5a9fba7cbd598'),
(207, 43, 'inst', 'адресс инст'),
(208, 43, '_inst', 'field_5a9fbbf1338d6'),
(209, 14, 'inst', 'print07'),
(210, 14, '_inst', 'field_5a9fbbf1338d6'),
(211, 37, 'field_5a9fbc7429833', 'a:14:{s:3:\"key\";s:19:\"field_5a9fbc7429833\";s:5:\"label\";s:14:\"Артикул\";s:4:\"name\";s:7:\"artikul\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"1\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:5;}'),
(215, 44, 'material', 'материал'),
(216, 44, '_material', 'field_5a9fae0c7ccbb'),
(217, 44, 'color', 'какой то цвет'),
(218, 44, '_color', 'field_5a9fb98b06bd1'),
(219, 44, 'tip_pechati', 'какой то тип'),
(220, 44, '_tip_pechati', 'field_5a9fb9a606bd2'),
(221, 44, 'format_pechati', 'что то там'),
(222, 44, '_format_pechati', 'field_5a9fb9c406bd3'),
(223, 44, 'phone', '87777777'),
(224, 44, '_phone', 'field_5a9fb9e006bd4'),
(225, 44, 'email', 'jhjhkjhj@mail.ru'),
(226, 44, '_email', 'field_5a9fba0606bd5'),
(227, 44, 'price', '99999'),
(228, 44, '_price', 'field_5a9fba4798c02'),
(229, 44, 'razmer', 'какой то размер'),
(230, 44, '_razmer', 'field_5a9fba7cbd598'),
(231, 44, 'inst', 'адресс инст'),
(232, 44, '_inst', 'field_5a9fbbf1338d6'),
(233, 44, 'artikul', 'код артикула'),
(234, 44, '_artikul', 'field_5a9fbc7429833'),
(235, 14, 'artikul', 'SH-1'),
(236, 14, '_artikul', 'field_5a9fbc7429833'),
(237, 37, 'field_5a9fbd19d6797', 'a:11:{s:3:\"key\";s:19:\"field_5a9fbd19d6797\";s:5:\"label\";s:52:\"Изображение-1 (Размер:  460 х 440)\";s:4:\"name\";s:5:\"img_1\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"1\";s:11:\"save_format\";s:3:\"url\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:7;}'),
(241, 45, 'material', 'материал'),
(242, 45, '_material', 'field_5a9fae0c7ccbb'),
(243, 45, 'color', 'какой то цвет'),
(244, 45, '_color', 'field_5a9fb98b06bd1'),
(245, 45, 'tip_pechati', 'какой то тип'),
(246, 45, '_tip_pechati', 'field_5a9fb9a606bd2'),
(247, 45, 'format_pechati', 'что то там'),
(248, 45, '_format_pechati', 'field_5a9fb9c406bd3'),
(249, 45, 'phone', '87777777'),
(250, 45, '_phone', 'field_5a9fb9e006bd4'),
(251, 45, 'email', 'jhjhkjhj@mail.ru'),
(252, 45, '_email', 'field_5a9fba0606bd5'),
(253, 45, 'price', '99999'),
(254, 45, '_price', 'field_5a9fba4798c02'),
(255, 45, 'razmer', 'какой то размер'),
(256, 45, '_razmer', 'field_5a9fba7cbd598'),
(257, 45, 'inst', 'адресс инст'),
(258, 45, '_inst', 'field_5a9fbbf1338d6'),
(259, 45, 'artikul', 'код артикула'),
(260, 45, '_artikul', 'field_5a9fbc7429833'),
(261, 45, 'img_1', '4'),
(262, 45, '_img_1', 'field_5a9fbd19d6797'),
(263, 14, 'img_1', '55'),
(264, 14, '_img_1', 'field_5a9fbd19d6797'),
(266, 46, '_wp_attached_file', '2018/03/haba.jpg'),
(267, 46, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:196;s:6:\"height\";i:188;s:4:\"file\";s:16:\"2018/03/haba.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"haba-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(270, 47, 'material', 'материал'),
(271, 47, '_material', 'field_5a9fae0c7ccbb'),
(272, 47, 'color', 'какой то цвет'),
(273, 47, '_color', 'field_5a9fb98b06bd1'),
(274, 47, 'tip_pechati', 'какой то тип'),
(275, 47, '_tip_pechati', 'field_5a9fb9a606bd2'),
(276, 47, 'format_pechati', 'что то там'),
(277, 47, '_format_pechati', 'field_5a9fb9c406bd3'),
(278, 47, 'phone', '87777777'),
(279, 47, '_phone', 'field_5a9fb9e006bd4'),
(280, 47, 'email', 'jhjhkjhj@mail.ru'),
(281, 47, '_email', 'field_5a9fba0606bd5'),
(282, 47, 'price', '99999'),
(283, 47, '_price', 'field_5a9fba4798c02'),
(284, 47, 'razmer', 'какой то размер'),
(285, 47, '_razmer', 'field_5a9fba7cbd598'),
(286, 47, 'inst', 'адресс инст'),
(287, 47, '_inst', 'field_5a9fbbf1338d6'),
(288, 47, 'artikul', 'код артикула'),
(289, 47, '_artikul', 'field_5a9fbc7429833'),
(290, 47, 'img_1', '46'),
(291, 47, '_img_1', 'field_5a9fbd19d6797'),
(295, 37, 'field_5a9fbfce7bc7b', 'a:11:{s:3:\"key\";s:19:\"field_5a9fbfce7bc7b\";s:5:\"label\";s:51:\"Изображение-2 (Размер: 460 х 440)\";s:4:\"name\";s:5:\"img_2\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"1\";s:11:\"save_format\";s:3:\"url\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:8;}'),
(296, 37, 'field_5a9fbfec7bc7c', 'a:11:{s:3:\"key\";s:19:\"field_5a9fbfec7bc7c\";s:5:\"label\";s:51:\"Изображение-3 (Размер: 460 х 440)\";s:4:\"name\";s:5:\"img_3\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:11:\"save_format\";s:3:\"url\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:9;}'),
(298, 48, '_wp_attached_file', '2018/03/cat-img5.jpg'),
(299, 48, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:249;s:4:\"file\";s:20:\"2018/03/cat-img5.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"cat-img5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:10:\"Аслан\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1519985875\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(302, 49, 'material', 'материал'),
(303, 49, '_material', 'field_5a9fae0c7ccbb'),
(304, 49, 'color', 'какой то цвет'),
(305, 49, '_color', 'field_5a9fb98b06bd1'),
(306, 49, 'tip_pechati', 'какой то тип'),
(307, 49, '_tip_pechati', 'field_5a9fb9a606bd2'),
(308, 49, 'format_pechati', 'что то там'),
(309, 49, '_format_pechati', 'field_5a9fb9c406bd3'),
(310, 49, 'phone', '87777777'),
(311, 49, '_phone', 'field_5a9fb9e006bd4'),
(312, 49, 'email', 'jhjhkjhj@mail.ru'),
(313, 49, '_email', 'field_5a9fba0606bd5'),
(314, 49, 'price', '99999'),
(315, 49, '_price', 'field_5a9fba4798c02'),
(316, 49, 'razmer', 'какой то размер'),
(317, 49, '_razmer', 'field_5a9fba7cbd598'),
(318, 49, 'inst', 'адресс инст'),
(319, 49, '_inst', 'field_5a9fbbf1338d6'),
(320, 49, 'artikul', 'код артикула'),
(321, 49, '_artikul', 'field_5a9fbc7429833'),
(322, 49, 'img_1', '46'),
(323, 49, '_img_1', 'field_5a9fbd19d6797'),
(324, 49, 'img_2', '4'),
(325, 49, '_img_2', 'field_5a9fbfce7bc7b'),
(326, 49, 'img_3', '48'),
(327, 49, '_img_3', 'field_5a9fbfec7bc7c'),
(328, 14, 'img_2', '55'),
(329, 14, '_img_2', 'field_5a9fbfce7bc7b'),
(330, 14, 'img_3', '55'),
(331, 14, '_img_3', 'field_5a9fbfec7bc7c'),
(332, 51, '_wp_attached_file', '2018/03/shark3.jpg'),
(333, 51, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:304;s:6:\"height\";i:505;s:4:\"file\";s:18:\"2018/03/shark3.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"shark3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"shark3-181x300.jpg\";s:5:\"width\";i:181;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(334, 52, '_wp_attached_file', '2018/03/shark.jpg'),
(335, 52, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:352;s:6:\"height\";i:465;s:4:\"file\";s:17:\"2018/03/shark.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"shark-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"shark-227x300.jpg\";s:5:\"width\";i:227;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(336, 53, '_wp_attached_file', '2018/03/shark2.jpg'),
(337, 53, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:375;s:6:\"height\";i:458;s:4:\"file\";s:18:\"2018/03/shark2.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"shark2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"shark2-246x300.jpg\";s:5:\"width\";i:246;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(340, 54, 'material', '100% Хлопок'),
(341, 54, '_material', 'field_5a9fae0c7ccbb'),
(342, 54, 'color', 'Черный'),
(343, 54, '_color', 'field_5a9fb98b06bd1'),
(344, 54, 'tip_pechati', 'Флекс пленки'),
(345, 54, '_tip_pechati', 'field_5a9fb9a606bd2'),
(346, 54, 'format_pechati', 'А4'),
(347, 54, '_format_pechati', 'field_5a9fb9c406bd3'),
(348, 54, 'phone', '89287778756'),
(349, 54, '_phone', 'field_5a9fb9e006bd4'),
(350, 54, 'email', 'print@mail.ru'),
(351, 54, '_email', 'field_5a9fba0606bd5'),
(352, 54, 'price', '1899'),
(353, 54, '_price', 'field_5a9fba4798c02'),
(354, 54, 'razmer', 'xs , s , m , l, xl '),
(355, 54, '_razmer', 'field_5a9fba7cbd598'),
(356, 54, 'inst', 'print07'),
(357, 54, '_inst', 'field_5a9fbbf1338d6'),
(358, 54, 'artikul', 'SH-1'),
(359, 54, '_artikul', 'field_5a9fbc7429833'),
(360, 54, 'img_1', '52'),
(361, 54, '_img_1', 'field_5a9fbd19d6797'),
(362, 54, 'img_2', '53'),
(363, 54, '_img_2', 'field_5a9fbfce7bc7b'),
(364, 54, 'img_3', '51'),
(365, 54, '_img_3', 'field_5a9fbfec7bc7c'),
(366, 55, '_wp_attached_file', '2018/03/prod.jpg'),
(367, 55, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:459;s:6:\"height\";i:441;s:4:\"file\";s:16:\"2018/03/prod.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"prod-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"prod-300x288.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:288;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:10:\"Аслан\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1519985875\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(370, 56, 'material', '100% Хлопок'),
(371, 56, '_material', 'field_5a9fae0c7ccbb'),
(372, 56, 'color', 'Черный'),
(373, 56, '_color', 'field_5a9fb98b06bd1'),
(374, 56, 'tip_pechati', 'Флекс пленки'),
(375, 56, '_tip_pechati', 'field_5a9fb9a606bd2'),
(376, 56, 'format_pechati', 'А4'),
(377, 56, '_format_pechati', 'field_5a9fb9c406bd3'),
(378, 56, 'phone', '89287778756'),
(379, 56, '_phone', 'field_5a9fb9e006bd4'),
(380, 56, 'email', 'print@mail.ru'),
(381, 56, '_email', 'field_5a9fba0606bd5'),
(382, 56, 'price', '1899'),
(383, 56, '_price', 'field_5a9fba4798c02'),
(384, 56, 'razmer', 'xs , s , m , l, xl '),
(385, 56, '_razmer', 'field_5a9fba7cbd598'),
(386, 56, 'inst', 'print07'),
(387, 56, '_inst', 'field_5a9fbbf1338d6'),
(388, 56, 'artikul', 'SH-1'),
(389, 56, '_artikul', 'field_5a9fbc7429833'),
(390, 56, 'img_1', '55'),
(391, 56, '_img_1', 'field_5a9fbd19d6797'),
(392, 56, 'img_2', '55'),
(393, 56, '_img_2', 'field_5a9fbfce7bc7b'),
(394, 56, 'img_3', '55'),
(395, 56, '_img_3', 'field_5a9fbfec7bc7c'),
(403, 57, 'material', '100% Хлопок'),
(404, 57, '_material', 'field_5a9fae0c7ccbb'),
(405, 57, 'color', 'Черный'),
(406, 57, '_color', 'field_5a9fb98b06bd1'),
(407, 57, 'tip_pechati', '3D'),
(408, 57, '_tip_pechati', 'field_5a9fb9a606bd2'),
(409, 57, 'format_pechati', 'А4'),
(410, 57, '_format_pechati', 'field_5a9fb9c406bd3'),
(411, 57, 'phone', '89287778756'),
(412, 57, '_phone', 'field_5a9fb9e006bd4'),
(413, 57, 'email', 'print@mail.ru'),
(414, 57, '_email', 'field_5a9fba0606bd5'),
(415, 57, 'price', '1899'),
(416, 57, '_price', 'field_5a9fba4798c02'),
(417, 57, 'razmer', 'xs , s , m , l, xl '),
(418, 57, '_razmer', 'field_5a9fba7cbd598'),
(419, 57, 'inst', 'print07'),
(420, 57, '_inst', 'field_5a9fbbf1338d6'),
(421, 57, 'artikul', 'SH-1'),
(422, 57, '_artikul', 'field_5a9fbc7429833'),
(423, 57, 'img_1', '55'),
(424, 57, '_img_1', 'field_5a9fbd19d6797'),
(425, 57, 'img_2', '55'),
(426, 57, '_img_2', 'field_5a9fbfce7bc7b'),
(427, 57, 'img_3', '55'),
(428, 57, '_img_3', 'field_5a9fbfec7bc7c'),
(429, 24, '_wp_trash_meta_status', 'publish'),
(430, 24, '_wp_trash_meta_time', '1520421562'),
(431, 24, '_wp_desired_post_slug', '%d1%82%d0%b5%d1%81%d1%82-3'),
(432, 22, '_wp_trash_meta_status', 'publish'),
(433, 22, '_wp_trash_meta_time', '1520421562'),
(434, 22, '_wp_desired_post_slug', '%d1%82%d0%b5%d1%81%d1%82-2'),
(435, 18, '_wp_trash_meta_status', 'publish'),
(436, 18, '_wp_trash_meta_time', '1520421562'),
(437, 18, '_wp_desired_post_slug', '%d1%82%d0%b5%d1%81%d1%82-4'),
(438, 16, '_wp_trash_meta_status', 'publish'),
(439, 16, '_wp_trash_meta_time', '1520421562'),
(440, 16, '_wp_desired_post_slug', '%d1%82%d0%b5%d1%81%d1%822'),
(441, 1, '_wp_trash_meta_status', 'publish'),
(442, 1, '_wp_trash_meta_time', '1520421563'),
(443, 1, '_wp_desired_post_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(444, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(445, 20, '_wp_trash_meta_status', 'publish'),
(446, 20, '_wp_trash_meta_time', '1520421571'),
(447, 20, '_wp_desired_post_slug', '%d1%82%d0%b5%d1%81%d1%82'),
(450, 59, '_edit_last', '1'),
(451, 59, '_edit_lock', '1520424274:1'),
(454, 60, 'material', 'Хлопок'),
(455, 60, '_material', 'field_5a9fae0c7ccbb'),
(456, 60, 'color', 'Черный'),
(457, 60, '_color', 'field_5a9fb98b06bd1'),
(458, 60, 'tip_pechati', '3D'),
(459, 60, '_tip_pechati', 'field_5a9fb9a606bd2'),
(460, 60, 'format_pechati', 'А4'),
(461, 60, '_format_pechati', 'field_5a9fb9c406bd3'),
(462, 60, 'phone', '899889999'),
(463, 60, '_phone', 'field_5a9fb9e006bd4'),
(464, 60, 'email', 'print@mail.ru'),
(465, 60, '_email', 'field_5a9fba0606bd5'),
(466, 60, 'price', '99999'),
(467, 60, '_price', 'field_5a9fba4798c02'),
(468, 60, 'razmer', 'xs , s , m , l, xl '),
(469, 60, '_razmer', 'field_5a9fba7cbd598'),
(470, 60, 'inst', 'print07'),
(471, 60, '_inst', 'field_5a9fbbf1338d6'),
(472, 60, 'artikul', 'SH-2'),
(473, 60, '_artikul', 'field_5a9fbc7429833'),
(474, 60, 'img_1', '55'),
(475, 60, '_img_1', 'field_5a9fbd19d6797'),
(476, 60, 'img_2', '55'),
(477, 60, '_img_2', 'field_5a9fbfce7bc7b'),
(478, 60, 'img_3', '55'),
(479, 60, '_img_3', 'field_5a9fbfec7bc7c'),
(480, 59, 'material', 'Хлопок'),
(481, 59, '_material', 'field_5a9fae0c7ccbb'),
(482, 59, 'color', 'Черный'),
(483, 59, '_color', 'field_5a9fb98b06bd1'),
(484, 59, 'tip_pechati', '3D'),
(485, 59, '_tip_pechati', 'field_5a9fb9a606bd2'),
(486, 59, 'format_pechati', 'А4'),
(487, 59, '_format_pechati', 'field_5a9fb9c406bd3'),
(488, 59, 'phone', '899889999'),
(489, 59, '_phone', 'field_5a9fb9e006bd4'),
(490, 59, 'email', 'print@mail.ru'),
(491, 59, '_email', 'field_5a9fba0606bd5'),
(492, 59, 'price', '99999'),
(493, 59, '_price', 'field_5a9fba4798c02'),
(494, 59, 'razmer', 'xs , s , m , l, xl '),
(495, 59, '_razmer', 'field_5a9fba7cbd598'),
(496, 59, 'inst', 'print07'),
(497, 59, '_inst', 'field_5a9fbbf1338d6'),
(498, 59, 'artikul', 'SH-2'),
(499, 59, '_artikul', 'field_5a9fbc7429833'),
(500, 59, 'img_1', '55'),
(501, 59, '_img_1', 'field_5a9fbd19d6797'),
(502, 59, 'img_2', '55'),
(503, 59, '_img_2', 'field_5a9fbfce7bc7b'),
(504, 59, 'img_3', '55'),
(505, 59, '_img_3', 'field_5a9fbfec7bc7c'),
(506, 61, '_edit_last', '1'),
(507, 61, '_edit_lock', '1520424255:1'),
(510, 62, 'material', '100% Хлопок'),
(511, 62, '_material', 'field_5a9fae0c7ccbb'),
(512, 62, 'color', 'Черный'),
(513, 62, '_color', 'field_5a9fb98b06bd1'),
(514, 62, 'tip_pechati', '3D'),
(515, 62, '_tip_pechati', 'field_5a9fb9a606bd2'),
(516, 62, 'format_pechati', 'А4'),
(517, 62, '_format_pechati', 'field_5a9fb9c406bd3'),
(518, 62, 'phone', '33333333333'),
(519, 62, '_phone', 'field_5a9fb9e006bd4'),
(520, 62, 'email', 'print@mail.ru'),
(521, 62, '_email', 'field_5a9fba0606bd5'),
(522, 62, 'price', '33333'),
(523, 62, '_price', 'field_5a9fba4798c02'),
(524, 62, 'razmer', 'xs , s , m , l, xl '),
(525, 62, '_razmer', 'field_5a9fba7cbd598'),
(526, 62, 'inst', 'print07'),
(527, 62, '_inst', 'field_5a9fbbf1338d6'),
(528, 62, 'artikul', 'SH-3'),
(529, 62, '_artikul', 'field_5a9fbc7429833'),
(530, 62, 'img_1', '55'),
(531, 62, '_img_1', 'field_5a9fbd19d6797'),
(532, 62, 'img_2', '55'),
(533, 62, '_img_2', 'field_5a9fbfce7bc7b'),
(534, 62, 'img_3', '55'),
(535, 62, '_img_3', 'field_5a9fbfec7bc7c'),
(536, 61, 'material', '100% Хлопок'),
(537, 61, '_material', 'field_5a9fae0c7ccbb'),
(538, 61, 'color', 'Черный'),
(539, 61, '_color', 'field_5a9fb98b06bd1'),
(540, 61, 'tip_pechati', '3D'),
(541, 61, '_tip_pechati', 'field_5a9fb9a606bd2'),
(542, 61, 'format_pechati', 'А4'),
(543, 61, '_format_pechati', 'field_5a9fb9c406bd3'),
(544, 61, 'phone', '33333333333'),
(545, 61, '_phone', 'field_5a9fb9e006bd4'),
(546, 61, 'email', 'print@mail.ru'),
(547, 61, '_email', 'field_5a9fba0606bd5'),
(548, 61, 'price', '33333'),
(549, 61, '_price', 'field_5a9fba4798c02'),
(550, 61, 'razmer', 'xs , s , m , l, xl '),
(551, 61, '_razmer', 'field_5a9fba7cbd598'),
(552, 61, 'inst', 'print07'),
(553, 61, '_inst', 'field_5a9fbbf1338d6'),
(554, 61, 'artikul', 'SH-3'),
(555, 61, '_artikul', 'field_5a9fbc7429833'),
(556, 61, 'img_1', '55'),
(557, 61, '_img_1', 'field_5a9fbd19d6797'),
(558, 61, 'img_2', '55'),
(559, 61, '_img_2', 'field_5a9fbfce7bc7b'),
(560, 61, 'img_3', '55'),
(561, 61, '_img_3', 'field_5a9fbfec7bc7c'),
(562, 63, '_edit_last', '1'),
(563, 63, '_edit_lock', '1520432401:1'),
(566, 64, 'material', '100% Хлопок'),
(567, 64, '_material', 'field_5a9fae0c7ccbb'),
(568, 64, 'color', 'Черный'),
(569, 64, '_color', 'field_5a9fb98b06bd1'),
(570, 64, 'tip_pechati', 'Флекс пленки'),
(571, 64, '_tip_pechati', 'field_5a9fb9a606bd2'),
(572, 64, 'format_pechati', 'А4'),
(573, 64, '_format_pechati', 'field_5a9fb9c406bd3'),
(574, 64, 'phone', '3333333333'),
(575, 64, '_phone', 'field_5a9fb9e006bd4'),
(576, 64, 'email', 'print@mail.ru'),
(577, 64, '_email', 'field_5a9fba0606bd5'),
(578, 64, 'price', '3333333'),
(579, 64, '_price', 'field_5a9fba4798c02'),
(580, 64, 'razmer', 'xs , s , m , l, xl '),
(581, 64, '_razmer', 'field_5a9fba7cbd598'),
(582, 64, 'inst', 'print07'),
(583, 64, '_inst', 'field_5a9fbbf1338d6'),
(584, 64, 'artikul', 'SH-4'),
(585, 64, '_artikul', 'field_5a9fbc7429833'),
(586, 64, 'img_1', '55'),
(587, 64, '_img_1', 'field_5a9fbd19d6797'),
(588, 64, 'img_2', '55'),
(589, 64, '_img_2', 'field_5a9fbfce7bc7b'),
(590, 64, 'img_3', '55'),
(591, 64, '_img_3', 'field_5a9fbfec7bc7c'),
(592, 63, 'material', '100% Хлопок'),
(593, 63, '_material', 'field_5a9fae0c7ccbb'),
(594, 63, 'color', 'Черный'),
(595, 63, '_color', 'field_5a9fb98b06bd1'),
(596, 63, 'tip_pechati', 'Флекс пленки'),
(597, 63, '_tip_pechati', 'field_5a9fb9a606bd2'),
(598, 63, 'format_pechati', 'А4'),
(599, 63, '_format_pechati', 'field_5a9fb9c406bd3'),
(600, 63, 'phone', '3333333333'),
(601, 63, '_phone', 'field_5a9fb9e006bd4'),
(602, 63, 'email', 'print@mail.ru'),
(603, 63, '_email', 'field_5a9fba0606bd5'),
(604, 63, 'price', '3333333'),
(605, 63, '_price', 'field_5a9fba4798c02'),
(606, 63, 'razmer', 'xs , s , m , l, xl '),
(607, 63, '_razmer', 'field_5a9fba7cbd598'),
(608, 63, 'inst', 'print07'),
(609, 63, '_inst', 'field_5a9fbbf1338d6'),
(610, 63, 'artikul', 'SH-4'),
(611, 63, '_artikul', 'field_5a9fbc7429833'),
(612, 63, 'img_1', '55'),
(613, 63, '_img_1', 'field_5a9fbd19d6797'),
(614, 63, 'img_2', '55'),
(615, 63, '_img_2', 'field_5a9fbfce7bc7b'),
(616, 63, 'img_3', '55'),
(617, 63, '_img_3', 'field_5a9fbfec7bc7c'),
(618, 63, '_thumbnail_id', '55'),
(621, 61, '_thumbnail_id', '55'),
(624, 59, '_thumbnail_id', '55'),
(627, 65, '_edit_last', '1'),
(628, 65, '_edit_lock', '1521021196:1'),
(629, 65, '_thumbnail_id', '55'),
(632, 66, 'material', '100% Хлопок'),
(633, 66, '_material', 'field_5a9fae0c7ccbb'),
(634, 66, 'color', 'Черный'),
(635, 66, '_color', 'field_5a9fb98b06bd1'),
(636, 66, 'tip_pechati', 'Флекс пленки'),
(637, 66, '_tip_pechati', 'field_5a9fb9a606bd2'),
(638, 66, 'format_pechati', 'А4'),
(639, 66, '_format_pechati', 'field_5a9fb9c406bd3'),
(640, 66, 'phone', '111111111111111'),
(641, 66, '_phone', 'field_5a9fb9e006bd4'),
(642, 66, 'email', 'print@mail.ru'),
(643, 66, '_email', 'field_5a9fba0606bd5'),
(644, 66, 'price', '222'),
(645, 66, '_price', 'field_5a9fba4798c02'),
(646, 66, 'razmer', 'xs , s , m , l, xl '),
(647, 66, '_razmer', 'field_5a9fba7cbd598'),
(648, 66, 'inst', 'print07'),
(649, 66, '_inst', 'field_5a9fbbf1338d6'),
(650, 66, 'artikul', 'SH-5'),
(651, 66, '_artikul', 'field_5a9fbc7429833'),
(652, 66, 'img_1', '55'),
(653, 66, '_img_1', 'field_5a9fbd19d6797'),
(654, 66, 'img_2', '55'),
(655, 66, '_img_2', 'field_5a9fbfce7bc7b'),
(656, 66, 'img_3', '55'),
(657, 66, '_img_3', 'field_5a9fbfec7bc7c'),
(658, 65, 'material', '100% Хлопок'),
(659, 65, '_material', 'field_5a9fae0c7ccbb'),
(660, 65, 'color', 'Черный'),
(661, 65, '_color', 'field_5a9fb98b06bd1'),
(662, 65, 'tip_pechati', 'Флекс пленки'),
(663, 65, '_tip_pechati', 'field_5a9fb9a606bd2'),
(664, 65, 'format_pechati', 'А4'),
(665, 65, '_format_pechati', 'field_5a9fb9c406bd3'),
(666, 65, 'phone', '111111111111111'),
(667, 65, '_phone', 'field_5a9fb9e006bd4'),
(668, 65, 'email', 'print@mail.ru'),
(669, 65, '_email', 'field_5a9fba0606bd5'),
(670, 65, 'price', '222'),
(671, 65, '_price', 'field_5a9fba4798c02'),
(672, 65, 'razmer', 'xs , s , m , l, xl '),
(673, 65, '_razmer', 'field_5a9fba7cbd598'),
(674, 65, 'inst', 'print07'),
(675, 65, '_inst', 'field_5a9fbbf1338d6'),
(676, 65, 'artikul', 'SH-5'),
(677, 65, '_artikul', 'field_5a9fbc7429833'),
(678, 65, 'img_1', '55'),
(679, 65, '_img_1', 'field_5a9fbd19d6797'),
(680, 65, 'img_2', '55'),
(681, 65, '_img_2', 'field_5a9fbfce7bc7b'),
(682, 65, 'img_3', '55'),
(683, 65, '_img_3', 'field_5a9fbfec7bc7c'),
(694, 65, '_wp_old_slug', '%d1%84%d1%83%d1%82%d0%b1%d0%be%d0%bb%d0%ba%d0%b0-%d0%b7%d0%b2%d0%b5%d0%b7%d0%b4%d0%bd%d1%8b%d0%b9-%d0%bc%d0%b5%d1%87%d1%82%d0%b0%d1%82%d0%b5%d0%bb%d1%8c-5'),
(705, 69, 'field_1', 'Хбэшка'),
(706, 69, '_field_1', 'field_5a9fae0c7ccbb'),
(707, 69, 'color', 'Черный'),
(708, 69, '_color', 'field_5a9fb98b06bd1'),
(709, 69, 'tip_pechati', 'Флекс пленки'),
(710, 69, '_tip_pechati', 'field_5a9fb9a606bd2'),
(711, 69, 'format_pechati', 'А4'),
(712, 69, '_format_pechati', 'field_5a9fb9c406bd3'),
(713, 69, 'price', '222'),
(714, 69, '_price', 'field_5a9fba4798c02'),
(715, 69, 'razmer', 'xs , s , m , l, xl '),
(716, 69, '_razmer', 'field_5a9fba7cbd598'),
(717, 69, 'artikul', 'SH-5'),
(718, 69, '_artikul', 'field_5a9fbc7429833'),
(719, 69, 'img_1', '55'),
(720, 69, '_img_1', 'field_5a9fbd19d6797'),
(721, 69, 'img_2', '55'),
(722, 69, '_img_2', 'field_5a9fbfce7bc7b'),
(723, 69, 'img_3', '55'),
(724, 69, '_img_3', 'field_5a9fbfec7bc7c'),
(727, 65, 'field_1', 'Хбэшка'),
(728, 65, '_field_1', 'field_5a9fae0c7ccbb'),
(739, 70, 'field', 'вамвам'),
(740, 70, '_field', 'field_5a9fae0c7ccbb'),
(741, 70, 'color', 'Черный'),
(742, 70, '_color', 'field_5a9fb98b06bd1'),
(743, 70, 'tip_pechati', 'Флекс пленки'),
(744, 70, '_tip_pechati', 'field_5a9fb9a606bd2'),
(745, 70, 'format_pechati', 'А4'),
(746, 70, '_format_pechati', 'field_5a9fb9c406bd3'),
(747, 70, 'price', '222'),
(748, 70, '_price', 'field_5a9fba4798c02'),
(749, 70, 'razmer', 'xs , s , m , l, xl '),
(750, 70, '_razmer', 'field_5a9fba7cbd598'),
(751, 70, 'artikul', 'SH-5'),
(752, 70, '_artikul', 'field_5a9fbc7429833'),
(753, 70, 'img_1', '55'),
(754, 70, '_img_1', 'field_5a9fbd19d6797'),
(755, 70, 'img_2', '55'),
(756, 70, '_img_2', 'field_5a9fbfce7bc7b'),
(757, 70, 'img_3', '55'),
(758, 70, '_img_3', 'field_5a9fbfec7bc7c'),
(761, 65, 'field', 'вамвам'),
(762, 65, '_field', 'field_5a9fae0c7ccbb'),
(772, 71, 'field1', 'вамвами'),
(773, 71, '_field1', 'field_5a9fae0c7ccbb'),
(774, 71, 'color', 'Черный'),
(775, 71, '_color', 'field_5a9fb98b06bd1'),
(776, 71, 'tip_pechati', 'Флекс пленки'),
(777, 71, '_tip_pechati', 'field_5a9fb9a606bd2'),
(778, 71, 'format_pechati', 'А4'),
(779, 71, '_format_pechati', 'field_5a9fb9c406bd3'),
(780, 71, 'price', '222'),
(781, 71, '_price', 'field_5a9fba4798c02'),
(782, 71, 'razmer', 'xs , s , m , l, xl '),
(783, 71, '_razmer', 'field_5a9fba7cbd598'),
(784, 71, 'artikul', 'SH-5'),
(785, 71, '_artikul', 'field_5a9fbc7429833'),
(786, 71, 'img_1', '55'),
(787, 71, '_img_1', 'field_5a9fbd19d6797'),
(788, 71, 'img_2', '55'),
(789, 71, '_img_2', 'field_5a9fbfce7bc7b'),
(790, 71, 'img_3', '55'),
(791, 71, '_img_3', 'field_5a9fbfec7bc7c'),
(794, 65, 'field1', 'Материал: хлопок'),
(795, 65, '_field1', 'field_5a9fae0c7ccbb'),
(800, 37, 'rule', 'a:5:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),
(807, 72, 'field1', 'Материал: хлопок'),
(808, 72, '_field1', 'field_5a9fae0c7ccbb'),
(809, 72, 'field2', 'Размеры: XL'),
(810, 72, '_field2', 'field_5a9fb98b06bd1'),
(811, 72, 'field3', 'Цвет: черный'),
(812, 72, '_field3', 'field_5a9fb9a606bd2'),
(813, 72, 'field4', 'Тип печати: флекс'),
(814, 72, '_field4', 'field_5a9fb9c406bd3'),
(815, 72, 'field5', 'Формат печати: А4'),
(816, 72, '_field5', 'field_5a9fba7cbd598'),
(817, 72, 'artikul', 'SH-5'),
(818, 72, '_artikul', 'field_5a9fbc7429833'),
(819, 72, 'price', '222'),
(820, 72, '_price', 'field_5a9fba4798c02'),
(821, 72, 'img_1', '55'),
(822, 72, '_img_1', 'field_5a9fbd19d6797'),
(823, 72, 'img_2', '55'),
(824, 72, '_img_2', 'field_5a9fbfce7bc7b'),
(825, 72, 'img_3', '55'),
(826, 72, '_img_3', 'field_5a9fbfec7bc7c'),
(829, 65, 'field2', 'Размеры: XL'),
(830, 65, '_field2', 'field_5a9fb98b06bd1'),
(831, 65, 'field3', 'Цвет: черный'),
(832, 65, '_field3', 'field_5a9fb9a606bd2'),
(833, 65, 'field4', 'Тип печати: флекс'),
(834, 65, '_field4', 'field_5a9fb9c406bd3'),
(835, 65, 'field5', 'Формат печати: А4'),
(836, 65, '_field5', 'field_5a9fba7cbd598'),
(837, 65, '_aioseop_description', 'описание'),
(838, 65, '_aioseop_title', 'тайтл'),
(839, 73, '_edit_last', '1'),
(840, 73, '_edit_lock', '1521191485:1'),
(843, 74, 'field1', ''),
(844, 74, '_field1', 'field_5a9fae0c7ccbb'),
(845, 74, 'field2', ''),
(846, 74, '_field2', 'field_5a9fb98b06bd1'),
(847, 74, 'field3', ''),
(848, 74, '_field3', 'field_5a9fb9a606bd2'),
(849, 74, 'field4', ''),
(850, 74, '_field4', 'field_5a9fb9c406bd3'),
(851, 74, 'field5', ''),
(852, 74, '_field5', 'field_5a9fba7cbd598'),
(853, 74, 'artikul', '333'),
(854, 74, '_artikul', 'field_5a9fbc7429833'),
(855, 74, 'price', '333'),
(856, 74, '_price', 'field_5a9fba4798c02'),
(857, 74, 'img_1', '46'),
(858, 74, '_img_1', 'field_5a9fbd19d6797'),
(859, 74, 'img_2', '46'),
(860, 74, '_img_2', 'field_5a9fbfce7bc7b'),
(861, 74, 'img_3', '46'),
(862, 74, '_img_3', 'field_5a9fbfec7bc7c'),
(863, 73, 'field1', ''),
(864, 73, '_field1', 'field_5a9fae0c7ccbb'),
(865, 73, 'field2', ''),
(866, 73, '_field2', 'field_5a9fb98b06bd1'),
(867, 73, 'field3', ''),
(868, 73, '_field3', 'field_5a9fb9a606bd2'),
(869, 73, 'field4', ''),
(870, 73, '_field4', 'field_5a9fb9c406bd3'),
(871, 73, 'field5', ''),
(872, 73, '_field5', 'field_5a9fba7cbd598'),
(873, 73, 'artikul', '33'),
(874, 73, '_artikul', 'field_5a9fbc7429833'),
(875, 73, 'price', '33'),
(876, 73, '_price', 'field_5a9fba4798c02'),
(877, 73, 'img_1', '46'),
(878, 73, '_img_1', 'field_5a9fbd19d6797'),
(879, 73, 'img_2', '46'),
(880, 73, '_img_2', 'field_5a9fbfce7bc7b'),
(881, 73, 'img_3', '46'),
(882, 73, '_img_3', 'field_5a9fbfec7bc7c'),
(883, 75, '_edit_last', '1'),
(884, 75, '_wp_page_template', 'category-products.php'),
(885, 75, '_edit_lock', '1521468104:1'),
(886, 77, '_menu_item_type', 'post_type'),
(887, 77, '_menu_item_menu_item_parent', '0'),
(888, 77, '_menu_item_object_id', '75'),
(889, 77, '_menu_item_object', 'page'),
(890, 77, '_menu_item_target', ''),
(891, 77, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(892, 77, '_menu_item_xfn', ''),
(893, 77, '_menu_item_url', ''),
(901, 79, 'field1', ''),
(902, 79, '_field1', 'field_5a9fae0c7ccbb'),
(903, 79, 'field2', ''),
(904, 79, '_field2', 'field_5a9fb98b06bd1'),
(905, 79, 'field3', ''),
(906, 79, '_field3', 'field_5a9fb9a606bd2'),
(907, 79, 'field4', ''),
(908, 79, '_field4', 'field_5a9fb9c406bd3'),
(909, 79, 'field5', ''),
(910, 79, '_field5', 'field_5a9fba7cbd598'),
(911, 79, 'artikul', '33'),
(912, 79, '_artikul', 'field_5a9fbc7429833'),
(913, 79, 'price', '33'),
(914, 79, '_price', 'field_5a9fba4798c02'),
(915, 79, 'img_1', '46'),
(916, 79, '_img_1', 'field_5a9fbd19d6797'),
(917, 79, 'img_2', '46'),
(918, 79, '_img_2', 'field_5a9fbfce7bc7b'),
(919, 79, 'img_3', '46'),
(920, 79, '_img_3', 'field_5a9fbfec7bc7c'),
(931, 80, 'field1', ''),
(932, 80, '_field1', 'field_5a9fae0c7ccbb'),
(933, 80, 'field2', ''),
(934, 80, '_field2', 'field_5a9fb98b06bd1'),
(935, 80, 'field3', ''),
(936, 80, '_field3', 'field_5a9fb9a606bd2'),
(937, 80, 'field4', ''),
(938, 80, '_field4', 'field_5a9fb9c406bd3'),
(939, 80, 'field5', ''),
(940, 80, '_field5', 'field_5a9fba7cbd598'),
(941, 80, 'artikul', '33'),
(942, 80, '_artikul', 'field_5a9fbc7429833'),
(943, 80, 'price', '33'),
(944, 80, '_price', 'field_5a9fba4798c02'),
(945, 80, 'img_1', '46'),
(946, 80, '_img_1', 'field_5a9fbd19d6797'),
(947, 80, 'img_2', '46'),
(948, 80, '_img_2', 'field_5a9fbfce7bc7b'),
(949, 80, 'img_3', '46'),
(950, 80, '_img_3', 'field_5a9fbfec7bc7c'),
(955, 73, '_thumbnail_id', '4'),
(970, 73, '_wp_post_template', 'single-blog.php'),
(973, 82, '_edit_last', '1'),
(974, 82, '_edit_lock', '1521203403:1'),
(975, 82, '_thumbnail_id', '55'),
(978, 83, 'field1', ''),
(979, 83, '_field1', 'field_5a9fae0c7ccbb'),
(980, 83, 'field2', ''),
(981, 83, '_field2', 'field_5a9fb98b06bd1'),
(982, 83, 'field3', ''),
(983, 83, '_field3', 'field_5a9fb9a606bd2'),
(984, 83, 'field4', ''),
(985, 83, '_field4', 'field_5a9fb9c406bd3'),
(986, 83, 'field5', ''),
(987, 83, '_field5', 'field_5a9fba7cbd598'),
(988, 83, 'artikul', '22'),
(989, 83, '_artikul', 'field_5a9fbc7429833'),
(990, 83, 'price', '33'),
(991, 83, '_price', 'field_5a9fba4798c02'),
(992, 83, 'img_1', '46'),
(993, 83, '_img_1', 'field_5a9fbd19d6797'),
(994, 83, 'img_2', '46'),
(995, 83, '_img_2', 'field_5a9fbfce7bc7b'),
(996, 83, 'img_3', '46'),
(997, 83, '_img_3', 'field_5a9fbfec7bc7c'),
(999, 82, 'field1', ''),
(1000, 82, '_field1', 'field_5a9fae0c7ccbb'),
(1001, 82, 'field2', ''),
(1002, 82, '_field2', 'field_5a9fb98b06bd1'),
(1003, 82, 'field3', ''),
(1004, 82, '_field3', 'field_5a9fb9a606bd2'),
(1005, 82, 'field4', ''),
(1006, 82, '_field4', 'field_5a9fb9c406bd3'),
(1007, 82, 'field5', ''),
(1008, 82, '_field5', 'field_5a9fba7cbd598'),
(1009, 82, 'artikul', '22'),
(1010, 82, '_artikul', 'field_5a9fbc7429833'),
(1011, 82, 'price', '33'),
(1012, 82, '_price', 'field_5a9fba4798c02'),
(1013, 82, 'img_1', '46'),
(1014, 82, '_img_1', 'field_5a9fbd19d6797'),
(1015, 82, 'img_2', '46'),
(1016, 82, '_img_2', 'field_5a9fbfce7bc7b'),
(1017, 82, 'img_3', '46'),
(1018, 82, '_img_3', 'field_5a9fbfec7bc7c'),
(1021, 84, 'field1', ''),
(1022, 84, '_field1', 'field_5a9fae0c7ccbb'),
(1023, 84, 'field2', ''),
(1024, 84, '_field2', 'field_5a9fb98b06bd1'),
(1025, 84, 'field3', ''),
(1026, 84, '_field3', 'field_5a9fb9a606bd2'),
(1027, 84, 'field4', ''),
(1028, 84, '_field4', 'field_5a9fb9c406bd3'),
(1029, 84, 'field5', ''),
(1030, 84, '_field5', 'field_5a9fba7cbd598'),
(1031, 84, 'artikul', '22'),
(1032, 84, '_artikul', 'field_5a9fbc7429833'),
(1033, 84, 'price', '33'),
(1034, 84, '_price', 'field_5a9fba4798c02'),
(1035, 84, 'img_1', '46'),
(1036, 84, '_img_1', 'field_5a9fbd19d6797'),
(1037, 84, 'img_2', '46'),
(1038, 84, '_img_2', 'field_5a9fbfce7bc7b'),
(1039, 84, 'img_3', '46'),
(1040, 84, '_img_3', 'field_5a9fbfec7bc7c'),
(1044, 82, '_wp_post_template', 'single-blog.php'),
(1080, 73, '_aioseop_description', 'Майкл Джерольд Тайсон'),
(1081, 73, '_aioseop_title', 'Майк Тайсон - путь чемпиона'),
(1086, 86, '_edit_last', '1'),
(1087, 86, '_edit_lock', '1521204444:1'),
(1088, 86, '_thumbnail_id', '4'),
(1091, 87, 'field1', ''),
(1092, 87, '_field1', 'field_5a9fae0c7ccbb'),
(1093, 87, 'field2', '1'),
(1094, 87, '_field2', 'field_5a9fb98b06bd1'),
(1095, 87, 'field3', '2'),
(1096, 87, '_field3', 'field_5a9fb9a606bd2'),
(1097, 87, 'field4', ''),
(1098, 87, '_field4', 'field_5a9fb9c406bd3'),
(1099, 87, 'field5', ''),
(1100, 87, '_field5', 'field_5a9fba7cbd598'),
(1101, 87, 'artikul', '222'),
(1102, 87, '_artikul', 'field_5a9fbc7429833'),
(1103, 87, 'price', '222'),
(1104, 87, '_price', 'field_5a9fba4798c02'),
(1105, 87, 'img_1', '55'),
(1106, 87, '_img_1', 'field_5a9fbd19d6797'),
(1107, 87, 'img_2', '55'),
(1108, 87, '_img_2', 'field_5a9fbfce7bc7b'),
(1109, 87, 'img_3', '55'),
(1110, 87, '_img_3', 'field_5a9fbfec7bc7c'),
(1112, 86, 'field1', ''),
(1113, 86, '_field1', 'field_5a9fae0c7ccbb'),
(1114, 86, 'field2', '1'),
(1115, 86, '_field2', 'field_5a9fb98b06bd1'),
(1116, 86, 'field3', '2'),
(1117, 86, '_field3', 'field_5a9fb9a606bd2'),
(1118, 86, 'field4', ''),
(1119, 86, '_field4', 'field_5a9fb9c406bd3'),
(1120, 86, 'field5', ''),
(1121, 86, '_field5', 'field_5a9fba7cbd598'),
(1122, 86, 'artikul', '222'),
(1123, 86, '_artikul', 'field_5a9fbc7429833'),
(1124, 86, 'price', '222'),
(1125, 86, '_price', 'field_5a9fba4798c02'),
(1126, 86, 'img_1', '55'),
(1127, 86, '_img_1', 'field_5a9fbd19d6797'),
(1128, 86, 'img_2', '55'),
(1129, 86, '_img_2', 'field_5a9fbfce7bc7b'),
(1130, 86, 'img_3', '55'),
(1131, 86, '_img_3', 'field_5a9fbfec7bc7c'),
(1134, 86, '_wp_post_template', 'single.php'),
(1135, 90, '_edit_last', '1'),
(1136, 90, '_wp_page_template', 'default'),
(1137, 90, '_edit_lock', '1521204125:1'),
(1140, 90, '_wp_trash_meta_status', 'publish'),
(1141, 90, '_wp_trash_meta_time', '1521204295'),
(1142, 90, '_wp_desired_post_slug', 'stranica-tovara'),
(1143, 86, '_wp_trash_meta_status', 'publish'),
(1144, 86, '_wp_trash_meta_time', '1521204329'),
(1145, 86, '_wp_desired_post_slug', 'futbolkishhe'),
(1146, 82, '_wp_trash_meta_status', 'publish'),
(1147, 82, '_wp_trash_meta_time', '1521204329'),
(1148, 82, '_wp_desired_post_slug', 'bryus-li-put-drakona'),
(1149, 73, '_wp_trash_meta_status', 'publish'),
(1150, 73, '_wp_trash_meta_time', '1521204330'),
(1151, 73, '_wp_desired_post_slug', 'blog-test'),
(1152, 65, '_wp_trash_meta_status', 'publish'),
(1153, 65, '_wp_trash_meta_time', '1521204330'),
(1154, 65, '_wp_desired_post_slug', 'futbolka-zvezdnyj-mechtatel-5'),
(1155, 63, '_wp_trash_meta_status', 'publish'),
(1156, 63, '_wp_trash_meta_time', '1521204330'),
(1157, 63, '_wp_desired_post_slug', '%d1%84%d1%83%d1%82%d0%b1%d0%be%d0%bb%d0%ba%d0%b0-%d0%b7%d0%b2%d0%b5%d0%b7%d0%b4%d0%bd%d1%8b%d0%b9-%d0%bc%d0%b5%d1%87%d1%82%d0%b0%d1%82%d0%b5%d0%bb%d1%8c-4'),
(1158, 61, '_wp_trash_meta_status', 'publish'),
(1159, 61, '_wp_trash_meta_time', '1521204330'),
(1160, 61, '_wp_desired_post_slug', '%d1%84%d1%83%d1%82%d0%b1%d0%be%d0%bb%d0%ba%d0%b0-%d0%b7%d0%b2%d0%b5%d0%b7%d0%b4%d0%bd%d1%8b%d0%b9-%d0%bc%d0%b5%d1%87%d1%82%d0%b0%d1%82%d0%b5%d0%bb%d1%8c-3'),
(1161, 59, '_wp_trash_meta_status', 'publish'),
(1162, 59, '_wp_trash_meta_time', '1521204330'),
(1163, 59, '_wp_desired_post_slug', '%d1%84%d1%83%d1%82%d0%b1%d0%be%d0%bb%d0%ba%d0%b0-%d0%b7%d0%b2%d0%b5%d0%b7%d0%b4%d0%bd%d1%8b%d0%b9-%d0%bc%d0%b5%d1%87%d1%82%d0%b0%d1%82%d0%b5%d0%bb%d1%8c-2'),
(1164, 14, '_wp_trash_meta_status', 'publish'),
(1165, 14, '_wp_trash_meta_time', '1521204330'),
(1166, 14, '_wp_desired_post_slug', '%d1%82%d0%b5%d1%81%d1%82%d0%be%d0%b2%d0%b0%d1%8f-%d0%b7%d0%b0%d0%bf%d0%b8%d1%81%d1%8c'),
(1167, 92, '_edit_last', '1'),
(1168, 92, '_edit_lock', '1521471622:1'),
(1169, 93, 'field1', ''),
(1170, 93, '_field1', 'field_5a9fae0c7ccbb'),
(1171, 93, 'field2', ''),
(1172, 93, '_field2', 'field_5a9fb98b06bd1'),
(1173, 93, 'field3', ''),
(1174, 93, '_field3', 'field_5a9fb9a606bd2'),
(1175, 93, 'field4', ''),
(1176, 93, '_field4', 'field_5a9fb9c406bd3'),
(1177, 93, 'field5', ''),
(1178, 93, '_field5', 'field_5a9fba7cbd598'),
(1179, 93, 'artikul', ''),
(1180, 93, '_artikul', 'field_5a9fbc7429833'),
(1181, 93, 'price', ''),
(1182, 93, '_price', 'field_5a9fba4798c02'),
(1183, 93, 'img_1', ''),
(1184, 93, '_img_1', 'field_5a9fbd19d6797'),
(1185, 93, 'img_2', ''),
(1186, 93, '_img_2', 'field_5a9fbfce7bc7b'),
(1187, 93, 'img_3', ''),
(1188, 93, '_img_3', 'field_5a9fbfec7bc7c'),
(1190, 92, 'field1', ''),
(1191, 92, '_field1', 'field_5a9fae0c7ccbb'),
(1192, 92, 'field2', ''),
(1193, 92, '_field2', 'field_5a9fb98b06bd1'),
(1194, 92, 'field3', ''),
(1195, 92, '_field3', 'field_5a9fb9a606bd2'),
(1196, 92, 'field4', ''),
(1197, 92, '_field4', 'field_5a9fb9c406bd3'),
(1198, 92, 'field5', ''),
(1199, 92, '_field5', 'field_5a9fba7cbd598'),
(1200, 92, 'artikul', '22'),
(1201, 92, '_artikul', 'field_5a9fbc7429833'),
(1202, 92, 'price', '22'),
(1203, 92, '_price', 'field_5a9fba4798c02'),
(1204, 92, 'img_1', '55'),
(1205, 92, '_img_1', 'field_5a9fbd19d6797'),
(1206, 92, 'img_2', '55'),
(1207, 92, '_img_2', 'field_5a9fbfce7bc7b'),
(1208, 92, 'img_3', '55'),
(1209, 92, '_img_3', 'field_5a9fbfec7bc7c'),
(1210, 92, '_thumbnail_id', '55'),
(1213, 94, 'field1', ''),
(1214, 94, '_field1', 'field_5a9fae0c7ccbb'),
(1215, 94, 'field2', ''),
(1216, 94, '_field2', 'field_5a9fb98b06bd1'),
(1217, 94, 'field3', ''),
(1218, 94, '_field3', 'field_5a9fb9a606bd2'),
(1219, 94, 'field4', ''),
(1220, 94, '_field4', 'field_5a9fb9c406bd3'),
(1221, 94, 'field5', ''),
(1222, 94, '_field5', 'field_5a9fba7cbd598'),
(1223, 94, 'artikul', '22'),
(1224, 94, '_artikul', 'field_5a9fbc7429833'),
(1225, 94, 'price', '22'),
(1226, 94, '_price', 'field_5a9fba4798c02'),
(1227, 94, 'img_1', '55'),
(1228, 94, '_img_1', 'field_5a9fbd19d6797'),
(1229, 94, 'img_2', '55'),
(1230, 94, '_img_2', 'field_5a9fbfce7bc7b'),
(1231, 94, 'img_3', '55'),
(1232, 94, '_img_3', 'field_5a9fbfec7bc7c'),
(1240, 95, '_edit_last', '1'),
(1241, 95, '_edit_lock', '1521457532:1'),
(1242, 95, '_thumbnail_id', '4'),
(1245, 96, 'field1', ''),
(1246, 96, '_field1', 'field_5a9fae0c7ccbb'),
(1247, 96, 'field2', ''),
(1248, 96, '_field2', 'field_5a9fb98b06bd1'),
(1249, 96, 'field3', ''),
(1250, 96, '_field3', 'field_5a9fb9a606bd2'),
(1251, 96, 'field4', ''),
(1252, 96, '_field4', 'field_5a9fb9c406bd3'),
(1253, 96, 'field5', ''),
(1254, 96, '_field5', 'field_5a9fba7cbd598'),
(1255, 96, 'artikul', '22'),
(1256, 96, '_artikul', 'field_5a9fbc7429833'),
(1257, 96, 'price', '22'),
(1258, 96, '_price', 'field_5a9fba4798c02'),
(1259, 96, 'img_1', '4'),
(1260, 96, '_img_1', 'field_5a9fbd19d6797'),
(1261, 96, 'img_2', '4'),
(1262, 96, '_img_2', 'field_5a9fbfce7bc7b'),
(1263, 96, 'img_3', '4'),
(1264, 96, '_img_3', 'field_5a9fbfec7bc7c'),
(1266, 95, 'field1', ''),
(1267, 95, '_field1', 'field_5a9fae0c7ccbb'),
(1268, 95, 'field2', ''),
(1269, 95, '_field2', 'field_5a9fb98b06bd1'),
(1270, 95, 'field3', ''),
(1271, 95, '_field3', 'field_5a9fb9a606bd2'),
(1272, 95, 'field4', ''),
(1273, 95, '_field4', 'field_5a9fb9c406bd3'),
(1274, 95, 'field5', ''),
(1275, 95, '_field5', 'field_5a9fba7cbd598'),
(1276, 95, 'artikul', '22'),
(1277, 95, '_artikul', 'field_5a9fbc7429833'),
(1278, 95, 'price', '22'),
(1279, 95, '_price', 'field_5a9fba4798c02'),
(1280, 95, 'img_1', '4'),
(1281, 95, '_img_1', 'field_5a9fbd19d6797'),
(1282, 95, 'img_2', '4'),
(1283, 95, '_img_2', 'field_5a9fbfce7bc7b'),
(1284, 95, 'img_3', '4'),
(1285, 95, '_img_3', 'field_5a9fbfec7bc7c'),
(1286, 97, '_edit_last', '1');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1287, 97, '_edit_lock', '1521205542:1'),
(1288, 97, '_thumbnail_id', '4'),
(1291, 98, 'field1', ''),
(1292, 98, '_field1', 'field_5a9fae0c7ccbb'),
(1293, 98, 'field2', ''),
(1294, 98, '_field2', 'field_5a9fb98b06bd1'),
(1295, 98, 'field3', ''),
(1296, 98, '_field3', 'field_5a9fb9a606bd2'),
(1297, 98, 'field4', ''),
(1298, 98, '_field4', 'field_5a9fb9c406bd3'),
(1299, 98, 'field5', ''),
(1300, 98, '_field5', 'field_5a9fba7cbd598'),
(1301, 98, 'artikul', '434'),
(1302, 98, '_artikul', 'field_5a9fbc7429833'),
(1303, 98, 'price', '44'),
(1304, 98, '_price', 'field_5a9fba4798c02'),
(1305, 98, 'img_1', '4'),
(1306, 98, '_img_1', 'field_5a9fbd19d6797'),
(1307, 98, 'img_2', '4'),
(1308, 98, '_img_2', 'field_5a9fbfce7bc7b'),
(1309, 98, 'img_3', '4'),
(1310, 98, '_img_3', 'field_5a9fbfec7bc7c'),
(1311, 97, '_wp_post_template', 'single-blog.php'),
(1312, 97, 'field1', ''),
(1313, 97, '_field1', 'field_5a9fae0c7ccbb'),
(1314, 97, 'field2', ''),
(1315, 97, '_field2', 'field_5a9fb98b06bd1'),
(1316, 97, 'field3', ''),
(1317, 97, '_field3', 'field_5a9fb9a606bd2'),
(1318, 97, 'field4', ''),
(1319, 97, '_field4', 'field_5a9fb9c406bd3'),
(1320, 97, 'field5', ''),
(1321, 97, '_field5', 'field_5a9fba7cbd598'),
(1322, 97, 'artikul', '434'),
(1323, 97, '_artikul', 'field_5a9fbc7429833'),
(1324, 97, 'price', '44'),
(1325, 97, '_price', 'field_5a9fba4798c02'),
(1326, 97, 'img_1', '4'),
(1327, 97, '_img_1', 'field_5a9fbd19d6797'),
(1328, 97, 'img_2', '4'),
(1329, 97, '_img_2', 'field_5a9fbfce7bc7b'),
(1330, 97, 'img_3', '4'),
(1331, 97, '_img_3', 'field_5a9fbfec7bc7c'),
(1334, 99, 'field1', ''),
(1335, 99, '_field1', 'field_5a9fae0c7ccbb'),
(1336, 99, 'field2', ''),
(1337, 99, '_field2', 'field_5a9fb98b06bd1'),
(1338, 99, 'field3', ''),
(1339, 99, '_field3', 'field_5a9fb9a606bd2'),
(1340, 99, 'field4', ''),
(1341, 99, '_field4', 'field_5a9fb9c406bd3'),
(1342, 99, 'field5', ''),
(1343, 99, '_field5', 'field_5a9fba7cbd598'),
(1344, 99, 'artikul', '434'),
(1345, 99, '_artikul', 'field_5a9fbc7429833'),
(1346, 99, 'price', '44'),
(1347, 99, '_price', 'field_5a9fba4798c02'),
(1348, 99, 'img_1', '4'),
(1349, 99, '_img_1', 'field_5a9fbd19d6797'),
(1350, 99, 'img_2', '4'),
(1351, 99, '_img_2', 'field_5a9fbfce7bc7b'),
(1352, 99, 'img_3', '4'),
(1353, 99, '_img_3', 'field_5a9fbfec7bc7c'),
(1354, 100, '_edit_last', '1'),
(1355, 100, '_edit_lock', '1521469536:1'),
(1356, 100, '_thumbnail_id', '48'),
(1359, 101, 'field1', ''),
(1360, 101, '_field1', 'field_5a9fae0c7ccbb'),
(1361, 101, 'field2', ''),
(1362, 101, '_field2', 'field_5a9fb98b06bd1'),
(1363, 101, 'field3', ''),
(1364, 101, '_field3', 'field_5a9fb9a606bd2'),
(1365, 101, 'field4', ''),
(1366, 101, '_field4', 'field_5a9fb9c406bd3'),
(1367, 101, 'field5', ''),
(1368, 101, '_field5', 'field_5a9fba7cbd598'),
(1369, 101, 'artikul', '33'),
(1370, 101, '_artikul', 'field_5a9fbc7429833'),
(1371, 101, 'price', '33'),
(1372, 101, '_price', 'field_5a9fba4798c02'),
(1373, 101, 'img_1', '48'),
(1374, 101, '_img_1', 'field_5a9fbd19d6797'),
(1375, 101, 'img_2', '48'),
(1376, 101, '_img_2', 'field_5a9fbfce7bc7b'),
(1377, 101, 'img_3', '48'),
(1378, 101, '_img_3', 'field_5a9fbfec7bc7c'),
(1380, 100, 'field1', ''),
(1381, 100, '_field1', 'field_5a9fae0c7ccbb'),
(1382, 100, 'field2', ''),
(1383, 100, '_field2', 'field_5a9fb98b06bd1'),
(1384, 100, 'field3', ''),
(1385, 100, '_field3', 'field_5a9fb9a606bd2'),
(1386, 100, 'field4', ''),
(1387, 100, '_field4', 'field_5a9fb9c406bd3'),
(1388, 100, 'field5', ''),
(1389, 100, '_field5', 'field_5a9fba7cbd598'),
(1390, 100, 'artikul', '33'),
(1391, 100, '_artikul', 'field_5a9fbc7429833'),
(1392, 100, 'price', '33'),
(1393, 100, '_price', 'field_5a9fba4798c02'),
(1394, 100, 'img_1', '48'),
(1395, 100, '_img_1', 'field_5a9fbd19d6797'),
(1396, 100, 'img_2', '48'),
(1397, 100, '_img_2', 'field_5a9fbfce7bc7b'),
(1398, 100, 'img_3', '48'),
(1399, 100, '_img_3', 'field_5a9fbfec7bc7c'),
(1402, 92, '_wp_post_template', 'single-products.php'),
(1407, 95, '_wp_post_template', 'single-blog.php'),
(1408, 102, '_edit_last', '1'),
(1409, 102, '_edit_lock', '1521462200:1'),
(1410, 102, '_wp_page_template', 'default'),
(1413, 100, '_wp_post_template', 'single-blog.php');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-03-05 14:14:24', '2018-03-05 11:14:24', 'Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите её, затем пишите!', 'Привет, мир!', '', 'trash', 'open', 'open', '', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80__trashed', '', '', '2018-03-07 14:19:23', '2018-03-07 11:19:23', '', 0, 'http://wp-catalog/?p=1', 0, 'post', '', 1),
(2, 1, '2018-03-05 14:14:24', '2018-03-05 11:14:24', 'Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице «Детали» владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:\r\n<blockquote>Привет! Днём я курьер, а вечером — подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</blockquote>\r\n...или так:\r\n<blockquote>Компания «Штучки XYZ» была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</blockquote>\r\nПерейдите <a href=\"http://wp-catalog/wp-admin/\">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!', 'Как сделать заказ', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-03-07 11:30:23', '2018-03-07 08:30:23', '', 0, 'http://wp-catalog/?page_id=2', 0, 'page', '', 0),
(4, 1, '2018-03-05 17:07:18', '2018-03-05 14:07:18', '', 'cat-img2', '', 'inherit', 'open', 'closed', '', 'cat-img2', '', '', '2018-03-05 17:07:18', '2018-03-05 14:07:18', '', 1, 'http://wp-catalog/wp-content/uploads/2018/03/cat-img2.jpg', 0, 'attachment', 'image/jpeg', 0),
(5, 1, '2018-03-05 17:09:34', '2018-03-05 14:09:34', 'Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите её, затем пишите!', 'Привет, мир!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-03-05 17:09:34', '2018-03-05 14:09:34', '', 1, 'http://wp-catalog/2018/03/05/1-revision-v1/', 0, 'revision', '', 0),
(6, 1, '2018-03-06 10:01:53', '2018-03-06 07:01:53', '', 'Главная', '', 'publish', 'closed', 'closed', '', '%d0%b3%d0%bb%d0%b0%d0%b2%d0%bd%d0%b0%d1%8f', '', '', '2018-03-16 11:26:39', '2018-03-16 08:26:39', '', 0, 'http://wp-catalog/?p=6', 1, 'nav_menu_item', '', 0),
(8, 1, '2018-03-06 09:58:13', '2018-03-06 06:58:13', '<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Контакты', '', 'publish', 'closed', 'closed', '', '%d0%ba%d0%be%d0%bd%d1%82%d0%b0%d0%ba%d1%82%d1%8b', '', '', '2018-03-07 12:58:32', '2018-03-07 09:58:32', '', 0, 'http://wp-catalog/?page_id=8', 0, 'page', '', 0),
(9, 1, '2018-03-06 09:58:13', '2018-03-06 06:58:13', 'контакты', 'Контакты', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2018-03-06 09:58:13', '2018-03-06 06:58:13', '', 8, 'http://wp-catalog/2018/03/06/8-revision-v1/', 0, 'revision', '', 0),
(10, 1, '2018-03-06 10:00:56', '2018-03-06 07:00:56', '<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'О нас', '', 'publish', 'closed', 'closed', '', '%d0%be-%d0%bd%d0%b0%d1%81', '', '', '2018-03-07 11:15:27', '2018-03-07 08:15:27', '', 0, 'http://wp-catalog/?page_id=10', 0, 'page', '', 0),
(11, 1, '2018-03-06 10:00:56', '2018-03-06 07:00:56', 'о нас', 'О нас', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2018-03-06 10:00:56', '2018-03-06 07:00:56', '', 10, 'http://wp-catalog/2018/03/06/10-revision-v1/', 0, 'revision', '', 0),
(12, 1, '2018-03-06 10:03:15', '2018-03-06 07:03:15', ' ', '', '', 'publish', 'closed', 'closed', '', '12', '', '', '2018-03-16 11:26:39', '2018-03-16 08:26:39', '', 0, 'http://wp-catalog/?p=12', 3, 'nav_menu_item', '', 0),
(13, 1, '2018-03-06 10:03:15', '2018-03-06 07:03:15', ' ', '', '', 'publish', 'closed', 'closed', '', '13', '', '', '2018-03-16 11:26:39', '2018-03-16 08:26:39', '', 0, 'http://wp-catalog/?p=13', 4, 'nav_menu_item', '', 0),
(14, 1, '2018-03-06 13:32:33', '2018-03-06 10:32:33', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель', '', 'trash', 'open', 'open', '', '%d1%82%d0%b5%d1%81%d1%82%d0%be%d0%b2%d0%b0%d1%8f-%d0%b7%d0%b0%d0%bf%d0%b8%d1%81%d1%8c__trashed', '', '', '2018-03-16 15:45:30', '2018-03-16 12:45:30', '', 0, 'http://wp-catalog/?p=14', 0, 'post', '', 0),
(15, 1, '2018-03-06 13:32:29', '2018-03-06 10:32:29', 'тест', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-06 13:32:29', '2018-03-06 10:32:29', '', 14, 'http://wp-catalog/2018/03/06/14-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2018-03-06 15:19:28', '2018-03-06 12:19:28', 'иии', 'тест2', '', 'trash', 'open', 'open', '', '%d1%82%d0%b5%d1%81%d1%822__trashed', '', '', '2018-03-07 14:19:22', '2018-03-07 11:19:22', '', 0, 'http://wp-catalog/?p=16', 0, 'post', '', 0),
(17, 1, '2018-03-06 15:19:28', '2018-03-06 12:19:28', 'иии', 'тест2', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2018-03-06 15:19:28', '2018-03-06 12:19:28', '', 16, 'http://wp-catalog/2018/03/06/16-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2018-03-06 15:22:31', '2018-03-06 12:22:31', '', 'Тест 4', '', 'trash', 'open', 'open', '', '%d1%82%d0%b5%d1%81%d1%82-4__trashed', '', '', '2018-03-07 14:19:22', '2018-03-07 11:19:22', '', 0, 'http://wp-catalog/?p=18', 0, 'post', '', 0),
(19, 1, '2018-03-06 15:22:31', '2018-03-06 12:22:31', '', 'Тест 4', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-03-06 15:22:31', '2018-03-06 12:22:31', '', 18, 'http://wp-catalog/2018/03/06/18-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2018-03-06 15:49:50', '2018-03-06 12:49:50', 'им', 'Тест', '', 'trash', 'open', 'open', '', '%d1%82%d0%b5%d1%81%d1%82__trashed', '', '', '2018-03-07 14:19:31', '2018-03-07 11:19:31', '', 0, 'http://wp-catalog/?p=20', 0, 'post', '', 0),
(21, 1, '2018-03-06 15:49:50', '2018-03-06 12:49:50', 'им', 'Тест', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2018-03-06 15:49:50', '2018-03-06 12:49:50', '', 20, 'http://wp-catalog/2018/03/06/20-revision-v1/', 0, 'revision', '', 0),
(22, 1, '2018-03-06 15:50:05', '2018-03-06 12:50:05', 'тест444444444444444444444444444444444444444444444444444444444444444', 'Тест', '', 'trash', 'open', 'open', '', '%d1%82%d0%b5%d1%81%d1%82-2__trashed', '', '', '2018-03-07 14:19:22', '2018-03-07 11:19:22', '', 0, 'http://wp-catalog/?p=22', 0, 'post', '', 0),
(23, 1, '2018-03-06 15:50:05', '2018-03-06 12:50:05', 'тест', 'Тест', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2018-03-06 15:50:05', '2018-03-06 12:50:05', '', 22, 'http://wp-catalog/2018/03/06/22-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2018-03-06 15:50:19', '2018-03-06 12:50:19', 'Тест3', 'Тест', '', 'trash', 'open', 'open', '', '%d1%82%d0%b5%d1%81%d1%82-3__trashed', '', '', '2018-03-07 14:19:22', '2018-03-07 11:19:22', '', 0, 'http://wp-catalog/?p=24', 0, 'post', '', 0),
(25, 1, '2018-03-06 15:50:19', '2018-03-06 12:50:19', 'Тест', 'Тест', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2018-03-06 15:50:19', '2018-03-06 12:50:19', '', 24, 'http://wp-catalog/2018/03/06/24-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2018-03-06 20:10:04', '2018-03-06 17:10:04', '', 'Описание категории', '', 'trash', 'closed', 'closed', '', 'acf_%d0%be%d0%bf%d0%b8%d1%81%d0%b0%d0%bd%d0%b8%d0%b5-%d0%ba%d0%b0%d1%82%d0%b5%d0%b3%d0%be%d1%80%d0%b8%d0%b8__trashed', '', '', '2018-03-06 20:51:02', '2018-03-06 17:51:02', '', 0, 'http://wp-catalog/?post_type=acf&#038;p=26', 0, 'acf', '', 0),
(27, 1, '2018-03-07 10:22:19', '2018-03-07 07:22:19', 'тестscsdcsdc', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 10:22:19', '2018-03-07 07:22:19', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2018-03-07 11:13:53', '2018-03-07 08:13:53', '<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Контакты', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2018-03-07 11:13:53', '2018-03-07 08:13:53', '', 8, 'http://wp-catalog/2018/03/07/8-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2018-03-07 11:15:27', '2018-03-07 08:15:27', '<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'О нас', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2018-03-07 11:15:27', '2018-03-07 08:15:27', '', 10, 'http://wp-catalog/2018/03/07/10-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2018-03-07 11:21:38', '2018-03-07 08:21:38', 'Тест3', 'Тест', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2018-03-07 11:21:38', '2018-03-07 08:21:38', '', 24, 'http://wp-catalog/2018/03/07/24-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2018-03-07 11:22:09', '2018-03-07 08:22:09', 'тест444444444444444444444444444444444444444444444444444444444444444', 'Тест', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2018-03-07 11:22:09', '2018-03-07 08:22:09', '', 22, 'http://wp-catalog/2018/03/07/22-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2018-03-07 11:30:23', '2018-03-07 08:30:23', 'Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице «Детали» владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:\r\n<blockquote>Привет! Днём я курьер, а вечером — подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</blockquote>\r\n...или так:\r\n<blockquote>Компания «Штучки XYZ» была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</blockquote>\r\nПерейдите <a href=\"http://wp-catalog/wp-admin/\">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!', 'Как сделать заказ', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2018-03-07 11:30:23', '2018-03-07 08:30:23', '', 2, 'http://wp-catalog/2018/03/07/2-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2018-03-07 11:30:43', '2018-03-07 08:30:43', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2018-03-07 11:43:13', '2018-03-07 08:43:13', '', 0, 'http://wp-catalog/?p=33', 1, 'nav_menu_item', '', 0),
(34, 1, '2018-03-07 11:43:00', '2018-03-07 08:43:00', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'О доставке / способы оплаты', '', 'publish', 'closed', 'closed', '', '%d0%be-%d0%b4%d0%be%d1%81%d1%82%d0%b0%d0%b2%d0%ba%d0%b5-%d1%81%d0%bf%d0%be%d1%81%d0%be%d0%b1%d1%8b-%d0%be%d0%bf%d0%bb%d0%b0%d1%82%d1%8b', '', '', '2018-03-07 11:43:00', '2018-03-07 08:43:00', '', 0, 'http://wp-catalog/?page_id=34', 0, 'page', '', 0),
(35, 1, '2018-03-07 11:43:00', '2018-03-07 08:43:00', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'О доставке / способы оплаты', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2018-03-07 11:43:00', '2018-03-07 08:43:00', '', 34, 'http://wp-catalog/2018/03/07/34-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2018-03-07 11:43:13', '2018-03-07 08:43:13', ' ', '', '', 'publish', 'closed', 'closed', '', '36', '', '', '2018-03-07 11:43:13', '2018-03-07 08:43:13', '', 0, 'http://wp-catalog/?p=36', 2, 'nav_menu_item', '', 0),
(37, 1, '2018-03-07 12:19:24', '2018-03-07 09:19:24', '', 'Характеристики', '', 'publish', 'closed', 'closed', '', 'acf_xarakteristiki', '', '', '2018-03-14 11:48:31', '2018-03-14 08:48:31', '', 0, 'http://wp-catalog/?post_type=acf&#038;p=37', 0, 'acf', '', 0),
(38, 1, '2018-03-07 12:21:09', '2018-03-07 09:21:09', 'тестscsdcsdc', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 12:21:09', '2018-03-07 09:21:09', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2018-03-07 12:38:41', '2018-03-07 09:38:41', '<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Контакты', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2018-03-07 12:38:41', '2018-03-07 09:38:41', '', 8, 'http://wp-catalog/2018/03/07/8-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2018-03-07 12:58:32', '2018-03-07 09:58:32', '<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n<strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Контакты', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2018-03-07 12:58:32', '2018-03-07 09:58:32', '', 8, 'http://wp-catalog/2018/03/07/8-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2018-03-07 13:04:49', '2018-03-07 10:04:49', 'тестscsdcsdc', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 13:04:49', '2018-03-07 10:04:49', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(42, 1, '2018-03-07 13:14:08', '2018-03-07 10:14:08', 'тестscsdcsdc', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 13:14:08', '2018-03-07 10:14:08', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(43, 1, '2018-03-07 13:16:53', '2018-03-07 10:16:53', 'тестscsdcsdc', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 13:16:53', '2018-03-07 10:16:53', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(44, 1, '2018-03-07 13:19:22', '2018-03-07 10:19:22', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 13:19:22', '2018-03-07 10:19:22', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2018-03-07 13:23:24', '2018-03-07 10:23:24', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 13:23:24', '2018-03-07 10:23:24', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2018-03-07 13:25:16', '2018-03-07 10:25:16', '', 'haba', '', 'inherit', 'open', 'closed', '', 'haba', '', '', '2018-03-07 13:25:16', '2018-03-07 10:25:16', '', 14, 'http://wp-catalog/wp-content/uploads/2018/03/haba.jpg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2018-03-07 13:25:51', '2018-03-07 10:25:51', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 13:25:51', '2018-03-07 10:25:51', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(48, 1, '2018-03-07 13:34:05', '2018-03-07 10:34:05', '', 'cat-img5', '', 'inherit', 'open', 'closed', '', 'cat-img5', '', '', '2018-03-07 13:34:05', '2018-03-07 10:34:05', '', 14, 'http://wp-catalog/wp-content/uploads/2018/03/cat-img5.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2018-03-07 13:34:12', '2018-03-07 10:34:12', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Тестовая запись', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 13:34:12', '2018-03-07 10:34:12', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2018-03-07 13:56:49', '2018-03-07 10:56:49', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Shark', '', 'inherit', 'closed', 'closed', '', '14-autosave-v1', '', '', '2018-03-07 13:56:49', '2018-03-07 10:56:49', '', 14, 'http://wp-catalog/2018/03/07/14-autosave-v1/', 0, 'revision', '', 0),
(51, 1, '2018-03-07 14:00:03', '2018-03-07 11:00:03', '', 'shark3', '', 'inherit', 'open', 'closed', '', 'shark3', '', '', '2018-03-07 14:00:03', '2018-03-07 11:00:03', '', 14, 'http://wp-catalog/wp-content/uploads/2018/03/shark3.jpg', 0, 'attachment', 'image/jpeg', 0),
(52, 1, '2018-03-07 14:00:05', '2018-03-07 11:00:05', '', 'shark', '', 'inherit', 'open', 'closed', '', 'shark', '', '', '2018-03-07 14:00:05', '2018-03-07 11:00:05', '', 14, 'http://wp-catalog/wp-content/uploads/2018/03/shark.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2018-03-07 14:00:06', '2018-03-07 11:00:06', '', 'shark2', '', 'inherit', 'open', 'closed', '', 'shark2', '', '', '2018-03-07 14:00:06', '2018-03-07 11:00:06', '', 14, 'http://wp-catalog/wp-content/uploads/2018/03/shark2.jpg', 0, 'attachment', 'image/jpeg', 0),
(54, 1, '2018-03-07 14:00:59', '2018-03-07 11:00:59', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Shark', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 14:00:59', '2018-03-07 11:00:59', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2018-03-07 14:11:25', '2018-03-07 11:11:25', '', 'prod', '', 'inherit', 'open', 'closed', '', 'prod', '', '', '2018-03-07 14:11:25', '2018-03-07 11:11:25', '', 14, 'http://wp-catalog/wp-content/uploads/2018/03/prod.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2018-03-07 14:11:51', '2018-03-07 11:11:51', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Shark', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 14:11:51', '2018-03-07 11:11:51', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2018-03-07 14:17:55', '2018-03-07 11:17:55', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-03-07 14:17:55', '2018-03-07 11:17:55', '', 14, 'http://wp-catalog/2018/03/07/14-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2018-03-07 15:01:44', '2018-03-07 12:01:44', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 2', '', 'trash', 'open', 'open', '', '%d1%84%d1%83%d1%82%d0%b1%d0%be%d0%bb%d0%ba%d0%b0-%d0%b7%d0%b2%d0%b5%d0%b7%d0%b4%d0%bd%d1%8b%d0%b9-%d0%bc%d0%b5%d1%87%d1%82%d0%b0%d1%82%d0%b5%d0%bb%d1%8c-2__trashed', '', '', '2018-03-16 15:45:30', '2018-03-16 12:45:30', '', 0, 'http://wp-catalog/?p=59', 0, 'post', '', 0),
(60, 1, '2018-03-07 15:01:44', '2018-03-07 12:01:44', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 2', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2018-03-07 15:01:44', '2018-03-07 12:01:44', '', 59, 'http://wp-catalog/2018/03/07/59-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2018-03-07 15:02:54', '2018-03-07 12:02:54', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 3', '', 'trash', 'open', 'open', '', '%d1%84%d1%83%d1%82%d0%b1%d0%be%d0%bb%d0%ba%d0%b0-%d0%b7%d0%b2%d0%b5%d0%b7%d0%b4%d0%bd%d1%8b%d0%b9-%d0%bc%d0%b5%d1%87%d1%82%d0%b0%d1%82%d0%b5%d0%bb%d1%8c-3__trashed', '', '', '2018-03-16 15:45:30', '2018-03-16 12:45:30', '', 0, 'http://wp-catalog/?p=61', 0, 'post', '', 0),
(62, 1, '2018-03-07 15:02:54', '2018-03-07 12:02:54', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 3', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2018-03-07 15:02:54', '2018-03-07 12:02:54', '', 61, 'http://wp-catalog/2018/03/07/61-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2018-03-07 15:03:58', '2018-03-07 12:03:58', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 4', '', 'trash', 'open', 'open', '', '%d1%84%d1%83%d1%82%d0%b1%d0%be%d0%bb%d0%ba%d0%b0-%d0%b7%d0%b2%d0%b5%d0%b7%d0%b4%d0%bd%d1%8b%d0%b9-%d0%bc%d0%b5%d1%87%d1%82%d0%b0%d1%82%d0%b5%d0%bb%d1%8c-4__trashed', '', '', '2018-03-16 15:45:30', '2018-03-16 12:45:30', '', 0, 'http://wp-catalog/?p=63', 0, 'post', '', 0),
(64, 1, '2018-03-07 15:03:58', '2018-03-07 12:03:58', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 4', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2018-03-07 15:03:58', '2018-03-07 12:03:58', '', 63, 'http://wp-catalog/2018/03/07/63-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2018-03-07 15:09:29', '2018-03-07 12:09:29', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 5', '', 'trash', 'open', 'open', '', 'futbolka-zvezdnyj-mechtatel-5__trashed', '', '', '2018-03-16 15:45:30', '2018-03-16 12:45:30', '', 0, 'http://wp-catalog/?p=65', 0, 'post', '', 0),
(66, 1, '2018-03-07 15:09:29', '2018-03-07 12:09:29', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 5', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2018-03-07 15:09:29', '2018-03-07 12:09:29', '', 65, 'http://wp-catalog/2018/03/07/65-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2018-03-14 11:35:50', '2018-03-14 08:35:50', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 5', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2018-03-14 11:35:50', '2018-03-14 08:35:50', '', 65, 'http://wp-catalog2/2018/03/14/65-revision-v1/', 0, 'revision', '', 0),
(70, 1, '2018-03-14 11:40:58', '2018-03-14 08:40:58', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 5', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2018-03-14 11:40:58', '2018-03-14 08:40:58', '', 65, 'http://wp-catalog2/2018/03/14/65-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2018-03-14 11:41:32', '2018-03-14 08:41:32', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 5', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2018-03-14 11:41:32', '2018-03-14 08:41:32', '', 65, 'http://wp-catalog2/2018/03/14/65-revision-v1/', 0, 'revision', '', 0),
(72, 1, '2018-03-14 11:52:36', '2018-03-14 08:52:36', '<strong>Lorem Ipsum</strong> — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Футболка Звездный мечтатель 5', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2018-03-14 11:52:36', '2018-03-14 08:52:36', '', 65, 'http://wp-catalog2/2018/03/14/65-revision-v1/', 0, 'revision', '', 0),
(73, 1, '2018-03-15 09:43:27', '2018-03-15 06:43:27', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Майк Тайсон путь чемпиона', '', 'trash', 'open', 'open', '', 'blog-test__trashed', '', '', '2018-03-16 15:45:30', '2018-03-16 12:45:30', '', 0, 'http://wp-catalog2/?p=73', 0, 'post', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(74, 1, '2018-03-15 09:43:27', '2018-03-15 06:43:27', 'тест', 'Блог тест', '', 'inherit', 'closed', 'closed', '', '73-revision-v1', '', '', '2018-03-15 09:43:27', '2018-03-15 06:43:27', '', 73, 'http://wp-catalog2/2018/03/15/73-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2018-03-15 11:08:10', '2018-03-15 08:08:10', '', 'Каталог товаров', '', 'publish', 'closed', 'closed', '', 'catalog', '', '', '2018-03-16 17:02:33', '2018-03-16 14:02:33', '', 0, 'http://wp-catalog2/?page_id=75', 0, 'page', '', 0),
(76, 1, '2018-03-15 11:08:10', '2018-03-15 08:08:10', '', 'Блог', '', 'inherit', 'closed', 'closed', '', '75-revision-v1', '', '', '2018-03-15 11:08:10', '2018-03-15 08:08:10', '', 75, 'http://wp-catalog2/2018/03/15/75-revision-v1/', 0, 'revision', '', 0),
(77, 1, '2018-03-15 11:08:35', '2018-03-15 08:08:35', '', 'Товары', '', 'publish', 'closed', 'closed', '', '77', '', '', '2018-03-16 11:26:39', '2018-03-16 08:26:39', '', 0, 'http://wp-catalog2/?p=77', 2, 'nav_menu_item', '', 0),
(78, 1, '2018-03-15 11:18:51', '2018-03-15 08:18:51', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Блог тест', '', 'inherit', 'closed', 'closed', '', '73-autosave-v1', '', '', '2018-03-15 11:18:51', '2018-03-15 08:18:51', '', 73, 'http://wp-catalog2/2018/03/15/73-autosave-v1/', 0, 'revision', '', 0),
(79, 1, '2018-03-15 11:19:30', '2018-03-15 08:19:30', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Блог тест', '', 'inherit', 'closed', 'closed', '', '73-revision-v1', '', '', '2018-03-15 11:19:30', '2018-03-15 08:19:30', '', 73, 'http://wp-catalog2/2018/03/15/73-revision-v1/', 0, 'revision', '', 0),
(80, 1, '2018-03-15 11:20:35', '2018-03-15 08:20:35', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 'Майк Тайсон путь чемпиона', '', 'inherit', 'closed', 'closed', '', '73-revision-v1', '', '', '2018-03-15 11:20:35', '2018-03-15 08:20:35', '', 73, 'http://wp-catalog2/2018/03/15/73-revision-v1/', 0, 'revision', '', 0),
(81, 1, '2018-03-15 12:00:06', '2018-03-15 09:00:06', '', 'Каталог товаров', '', 'inherit', 'closed', 'closed', '', '75-revision-v1', '', '', '2018-03-15 12:00:06', '2018-03-15 09:00:06', '', 75, 'http://wp-catalog2/2018/03/15/75-revision-v1/', 0, 'revision', '', 0),
(82, 1, '2018-03-15 12:43:05', '2018-03-15 09:43:05', 'Lorem Ipsum — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, Lorem Ipsum — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, Lorem Ipsum — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, ', 'Брюс Ли путь дракона', '', 'trash', 'open', 'open', '', 'bryus-li-put-drakona__trashed', '', '', '2018-03-16 15:45:29', '2018-03-16 12:45:29', '', 0, 'http://wp-catalog2/?p=82', 0, 'post', '', 0),
(83, 1, '2018-03-15 12:43:05', '2018-03-15 09:43:05', 'Lorem Ipsum — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но', 'Брюс Ли путь дракона', '', 'inherit', 'closed', 'closed', '', '82-revision-v1', '', '', '2018-03-15 12:43:05', '2018-03-15 09:43:05', '', 82, 'http://wp-catalog2/2018/03/15/82-revision-v1/', 0, 'revision', '', 0),
(84, 1, '2018-03-15 14:40:03', '2018-03-15 11:40:03', 'Lorem Ipsum — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, Lorem Ipsum — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, Lorem Ipsum — это текст-«рыба», часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной «рыбой» для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, ', 'Брюс Ли путь дракона', '', 'inherit', 'closed', 'closed', '', '82-revision-v1', '', '', '2018-03-15 14:40:03', '2018-03-15 11:40:03', '', 82, 'http://wp-catalog2/82-revision-v1/', 0, 'revision', '', 0),
(86, 1, '2018-03-16 15:24:16', '2018-03-16 12:24:16', 'описание', 'Футболкище', '', 'trash', 'open', 'open', '', 'futbolkishhe__trashed', '', '', '2018-03-16 15:45:29', '2018-03-16 12:45:29', '', 0, 'http://wp-catalog2/?p=86', 0, 'post', '', 0),
(87, 1, '2018-03-16 15:24:16', '2018-03-16 12:24:16', 'описание', 'Футболкище', '', 'inherit', 'closed', 'closed', '', '86-revision-v1', '', '', '2018-03-16 15:24:16', '2018-03-16 12:24:16', '', 86, 'http://wp-catalog2/3d-t-shirt-1/86-revision-v1/', 0, 'revision', '', 0),
(90, 1, '2018-03-16 15:43:03', '2018-03-16 12:43:03', '', 'Страница товара', '', 'trash', 'closed', 'closed', '', 'stranica-tovara__trashed', '', '', '2018-03-16 15:44:55', '2018-03-16 12:44:55', '', 0, 'http://wp-catalog2/?page_id=90', 0, 'page', '', 0),
(91, 1, '2018-03-16 15:43:03', '2018-03-16 12:43:03', '', 'Страница товара', '', 'inherit', 'closed', 'closed', '', '90-revision-v1', '', '', '2018-03-16 15:43:03', '2018-03-16 12:43:03', '', 90, 'http://wp-catalog2/3d-t-shirt-1/90-revision-v1/', 0, 'revision', '', 0),
(92, 1, '2018-03-16 15:51:57', '2018-03-16 12:51:57', 'Описание', 'Рик и Морти', '', 'publish', 'open', 'open', '', 'rik-i-morti', '', '', '2018-03-19 13:59:39', '2018-03-19 10:59:39', '', 0, 'http://wp-catalog2/?p=92', 0, 'post', '', 0),
(93, 1, '2018-03-16 15:50:14', '2018-03-16 12:50:14', 'Описание', 'Тим и Морти', '', 'inherit', 'closed', 'closed', '', '92-revision-v1', '', '', '2018-03-16 15:50:14', '2018-03-16 12:50:14', '', 92, 'http://wp-catalog2/blog/92-revision-v1/', 0, 'revision', '', 0),
(94, 1, '2018-03-16 15:51:57', '2018-03-16 12:51:57', 'Описание', 'Рик и Морти', '', 'inherit', 'closed', 'closed', '', '92-revision-v1', '', '', '2018-03-16 15:51:57', '2018-03-16 12:51:57', '', 92, 'http://wp-catalog2/blog/92-revision-v1/', 0, 'revision', '', 0),
(95, 1, '2018-03-16 16:05:04', '2018-03-16 13:05:04', 'ааа', 'Тест', '', 'publish', 'open', 'open', '', 'test', '', '', '2018-03-19 14:00:29', '2018-03-19 11:00:29', '', 0, 'http://wp-catalog2/?p=95', 0, 'post', '', 0),
(96, 1, '2018-03-16 16:05:04', '2018-03-16 13:05:04', 'ааа', 'Тест', '', 'inherit', 'closed', 'closed', '', '95-revision-v1', '', '', '2018-03-16 16:05:04', '2018-03-16 13:05:04', '', 95, 'http://wp-catalog2/blog/95-revision-v1/', 0, 'revision', '', 0),
(97, 1, '2018-03-16 16:06:48', '2018-03-16 13:06:48', 'тест', 'Статья тест', '', 'publish', 'open', 'open', '', 'statya-test', '', '', '2018-03-16 16:07:04', '2018-03-16 13:07:04', '', 0, 'http://wp-catalog2/?p=97', 0, 'post', '', 0),
(98, 1, '2018-03-16 16:06:48', '2018-03-16 13:06:48', 'вам', 'Статья тест', '', 'inherit', 'closed', 'closed', '', '97-revision-v1', '', '', '2018-03-16 16:06:48', '2018-03-16 13:06:48', '', 97, 'http://wp-catalog2/blog/97-revision-v1/', 0, 'revision', '', 0),
(99, 1, '2018-03-16 16:07:04', '2018-03-16 13:07:04', 'тест', 'Статья тест', '', 'inherit', 'closed', 'closed', '', '97-revision-v1', '', '', '2018-03-16 16:07:04', '2018-03-16 13:07:04', '', 97, 'http://wp-catalog2/blog/97-revision-v1/', 0, 'revision', '', 0),
(100, 1, '2018-03-16 16:07:41', '2018-03-16 13:07:41', 'тест', 'Статья тест 2', '', 'publish', 'open', 'open', '', 'statya-test-2', '', '', '2018-03-19 17:27:51', '2018-03-19 14:27:51', '', 0, 'http://wp-catalog2/?p=100', 0, 'post', '', 0),
(101, 1, '2018-03-16 16:07:41', '2018-03-16 13:07:41', 'тест', 'Статья тест 2', '', 'inherit', 'closed', 'closed', '', '100-revision-v1', '', '', '2018-03-16 16:07:41', '2018-03-16 13:07:41', '', 100, 'http://wp-catalog2/blog/100-revision-v1/', 0, 'revision', '', 0),
(102, 1, '2018-03-19 15:25:20', '2018-03-19 12:25:20', '', 'Блог', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2018-03-19 15:25:20', '2018-03-19 12:25:20', '', 0, 'http://wp-catalog2/?page_id=102', 0, 'page', '', 0),
(104, 1, '2018-03-19 15:25:20', '2018-03-19 12:25:20', '', 'Блог', '', 'inherit', 'closed', 'closed', '', '102-revision-v1', '', '', '2018-03-19 15:25:20', '2018-03-19 12:25:20', '', 102, 'http://wp-catalog2/blog/102-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(2, 1, 'h1', 'Блогггг');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Блог', 'blog', 0),
(2, 'HeaderMenu', 'headermenu', 0),
(8, 'FooterMenu', 'footermenu', 0),
(18, 'Товары', 'products', 0),
(19, 'Рубрика-1', 'rubrika-1', 0),
(20, 'Рубрика-2', 'rubrika-2', 0),
(21, 'Тест 1', 'test11', 0),
(22, 'Тест 2', 'test2222', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(6, 2, 0),
(12, 2, 0),
(13, 2, 0),
(14, 1, 0),
(16, 1, 0),
(18, 1, 0),
(20, 1, 0),
(22, 1, 0),
(24, 1, 0),
(33, 8, 0),
(36, 8, 0),
(59, 1, 0),
(61, 1, 0),
(63, 1, 0),
(65, 1, 0),
(73, 1, 0),
(77, 2, 0),
(82, 1, 0),
(86, 1, 0),
(92, 18, 0),
(92, 19, 0),
(95, 18, 0),
(95, 20, 0),
(97, 1, 0),
(97, 21, 0),
(100, 1, 0),
(100, 22, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(2, 2, 'nav_menu', '', 0, 4),
(8, 8, 'nav_menu', '', 0, 2),
(18, 18, 'category', '', 0, 2),
(19, 19, 'category', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 18, 1),
(20, 20, 'category', '', 18, 1),
(21, 21, 'category', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.', 1, 1),
(22, 22, 'category', '', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'plugin_editor_notice,theme_editor_notice,text_widget_custom_html'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:9:{s:64:\"4da05dfa9d3aa2d23e22d2388236b7d14e976dc47c9a1df7d4c28f5d22ec0f1a\";a:4:{s:10:\"expiration\";i:1521458084;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1520248484;}s:64:\"e5559fc4126a3a3236e63f3ba4ea8791f8568674c1456103133219fec7c860b4\";a:4:{s:10:\"expiration\";i:1521528474;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1520318874;}s:64:\"fac13c83236396359560b2d739e94a3328aaca107553de79a5d3f5a831c0b12f\";a:4:{s:10:\"expiration\";i:1521565478;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1520355878;}s:64:\"22be6145f227f438c396c079cdc8463e8a45d3746ffcdd4b0ad03bf13631eb14\";a:4:{s:10:\"expiration\";i:1521616498;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1520406898;}s:64:\"9e338cf8e440206bddfc8157c53da5269e9016847615be641e5d0923a282989a\";a:4:{s:10:\"expiration\";i:1521708074;s:2:\"ip\";s:15:\"109.248.186.132\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1520498474;}s:64:\"7f69e6744ab42140d2ceb87be23da52a25dd1a9aa43aa5e58c668a2a38371f4f\";a:4:{s:10:\"expiration\";i:1521794271;s:2:\"ip\";s:15:\"109.248.190.153\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1520584671;}s:64:\"11d748a0cf480c8b6d0080931363898df1ca957a9ac359f71dd1727d6c3b0140\";a:4:{s:10:\"expiration\";i:1522047568;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1520837968;}s:64:\"27156fd460e2625a77f24bd7686f5d6a5ff069045f6051decddea8f1aa2f6366\";a:4:{s:10:\"expiration\";i:1522392422;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1521182822;}s:64:\"68cfc18f3d87de47c26abf6aced7fb483ad954d3c2c10f5da4dbe4742925270a\";a:4:{s:10:\"expiration\";i:1522666676;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1521457076;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '68'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'wp_user-settings', 'libraryContent=browse&editor=html'),
(20, 1, 'wp_user-settings-time', '1521099804'),
(21, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(22, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(23, 1, 'closedpostboxes_post', 'a:1:{i:0;s:10:\"postcustom\";}'),
(24, 1, 'metaboxhidden_post', 'a:7:{i:0;s:11:\"postexcerpt\";i:1;s:13:\"trackbacksdiv\";i:2;s:10:\"postcustom\";i:3;s:16:\"commentstatusdiv\";i:4;s:11:\"commentsdiv\";i:5;s:7:\"slugdiv\";i:6;s:9:\"authordiv\";}'),
(25, 1, 'nav_menu_recently_edited', '2'),
(26, 1, 'closedpostboxes_page', 'a:0:{}'),
(27, 1, 'metaboxhidden_page', 'a:6:{i:0;s:12:\"revisionsdiv\";i:1;s:10:\"postcustom\";i:2;s:16:\"commentstatusdiv\";i:3;s:11:\"commentsdiv\";i:4;s:7:\"slugdiv\";i:5;s:9:\"authordiv\";}'),
(29, 1, 'aioseop_seen_about_page', '2.4.5.1');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$B9k4EgFOZYKNTXPNERd7F.OnyRKMRL.', 'admin', 'berezg86@gmail.com', '', '2018-03-05 11:14:24', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_yoast_seo_links`
--

CREATE TABLE `wp_yoast_seo_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `target_post_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_yoast_seo_meta`
--

CREATE TABLE `wp_yoast_seo_meta` (
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `internal_link_count` int(10) UNSIGNED DEFAULT NULL,
  `incoming_link_count` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Индексы таблицы `wp_duplicator_packages`
--
ALTER TABLE `wp_duplicator_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`);

--
-- Индексы таблицы `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Индексы таблицы `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Индексы таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Индексы таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Индексы таблицы `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Индексы таблицы `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Индексы таблицы `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Индексы таблицы `wp_yoast_seo_links`
--
ALTER TABLE `wp_yoast_seo_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_direction` (`post_id`,`type`);

--
-- Индексы таблицы `wp_yoast_seo_meta`
--
ALTER TABLE `wp_yoast_seo_meta`
  ADD UNIQUE KEY `object_id` (`object_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `wp_duplicator_packages`
--
ALTER TABLE `wp_duplicator_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=768;
--
-- AUTO_INCREMENT для таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1414;
--
-- AUTO_INCREMENT для таблицы `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT для таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `wp_yoast_seo_links`
--
ALTER TABLE `wp_yoast_seo_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
