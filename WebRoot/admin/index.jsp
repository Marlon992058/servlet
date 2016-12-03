<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.bean.Admin"%>
<!DOCTYPE HTML>
<HTML><HEAD><TITLE>尚学堂VIP学员-后台管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="/marlon/css/style.css" type=text/css rel=stylesheet>
<!-- 引入通用样式 -->
<link href="/marlon/css/layout.css" rel="stylesheet" type="text/css" />
<STYLE>.main_left {
	TABLE-LAYOUT: auto; BACKGROUND: url(/marlon/images/left_bg.gif);
}
.main_left_top {
	BACKGROUND: url(/marlon/images/left_menu_bg.gif); PADDING-TOP: 5px;
}
.main_left_title {
	PADDING-LEFT: 15px; FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #fff; TEXT-ALIGN: left;
}
.left_iframe {
	BACKGROUND: none transparent scroll repeat 0% 0%; VISIBILITY: inherit; WIDTH: 180px; HEIGHT: 92%
}
.main_iframe {
	Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 92%;  background: #DDE9EC;
}
TABLE {
	FONT-SIZE: 14px; FONT-FAMILY: "微软雅黑";
}
TD {
	FONT-SIZE: 14px; FONT-FAMILY:"微软雅黑";
}
</STYLE>
<SCRIPT src="/marlon/js/admin.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/marlon/js/sAdmin.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/marlon/js/util.js" type="text/javascript"></SCRIPT>
<!-- 引入jquery核心js文件 -->
<script type="text/javascript" src="/marlon/js/jquery-1.11.1.min.js"></script>
<!-- 引入拖动对话框js文件-->
<script type="text/javascript" src="/marlon/js/tmdrag.js"></script>
<!-- 引入引入弹出对话框js文件 -->
<script type="text/javascript" src="/marlon/js/tmDialog.js"></script>
<SCRIPT  type="text/javascript">
var status = 1;
var Menus = new DvMenuCls;
document.onclick=Menus.Clear;
function switchSysBar(){
     if (1 == window.status){
		  window.status = 0;
          switchPoint.innerHTML = '<img src="/marlon/images/left.gif">';
          document.all("frmTitle").style.display="none";
     }
     else{
		  window.status = 1;
          switchPoint.innerHTML = '<img src="/marlon/images/right.gif">';
          document.all("frmTitle").style.display="";
     }
};
</SCRIPT>
<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY style="MARGIN: 0px"><!--导航部分-->
<%
	Admin admin = (Admin)session.getAttribute("admin");
