<%@ page language="java" import="java.util.*,com.marlon.bean.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tz.tld" prefix="tz"%>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>北京尚学堂</title>
	<link href="/marlon/css/book.css" rel="stylesheet" type="text/css" /></link>
	<link rel="stylesheet" type="text/css" href="/marlon/css/css.css"></link>
	<link rel="stylesheet" type="text/css" href="/marlon/css/logs.css"></link>
	<link type="text/css" rel="stylesheet" href="/marlon/js/editer/themes/default/css/umeditor.css"></link>
	<script type="text/javascript" src="/marlon/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/marlon/js/util.js"></script>
	<script type="text/javascript" src="/marlon/js/tmdrag.js"></script>
	<script type="text/javascript" src="/marlon/js/tmDialog.js"></script>
	<script type="text/javascript" charset="utf-8" src="/marlon/js/editer/umeditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="/marlon/js/editer/umeditor.min.js"></script>
</head>

<body onload="initLogs(${user.id})">
<%
	User user = (User)session.getAttribute("user");
	List<HashMap<String,Object>> logMaps = (List<HashMap<String,Object>>)session.getAttribute("logMaps");
%>
<div class="top">
	<div class="head">
		<div class="logo">
			<a href="javascript:void(0)"><img style="opacity: 1;" src="/marlon/images/logo.jpg" width="252" height="105" alt="尚学堂"></a>
		</div>
		<div class="right">
				<a href="#"><img style="opacity: 1;" src="/marlon/images/by.jpg" width="672" height="105" alt=""></a>
		</div>	
		<div class="clear"></div>
	</div>
	<div class="sxt_nav">
		<ul>
			<li><a class="hover" href="/marlon/stage/index.jsp">首页</a></li>
			<li><a href="/marlon/stage/java.jsp">java培训</a></li>
			<li><a href="/marlon/stage/vip.jsp">VIP专场</a></li>
			<li><a href="/marlon/stage/enroll.jsp">报名流程</a></li>
			<li><a href="/marlon/stage/course.jsp">在线课堂</a></li>
			<li><a href="/marlon/stage/about.jsp">关于我们</a></li>
			<li><a href="book.jsp">留言板</a></li>
		</ul>
		<div class="user">当前登录学员：<b id="change_color">${user.account}</b><a style="font-size:14px;" href="/marlon/service/logout.jsp">【退出】</a></div>
	</div>
</div>
<div class="box wid700  "> 
    <div class="selfinfo">
       	<div class="logo">
            <a href="javascript:void(0)"><img style="border-radius: 80px;" src="/marlon/images/proxy.jpg" height="80"><i></i></a>
        </div>
       	<h1><a href="javascript:void(0)">${user.account}</a></h1>
        <div id="change_color" class="text">我是一个爱知识、有爱心的技术狂。至理名言：<b>Believe yourself，you're the best one.</b></div>
    </div>
    <div class="sch">
        <form action="/search" method="get">
            <input value="搜索" type="text" name="q" onfocus="if(this.value=='搜索'){this.value='';}" onblur="if(this.value==''){this.value='搜索';}" class="txt">
        </form>
    </div>
    <!-- <ul class="sidelist">
		<li><a href="javascript:void(0);" rel="nofollow">私信</a></li>
		<li><a href="javascript:void(0);">归档</a></li>
		<li><a href="javascript:void(0);">RSS</a></li>
    </ul> -->
</div>
<div id="message" class="postwrapper box wid700  ">
     <div class="mes_nr">
     	 <input style="text-indent:1em;" type="text" id="title"  class="input" autofocus="autofocus" placeholder="请输入标题" maxlength="10">
	     <br>
	     <br>
	     <textarea id="myEditor" class="input text_area" style="height: 240px;text-indent:2em;" maxlength="140"  placeholder="请输入评论信息长度不能超过140位!"></textarea>
	     <br>
     	 <div id="tagMsg" style="display:none;float:left;width:300px;height:30px;font-size:16px;color:red;line-height:30px;text-indent:0.5em;"></div>
	     <div class="fabiao"><input type="button" data-userid="${user.id}" id="tm_sendcomment" class="submit" value="发表留言"><span>还可以输入<label id="count">140</label>字</span></div>
	     <div class="clearfix"></div>
	</div>
