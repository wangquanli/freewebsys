
linux Mysql乱码解决默认字符设置
[client]
port            = 3306
socket          = /var/run/mysqld/mysqld.sock
default-character-set=utf8

重启mysql
sudo /etc/init.d/mysql restart

struts2中文提交乱码
<constant name="struts.i18n.encoding" value="GBK" />


