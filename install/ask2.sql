-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 �?12 �?12 �?15:58
-- 服务器版本: 5.5.47
-- PHP 版本: 5.5.30

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `vipask`
--

-- --------------------------------------------------------

--
-- 表的结构 `ask_ad`
--

CREATE TABLE IF NOT EXISTS `ask_ad` (
  `html` text,
  `page` varchar(50) NOT NULL DEFAULT '',
  `position` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`page`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_answer`
--

CREATE TABLE IF NOT EXISTS `ask_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(50) NOT NULL,
  `author` varchar(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `adopttime` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `comments` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ip` varchar(20) DEFAULT NULL,
  `supports` int(10) NOT NULL DEFAULT '0',
  `reward` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`),
  KEY `authorid` (`authorid`),
  KEY `adopttime` (`adopttime`),
  KEY `time` (`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_answer_append`
--

CREATE TABLE IF NOT EXISTS `ask_answer_append` (
  `appendanswerid` int(10) NOT NULL AUTO_INCREMENT,
  `answerid` int(10) NOT NULL,
  `author` varchar(20) NOT NULL,
  `authorid` int(10) NOT NULL,
  `content` text NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`appendanswerid`),
  KEY `answerid` (`answerid`),
  KEY `authorid` (`authorid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_answer_comment`
--

CREATE TABLE IF NOT EXISTS `ask_answer_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) NOT NULL,
  `authorid` int(10) NOT NULL,
  `author` char(18) NOT NULL,
  `content` varchar(100) NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_answer_support`
--

CREATE TABLE IF NOT EXISTS `ask_answer_support` (
  `sid` char(16) NOT NULL,
  `aid` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`sid`,`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_attach`
--

CREATE TABLE IF NOT EXISTS `ask_attach` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` char(100) NOT NULL DEFAULT '',
  `filetype` char(50) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `location` char(100) NOT NULL DEFAULT '',
  `downloads` mediumint(8) NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`,`isimage`,`downloads`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_badword`
--

CREATE TABLE IF NOT EXISTS `ask_badword` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `findpattern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `find` (`find`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ask_badword`
--

INSERT INTO `ask_badword` (`id`, `admin`, `find`, `replacement`, `findpattern`) VALUES
(4, 'admin', '习近平', '小习', ''),
(3, 'admin', '汉语', '中国话', '');

-- --------------------------------------------------------

--
-- 表的结构 `ask_banned`
--

CREATE TABLE IF NOT EXISTS `ask_banned` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ip1` char(3) NOT NULL,
  `ip2` char(3) NOT NULL,
  `ip3` char(3) NOT NULL,
  `ip4` char(3) NOT NULL,
  `admin` varchar(15) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_category`
--

CREATE TABLE IF NOT EXISTS `ask_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `dir` char(30) NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `grade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `questions` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `ask_category`
--

INSERT INTO `ask_category` (`id`, `name`, `dir`, `pid`, `grade`, `displayorder`, `questions`, `alias`) VALUES
(25, '电脑网络', '', 23, 2, 0, 0, ''),
(26, '编程', '', 23, 2, 1, 0, ''),
(22, '默认', '', 0, 1, 0, 25, ''),
(23, '电脑', '', 0, 1, 0, 2, ''),
(24, '生活', '', 0, 1, 1, 5, '');

-- --------------------------------------------------------

--
-- 表的结构 `ask_category_admin`
--

CREATE TABLE IF NOT EXISTS `ask_category_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_chexingku`
--

CREATE TABLE IF NOT EXISTS `ask_chexingku` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shouzimu` varchar(200) NOT NULL,
  `pinpai` varchar(200) NOT NULL,
  `chexing` varchar(200) NOT NULL,
  `jiaqian` varchar(200) NOT NULL,
  `jiebie` varchar(200) NOT NULL,
  `chexingjiegou` varchar(200) NOT NULL,
  `fadongji` varchar(200) NOT NULL,
  `biansuxiang` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_credit`
--

CREATE TABLE IF NOT EXISTS `ask_credit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `operation` varchar(100) NOT NULL DEFAULT '',
  `credit1` smallint(6) NOT NULL DEFAULT '0',
  `credit2` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_crontab`
--

CREATE TABLE IF NOT EXISTS `ask_crontab` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `name` char(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `nextrun` int(10) unsigned NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `nextrun` (`available`,`nextrun`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_datacall`
--

CREATE TABLE IF NOT EXISTS `ask_datacall` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `expression` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_doing`
--

CREATE TABLE IF NOT EXISTS `ask_doing` (
  `doingid` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorid` int(10) NOT NULL,
  `author` varchar(20) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `questionid` int(10) NOT NULL,
  `content` text,
  `referid` int(10) NOT NULL DEFAULT '0',
  `refer_authorid` int(10) NOT NULL DEFAULT '0',
  `refer_content` tinytext,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`doingid`),
  KEY `authorid` (`authorid`,`author`),
  KEY `sourceid` (`questionid`),
  KEY `createtime` (`createtime`),
  KEY `referid` (`referid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_editor`
--

CREATE TABLE IF NOT EXISTS `ask_editor` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `tag` varchar(100) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `code` text NOT NULL,
  `displayorder` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_expert`
--

CREATE TABLE IF NOT EXISTS `ask_expert` (
  `uid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  PRIMARY KEY (`uid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_famous`
--

CREATE TABLE IF NOT EXISTS `ask_famous` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reason` char(50) DEFAULT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_favorite`
--

CREATE TABLE IF NOT EXISTS `ask_favorite` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `qid` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `qid` (`qid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_gift`
--

CREATE TABLE IF NOT EXISTS `ask_gift` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(250) NOT NULL,
  `credit` int(10) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_giftlog`
--

CREATE TABLE IF NOT EXISTS `ask_giftlog` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `username` char(20) NOT NULL,
  `realname` char(20) NOT NULL,
  `gid` int(10) NOT NULL,
  `giftname` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `postcode` char(10) NOT NULL,
  `phone` char(15) NOT NULL,
  `qq` char(15) NOT NULL,
  `email` varchar(30) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `credit` int(10) NOT NULL,
  `time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_inform`
--

CREATE TABLE IF NOT EXISTS `ask_inform` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `uid` int(10) NOT NULL,
  `qtitle` varchar(200) NOT NULL,
  `qid` int(100) NOT NULL,
  `aid` int(11) NOT NULL,
  `content` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `keywords` varchar(100) NOT NULL,
  `counts` int(11) NOT NULL DEFAULT '1',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_keywords`
--

CREATE TABLE IF NOT EXISTS `ask_keywords` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `find` varchar(200) NOT NULL,
  `replacement` varchar(200) NOT NULL,
  `admin` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_link`
--

CREATE TABLE IF NOT EXISTS `ask_link` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ask_link`
--

INSERT INTO `ask_link` (`id`, `displayorder`, `name`, `url`, `description`, `logo`) VALUES
(1, 0, 'ask2问答系统', 'http://www.ask2.cn', 'ask2问答系统_高仿360问答系统', '');

-- --------------------------------------------------------

--
-- 表的结构 `ask_login_auth`
--

CREATE TABLE IF NOT EXISTS `ask_login_auth` (
  `uid` int(10) NOT NULL,
  `type` enum('qq','sina') NOT NULL,
  `token` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_message`
--

CREATE TABLE IF NOT EXISTS `ask_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(15) NOT NULL DEFAULT '',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(1) NOT NULL DEFAULT '1',
  `subject` varchar(75) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `touid` (`touid`,`time`),
  KEY `fromuid` (`fromuid`,`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_nav`
--

CREATE TABLE IF NOT EXISTS `ask_nav` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `target` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ask_nav`
--

INSERT INTO `ask_nav` (`id`, `name`, `title`, `url`, `target`, `available`, `type`, `displayorder`) VALUES
(1, '首页', '问答首页', 'index/default', 0, 1, 1, 0),
(2, '发现', '问答动态', 'doing/default', 0, 1, 1, 1),
(3, '问题库', '分类大全', 'category/view/all', 0, 1, 1, 2),
(4, '专家', '问答专家', 'expert/default', 0, 1, 1, 3),
(5, '专栏', '知识专题', 'topic/default', 0, 1, 1, 4),
(6, '用户', '活跃用户', 'user/activelist', 0, 1, 1, 5),
(7, '商城', '财富商城', 'gift/default', 0, 1, 1, 6),
(8, '公告', '站内公告', 'note/list', 0, 1, 1, 7);

-- --------------------------------------------------------

--
-- 表的结构 `ask_note`
--

CREATE TABLE IF NOT EXISTS `ask_note` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `authorid` int(10) NOT NULL DEFAULT '0',
  `author` char(18) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` int(10) NOT NULL DEFAULT '0',
  `views` int(10) NOT NULL DEFAULT '0',
  `url` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_note_comment`
--

CREATE TABLE IF NOT EXISTS `ask_note_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noteid` int(10) NOT NULL,
  `authorid` int(10) NOT NULL,
  `author` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_question`
--

CREATE TABLE IF NOT EXISTS `ask_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cid1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cid2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cid3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `author` char(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(50) NOT NULL,
  `description` text NOT NULL,
  `supply` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `answers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attentions` int(10) NOT NULL DEFAULT '0',
  `goods` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ipåœ°å€',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid1` (`cid1`),
  KEY `cid2` (`cid2`),
  KEY `cid3` (`cid3`),
  KEY `time` (`time`),
  KEY `price` (`price`),
  KEY `answers` (`answers`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_question_attention`
--

CREATE TABLE IF NOT EXISTS `ask_question_attention` (
  `qid` int(10) NOT NULL,
  `followerid` int(10) NOT NULL,
  `follower` char(18) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`qid`,`followerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_question_supply`
--

CREATE TABLE IF NOT EXISTS `ask_question_supply` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `qid` int(10) NOT NULL,
  `content` text NOT NULL,
  `time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_question_tag`
--

CREATE TABLE IF NOT EXISTS `ask_question_tag` (
  `qid` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`,`name`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_recommend`
--

CREATE TABLE IF NOT EXISTS `ask_recommend` (
  `qid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_session`
--

CREATE TABLE IF NOT EXISTS `ask_session` (
  `sid` char(16) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `code` char(4) NOT NULL DEFAULT '',
  `islogin` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_setting`
--

CREATE TABLE IF NOT EXISTS `ask_setting` (
  `k` varchar(32) NOT NULL DEFAULT '',
  `v` text NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ask_setting`
--

INSERT INTO `ask_setting` (`k`, `v`) VALUES
('site_name', 'ask2问答系统'),
('meta_description', 'ask2问答系统'),
('meta_keywords', 'php问答系统,百度知道程序'),
('cookie_domain', ''),
('cookie_pre', 'ask_'),
('seo_prefix', '?'),
('seo_suffix', '.html'),
('date_format', 'Y/m/d'),
('time_format', 'H:i'),
('time_offset', '8'),
('time_diff', '0'),
('site_icp', '京ICP备15032243号-1'),
('site_statcode', ''),
('banner_color', '#858c96'),
('banner_img', 'https://gss0.bdstatic.com/7051cy89RcgCncy6lo7D0j9wexYrbOWh7c50/zhidaoribao/2016/0710/top.jpg'),
('allow_register', '1'),
('access_email', ''),
('censor_email', ''),
('censor_username', ''),
('maildefault', 'vip@domain.com'),
('mailsend', '1'),
('mailserver', 'smtp.domain.com'),
('mailport', '25'),
('mailauth', '0'),
('mailfrom', 'vip <vip@domain.com>'),
('mailauth_username', 'vip@domain.com'),
('mailauth_password', '123456'),
('maildelimiter', '0'),
('mailusername', '1'),
('mailsilent', '0'),
('credit1_register', '20'),
('credit2_register', '20'),
('credit1_login', '2'),
('credit2_login', '0'),
('credit1_ask', '5'),
('credit2_ask', '0'),
('credit1_answer', '2'),
('credit2_answer', '1'),
('credit1_message', '-1'),
('credit2_message', '0'),
('credit1_adopt', '5'),
('credit2_adopt', '2'),
('list_indexnosolve', '10'),
('list_indexcommend', '10'),
('list_indexreward', '8'),
('list_indexnote', '10'),
('list_indexhottag', '20'),
('list_indexexpert', '4'),
('list_indexallscore', '8'),
('list_indexweekscore', '8'),
('list_default', '15'),
('rss_ttl', '60'),
('code_register', '0'),
('code_login', '0'),
('code_ask', '1'),
('code_message', '1'),
('passport_type', '0'),
('passport_open', '0'),
('passport_key', ''),
('passport_client', ''),
('passport_server', ''),
('passport_login', 'login.php'),
('passport_logout', 'login.php?action=quit'),
('passport_register', 'register.php'),
('passport_expire', '3600'),
('passport_credit1', '0'),
('passport_credit2', '0'),
('overdue_days', '60'),
('ucenter_open', '0'),
('seo_title', ''),
('seo_keywords', ''),
('seo_description', ''),
('seo_headers', ''),
('notify_mail', '0'),
('notify_message', '1'),
('tpl_dir', 'zui'),
('verify_question', '0'),
('index_life', '10'),
('msgtpl', 'a:4:{i:0;a:2:{s:5:"title";s:36:"您的问题{wtbt}有了新回答！";s:7:"content";s:51:"你在{wzmc}上的提出的问题有了新回答！";}i:1;a:2:{s:5:"title";s:54:"恭喜，您对问题{wtbt}的回答已经被采纳！";s:7:"content";s:42:"你在{wzmc}上的回答内容被采纳！";}i:2;a:2:{s:5:"title";s:78:"抱歉，您的问题{wtbt}由于长时间没有处理，现已过期关闭！";s:7:"content";s:69:"您的问题{wtbt}由于长时间没有处理，现已过期关闭！";}i:3;a:2:{s:5:"title";s:42:"您对{wtbt}的回答有了新的评分！";s:7:"content";s:36:"您的回答{hdnr}有了新评分！";}}'),
('allow_outer', '3'),
('stopcopy_on', '0'),
('stopcopy_allowagent', 'webkit\r\nopera\r\nmsie\r\ncompatible\r\nbaiduspider\r\ngoogle\r\nsoso\r\nsogou\r\ngecko\r\nmozilla'),
('stopcopy_stopagent', ''),
('stopcopy_maxnum', '60'),
('editor_wordcount', 'false'),
('editor_elementpath', 'false'),
('editor_toolbars', '''source'',''Undo'', ''Redo'',''bold'',''simpleupload'', ''scrawl'', ''attachment'' ,''removeformat'',''fullscreen'''),
('gift_range', 'a:3:{i:0;s:2:"50";i:50;s:3:"100";i:100;s:3:"300";}'),
('usernamepre', 'ask_'),
('usercount', '0'),
('sum_onlineuser_time', '30'),
('sum_category_time', '60'),
('del_tmp_crontab', '1440'),
('allow_credit3', '0'),
('apend_question_num', '5'),
('time_friendly', '1'),
('register_clause', ''),
('tpl_wapdir', 'amazeuiwap'),
('wap_domain', ''),
('auth_key', '8BdS0M5Y5M1L6p8LdleedOcF0rb97Y6NfH9RatcOeV7Dd306c9e71Maq184j2Tew'),
('admin_email', 'webmaster@domain.com'),
('seo_index_title', 'php问答系统-ask2问答官网'),
('seo_index_keywords', 'php问答系统'),
('seo_index_description', 'php问答系统'),
('seo_question_title', ''),
('seo_question_keywords', ''),
('seo_question_description', ''),
('seo_category_title', ''),
('seo_category_keywords', ''),
('seo_category_description', ''),
('question_share', ''),
('qqlogin_avatar', '0'),
('site_alias', 'ask2问答系统'),
('maxindex_keywords', '4'),
('pagemaxindex_keywords', '4'),
('openweixin', ''),
('baidu_api', ' http://data.zz.baidu.com/urls?site=www.ask2.cn&token=YuHZrBhWBcGeXkIL'),
('wxtoken', '3546060ff4d14gab024g4200'),
('unword', '主人，我不知道你要说什么。'),
('duoshuoname', ''),
('zl_domain', ''),
('allow_expert', '0'),
('qqlogin_open', '0'),
('qqlogin_appid', '43243244'),
('qqlogin_key', 'fdsf'),
('site_logo', 'http://img.ask2.cn/data/attach/logo/logo.png'),
('site_qrcode', ''),
('register_on', '0'),
('hot_on', '0'),
('title_description', '知名专家为您解答'),
('search_shownum', '5'),
('search_placeholder', '请输入关键词检索'),
('ucenter_url', '');

-- --------------------------------------------------------

--
-- 表的结构 `ask_site_log`
--

CREATE TABLE IF NOT EXISTS `ask_site_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `guize` varchar(200) NOT NULL,
  `miaoshu` varchar(200) DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- 转存表中的数据 `ask_site_log`
--

INSERT INTO `ask_site_log` (`id`, `guize`, `miaoshu`, `uid`, `username`, `time`) VALUES
(1, '', '', 1, 'admin', 1481191128),
(2, 'admin_main', '', 1, 'admin', 1481191131),
(3, 'admin_main/login', '', 1, 'admin', 1481191139),
(4, 'admin_setting/base', '', 1, 'admin', 1481191143),
(5, 'admin_setting/caiji', '', 1, 'admin', 1481191155),
(6, 'admin_setting/ajaxpostpage', '', 1, 'admin', 1481191166),
(7, 'admin_user', '', 1, 'admin', 1481191196),
(8, 'admin_question', '', 1, 'admin', 1481191202),
(9, 'question/view/1', '', 1, 'admin', 1481191207),
(10, 'admin_question/delete', '', 1, 'admin', 1481191220),
(11, 'admin_question/searchanswer', '', 1, 'admin', 1481191224),
(12, 'admin_user/add', '', 1, 'admin', 1481191227),
(13, 'admin_user/add', '', 1, 'admin', 1481191236),
(14, 'admin_link', '', 1, 'admin', 1481191251),
(15, 'api_user/loginapi', '', 1, 'admin', 1481262552),
(16, '', '', 1, 'admin', 1481262555),
(17, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481262564),
(18, 'user/space/2', '', 1, 'admin', 1481262564),
(19, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481262565),
(20, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481262571),
(21, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481262572),
(22, 'message/send/2', '', 1, 'admin', 1481262574),
(23, 'message/send/2', '', 1, 'admin', 1481262585),
(24, 'message/send/2', '', 1, 'admin', 1481262633),
(25, 'message/send/2', '', 1, 'admin', 1481262743),
(26, 'message/send/2', '', 1, 'admin', 1481262749),
(27, 'message/send/2', '', 1, 'admin', 1481264291),
(28, 'admin_main', '', 1, 'admin', 1481264379),
(29, 'admin_main/login', '', 1, 'admin', 1481264381),
(30, 'admin_main/login', '', 1, 'admin', 1481264389),
(31, 'admin_editor/setting', '', 1, 'admin', 1481264395),
(32, 'admin_editor/setting', '', 1, 'admin', 1481264434),
(33, 'admin_editor/setting', '', 1, 'admin', 1481264437),
(34, 'admin_setting/cache', '', 1, 'admin', 1481264441),
(35, '', '', 1, 'admin', 1481264446),
(36, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481264449),
(37, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481264450),
(38, 'message/send/2', '', 1, 'admin', 1481264452),
(39, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481264452),
(40, '', '', 1, 'admin', 1481265979),
(41, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481265997),
(42, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481265998),
(43, 'message/send/2', '', 1, 'admin', 1481266000),
(44, 'user/ajaxuserinfo/2', '', 1, 'admin', 1481266000),
(45, 'update', '', 1, 'admin', 1481266016),
(46, 'admin_editor/setting', '', 1, 'admin', 1481267804),
(47, 'admin_editor/setting', '', 1, 'admin', 1481267899),
(48, 'admin_main/stat', '', 1, 'admin', 1481268064),
(49, 'admin_main/stat', '', 1, 'admin', 1481268194),
(50, 'admin_main/stat', '', 1, 'admin', 1481268265),
(51, 'admin_main/stat', '', 1, 'admin', 1481268292),
(52, 'admin_main/stat', '', 1, 'admin', 1481268304),
(53, 'admin_main/stat', '', 1, 'admin', 1481268417),
(54, 'admin_main/stat', '', 1, 'admin', 1481268896),
(55, 'admin_topic', '', 1, 'admin', 1481269729),
(56, 'admin_setting/caiji', '', 1, 'admin', 1481269867),
(57, 'admin_setting/ajaxpostpage', '', 1, 'admin', 1481269873),
(58, 'admin_user', '', 1, 'admin', 1481269884),
(59, 'admin_user', '', 1, 'admin', 1481270085),
(60, 'admin_question', '', 1, 'admin', 1481270168),
(61, 'question/view/4', '', 1, 'admin', 1481270171),
(62, 'question/view/5', '', 1, 'admin', 1481270179),
(63, 'admin_user', '', 1, 'admin', 1481270407),
(64, '', '', 1, 'admin', 1481272904),
(65, 'admin_main', '', 1, 'admin', 1481272907),
(66, 'admin_main/login', '', 1, 'admin', 1481272915),
(67, 'admin_setting/base', '', 1, 'admin', 1481272926),
(68, 'admin_setting/base', '', 1, 'admin', 1481272931),
(69, '', '', 1, 'admin', 1481272941),
(70, '', '', 1, 'admin', 1481272946),
(71, 'question/add', '', 1, 'admin', 1481272950),
(72, 'question/ajaxgetcat', '', 1, 'admin', 1481272951),
(73, 'question/ajaxgetcat', '', 1, 'admin', 1481272967),
(74, 'question/add', '', 1, 'admin', 1481272997),
(75, 'question/ajaxgetcat', '', 1, 'admin', 1481272998),
(76, 'question/add', '', 1, 'admin', 1481273070),
(77, 'question/ajaxgetcat', '', 1, 'admin', 1481273072),
(78, 'question/ajaxgetcat', '', 1, 'admin', 1481273087),
(79, 'question/ajaxadd', '', 1, 'admin', 1481273090),
(80, 'question/ajaxadd', '', 1, 'admin', 1481273091),
(81, 'question/add', '', 1, 'admin', 1481273143),
(82, 'question/ajaxgetcat', '', 1, 'admin', 1481273144),
(83, 'question/ajaxadd', '', 1, 'admin', 1481273150),
(84, 'question/ajaxgetcat', '', 1, 'admin', 1481273159),
(85, 'question/ajaxadd', '', 1, 'admin', 1481273160),
(86, 'question/view/6', '', 1, 'admin', 1481273163),
(87, 'question/view/6', '', 1, 'admin', 1481273193),
(88, 'user/logout', '', 1, 'admin', 1481273213),
(89, '', '', 1, 'admin', 1481273240),
(90, 'user/logout', '', 1, 'admin', 1481273246),
(91, 'user/default', '', 8, 'vvvvv', 1481274498),
(92, 'user/logout', '', 8, 'vvvvv', 1481274768),
(93, '', '', 1, 'admin', 1481274815),
(94, '', '', 1, 'admin', 1481274834),
(95, '', '', 1, 'admin', 1481274841),
(96, 'admin_main', '', 1, 'admin', 1481274860),
(97, 'admin_main/login', '', 1, 'admin', 1481274866),
(98, 'admin_setting/base', '', 1, 'admin', 1481274870),
(99, '', '', 1, 'admin', 1481274877),
(100, '', '', 1, 'admin', 1481275407),
(101, '', '', 1, 'admin', 1481275411),
(102, 'question/view/4', '', 1, 'admin', 1481275413),
(103, 'question/answer', '', 1, 'admin', 1481275418),
(104, 'question/answer', '', 1, 'admin', 1481275441),
(105, 'question/view/4', '', 1, 'admin', 1481275442),
(106, 'question/view/4', '', 1, 'admin', 1481275445),
(107, 'question/view/4', '', 1, 'admin', 1481275459),
(108, 'question/view/4', '', 1, 'admin', 1481275537),
(109, 'question/ajaxanswer', '', 1, 'admin', 1481275541),
(110, 'question/ajaxanswer', '', 1, 'admin', 1481275547),
(111, 'question/view/4', '', 1, 'admin', 1481275550),
(112, 'question/view/4', '', 1, 'admin', 1481275791),
(113, 'question/add', '', 1, 'admin', 1481275796),
(114, 'admin_main', '', 1, 'admin', 1481275868),
(115, 'admin_editor/setting', '', 1, 'admin', 1481275872),
(116, 'admin_editor/setting', '', 1, 'admin', 1481275890),
(117, '', '', 1, 'admin', 1481275895),
(118, 'question/add', '', 1, 'admin', 1481275898),
(119, 'question/add', '', 1, 'admin', 1481276001),
(120, 'question/add', '', 1, 'admin', 1481276721),
(121, 'question/add', '', 1, 'admin', 1481276837),
(122, 'question/add', '', 1, 'admin', 1481276877),
(123, 'question/add', '', 1, 'admin', 1481276900),
(124, '', '', 1, 'admin', 1481528601),
(125, 'question/add', '', 1, 'admin', 1481528606);

-- --------------------------------------------------------

--
-- 表的结构 `ask_tid_qid`
--

CREATE TABLE IF NOT EXISTS `ask_tid_qid` (
  `tid` int(10) NOT NULL DEFAULT '0',
  `qid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_topic`
--

CREATE TABLE IF NOT EXISTS `ask_topic` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `describtion` text,
  `image` varchar(100) DEFAULT NULL,
  `displayorder` int(10) NOT NULL DEFAULT '0',
  `author` varchar(200) NOT NULL,
  `authorid` int(10) NOT NULL,
  `views` int(10) NOT NULL,
  `articleclassid` int(10) NOT NULL,
  `isphone` int(10) NOT NULL,
  `viewtime` int(10) unsigned NOT NULL,
  `ispc` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_topicclass`
--

CREATE TABLE IF NOT EXISTS `ask_topicclass` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `dir` varchar(200) NOT NULL,
  `pid` int(10) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `articles` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_topic_tag`
--

CREATE TABLE IF NOT EXISTS `ask_topic_tag` (
  `aid` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`aid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_user`
--

CREATE TABLE IF NOT EXISTS `ask_user` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(18) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '7',
  `credits` int(10) NOT NULL DEFAULT '0',
  `credit1` int(10) NOT NULL DEFAULT '0',
  `credit2` int(10) NOT NULL DEFAULT '0',
  `credit3` int(10) NOT NULL DEFAULT '0',
  `regip` char(15) DEFAULT NULL,
  `regtime` int(10) NOT NULL DEFAULT '0',
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bday` date DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `msn` varchar(40) DEFAULT NULL,
  `authstr` varchar(25) DEFAULT NULL,
  `signature` mediumtext,
  `introduction` varchar(200) DEFAULT NULL,
  `questions` int(10) unsigned NOT NULL DEFAULT '0',
  `answers` int(10) unsigned NOT NULL DEFAULT '0',
  `adopts` int(10) unsigned NOT NULL DEFAULT '0',
  `supports` int(10) NOT NULL DEFAULT '0',
  `followers` int(10) NOT NULL DEFAULT '0',
  `attentions` int(10) NOT NULL DEFAULT '0',
  `isnotify` tinyint(1) unsigned NOT NULL DEFAULT '7',
  `elect` int(10) NOT NULL DEFAULT '0',
  `expert` tinyint(2) NOT NULL DEFAULT '0',
  `chuli` int(10) NOT NULL,
  `bankcard` varchar(200) DEFAULT NULL,
  `activecode` varchar(200) DEFAULT NULL,
  `active` int(10) DEFAULT '0',
  `mypay` int(10) DEFAULT '0',
  `fromsite` int(10) DEFAULT '0',
  `isblack` int(10) DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_userbank`
--

CREATE TABLE IF NOT EXISTS `ask_userbank` (
  `id` int(10) NOT NULL,
  `fromuid` int(10) NOT NULL,
  `touid` int(10) NOT NULL,
  `operation` varchar(200) NOT NULL,
  `money` int(10) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_usergroup`
--

CREATE TABLE IF NOT EXISTS `ask_usergroup` (
  `groupid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(4) NOT NULL DEFAULT '1' COMMENT '用户级别',
  `grouptitle` char(30) NOT NULL DEFAULT '',
  `grouptype` tinyint(1) NOT NULL DEFAULT '2',
  `creditslower` int(10) NOT NULL,
  `creditshigher` int(10) NOT NULL DEFAULT '0',
  `questionlimits` int(10) NOT NULL DEFAULT '0',
  `answerlimits` int(10) NOT NULL DEFAULT '0',
  `credit3limits` int(10) NOT NULL DEFAULT '0',
  `regulars` text NOT NULL,
  `doarticle` int(10) DEFAULT '0',
  `articlelimits` int(10) DEFAULT '1',
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `ask_usergroup`
--

INSERT INTO `ask_usergroup` (`groupid`, `level`, `grouptitle`, `grouptype`, `creditslower`, `creditshigher`, `questionlimits`, `answerlimits`, `credit3limits`, `regulars`, `doarticle`, `articlelimits`) VALUES
(1, 0, '超级管理员', 1, 0, 1, 0, 0, 0, 'user/qqlogin,user/register,index/default,category/view,category/list,question/view,category/recommend,note/list,note/view,rss/category,rss/list,rss/question,user/space,user/scorelist,question/search,question/add,gift/default,gift/search,gift/add\r\n', 0, 1),
(2, 0, '管理员', 1, 0, 1, 0, 0, 0, 'user/qqlogin,user/register,index/default,category/view,category/list,question/view,category/recommend,note/list,note/view,rss/category,rss/list,rss/question,user/space,user/scorelist,question/search,question/add,gift/default,gift/search,gift/add\r\n,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(3, 0, '分类员', 1, 0, 1, 0, 0, 0, 'user/qqlogin,user/register,index/default,category/view,category/list,question/view,category/recommend,note/list,note/view,rss/category,rss/list,rss/question,user/space,user/scorelist,question/search,question/add,gift/default,gift/search,gift/add\r\n,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(6, 0, '游客', 3, 0, 1, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,user/space_ask,user/space_answer,user/space', 0, 1),
(7, 1, '书童', 2, 0, 80, 3, 3, 5, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(8, 2, '书生', 2, 80, 400, 5, 5, 8, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(9, 3, '秀才', 2, 400, 800, 10, 10, 10, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(10, 4, '举人', 2, 800, 2000, 15, 15, 12, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(11, 5, '解元', 2, 2000, 4000, 10, 10, 10, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(12, 6, '贡士', 2, 4000, 7000, 15, 15, 20, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(13, 7, '会元', 2, 7000, 10000, 15, 15, 20, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(14, 8, '同进士出身', 2, 10000, 14000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(15, 9, '大学士', 2, 14000, 18000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(16, 10, '探花', 2, 18000, 22000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(17, 11, '榜眼', 2, 22000, 32000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(18, 12, '状元', 2, 32000, 45000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(19, 13, '编修', 2, 45000, 60000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(20, 14, '府丞', 2, 60000, 100000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(21, 15, '翰林学士', 2, 100000, 150000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(22, 16, '御史中丞', 2, 150000, 250000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(23, 17, '詹士', 2, 250000, 400000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(24, 18, '侍郎', 2, 400000, 700000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(25, 19, '大学士', 2, 700000, 1000000, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1),
(26, 20, '文曲星', 2, 1000000, 999999999, 0, 0, 0, 'user/register,user/editimg,index/default,category/view,category/list,question/view,question/follow,topic/default,note/list,note/view,rss/category,rss/list,rss/question,user/scorelist,user/activelist,expert/default,user/qqlogin,gift/default,gift/search,gift/add,question/search,question/add,question/answer,doing/default,user/space_ask,user/space_answer,user/space,answer/append,answer/addcomment,question/edittag,favorite/add,inform/add,question/answercomment,note/addcomment,question/attentto,user/attentto,user/register,user/recommend,user/default,user/score,user/recharge,ebank/aliapyback,ebank/aliapytransfer,user/ask,user/answer,user/follower,user/attention,favorite/default,favorite/delete,question/addfavorite,user/profile,user/uppass,user/editimg,user/saveimg,user/mycategory,user/unchainauth,user/level,attach/uploadimage,question/adopt,question/close,question/supply,question/addscore,question/editanswer,question/search,message/send,message/new,message/personal,message/system,message/outbox,message/view,message/remove,message/removedialog,user/sendcheckmail,user/editemail,user/sendcheckmail,user/editemail', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ask_userlog`
--

CREATE TABLE IF NOT EXISTS `ask_userlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sid` varchar(10) NOT NULL DEFAULT '',
  `type` enum('login','ask','answer') NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `time` (`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ask_user_attention`
--

CREATE TABLE IF NOT EXISTS `ask_user_attention` (
  `uid` int(10) NOT NULL,
  `followerid` int(10) NOT NULL,
  `follower` char(18) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`uid`,`followerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_user_category`
--

CREATE TABLE IF NOT EXISTS `ask_user_category` (
  `uid` int(10) NOT NULL,
  `cid` int(4) NOT NULL,
  PRIMARY KEY (`uid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_user_readlog`
--

CREATE TABLE IF NOT EXISTS `ask_user_readlog` (
  `uid` int(10) NOT NULL,
  `qid` int(10) NOT NULL,
  PRIMARY KEY (`uid`,`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ask_visit`
--

CREATE TABLE IF NOT EXISTS `ask_visit` (
  `ip` varchar(15) NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  KEY `ip` (`ip`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
