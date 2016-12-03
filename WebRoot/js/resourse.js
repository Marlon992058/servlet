	$(function(){
		//禁止文本窗口选中
		tm_forbiddenSelect();
		//禁止浏览器的右键
		//document.body.oncontextmenu=document.body.ondragstart= document.body.onselectstart=document.body.onbeforecopy=function(){return false;};
		//工具类的高度是自动换算的
		$("#sidebar").height(getClientHeight()-103);
		//内容栏的高度是自动换算的
		$("#content").height(getClientHeight()-105);
		//这行是浏览器改变的时候自动的改变内容和工具栏的高度
		$(window).resize(function(){
			$("#sidebar").height(getClientHeight()-103);
			$("#content").height(getClientHeight()-105);
		});
		//动态绑定修改保存按钮时间按钮事件
		//调用分页
		tm_load_resourses(0,10/* ,function(itemcount){
				tm_init_page(itemcount);
			} */);
	});
	//全选反选切换
	$("#checkall").click(function(){
		var text = $(this).attr("op");
		if(text=="on"){
			$("#contentbox").find(".chk").prop("checked",true);
			$(this).attr("op","off");
			$(this).text("反选");
		}else{
			$("#contentbox").find(".chk").prop("checked",false);
			$(this).attr("op","on");
			$(this).text("全选");
		}
	});
	/*//编辑功能函数tm_updateresourse()
	function tm_updateresourse(){
		//编辑事件
		$("#contentbox").find(".edit").click(function(){
			alert(1);
			//获取修改的名字的框
			var $name = $(this).parents(".list").find(".name-text");
			//获取div里面的文本内容
			var text = $name.text();
			//隐藏当前的编辑按钮
			$(this).hide();
			//显示保存和取消按钮
			$(this).parents(".list").find(".tmui-btns").show();
			//给div加入一个输入框，并且把内容放入在input中
			$name.html("<input type='text' class='itemvalue' value='"+text+"'>");
			//并且选中要修改的内容
			$name.find(".itemvalue").select();
		});

		//取消事件
		$("#contentbox").find(".cancle").click(function(){
			//获取name的对象
			var $name = $(this).parents(".list").find(".name");	
			//把title的值重新赋给div
			$name.html($name.attr("title"));
			//隐藏保存按钮和取消按钮给隐藏
			$(this).parents(".list").find(".tmui-btns").hide();
			//编辑按钮显示出来
			$(this).parents(".list").find(".edit").show();
		});
		//保存事件
		$("#contentbox").find(".save").click(function(){
			//获取name的对象
			var $name = $(this).parents(".list").find(".name");	
			//获取文本框的内容
			var newValue = $(this).parents(".list").find(".itemvalue").val();
			//获取元素的标题
			var title = $name.attr("title");
			//这里如点击保存的时候如果没有发生任何的变化执行取消事件.
			if(newValue!="" && title == newValue){
				//trigger事件触发
				 $(this).parents(".list").find(".cancle").trigger("click");	//触发我们的取消事件
				return;
			}
			if(newValue!="" && newValue.length<100){
				var opid = $(this).data("opid");
				$name.attr("title",newValue).html(newValue);
				alert("您要修改的id是:"+opid+"文件名是:"+newValue);
				//执行一个ajax把新的文件名通过id去修改数据库的信息
				$(this).parents(".list").find(".tmui-btns").hide();
				$(this).parents(".list").find(".edit").show();
			}else{
				alert("请输入文件名称或者文件名不得超过100");
			}
		});
	}
*/	//删除功能函数tm_deleteresourse()
	function tm_deleteresourse(obj){
		var opid = $(obj).data("opid");
		tm_dialoag({content:"您确定删除该文件吗？",callback:function(ok){
			if(ok){
				$.ajax({
					type:"post",
					url:"/tzcloud/service/deleteDao.jsp",
					data:{"id":opid},
					success:function(data){
						var jsonData = data.trim();
						if(jsonData=="success"){
							$(obj).parents(".list").fadeOut("slow",function(){
								$(this).remove;
							});
						}else{
							tm_dialoag({title:"警告",width:340,height:204,content:"非常抱歉，删除操作失败！"});							
						}
					}
				});
			}
		}});
	}
	//批量删除功能函数tm_delresourses()
	function tm_delresourses(){
		var arr = [];
		$("#contentbox").find(".chk:checked").each(function(){
			arr.push($(this).val());
		});
		if(arr.length==0){
			alert("请选择要删除的文件！");
			return;
		}
		tm_dialoag({content:"您确定要批量删除这些文件吗？",callback:function(ok){
			$.ajax({
				type:"post",
				url:"/tzcloud/service/delResourseDao.jsp",
				data:{"ids":arr.toString()},
				success:function(data){
					var jdata = data.trim();
					if(jdata=="success"){
						for(var i = 0; i<arr.length; i++){
							$("#tm-list-"+arr[i]).slideUp("slow",function(){
								$(this).remove();
							});
						}
					}
				}
			});
		}});
	}
	//添加功能函数tm_saveresourse()
	function tm_saveresourse(jdata){
		var name = jdata.name;
		var size = jdata.size;
		var sizeString = jdata.sizeString;
		var newName = jdata.newName;
		var ext = jdata.ext;
		var url = jdata.url;
		var width = 100;
		var height = 80;
		var description = "";
		var folderId = 1;
		var params = {
				"name":name,
				"size":size,
				"sizeString":sizeString,
				"newName":newName,
				"ext":ext,
				"url":url,
				"width":width,
				"height":height,
				"description":description,
				"folderId":folderId
		};
		$.ajax({
			type:"post",
			url:"/tzcloud/service/resourseDao.jsp",
			data:params,
			success:function(data){
				var jsonData = data.trim();
				if(jsonData=="success"){
					var date = new Date();
					$("#contentbox").append("<li class='list' id='tm-list-${resourse.id}' data-opid='${resourse.id }'>"+
							"    <div class='col c1' style='width: 50%;'>"+
					        "    <span class='fl icon'><input type='checkbox' class='chk' name='ridchk' value='${resourse.id }'><img src='images/text.png'></span>"+
					        "    <div class='name fl'><span class='name-text'>"+jdata.name+"</span></div>"+
					        "    </div>"+
					        "    <div class='col' style='width: 16%'>"+jdata.sizeString+"</div>"+
					        "    <div class='col' style='width: 23%'>"+date.format("yyyy-MM-dd HH:mm:ss")+"（"+getTimeFormat(date)+"）</div>"+
					        "    <div class='col buttons' style='width: 10%'>"+
					        "    	<a href='javascript:void(0);' class='edit'><img src='images/edit.png'></a>&nbsp;&nbsp;"+
					        "    	<a href='javascript:void(0); data-opid='${resourse.id}' onclick='tm_deleteresourse(this);'><img src='images/delete.gif'></a>"+
					        "    </div>"+
							"</li>");
							$("#content").height(getClientHeight()-105);
				}else{
					tm_dialoag({title:"添加提示",width:340,height:204,content:"非常抱歉，文件添加失败！"});
				}
			}
		});
	}
	//文件上传
	$.tmUpload({"fileTypes":"*.*",callback:function(data,file){
		var jdata = eval("("+data+")");
		tm_saveresourse(jdata);
	}});
	//分页
	/* function tm_init_page(){ */
	$(".con").pagination(58, {
		num_display_entries : 3, //主体页数
		num_edge_entries : 4,//边缘页数
		current_page : 0,//指明选中页码
		items_per_page : 10, //每页显示多条条
		prev_text : "首页",
		next_text : "尾页",
		showGo:true,//控制是否显示go 页 ,默认是true
		showSelect:true,//控制是否现在下拉框 默认是true
		callback : function(current_page, items_per_page) {//会回传两个参数一个当前页，显示的页数
			alert(current_page+"=====>"+items_per_page);
			tm_load_resourses(current_page,items_per_page);
		}
	});