%>
<DIV class=top_table>
<DIV class=top_table_leftbg>
<DIV class=system_logo><A href="/marlon/stage/index.jsp"><IMG src="/marlon/images/logo.jpg" width="180px;" height="48px"></a></DIV>
<DIV class=menu>
<UL>
  <LI id=menu_0 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="javascript:void(0)">学校概况/荣誉</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="javascript:void(0)" >学校概况列表</A> </LI>
    <LI><A href="javascript:void(0)" >添加学校概况</A> </LI>
    <LI><A href="javascript:void(0)" >生成学校概况列表</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_1 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="javascript:void(0)">新闻资讯</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="javascript:void(0)" >新闻类别</A> </LI>
    <LI><A href="javascript:void(0)" >新闻列表</A> </LI>
    <LI><A href="javascript:void(0)" >添加新闻</A> </LI>
    <LI><A href="javascript:void(0)" >生成新闻分类页面</A> </LI>
    <LI><A href="javascript:void(0)" >生成新闻详细页面</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_2 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="javascript:void(0)">教师风采/学生之星</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="javascript:void(0)" >教师风采/学生之星类别</A> </LI>
    <LI><A href="javascript:void(0)" >教师风采/学生之星列表</A> </LI>
    <LI><A href="javascript:void(0)" >添加教师风采/学生之星</A> </LI>
    <LI><A href="javascript:void(0)" >所有明星师/生详细页面</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom"  src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_3 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="javascript:void(0)">下载管理</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A 
    href="javascript:void(0)" >下载类别</A> </LI>
    <LI><A href="javascript:void(0)" >下载列表</A> </LI>
    <LI><A href="javascript:void(0)" >添加下载</A> </LI>
    <LI><A href="javascript:void(0)" >生成下载分类页面</A> </LI>
    <LI><A href="javascript:void(0)" >生成下载详细页面</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_4 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="javascript:void(0)">人才招聘</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="javascript:void(0)" >招聘列表</A> </LI>
    <LI><A href="javascript:void(0)" >添加招聘</A> </LI>
    <LI><A href="javascript:void(0)" >生成招聘列表</A> </LI>
    <LI><A href="javascript:void(0)" >生成招聘详细页面</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_5 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="javascript:void(0)">其他信息</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="javascript:void(0)" >信息类别</A> </LI>
    <LI><A href="javascript:void(0)" >信息列表</A> </LI>
    <LI><A href="javascript:void(0)" >添加信息</A> </LI>
    <LI><A href="javascript:void(0)" >生成其他信息分类页面</A> </LI>
    <LI><A href="javascript:void(0)" >生成其他信息详细页面</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_7 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="javascript:void(0)">访客反馈</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="javascript:void(0)" >留言信息</A> </LI>
    <LI><A href="javascript:void(0)" >订单信息</A> </LI>
    <LI><A href="javascript:void(0)" >人才信息</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_8 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A  href="javascript:void(0)">用户管理</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="javascript:void(0)" >网站管理员</A> </LI>
    <LI><A href="javascript:void(0)" >前台会员</A> </LI>
    <LI><A href="javascript:void(0)" >会员组别</A></LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_10 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="javascript:void(0)">系统管理</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL><LI><A href="javascript:void(0)" >修改密码</A> </LI>
    <LI><A href="javascript:void(0)" >网站信息设置</A> </LI>
    <LI><A href="javascript:void(0)" >导航栏目</A> </LI>
    <LI><A href="javascript:void(0)" >在线客服</A> </LI>
    <LI><A href="javascript:void(0)" >网站公告</A> </LI>
    <LI><A href="javascript:void(0)" >数据库操作</A> </LI>
    <LI><A href="javascript:void(0)" >空间统计</A> </LI>
    <LI><A href="javascript:void(0)" >访问统计</A> </LI>
    <LI><A href="javascript:void(0)" >友情链接</A> </LI>
    <LI><A href="javascript:void(0)" >阻止SQL注入记录</A> </LI>
    <LI><A href="javascript:void(0)"  >幻灯设置</A> </LI>
    <LI><A href="javascript:void(0)" target=frmright>使用帮助</A></LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_6 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="javascript:void(0)">静态生成</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="javascript:void(0)" >生成新闻分类页面</A></LI>
    <LI><A href="javascript:void(0)" >生成新闻详细页面</A></LI>
    <LI><A href="javascript:void(0)" >生成学校信息列表</A></LI>
    <LI><A href="javascript:void(0)" >生成下载分类页面</A></LI>
    <LI><A href="javascript:void(0)" >生成下载详细页面</A></LI>
    <LI><A href="javascript:void(0)" >生成招聘列表</A></LI>
    <LI><A href="javascript:void(0)" >生成招聘详细页面</A></LI>
    <LI><A href="javascript:void(0)" >生成其他信息</A></LI>
    </UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="/marlon/images/menu01_right.gif"></DIV></LI>
  <LI id=menu_9 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="javascript:void(0)">网站推广</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="http://www.baidu.com/search/url_submit.html" 
    target=_blank>百度登录入口</A> </LI>
    <LI><A href="http://www.google.com/intl/zh-CN/add_url.html" 
    target=_blank>Google登录入口</A> </LI>
    <LI><A href="http://search.help.cn.yahoo.com/h4_4.html" 
    target=_blank>Yahoo登录入口</A> </LI>
    <LI><A href="http://search.msn.com/docs/submit.aspx" 
    target=_blank>Live登录入口</A> </LI>
    <LI><A href="http://www.dmoz.org/World/Chinese_Simplified/" 
    target=_blank>Dmoz登录入口</A> </LI>
    <LI><A href="http://www.alexa.com/site/help/webmasters" 
    target=_blank>Alexa登录入口</A> </LI>
    <LI><A href="http://ads.zhongsou.com/register/page.jsp" 
    target=_blank>中搜登录入口</A> </LI>
    <LI><A href="http://iask.com/guest/add_url.php" target=_blank>爱问登录入口</A> 
    </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="/marlon/images/menu01_right.gif"></DIV></LI></UL></DIV></DIV></DIV>