</div>
<div class="postwrapper box wid700" id="contentbox">
</div>
<div class="bottom">
	<div class="btm">
		<div class="up">
			<p><a href="javascript:void(0)">关于学院</a>|<a href="javascript:void(0)">联系我们</a>|<a href="javascript:void(0)">招贤纳士</a>|<a href="javascript:void(0)">报名咨询</a>|
			<a href="javascript:void(0)">商务合作</a>|<a href="javascript:void(0)">教学视频</a>|<a href="javascript:void(0)">技术论坛</a></p>
		</div>
		<div class="down">
			<p>北京总部地址：北京市海淀区西三旗桥东建材城西路85号神州科技园B座三层尚学堂 咨询电话：400-009-1906 010-56233821</p>
			<p>四川学院地址：成都市高新区锦晖西一街99号布鲁明顿大厦2栋1003室 电话：028-65176856</p>
			<p>长沙学院地址：长沙韶山南路香颂国际大厦1014 咨询电话：0731-83299621/83999726</p>
			<p>Copyright 2007-2014 北京尚学堂科技有限公司   京ICP备06015238号   京公网安备11010802015183 </p>
		</div>
	</div>
</div>
<script type="text/javascript">
	var um = UM.getEditor("myEditor");
	//获取富文本编辑器的带有格式的内容
	function getEditoHtml(myEditor){
		return UM.getEditor(myEditor).getContentTxt();
	}
	
	//获取富文本编辑器的纯文本内容
	function getEditText(myEditor){
		return UM.getEditor(myEditor).getContentTxt();
	}
	
	//给某个富文本框赋值
	function setEditorText(message,myEditor){
		 UM.getEditor(myEditor).setContent(message, false);//清空富文本编辑器
	}
	function initLogs(uId){
		//var userId = userId;
		$.ajax({
			type:"post",
			url:"/marlon/service/searchLogs.jsp",
			data:{"userId":uId},
			success:function(data){
				/* var jdata = data.trim(); */
				$("#contentbox").html(data);
			}
		});
	};
	$(function(){
		/* 发表留言  */
		var timer = null;
		$("#tm_sendcomment").click(function(){
			var content = getEditText("myEditor");
			var title = $("#title").val();
			var userId = $("#tm_sendcomment").data("userid");
			if(isEmpty(title)){
				$("#title").focus();
				tm_showmessage("请输入标题！");
				return;
			}
			if(isEmpty(content)){
				tm_showmessage("请输入内容！");
				UM.getEditor("myEditor").focus();
				return;
			}
			clearTimeout(timer);
			content = getEditoHtml("myEditor");
			timer = setTimeout(function(){
				$.ajax({
					type:"post",
					url:"/marlon/service/addLog.jsp",
					data:{"content":content,"title":title,"userId":userId},
					success:function(data){
						var jdata = data.trim();
						if(jdata=="success"){
							var day = new Date().format("dd");
							var month = new Date().format("MM");
							//append 追加到元素的后面
							//prepend:追加到元素的前面
							var length = $("#contentbox").find(".photo").length;
							$("#contentbox").prepend("<div class='block photo'>"+
							"		<label style='font-weight: 700;font-size: 18px;'>第"+tm_NumberToChinese(length+1)+"楼</label>"+
				             "        <div class='side'>"+
					         "               <div class='day'><a href='javascript:void(0);'>"+day+"</a></div>"+
					         "               <div class='month'><a href='javascript:void(0);'>"+month+"</a></div>"+
					         "        </div>"+
					         "       <div class='main'>"+
					         "           <div class='content'>"+content+"</div>"+
					         "       <div class='link'>"+
					         "           <a href='javascript:void(0);' onclick='tm_comment(this)'>评论(1)</a>"+
					         "           <a href='javascript:void(0);' onclick='tm_delete_content(this)'>删除</a>"+
					         "       </div>"+
					         " 		<div class='disc_list'>"+
	                        " 			 <div class='pic'><a href='#'><img src='../images/pic.jpg' width='43' height='43' /></a></div>"+
	                        "  			 <div class='liuyan1'>"+
	                        "    			 <dl>"+
	                        "          		   <dt>天上的星星</dt>"+
	                        "           			<dd>推荐你们去看一部电影，叫代理人，其实未来的世界就是那样的！</dd>"+                                   
	                        "      			 </dl>"+
	                        "      	 		 <div class='pubdata'>"+
	                        "           		 <span>发表于：2014-9-05 19:13:48 |</span>"+
	                        "           		 <a href='#' class='fr'><span class='nolike teac_icon'></span><p>不喜欢(21)</p></a>"+
	                        "            		 <a href='#' class='fr'><span class='onlike teac_icon'></span><p>喜欢(123)</p></a>"+
	                        "       		 </div>"+
	                        "  			</div>"+
	                        "  		<div class='clearfix'></div>"+
	                        "		</div>"+
							"	    <div class='bcmtmore s-bd2' style='display: none;'>"+
							"	    	<div class='bcmtlsta'><a href='#' class='s-fc2 ztag'>查看更多</a></div>"+
							"	    </div>"+
							"	</div>"+
					        "</div>");
							$("#title").val("");
							$("#content").val("");
							setEditorText("","myEditor");
						}else{
							$("#title").focus();
							alert("标题和内容不允许为空!");
						}
					}
				});	
			},200);
		});
	});
	//显示错误信息
	function tm_showmessage(message){
		$("#tagMsg").show().html(message).stop(true,true).fadeOut(3000);
	}
