# SQL Manager 2005 for MySQL 3.7.5.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : thinksns


SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `thinksns`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `thinksns`;

#
# Structure for the `ts_ad` table : 
#

CREATE TABLE `ts_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `place` varchar(25) DEFAULT NULL,
  `use` tinyint(1) DEFAULT NULL,
  `ad` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_app` table : 
#

CREATE TABLE `ts_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enname` varchar(150) DEFAULT NULL,
  `icon` text,
  `url` text,
  `url_exp` text,
  `url_admin` text,
  `uid_url` varchar(255) DEFAULT NULL,
  `add_url` varchar(255) DEFAULT NULL,
  `add_name` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT 'thinksns',
  `description` text,
  `order2` int(11) NOT NULL DEFAULT '1',
  `place` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `canvas_url` varchar(255) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_app_user` table : 
#

CREATE TABLE `ts_app_user` (
  `appid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '1',
  `publish_to_profile` tinyint(1) NOT NULL DEFAULT '0',
  `activited` tinyint(1) NOT NULL DEFAULT '0',
  `login_times` int(11) DEFAULT NULL,
  `last_login_time` int(11) DEFAULT NULL,
  `invitor` int(11) DEFAULT NULL,
  PRIMARY KEY (`appid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_attach` table : 
#

CREATE TABLE `ts_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attach_type` varchar(50) NOT NULL DEFAULT 'attach',
  `userId` int(11) unsigned DEFAULT NULL,
  `uploadTime` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0',
  `isDel` tinyint(1) DEFAULT '0',
  `savepath` varchar(255) DEFAULT NULL,
  `savename` varchar(255) DEFAULT NULL,
  `savedomain` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_blog` table : 
#

CREATE TABLE `ts_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` mediumint(5) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `content` longtext,
  `readCount` int(11) NOT NULL DEFAULT '0',
  `commentCount` int(11) NOT NULL DEFAULT '0',
  `recommendCount` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  `mTime` int(11) DEFAULT NULL,
  `rTime` int(11) NOT NULL DEFAULT '0',
  `isHot` varchar(1) NOT NULL DEFAULT '0',
  `type` int(1) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `private_data` varchar(255) DEFAULT NULL,
  `hot` int(11) NOT NULL DEFAULT '0',
  `canableComment` tinyint(1) NOT NULL DEFAULT '1',
  `attach` text,
  PRIMARY KEY (`id`),
  KEY `hot` (`hot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_blog_category` table : 
#

CREATE TABLE `ts_blog_category` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_blog_item` table : 
#

CREATE TABLE `ts_blog_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `snapday` int(11) DEFAULT NULL,
  `pubdate` int(11) DEFAULT NULL,
  `boot` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `summary` text,
  PRIMARY KEY (`id`),
  KEY `source_id` (`sourceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_blog_mention` table : 
#

CREATE TABLE `ts_blog_mention` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogid` int(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogid` (`blogid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_blog_outline` table : 
#

CREATE TABLE `ts_blog_outline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` mediumint(5) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `content` longtext,
  `readCount` int(11) NOT NULL DEFAULT '0',
  `commentCount` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  `mTime` int(11) DEFAULT NULL,
  `isHot` varchar(1) NOT NULL DEFAULT '0',
  `type` int(1) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `hot` int(11) NOT NULL DEFAULT '0',
  `friendId` text,
  `canableComment` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `hot` (`hot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_blog_source` table : 
#

CREATE TABLE `ts_blog_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(10) DEFAULT NULL,
  `username` char(30) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  `lastSnap` int(11) DEFAULT NULL,
  `isNew` tinyint(1) DEFAULT NULL,
  `changes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_blog_subscribe` table : 
#

CREATE TABLE `ts_blog_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `newNum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sourceId` (`sourceId`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_chat` table : 
#

CREATE TABLE `ts_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromUserId` int(11) DEFAULT NULL,
  `toUserId` int(11) DEFAULT NULL,
  `msg` text,
  `disTime` varchar(25) DEFAULT NULL,
  `flagNew` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_comment` table : 
#

CREATE TABLE `ts_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(15) DEFAULT NULL,
  `appid` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `comment` text,
  `cTime` int(12) DEFAULT NULL,
  `toId` int(11) NOT NULL DEFAULT '0',
  `status` int(1) DEFAULT '0',
  `quietly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_credit_setting` table : 
#

CREATE TABLE `ts_credit_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) DEFAULT NULL,
  `actioncn` varchar(255) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'user',
  `info` text,
  `score` int(11) NOT NULL DEFAULT '0',
  `experience` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_credit_type` table : 
#

CREATE TABLE `ts_credit_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_edu_search` table : 
#

CREATE TABLE `ts_edu_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `extra1` varchar(255) DEFAULT NULL,
  `extra2` varchar(255) DEFAULT NULL,
  `privacy` int(1) DEFAULT NULL,
  `home` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_event` table : 
#

CREATE TABLE `ts_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `title` text,
  `explain` text,
  `contact` varchar(32) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `sTime` int(11) DEFAULT NULL,
  `eTime` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  `deadline` int(11) DEFAULT NULL,
  `joinCount` int(11) NOT NULL DEFAULT '0',
  `attentionCount` int(11) NOT NULL DEFAULT '0',
  `limitCount` int(11) NOT NULL DEFAULT '0',
  `commentCount` int(11) NOT NULL DEFAULT '0',
  `coverId` int(11) NOT NULL DEFAULT '0',
  `optsId` int(11) NOT NULL DEFAULT '0',
  `feedId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_event_opts` table : 
#

CREATE TABLE `ts_event_opts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` char(10) NOT NULL DEFAULT '0',
  `costExplain` varchar(255) DEFAULT '0',
  `province` char(10) DEFAULT NULL,
  `city` char(10) DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `opts` varchar(50) NOT NULL DEFAULT '0',
  `isHot` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_event_photo` table : 
#

CREATE TABLE `ts_event_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` char(10) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `savename` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  `commentCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_event_type` table : 
#

CREATE TABLE `ts_event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_event_user` table : 
#

CREATE TABLE `ts_event_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `contact` text,
  `action` char(10) NOT NULL DEFAULT 'attention',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cTime` int(11) DEFAULT NULL,
  `feedId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_feed` table : 
#

CREATE TABLE `ts_feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title_data` text,
  `body_data` text,
  `cTime` int(11) DEFAULT NULL,
  `appid` varchar(25) DEFAULT '',
  `feedtype` tinyint(3) NOT NULL DEFAULT '0',
  `fid` int(11) NOT NULL DEFAULT '0',
  `cache` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_feed_del` table : 
#

CREATE TABLE `ts_feed_del` (
  `uid` int(11) DEFAULT NULL,
  `feedId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_feed_template` table : 
#

CREATE TABLE `ts_feed_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `title` text,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_fg` table : 
#

CREATE TABLE `ts_fg` (
  `uid` int(11) DEFAULT NULL,
  `fuid` int(11) DEFAULT NULL,
  `gid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_field_name` table : 
#

CREATE TABLE `ts_field_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_friend` table : 
#

CREATE TABLE `ts_friend` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` char(15) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `note` char(50) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fuid`),
  KEY `fuid` (`fuid`),
  KEY `status` (`uid`,`status`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_friend_black` table : 
#

CREATE TABLE `ts_friend_black` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `fuid` int(11) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_friend_group` table : 
#

CREATE TABLE `ts_friend_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_friend_hide` table : 
#

CREATE TABLE `ts_friend_hide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `fuid` int(11) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_friend_ping` table : 
#

CREATE TABLE `ts_friend_ping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `fuid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_friend_tip` table : 
#

CREATE TABLE `ts_friend_tip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `content` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_gift` table : 
#

CREATE TABLE `ts_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_gift_category` table : 
#

CREATE TABLE `ts_gift_category` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group` table : 
#

CREATE TABLE `ts_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `intro` text,
  `logo` varchar(255) DEFAULT NULL,
  `announce` text,
  `cid0` smallint(6) unsigned DEFAULT NULL,
  `cid1` smallint(6) unsigned DEFAULT NULL,
  `membercount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threadcount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` enum('open','limit','close') DEFAULT NULL,
  `need_invite` tinyint(1) NOT NULL DEFAULT '0',
  `need_verify` tinyint(4) DEFAULT NULL,
  `actor_level` tinyint(4) DEFAULT NULL,
  `brower_level` tinyint(4) DEFAULT NULL,
  `openUploadFile` tinyint(1) NOT NULL DEFAULT '0',
  `whoUploadFile` tinyint(1) NOT NULL DEFAULT '0',
  `openAlbum` tinyint(1) NOT NULL DEFAULT '0',
  `whoCreateAlbum` tinyint(1) NOT NULL DEFAULT '0',
  `whoUploadPic` tinyint(1) NOT NULL DEFAULT '0',
  `anno` tinyint(1) NOT NULL DEFAULT '0',
  `ipshow` tinyint(1) NOT NULL DEFAULT '0',
  `invitepriv` tinyint(1) NOT NULL DEFAULT '0',
  `createalbumpriv` tinyint(1) NOT NULL DEFAULT '0',
  `uploadpicpriv` tinyint(1) NOT NULL DEFAULT '0',
  `ctime` int(11) NOT NULL DEFAULT '0',
  `mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `isrecom` tinyint(1) NOT NULL DEFAULT '0',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_album` table : 
#

CREATE TABLE `ts_group_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `info` text,
  `cTime` int(11) unsigned DEFAULT NULL,
  `mTime` int(11) unsigned DEFAULT NULL,
  `coverImageId` int(11) DEFAULT NULL,
  `coverImagePath` varchar(255) DEFAULT NULL,
  `photoCount` int(11) DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `share` tinyint(1) NOT NULL DEFAULT '0',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`userId`),
  KEY `cTime` (`cTime`),
  KEY `mTime` (`mTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_attachement` table : 
#

CREATE TABLE `ts_group_attachement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) unsigned DEFAULT NULL,
  `uid` int(11) unsigned DEFAULT NULL,
  `attachId` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `note` text,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `filetype` varchar(10) DEFAULT NULL,
  `fileurl` varchar(255) DEFAULT NULL,
  `totaldowns` mediumint(6) NOT NULL DEFAULT '0',
  `ctime` int(11) DEFAULT NULL,
  `mtime` varchar(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  KEY `gid_2` (`gid`,`attachId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_category` table : 
#

CREATE TABLE `ts_group_category` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `pid` tinyint(3) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_log` table : 
#

CREATE TABLE `ts_group_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) unsigned DEFAULT NULL,
  `uid` int(11) unsigned DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` text,
  `ctime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_member` table : 
#

CREATE TABLE `ts_group_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) unsigned DEFAULT NULL,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` char(10) DEFAULT NULL,
  `reason` text,
  `status` tinyint(1) DEFAULT '1',
  `level` tinyint(2) unsigned DEFAULT '1',
  `ctime` int(11) NOT NULL DEFAULT '0',
  `mtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gid` (`gid`,`uid`),
  KEY `mid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_photo` table : 
#

CREATE TABLE `ts_group_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `attachId` int(11) DEFAULT NULL,
  `albumId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `cTime` int(11) unsigned DEFAULT NULL,
  `mTime` int(11) unsigned DEFAULT NULL,
  `info` text,
  `commentCount` int(11) unsigned DEFAULT '0',
  `readCount` int(11) unsigned DEFAULT '0',
  `savepath` varchar(255) DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `tags` text,
  `order` int(11) DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`,`albumId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_post` table : 
#

CREATE TABLE `ts_group_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) unsigned DEFAULT NULL,
  `uid` int(11) unsigned DEFAULT NULL,
  `tid` int(11) unsigned DEFAULT NULL,
  `content` text,
  `ip` char(16) DEFAULT NULL,
  `istopic` tinyint(1) NOT NULL DEFAULT '0',
  `ctime` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `quote` int(11) unsigned NOT NULL DEFAULT '0',
  `is_del` varchar(1) NOT NULL DEFAULT '0',
  `attach` text,
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_setting` table : 
#

CREATE TABLE `ts_group_setting` (
  `name` varchar(36) DEFAULT NULL,
  `value` varchar(36) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_topic` table : 
#

CREATE TABLE `ts_group_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) unsigned DEFAULT NULL,
  `uid` int(11) unsigned DEFAULT NULL,
  `name` varchar(36) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `viewcount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `replycount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dist` tinyint(1) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL DEFAULT '0',
  `lock` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `replytime` int(11) NOT NULL DEFAULT '0',
  `mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isrecom` tinyint(1) NOT NULL DEFAULT '0',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `attach` text,
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  KEY `gid_2` (`gid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_group_topic_collect` table : 
#

CREATE TABLE `ts_group_topic_collect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `mid` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tid` (`tid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_info_category` table : 
#

CREATE TABLE `ts_info_category` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `addcontent_tpl` varchar(255) DEFAULT NULL,
  `content_tpl` varchar(255) DEFAULT NULL,
  `category_tpl` varchar(255) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_info_content` table : 
#

CREATE TABLE `ts_info_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `publish_time` int(11) DEFAULT NULL,
  `category` mediumint(5) NOT NULL DEFAULT '0',
  `cate_tree` varchar(100) DEFAULT NULL,
  `content` text,
  `author` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `param_1` varchar(250) DEFAULT NULL,
  `param_2` varchar(250) DEFAULT NULL,
  `param_3` varchar(250) DEFAULT NULL,
  `param_4` varchar(250) DEFAULT NULL,
  `param_5` varchar(250) DEFAULT NULL,
  `newicon` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21215 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_invite` table : 
#

CREATE TABLE `ts_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) DEFAULT NULL,
  `type` varchar(150) NOT NULL,
  `typeid` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_links` table : 
#

CREATE TABLE `ts_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_login_record` table : 
#

CREATE TABLE `ts_login_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `login_ip` varchar(15) DEFAULT NULL,
  `login_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_mini` table : 
#

CREATE TABLE `ts_mini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` char(10) DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `content` text,
  `tagId` int(11) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `replay_numbel` int(11) NOT NULL DEFAULT '0',
  `feedId` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`uid`),
  KEY `replay_numbel` (`replay_numbel`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_msg` table : 
#

CREATE TABLE `ts_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromUserId` int(11) DEFAULT NULL,
  `toUserId` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `cTime` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `replyMsgId` int(11) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_network` table : 
#

CREATE TABLE `ts_network` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3235 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_notify` table : 
#

CREATE TABLE `ts_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `authorid` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `title` text,
  `body` text,
  `url` text,
  `cTime` int(11) DEFAULT NULL,
  `cate` varchar(255) DEFAULT NULL,
  `appid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_notify_template` table : 
#

CREATE TABLE `ts_notify_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `type_cn` varchar(255) DEFAULT NULL,
  `deal` varchar(255) DEFAULT NULL,
  `title` text,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_option` table : 
#

CREATE TABLE `ts_option` (
  `name` varchar(64) DEFAULT NULL,
  `value` text,
  `appname` varchar(30) NOT NULL DEFAULT 'thinksns'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_photo` table : 
#

CREATE TABLE `ts_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachId` int(11) DEFAULT NULL,
  `albumId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `cTime` int(11) unsigned DEFAULT NULL,
  `mTime` int(11) unsigned DEFAULT NULL,
  `info` text,
  `commentCount` int(11) unsigned DEFAULT '0',
  `readCount` int(11) unsigned DEFAULT '0',
  `savepath` varchar(255) DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `privacy` int(1) NOT NULL DEFAULT '1',
  `tags` text,
  `order` int(11) NOT NULL DEFAULT '0',
  `isDel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_photo_album` table : 
#

CREATE TABLE `ts_photo_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `info` text,
  `cTime` int(11) unsigned DEFAULT NULL,
  `mTime` int(11) unsigned DEFAULT NULL,
  `coverImageId` int(11) DEFAULT NULL,
  `coverImagePath` varchar(255) DEFAULT NULL,
  `photoCount` int(11) DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `share` tinyint(1) NOT NULL DEFAULT '0',
  `privacy` tinyint(1) DEFAULT NULL,
  `privacy_data` text,
  `isDel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`userId`),
  KEY `cTime` (`cTime`),
  KEY `mTime` (`mTime`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_photo_index` table : 
#

CREATE TABLE `ts_photo_index` (
  `albumId` int(11) NOT NULL DEFAULT '0',
  `photoId` int(11) NOT NULL DEFAULT '0',
  `userId` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `privacy` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`albumId`,`photoId`),
  UNIQUE KEY `album_photo` (`albumId`,`photoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_photo_mark` table : 
#

CREATE TABLE `ts_photo_mark` (
  `photoId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `markedUserId` int(11) DEFAULT NULL,
  `x` varchar(100) DEFAULT NULL,
  `y` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_privacy` table : 
#

CREATE TABLE `ts_privacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `privacy` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_privacy_index` table : 
#

CREATE TABLE `ts_privacy_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL,
  `visitor` int(11) DEFAULT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `black` tinyint(1) NOT NULL DEFAULT '0',
  `white` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'space',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_report` table : 
#

CREATE TABLE `ts_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `con` varchar(255) DEFAULT NULL,
  `appid` int(11) DEFAULT NULL,
  `recordId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_saveemail` table : 
#

CREATE TABLE `ts_saveemail` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `toemail` varchar(255) DEFAULT NULL,
  `title` text,
  `content` text,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(36) DEFAULT NULL,
  `senderemail` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_share` table : 
#

CREATE TABLE `ts_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) DEFAULT NULL,
  `toUid` int(11) DEFAULT NULL,
  `toUserName` varchar(50) DEFAULT NULL,
  `fromUid` int(11) DEFAULT NULL,
  `fromUserName` varchar(50) DEFAULT NULL,
  `aimId` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` text,
  `info` text,
  `data` text,
  `cTime` int(11) DEFAULT NULL,
  `purview` tinyint(4) DEFAULT '0',
  `viewNum` int(11) DEFAULT '0',
  `comNum` int(11) DEFAULT '0',
  `isDel` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_share_set` table : 
#

CREATE TABLE `ts_share_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `typeIds` text,
  `uids` text,
  `passive` tinyint(1) DEFAULT '0',
  `uid_type` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_share_type` table : 
#

CREATE TABLE `ts_share_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `alias` varchar(20) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0',
  `temp_list` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_site` table : 
#

CREATE TABLE `ts_site` (
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_smile` table : 
#

CREATE TABLE `ts_smile` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `emotion` varchar(10) DEFAULT NULL,
  `filename` varchar(20) DEFAULT NULL,
  `title` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_space` table : 
#

CREATE TABLE `ts_space` (
  `value` varchar(255) DEFAULT NULL,
  `variable` varchar(30) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `appname` varchar(30) DEFAULT NULL,
  KEY `appname` (`appname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_system_group` table : 
#

CREATE TABLE `ts_system_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `showname` varchar(150) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_system_node` table : 
#

CREATE TABLE `ts_system_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `containaction` longtext,
  `description` varchar(255) DEFAULT NULL,
  `ordernum` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `selected` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_system_popedom` table : 
#

CREATE TABLE `ts_system_popedom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL,
  `modelid` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `arraction` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_system_user_rank` table : 
#

CREATE TABLE `ts_system_user_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `rulemin` text,
  `rulemax` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_user` table : 
#

CREATE TABLE `ts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `current_province` varchar(255) DEFAULT NULL,
  `current_city` varchar(255) DEFAULT NULL,
  `current_area` varchar(255) DEFAULT NULL,
  `admin_level` varchar(255) DEFAULT '0',
  `commend` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `cTime` int(11) DEFAULT NULL,
  `identity` tinyint(1) NOT NULL DEFAULT '1',
  `score` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_user_app` table : 
#

CREATE TABLE `ts_user_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `appid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_user_attach` table : 
#

CREATE TABLE `ts_user_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `appId` int(11) DEFAULT NULL,
  `attachId` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `info` text,
  `cTime` int(11) unsigned DEFAULT NULL,
  `mTime` int(11) unsigned DEFAULT NULL,
  `tags` text,
  `commentCount` int(11) unsigned DEFAULT '0',
  `readCount` int(11) unsigned DEFAULT '0',
  `digCount` int(11) unsigned DEFAULT '0',
  `attachPath` varchar(255) DEFAULT NULL,
  `attachSize` varchar(20) DEFAULT NULL,
  `attachType` varchar(20) DEFAULT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `private` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `cTime` (`cTime`),
  KEY `mTime` (`mTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_user_gift` table : 
#

CREATE TABLE `ts_user_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromUserId` int(11) DEFAULT NULL,
  `fromUserName` varchar(255) DEFAULT NULL,
  `toUserId` int(11) DEFAULT NULL,
  `giftPrice` int(11) DEFAULT NULL,
  `giftImg` varchar(255) DEFAULT NULL,
  `sendInfo` text,
  `sendWay` tinyint(1) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_user_info` table : 
#

CREATE TABLE `ts_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `info` text,
  `intro` text,
  `contact` text,
  `education` text,
  `career` text,
  `credit` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_user_online` table : 
#

CREATE TABLE `ts_user_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `mini` varchar(255) DEFAULT NULL,
  `activeTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_user_score` table : 
#

CREATE TABLE `ts_user_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'score',
  `number` int(3) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_user_search` table : 
#

CREATE TABLE `ts_user_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `extra1` varchar(255) DEFAULT NULL,
  `extra2` varchar(255) DEFAULT NULL,
  `extra3` varchar(255) DEFAULT NULL,
  `extra4` varchar(255) DEFAULT NULL,
  `extra5` varchar(255) DEFAULT NULL,
  `privacy` int(1) DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_visitor` table : 
#

CREATE TABLE `ts_visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_vote` table : 
#

CREATE TABLE `ts_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `title` text,
  `explain` text,
  `type` tinyint(4) DEFAULT NULL,
  `glimit` tinyint(4) NOT NULL DEFAULT '0',
  `deadline` int(11) DEFAULT NULL,
  `onlyfriend` tinyint(4) DEFAULT NULL,
  `cTime` int(11) DEFAULT NULL,
  `vote_num` int(11) NOT NULL DEFAULT '0',
  `commentCount` int(11) NOT NULL DEFAULT '0',
  `feedId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_vote_comment` table : 
#

CREATE TABLE `ts_vote_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text,
  `cTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_vote_config` table : 
#

CREATE TABLE `ts_vote_config` (
  `variable` char(20) DEFAULT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_vote_opt` table : 
#

CREATE TABLE `ts_vote_opt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) DEFAULT NULL,
  `name` text,
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_vote_user` table : 
#

CREATE TABLE `ts_vote_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `opts` text,
  `cTime` int(11) DEFAULT NULL,
  `feedId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `ts_wall` table : 
#

CREATE TABLE `ts_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `fromUserId` int(11) DEFAULT NULL,
  `fromUserName` varchar(255) DEFAULT NULL,
  `content` text,
  `cTime` int(11) DEFAULT NULL,
  `replyWallId` int(11) NOT NULL DEFAULT '0',
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `ts_work_search` table : 
#

CREATE TABLE `ts_work_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `begin` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `home` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