<DIV style="BACKGROUND: #337abb; HEIGHT: 24px"></DIV><!--导航部分结束-->
<TABLE style="BACKGROUND: #337abb" height="92%" cellSpacing=0 cellPadding=0 
width="100%" border=0>
  <TBODY>
  <TR>
    <TD class="main_left" id="frmTitle" align="absmiddle" name="fmTitle">
      <TABLE class=main_left_top cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR height=32>
          <TD vAlign=top></TD>
          <TD class=main_left_title id=leftmenu_title>常用快捷功能</TD>
          <TD vAlign=top align=right></TD></TR></TBODY></TABLE>
          <IFRAME class=left_iframe id=frmleft name=frmleft src="left.jsp" frameBorder=0 allowTransparency></IFRAME>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR height=32>
          <TD vAlign=top></TD>
          <TD vAlign=bottom align="middle"></TD>
          <TD vAlign=top align=right></TD></TR></TBODY></TABLE></TD>
    <TD style="WIDTH: 10px" bgColor=#337abb>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD style="HEIGHT: 100%" onclick="switchSysBar(this)"><SPAN class=navPoint 
            id=switchPoint title=关闭/打开左栏><IMG 
            src="/marlon/images/right.gif"></SPAN> 
        </TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top width="100%" bgColor=#337abb>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed 
        border=0><TBODY>
        <TR height=32>
          <TD vAlign=top width=10 
          background="/marlon/images/bg2.gif"><IMG alt="" 
            src="/marlon/images/teble_top_left.gif"></TD>
          <TD width=28 
          background="/marlon/images/bg2.gif"></TD>
          <TD background="/marlon/images/bg2.gif">
	          <SPAN style="FLOAT: left">尚学堂VIP后台管理信息系统</SPAN>
	          <SPAN id="dvbbsannounce" style="FONT-WEIGHT: bold; FLOAT:left;WIDTH: 300px; COLOR: #191919;"></SPAN>
          </TD>
          <TD style="COLOR: #135294; TEXT-ALIGN: center" background="/marlon/images/bg2.gif">  <span href="javascript:void(0)" style="color:#191919;font-size:16px;" id="timer"></span>|
           <A href="index.jsp" target=_top>后台首页</A>| <A href="/marlon/stage/index.jsp">首页</A>
            |当前管理员： <A href="javascript:void(0)" target=_top><span id="change_color" class="tz_font">${admin.admin}</span></A>
           <!--  <A class="tz_out" href="javascript:AdminOut()" target=_top>【退出】</A> -->
           <A class="tz_out" href="javascript:void(0)" onclick="tz_logout(this);">【退出】</A>  </TD>
          </TR></TBODY></TABLE>
          <IFRAME  class=main_iframe id=frmright name=frmright src="syscome.jsp" frameBorder=0 scrolling=true></IFRAME>
      <TABLE style="BACKGROUND: #FFF" cellSpacing=0 cellPadding=0 
      width="100%" border=0>
       </TABLE></TD></TR></TBODY></TABLE>
<DIV id=dvbbsannounce_true style="DISPLAY: none"></DIV>
<script type="text/javascript">
var h = 0,m = 0,s = 0;
window.setInterval(function(){
	s ++;
	if(s==60){
		s = 0;
		m++;
	}
	if(m==60){
		m = 0;
		h++;
	}
	document.getElementById("timer").innerHTML = "您已经登录了：【"+h+"小时"+m+"分钟"+s+"秒】";
},1000);

function tz_logout(){
	tm_dialoag({content:"您确定要执行退出操作吗？",callback:function(ok){
		if(ok){
			window.location.href = "/marlon/service/logout.jsp";
		}
	}});
}
</script>
</BODY>
</HTML>