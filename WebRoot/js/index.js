$(".nav ul li a").click(function(){
	$(this).addClass("hover").siblings().removeClass("hover");
});
//�ı�ul li��hover
var index=0;//��ʼ�����к�ֵ
var Play=null;
$(".button li").mouseover(function(){
	clearInterval(Play);//�����ʱ��Play
	index=$(this).index();//��ȡ��ǰ��������к�
	$(this).addClass("hover").siblings().removeClass("hover");//addClass�Ǹ���ǰ�������hover���ԣ�siblings��ʾ��ȡ�뵱ǰ����ͬ�ȼ��Ķ���
	$("#adv img.Img_list").eq(index).fadeIn().siblings("img.Img_list").fadeOut();//�����кŶ�Ӧ��ͼƬ��ʾ���� fadeIn/fadeOut��ʾ���뵭������Ҳ����ʹ��show/hide��ʾ������ʾ
}).mouseout(function(){
	autoPlay();
});

function autoPlay(){
	//setInterval()��ʱ������ ����������������һ���Ǻ���Ҫʵ�ֵ����� �ڶ�����ʱ�䵥λms
	Play=setInterval(function(){
		index++;
		//if(index>4){index=-1;}
		//else{
		//$(".button li").eq(index).addClass("hover").siblings().removeClass("hover");
		//$("#adv img.Img_list").eq(index).fadeIn().siblings("img.Img_list").fadeOut();
		if(index<5){
			if(index==4){index=-1;}//�ж���������һ��ͼƬʱ�͸ı����кŵ�ֵ  �������Խ�����һ�ŵ���һ��ͼƬ�л�ʱ�����ӳ�ʱ��
			$(".button li").eq(index).addClass("hover").siblings().removeClass("hover");
			$("#adv img.Img_list").eq(index).fadeIn().siblings("img.Img_list").fadeOut();
		}else{index=-1;}
		
	},1000);
}
autoPlay();
