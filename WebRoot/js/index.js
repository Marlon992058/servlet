$(".nav ul li a").click(function(){
	$(this).addClass("hover").siblings().removeClass("hover");
});
//改变ul li的hover
var index=0;//初始化序列号值
var Play=null;
$(".button li").mouseover(function(){
	clearInterval(Play);//清除定时器Play
	index=$(this).index();//获取当前对象的序列号
	$(this).addClass("hover").siblings().removeClass("hover");//addClass是个当前对象添加hover属性，siblings表示获取与当前对象同等级的对象
	$("#adv img.Img_list").eq(index).fadeIn().siblings("img.Img_list").fadeOut();//将序列号对应的图片显示出来 fadeIn/fadeOut表示淡入淡出这里也可以使用show/hide表示立刻显示
}).mouseout(function(){
	autoPlay();
});

function autoPlay(){
	//setInterval()定时器函数 他有两个参数：第一个是函数要实现的内容 第二个是时间单位ms
	Play=setInterval(function(){
		index++;
		//if(index>4){index=-1;}
		//else{
		//$(".button li").eq(index).addClass("hover").siblings().removeClass("hover");
		//$("#adv img.Img_list").eq(index).fadeIn().siblings("img.Img_list").fadeOut();
		if(index<5){
			if(index==4){index=-1;}//判断如果是最后一张图片时就改变序列号的值  这样可以解决最后一张到第一张图片切换时两倍延长时间
			$(".button li").eq(index).addClass("hover").siblings().removeClass("hover");
			$("#adv img.Img_list").eq(index).fadeIn().siblings("img.Img_list").fadeOut();
		}else{index=-1;}
		
	},1000);
}
autoPlay();