</script>
<!-- <script type="text/javascript">
	$(function(){
		$("#contentbox").find(".photo").each(function(){
			var content = $(this).find(".content").html();
			var result = "";
			var start = "";
			if(content.length>100){
				start = content.substring(0,100);
				result = "<span style='display:none;'>"+content.substring(100,content.length)+"</span>";
				$(this).find(".content").html(start+result+"&nbsp;&nbsp;<a onclick='tm_show_expand(this)' href='javascript:void(0)'>展开</a>");
			}
		});
	});
	//删除帖子
	function tm_delete_content(obj){
		//根据帖子ID去删除 
		//通过ajax方式去删除
		var opid = $(obj).data("opid");
		tm_dialoag({content:"您确定删除改帖子吗?",callback:function(ok){
			if(ok){
				$.ajax({
					type:"post",
					url:"service/deleteContent.jsp",
					data:{"id":opid},
					success:function(data){
						var jdata = data.trim();
						if(jdata=="success"){
							//删除div
							$(obj).parents(".photo").fadeOut("slow",function(){
								$(this).remove();
							});
						}else{
							//删除失败
							tm_dialoag({title:"删除提示",content:"删除用户失败!"});
						}
					}
				});
			}
		}});
	}
	
	function tm_show_expand(obj){
		var text = $(obj).text();
		if(text=="展开"){
			$(obj).text("收起");
			$(obj).prev().fadeIn("slow");
		}else{
			$(obj).text("展开");
			$(obj).prev().fadeOut("slow");
		}
	}

	$(function(){
		/* 置顶 */
	    $(window).scroll(function() {
	    	var stop = $(window).scrollTop();
	        if (stop >= 100){
	        	$("#dynamic-to-top").stop(true, true).fadeIn(300);
	        	$("#dynamic-to-bottom").stop(true, true).fadeOut(300);
	        }else {
	        	$("#dynamic-to-top").stop(true, true).fadeOut(300);
	        	$("#dynamic-to-bottom").stop(true, true).fadeIn(300);
	        }
	    });

	    $("#dynamic-to-top").on("click",function() {
	        $("html, body").stop(true, true).animate({ scrollTop: 0});
	        return false;
	    });
	    
	    $("#dynamic-to-bottom").click(function(){
			var scrollHeight = document.body.scrollHeight || document.documentElement.scrollHeight;
			$("body").stop(true,true).animate({"scrollTop":scrollHeight},35000,function(){
				$("#dynamic-to-bottom").hide();
			});
		});
	    
		var um = UM.getEditor("myEditor");
		//keydown:键盘按下去的事件
		//keyup :键盘抬起来的事件
		$("#content").keyup(function(){
			tm_number_textarea($(this));
		}).keydown(function(){
			tm_number_textarea($(this));
		});
		
		function tm_number_textarea($obj){
			var value = $obj.val();
			var maxLength = $obj.attr("maxLength");
			//获取你输入的个数
			var length = value.length;
			if(length <= maxLength){
				$("#count").text(maxLength-length);
			}
		};
	});
 </script>  -->
</body>
</html>