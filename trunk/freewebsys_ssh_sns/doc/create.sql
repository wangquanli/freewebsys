linux 配置mysql数据库utf8参数
show variables like 'character%';

character_set_client=utf8;
character_set_connection=utf8;
character_set_results=utf8;
character_set_server=utf8;
character_set_database=utf8;

修改mysql的数据库参数
/etc/mysql/my.cnf
[client]
default-character-set=utf8
[mysqld]
default-character-set=utf8

ALTER TABLE UserInfo ENGINE = MEMORY;


CREATE DATABASE freewebsys_sns DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; 

insert into FeedTemplate  
SELECT null,t.type,t.title,t.body FROM thinksns.ts_feed_template t 

create table Blog (--日志博客
  id int(11) primary key not null auto_increment,
  userId int(11),
  title varchar(255),
  categoryId int(11),--日志分类
  content longtext,--日志内容
  readCount int(11),--阅读次数
  commentCount int(11),--评论次数
  createTime int(11),--创建时间
  modifyTime int(11),--修改时间
  status int(1),--状态
  privatePermission varchar(10),
  commentPermission varchar(10) ,
  attach text--附件
) engine=myisam default charset=utf8;

create table BlogCategory (--日志博客分类
  id int(5) primary key auto_increment,--分类id
  name varchar(100),--分类名
  userId int(11),
) engine=myisam default charset=utf8;

--评论评论是 各自有各自的评论减少查询压力
create table Comment (
  id int(11) not null primary key auto_increment,
  appType varchar(255),--app分类
  appId int(11) default null,--应用Id如blog的id,图片id
  userId int(11) default null,--用户Id
  comment text,--评论内容
  createTime int(11),--创建时间
  parentId int(11)--父节点
) engine=myisam default charset=utf8;

--图片
create table Photo (
  id int(11) not null primary key auto_increment,
  albumId int(11),--相册id
  userId int(11),--用户id
  name varchar(255),--图片名称
  createTime int(11),--创建时间
  commentCount int(11),--评论数量
  readCount int(11),--阅读次数
  imagePath varchar(255),--图片路径
  smallImagePath varchar(255),--缩略的图片路径
) engine=myisam default charset=utf8;

--相册专辑
create table PhotoAlbum (
  id int(11) not null primary key auto_increment,
  userId int(11),--用户id
  name varchar(255),--名称
  createTime int(11),--创建时间
  coverImageId int(11),--相册封面id
  coverImagePath varchar(255),--相册图片路径
  photoCount int(11),--相册下照片数量
  share int(1),--分享状态
  privacy int(1)--权力
) engine=myisam default charset=utf8;


create table UserInfo (--用户信息表
  id int(11) not null primary key  auto_increment,
  createTime int(11),--创建时间
  email varchar(255),--电子邮件
  name varchar(255),--真实姓名
  passwd varchar(255),--密码
  sex varchar(10),--性别
  birthday int(11),--生日，使用数字加快搜索
  bloodType int(5),--血型
  currentProvince int(11),--当前省
  currentCity int(11),--当前城市
  currentArea varchar(255),
  adminLevel int(11),--admin等级 1 管理员 2 普通用户 
  active int(1),--是否激活
  score int(11)--积分
) engine=myisam default charset=utf8;

create table Friend (--好友
  id int(11) not null primary key auto_increment,
  createTime int(11),--创建时间
  userId int(11),--用户Id
  friendId int(11),--朋友Id
  friendUserName varchar(255),--好友名称
  status int(11),--状态 0 为待审核 1 为成功添加好友
  note varchar(1000)--好友请求
) engine=myisam default charset=utf8;

create table FriendBlack (--好友黑名单
  id int(11) not null primary key auto_increment,
  userId int(11),
  friendId int(11)
) engine=myisam default charset=utf8;

create table FriendGroup (--好友分组
  id int(11) not null primary key auto_increment,
  userId int(11),
  name varchar(255)--分组名称
) engine=myisam default charset=utf8;

com.freewebsys.sns.web.feed

create table Feed (--动态表
  id int(11) not null primary key auto_increment,
  userId int(11) ,--用户id
  userName varchar(255),--用户名
  feedType varchar(255),--动态类型
  titleData text,--标题数据
  contentData text,--内容数据
  createTime date,--创建时间
  feedTemplateId int(3)--模板Id
) engine=myisam default charset=utf8;

create table FeedUser (--动态用户关连表
  id int(11) not null primary key auto_increment,
  userId int(11),--用户id
  feedId int(11)--动态id
) engine=myisam default charset=utf8;

create table FeedTemplate (--动态模板表
  id int(11) not null primary key auto_increment,
  feedType varchar(255),--动态类型
  title text,--动态标题
  content text--动态内容
) engine=myisam default charset=utf8;

com.freewebsys.sns.web.friend
--最近来访
create table UserVisitor (
  id int(11) not null primary key  auto_increment,
  createTime date,--创建时间
  userId int(11) ,--用户id
  visitorId int(11),--访问Id
  visitorName varchar(20)--访问用户名
) engine=myisam default charset=utf8;

com.freewebsys.sns.web.mini
create table MiniTest (--心情
  id int(11) not null primary key auto_increment,
  userId int(11) ,--用户Id
  content varchar(400),--内容
  createTime date,--创建时间
  commentCount int(11),--评论次数
  feedId int(11)--动态Id
) engine=myisam default charset=utf8;

ALTER TABLE thinksns.MiniTest ENGINE = MEMORY;


CREATE TABLE  Message (
  id int(11) NOT NULL AUTO_INCREMENT,
  fromUserId int(11) DEFAULT NULL,--发件人是一个人
  fromName varchar(20) DEFAULT NULL,--发件人是一个人
  toUserIds varchar(200) DEFAULT NULL,--收件人，可以是多个人
  toUserNames varchar(200) DEFAULT NULL,--收件人，可以是多个人
  subject varchar(255) DEFAULT NULL,--标题
  content text,--内容
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE  MessageLog (
  id int(11) NOT NULL AUTO_INCREMENT,
  messageId int(11) DEFAULT NULL,--消息Id
  userId int(11) DEFAULT NULL,--收件人一个人一个流水
  createTime date,--创建时间
  isRead int(11) DEFAULT NULL,--是否已经读取
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


