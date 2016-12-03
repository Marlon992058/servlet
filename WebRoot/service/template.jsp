<%@page import="com.marlon.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- c标签 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 自定义函数标签 -->
<%@taglib uri="/WEB-INF/tz.tld" prefix="tz" %>
<c:forEach items="${logMaps}" var="logMap">
	<div class="block photo">
			<label style="font-weight: 700;font-size: 18px;">${logMap.title}</label>
                    <div class="side">
                        <div class="day"><a href="javascript:void(0);">${tz:dataFormat(logMap.createtime,"dd")}</a></div>
                        <div class="month"><a href="javascript:void(0);">${tz:dataFormat(logMap.createtime,"MM")}</a></div>
                    </div>
                <div class="main">
                    <div class="content">${logMap.content}</div>
                <div class="link">
                    <a href="javascript:void(0);" data-logid="${logMap.id}" onclick="tm_comment(this);">评论(1)</a>
                    <a href="javascript:void(0);" data-logid="${logMap.id}" onclick="tm_delete_content(this)">删除</a>
                </div>
               <div class="bcmt">
				<div class="s-fc0 ztag" style="line-height: 30px; display: none;">由于该用户的权限设置，你暂时无法进行评论...</div>
				<div class="bcmtadd" style="display:none">
			    	<div class="bcmtipt s-bd0 s-bg0">
			        	<div class="bcmtiptc"><div contenteditable="true" class="editdiv s-fc0 ztag f-trans" maxlength="200" style="height: 130px;"></div></div>
			        </div>
		         <div class="bcmtbtn">
			        	<span class="ztag" style="color:red;display:none;margin-right:10px;">提示</span><button class="s-bd1 s-fc1 s-bg1 ztag">发布</button>
			        	<div class="txt s-fc0"></div>
			        </div>
		    </div>
			    <div class="bcmtlst">
			        <ul class="clearfix ztag" id="commentbox"></ul>
			    </div>
			    <div class="bcmtmore s-bd2 ztag" style="display: none;">
			    	<div class="bcmtlsta"><span class="s-fc4">正在载入中...</span></div>
			    </div>
			    <div class="bcmtmore s-bd2" style="display: none;">
			    	<div class="bcmtlsta"><a href="#" class="s-fc2 ztag">查看更多</a></div>
			    </div>
			</div>
           </div>
       </div>
</c:forEach>