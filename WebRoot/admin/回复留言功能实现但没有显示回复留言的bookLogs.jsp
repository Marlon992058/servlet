<%@ page language="java" import="java.util.*,com.marlon.bean.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tz.tld" prefix="tz"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link href="/marlon/css/book.css" rel="stylesheet" type="text/css" /></link>
	<link rel="stylesheet" type="text/css" href="/marlon/css/css.css"></link>
	<link rel="stylesheet" type="text/css" href="/marlon/css/logs.css"></link>
	<link href="/marlon/css/layout.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="/marlon/js/editer/themes/default/css/umeditor.css"></link>
	<script type="text/javascript" src="/marlon/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/marlon/js/util.js"></script>
	<script type="text/javascript" src="/marlon/js/tmdrag.js"></script>
	<script type="text/javascript" src="/marlon/js/tmDialog.js"></script>
	<script type="text/javascript" charset="utf-8" src="/marlon/js/editer/umeditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="/marlon/js/editer/umeditor.min.js"></script>
</head>
<body>
<div class="logsTitle"><label id="change_color" style="border:1px solid gray;border-radius:15px;padding:8px 15px;">VIP学员和管理员互动</label></div>
<div class="main_logs">
	<textarea id="myEditor" class="input text_area" style="width:697px;height:240px;text-indent:2em;margin-top:10px;" autofocus="autofocus" maxlength="140"  placeholder="请输入评论信息长度不能超过140位!"></textarea>
	<div><input style="" type="button" data-userid="${user.id}" id="tm_commentLogs" class="comment" value="提交"></div>
</div>
<div class="postwrapper box wid700" id="contentbox"></div>
<script type="text/javascript">
	$(function(){
		initLogs();//相当于给body加 onload="initLogs();"
	});
	/* 加载留言信息 */
	function initLogs(){
		$.ajax({
			type:"post",
			url:"/marlon/service/searchUserLogs.jsp",
			success:function(data){
				var jdata = data.trim();
			    var	jsonData = eval("("+jdata+")");
			    //改进写法
			    var length =jsonData.length;
			    var html = "";
			    for(var i=0;i<length;i++){
			    	html += "<div class='block photo'>"+
							"<label style='font-weight: 700;font-size: 18px;'>第"+jsonData[i].id+"楼</label>"+
						    "      <div class='side'>"+
					        "               <div class='day'><a href='javascript:void(0);'>"+(new Date(jsonData[i].createtime )).format("MM")+"</a></div>"+
					        "               <div class='month'><a href='javascript:void(0);'>"+(new Date(jsonData[i].createtime )).format("dd")+"</a></div>"+
					        "           </div>"+
					        "       <div class='main'>"+
					        "           <div class='content'>"+jsonData[i].content+"</div>"+
							"		<div class='link'>"+
							"			<a id='comment' href='javascript:void(0);' data-logid='"+jsonData[i].id+"' onclick='tm_comment(this);'>回复</a>"+
							"			<a href='javascript:viod(0);' data-logid='"+jsonData[i].id+"' onclick='tm_delete_content(this)'>删除</a>"+
							"		</div>"+
							"		<div class='bcmt'>"+
							"			<div class='s-fc0 ztag' style='line-height: 30px; display: none;'>由于该用户的权限设置，你暂时无法进行评论...</div>"+
							"			<div class='bcmtadd' style='display:none'>"+
							"				<div class='bcmtipt s-bd0 s-bg0'>"+
							"					<div class='bcmtiptc'>"+
							"						<div contenteditable='true' class='editdiv s-fc0 ztag f-trans'"+
							"							maxlength='200' style='height: 130px;'></div>"+
							"					</div>"+
							"				</div>"+
							"				<div class='bcmtbtn'>"+
							"					<span class='ztag'"+
							"						style='color:red;display:none;margin-right:10px;'>提示</span>"+
							"					<button class='s-bd1 s-fc1 s-bg1 ztag'>发布</button>"+
							"					<div class='txt s-fc0'></div>"+
							"				</div>"+
							"			</div>"+
							"			<div class='bcmtlst'>"+
							"				<ul class='clearfix ztag' id='commentbox'></ul>"+
							"			</div>"+
							"			<div class='bcmtmore s-bd2 ztag' style='display: none;'>"+
							"				<div class='bcmtlsta'>"+
							"					<span class='s-fc4'>正在载入中...</span>"+
							"				</div>"+
							"			</div>"+
							"			<div class='bcmtmore s-bd2' style='display: none;'>"+
							"				<div class='bcmtlsta'>"+
							"					<a href='#' class='s-fc2 ztag'>查看更多</a>"+
							"				</div>"+
							"			</div>"+
							"		</div>"+
							"	</div>"+
							"</div>";
			    }
			    $("#contentbox").html(html);
			}
		});
	};
	/* 回复留言 */
	function tm_comment(){
		var um = UM.getEditor("myEditor");//初始化富文本编辑器
		$(".main_logs").show();
		var timer = null;
		$("#tm_commentLogs").click(function(){
			var content = um.getContentTxt();//获取富文本编辑器的纯文本内容（作用：判断是否为空），getContent()获取文本内容（作用：放值）
			var logId = $("#comment").data("logid");
			if(isEmpty(content)){
				alert("回复内容不能为空！");/* tm_showmessage("请输入内容！"); */
				UM.getEditor("myEditor").focus();
				return;
			}
			content = um.getContent();
			clearTimeout(timer);
			/* content = getEditoHtml("myEditor"); */
			timer = setTimeout(function(){
				$.ajax({
					type:"post",
					url:"/marlon/service/commentLog.jsp",
					data:{"content":content,"logId":logId},
					success:function(data){
						var jdata = data.trim();
						if(jdata=="success"){
							alert("回复成功！");
						}else{
							alert("操作失败，请重新回复操作！");
						}
					}
				});
			});
		});
	}
</script>
</body>
</html>