<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<<script type="text/javascript">
/* 分页功能ajax实现 */
function tm_load_users(pageNo,pageSize){
	$.ajax({
		type:"post",
		url:"/marlon/service/search.jsp",
		data:{"pageNo":(pageNo*12),"pageSize":pageSize},
		success:function(data){
			var jdata = data.trim();
		    var	jsonData = eval("("+jdata+")");
		    //改进写法
		    var length =jsonData.length;
		    var html = "";
		    for(var i=0;i<length;i++){
		    	if(jsonData[i].type==1){
		    		jsonData[i].type="java基础班";
		    	}else if(jsonData[i].type==2){
		    		jsonData[i].type="java中级班";	
		    	}else if(jsonData[i].type==3){
		    		jsonData[i].type="java高级班";
		    	}else if(jsonData[i].type==4){
		    		jsonData[i].type="java系统学习班";	
		    	}else{
		    		jsonData[i].type="java就业特训班";	
		    	}
		    	/*根据pay的值将对应的支付方式赋予pay字段*/
		    	if(jsonData[i].pay==1){
		    		jsonData[i].pay="支付宝";
		    	}else if(jsonData[i].pay==2){
		    		jsonData[i].pay="网上银行";	
		    	}
		    	 html += "<ul class='tz_user_lists'>"+
				"<li class='tz_u-id'>"+jsonData[i].id+"</li>"+
				"<li class='tz_u-account'>"+jsonData[i].account+"</li>"+
				"<li class='tz_u-type'>"+jsonData[i].type+"</li>"+
				"<li class='tz_u-pay'>"+jsonData[i].pay+"</li>"+
				"<li class='tz_u-contact'>"+jsonData[i].contact+"</li>"+
				"<li class='tz_u-jointime'>"+(new Date(/* jsonData[i].jointime */)).format("yyyy-MM-dd HH:mm:ss")+"</li>"+
				"<li class='tz_u-option'>"+
				"	<a href='regest.jsp' onclick='tm_addUser(this);'>"+"添加"+"</a>"+
				"	<a href='javascript:void(0)' data-opid='"+jsonData[i].id+"' onclick='tm_updateUser(this);'>"+"修改"+"</a>"+
				"	<a href='javascript:void(0)' data-opid='"+jsonData[i].id+"' onclick='tm_deleteUser(this);'>"+"删除"+"</a>"+
				"</li>"+
			    "</ul>"; 
		    }
		    $(".tz_user_lists").html(html);
		}
	});
} 
</script>
