<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="userList.js"></script>
</head>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE>P {
	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px
}
</STYLE>

<META content="MSHTML 6.00.5730.13" name=GENERATOR></HEAD>
<BODY>
<DIV class=tit>
<P>ubuntu 通过代理上网及apt-get</P></DIV>
<DIV class=date></DIV>
<TABLE class=FCK__ShowTableBorders style="TABLE-LAYOUT: fixed">
  <TBODY>
  <TR>
    <TD>
      <DIV class=cnt>
      <P><STRONG><FONT color=#ff0000>一、代理上网：</FONT></STRONG></P>
      <P><FONT color=#0000ff>方法一</FONT> 
      <BR>这是一种临时的手段，如果您仅仅是暂时需要通过http代理使用apt-get，您可以使用这种方式。</P>
      <P>在使用apt-get之前，在终端中输入以下命令（根据您的实际情况替换yourproxyaddress和proxyport）。</P>
      <P>终端运行export http_proxy="http://用户名:密码@代理IP:代理端口"也可<BR><BR><FONT 
      color=#0000ff>方法二</FONT></P>
      <P>这种方法要用到/etc/apt/文件夹下的apt.conf文件。如果您希望apt-get（而不是其他应用程序）一直使用http代理，您可以使用这种方式。</P>
      <P>注意： 某些情况下，系统安装过程中没有建立apt配置文件。下面的操作将视情况修改现有的配置文件或者新建配置文件。</P>
      <P>sudo gedit /etc/apt/apt.conf</P>
      <P>在您的apt.conf文件中加入下面这行（根据你的实际情况替换yourproxyaddress和proxyport）。</P>
      <P>Acquire::http::Proxy “http://yourproxyaddress:proxyport”;</P>
      <P><FONT color=#ff0000>！！说明：最后有一个分号！！</FONT></P>
      <P>&nbsp;</P>
      <P>保存apt.conf文件。</P>
      <P><FONT color=#0000ff>方法三</FONT></P>
      <P>这种方法会在您的主目录下的.bashrc文件中添加两行。如果您希望apt-get和其他应用程序如wget等都使用http代理，您可以使用这种方式。</P>
      <P>gedit ~/.bashrc</P>
      <P>在您的.bashrc文件末尾添加如下内容（根据你的实际情况替换yourproxyaddress和proxyport）。</P>
      <P>http_proxy=http://yourproxyaddress:proxyport<BR>export http_proxy</P>
      <P>保存文件。关闭当前终端，然后打开另一个终端。</P>
      <P>使用apt-get update或者任何您想用的网络工具测试代理。我使用firestarter查看活动的网络连接。</P>
      <P>如果您为了纠正错误而再次修改了配置文件，记得关闭终端并重新打开，否自新的设置不会生效。<BR><BR><STRONG><FONT 
      color=#ff0000>常见FAQ:</FONT></STRONG><BR><BR>Network Proxy没有作用！web 
      brower,APT,Gaim IM都要自己设！！</P>
      <P>System--Preferences--Network Proxy设置成Automatic proxy configuration就是不行！ 
      <BR>而Firfox web brower要自己的proxy设置才可以。 <BR>Gain Internet 
      Messenger也要设proxy才行。</P>
      <P>问题在于通过proxy的APT怎么都不行，我用的porxy是要用用户名密码鉴权的，而用户名是域用户，比如：用户user123,域是domain123,在windows里要用用户为“domain123\user123" 
      <BR>现在用了n种办法： <BR>１，System--Preferences--Network Proxy设置成Automatic proxy 
      configuration就是不行！ <BR>２，按<A 
      href="http://wiki.ubuntu.org.cn/index/system/ConfigAptProxy">http://wiki.ubuntu.org.cn/index/system/ConfigAptProxy</A>修改文件不行！ 
      <BR>３，新增/etc/apt/apt.conf为 <BR>Acquire::http::Proxy "<A 
      href="http://user123:password@111.222.xxxx.xxx:8080/">http://user123:password@111.222.xxxx.xxx:8080</A>"; 
      <BR>or <BR>Acquire::http::Proxy "<A 
      href="http://domain123/user123:password@111.222.xxxx.xxx:8080">http://domain123\user123:password@111.222.xxxx.xxx:8080</A>"; 
      <BR>or <BR>Acquire::http::Proxy "<A 
      href="http://user123:password@proxyabc.xxx.com.cn:8080/">http://user123:password@proxyabc.xxx.com.cn:8080</A>"; 
      <BR>or <BR>"<A 
      href="http://user123:password@proxyabc.xxx.com.cn/">http://user123:password@proxyabc.xxx.com.cn</A>";</P>
      <P></P>
      <P>--------------------------------</P></DIV></TD></TR></TBODY></TABLE></BODY></HTML>

</html>