function tm_load_resourses(pageNo,pageSize){
	$.ajax({
		type:"post",
		url:"/tzcloud/service/search.jsp",
		beforeSend:function(){$("#contentbox").html("<div style='text-align:center;'><img src='images/loading.gif'/></div>");},
		data:{"pageNo":(pageNo*10),"pageSize":pageSize},
		success:function(data){
			var jdata = data.trim();
		    var	jsonData = eval("("+jdata+")");
		    //改进写法
		    var length =jsonData.length;
		    var html = "";
		    for(var i=0;i<length;i++){
		    	html += "<li class='list' id='tm-list-"+jsonData[i].id+"' data-opid='"+jsonData[i].id+"'>"+
				"		<div class='col c1' style='width: 50%;'>"+
		        "        <span class='fl icon'><input type='checkbox' class='chk' name='ridchk' value='"+jsonData[i].id+"'><img src='images/text.png'></span>"+
		         "       <div class='name fl'><span title='"+jsonData[i].name+"' class='name-text'>"+jsonData[i].id+":"+jsonData[i].name+"</span></div>"+
		         "   </div>"+
		         "   <div class='col' style='width: 16%'>"+jsonData[i].sizeString+"</div>"+
		         "   <div class='col' style='width: 23%'>"+jsonData[i].createtime+"</div>"+
		         "   <div class='col buttons' style='width: 10%'>"+
		         "   	<a href='javascript:void(0);' class='edit'><img src='images/edit.png'></a>&nbsp;&nbsp;"+
		         "   	<a href='javascript:void(0);' data-opid='"+jsonData[i].id+"' onclick='tm_deleteresourse(this);'><img src='images/delete.gif'></a>"+
		         "   </div>"+
				"</li>";
		    }
		    $("#contentbox").html(html);
		}
	});
}