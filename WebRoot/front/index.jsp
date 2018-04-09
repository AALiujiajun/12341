<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>U闲交易平台</title>
<link rel="stylesheet" type="text/css" href="front/css/index.css">
<link rel="icon" href="front/images/icon.ico">
 <script type="text/javascript" src="front/js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
	
	
	 $(function(){
     var id=${map_front.u_id};
         if(id!=0)
        	{
        		$.ajax({
        		url:"initshuliang",
        		data:"id="+id+"",
        		dataType:'json',
        		success : function(data){
        		var chushouzhong =data[0].chushouzhong;
        		var jiaoyizhuangtai= data[0].jiaoyizhuangtai;
        		var daifahuo =data[0].daifahuo;
        		var daishouhuo= data[0].daishouhuo;
        		var yiqianshou =data[0].yiqianshou;
        		$('#chushouzhong').html(chushouzhong);
        		$('#jiaoyizhuangtai').html(jiaoyizhuangtai);
        		$('#daishouhuo').html(daishouhuo);
        		$('#daifahuo').html(daifahuo);
        		$('#yiqianshou').html(yiqianshou);
        		},
        		error : function(){
        		
        		}
        		});
        	}
    })
	
	
       $(function(){
	    $.ajax({
		    url:'select_front',
		    dataType:'json',
		    success:function(data){
		  	 ajax_dd(data);
		    },
		    error:function(){
		    alert('2'); 
		    }
	    });
    });
    
      function ajax_dd(data)
    {
    var jsd="";
    var st="";
    for(var i=0;i<data.length;i++)
    {
      jsd+=
                "<a href='xiangqing?id="+data[i].id+"' target='_blank'>"+
                    "<img width='160px' height='160px' src='idleimg/"+data[i].idleimg+"'>"+
                   " <span>"+data[i].name+"</span>"+
                "</a>";
                
       st+=
                " <li> "+
                        " <a href='xiangqing?id="+data[i].id+"' target='_blank'> "+
                            " <img width='160px' height='160px' src='idleimg/"+data[i].idleimg+"' alt=''> "+
                            " <span class='section_middle_name'>"+data[i].name+"</span> "+
                             "<span class='section_middle_price'>¥<i>"+data[i].transfer_price+"</i></span> "+
                       "  </a> "+
                       "  </li> "  ;     
    }
    $('#div1').html(jsd);
    $('#div3').html(st);  
    }
    
    
    </script>
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="header_main wrap">
			<h1>
				<a href="#"><img src="front/images/logo-2.png"></a>
			</h1>
			<h2>让你的闲置游起来!</h2>
			<ul class="header_menu clearfix">
				<li><a href="#" class="active">首页</a></li>
				<li><a href="iphone?id=手机">手机二手</a></li>
				<li><a href="#">二手车估价</a></li>

				<li><a href="front/fabu.jsp" target="_blank">发布闲置</a></li>
				<li class="header_wdxz"><a href="#">我是买家</a>
					<ul class="header_xz">
						<li><a href="#">等待发货：<span id="daifahuo">0</span></a></li>
						<li><a href="#">待收货：<span id="daishouhuo">0</span></a></li>
						<li><a href="#">购买记录：<span id="yiqianshou">0</span></a></li>
					</ul></li>
				<li class="header_wdxz"><a href="#">我是卖家</a>
					<ul class="header_xz">
						<li><a href="#" >出售中：<span id="chushouzhong">0</span></a></li>
						<li><a href="#">待发货：<span>0</span></a></li>
						<li><a href="#" >成交记录：<span id="jiaoyizhuangtai">0</span></a></li>
					</ul></li>
				<li class="header_mycenter"><a href="#">个人中心</a>
					<ul class="header_center">
						<li><a href="front/wanshan.jsp">完善个人信息</a></li>
						<li><a href="front/updatepsw.jsp">修改密码</a></li>
						<li><a href="#">我的收藏</a></li>
					</ul></li>
				<li class="quit"><a href="exit_front">退出</a></li>
			</ul>
		</div>
	</div>

	<!-- section1 -->
	<div class="section1 wrap clearfix">
		<ul class="sec1_list">
			<li>
				<div class="shuma"></div> <a href="iphone?id=闲置数码" class="sec1_list_first">闲置数码</a>
				<a href="iphone?id=手机">手机</a> <a href="iphone?id=相机">相机</a> <a href="iphone?id=笔记本">笔记本</a>
			</li>
			<li>
				<div class="muying"></div> <a href="iphone?id=闲置母婴" class="sec1_list_first">闲置母婴</a>
				<a href="iphone?id=童装">童装</a> <a href="iphone?id=宝宝用品">宝宝用品</a> <a href="iphone?id=玩具">玩具</a>
			</li>
			<li>
				<div class="riyong"></div> <a href="iphone?id=家居日用" class="sec1_list_first">家居日用</a>
				<a href="iphone?id=家具">家具</a> <a href="iphone?id=家纺">家纺</a> <a href="iphone?id=日用">日用</a>
			</li>
			<li>
				<div class="jiadian"></div> <a href="iphone?id=影音家电" class="sec1_list_first">影音家电</a>
				<a href="iphone?id=大家电">大家电</a> <a href="iphone?id=小家电">小家电</a> <a href="iphone?id=料理机">料理机</a>
			</li>
			<li>
				<div class="pieshi"></div> <a href="iphone?id=鞋服配饰" class="sec1_list_first">鞋服配饰</a>
				<a href="iphone?id=女鞋">女鞋</a> <a href="iphone?id=箱包">箱包</a> <a href="iphone?id=女装">女装</a> <a href="iphone?id=配饰">配饰</a>
			</li>
			<li>
				<div class="zhubao"></div> <a href="iphone?id=闲置数码" class="sec1_list_first">闲置数码</a>
				<a href="iphone?id=手机">手机</a> <a href="iphone?id=相机">相机</a> <a href="iphone?id=笔记本">笔记本</a>
			</li>

		</ul>

		<!-- 轮播图 -->
		<div class="lunbo">
			<div class="hd">
				<ul>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="lunbo_bd">
				<ul>
					<li><a href="#" target="_blank"><img
							src="front/images/lunbo.jpg" /></a></li>
					<li><a href="#" target="_blank"><img
							src="front/images/lunbo2.jpg" /></a></li>
				</ul>
			</div>
			<a class="prev" href="javascript:void(0)"></a> <a class="next"
				href="javascript:void(0)"></a>
		</div>
		<script type="text/javascript">
			jQuery(".lunbo").slide({
				mainCell : ".lunbo_bd ul",
				effect : "leftLoop",
				autoPlay : true
			});
		</script>
		<!-- 个人中心 -->
		<div class="personal">
			<div class="clearfix">
				<div class="personal_head">
					<img src="front/images/danhuang.png">
				</div>
				<p class="personal_hi">
					Hi，${map_front.u_nickname}<br>这里有更多你感兴趣的！
				</p>
			</div>
			<div class="clearfix">
				<a href="front/login.jsp" class="personal_login" target="_blank">登录</a>
				<a href="front/register.jsp" class="personal_register" target="_blank">注册</a>
			</div>
			<div class="clearfix fabuzhuanma">
				<a href="front/fabu.jsp" target="_blank" class="fabuxianzhi"> <span
					class="fabuxianzhi_top">发布闲置</span> <span
					class="fabuxianzhi_bottom">闲置换钱 快速出手</span>
				</a> <a href="#" class="yijianzhuanma"> <span
					class="yijianzhuanma_top">一键转卖</span> <span
					class="yijianzhuanma_bottom">转卖已买到的宝贝</span>
				</a>
			</div>
		</div>
	</div>
	<!-- 猜你喜欢 -->
	<div class="wrap like">
		<ul class="tabhd clearfix">
			<li class="on">猜你喜欢</li>
			<li>全新闲置</li>
			<li>同城交易</li>
		</ul>
		<div class="tabbd">
			<div id="div1" class="tabc clearfix" style="display:block;">
				<a href="#" target="_blank"> <img src="front/images/ad1.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a>
			</div>
			<div class="tabc clearfix" id="div2">

				<a href="#" target="_blank"> <img src="front/images/ad3.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a>
			</div>
			<div class="tabc clearfix">
				<a href="#" target="_blank"> <img src="front/images/ad2.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a> <a href="#" target="_blank"> <img src="front/images/ad3.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a> <a href="#" target="_blank"> <img src="front/images/ad2.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a> <a href="#" target="_blank"> <img src="front/images/ad3.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a> <a href="#" target="_blank"> <img src="front/images/ad1.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a> <a href="#" target="_blank"> <img src="front/images/ad3.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a> <a href="#" target="_blank"> <img src="front/images/ad2.jpg">
					<span>puma卫衣 男女 春秋款</span>
				</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".tabhd li").click(function() {
				$(".tabhd li").removeClass();
				$(this).addClass("on");
				$(".tabbd .tabc").css("display", "none");
				$(".tabbd .tabc").eq($(this).index()).css("display", "block");
	
			})
		})
	</script>

	<!-- section -->
	<div class="section wrap">
		<h2>
			<a href="#"> 数码控.3C也性感 </a>
		</h2>
		<div class="section_main clearfix">
			<div class="section_left fl">
				<div class="section_left_top">
					<a href="iphone?id=显示器 "> 显示器 </a> <a href="iphone?id=内存"> 内存 </a> <a href="iphone?id=主板"> 主板 </a> <a
						href="iphone?id=硬盘"> 硬盘 </a> <a href="iphone?id=CPU"> CPU </a> <a href="iphone?id=显卡">
						显卡 </a> <a href="iphone?id=平板"> 平板 </a> <a href="iphone?id=无线路由器"> 无线路由器 </a> <a href="iphone?id=笔记本">
						笔记本 </a> <a href="iphone?id=无线鼠标"> 无线鼠标 </a> <a href="iphone?id=充电宝"> 充电宝 </a> <a href="iphone?id=移动硬盘">
						移动硬盘 </a> <a href="iphone?id=数据线"> 数据线 </a>
				</div>
				<div class="section_left_bottom">
					<a href="#"> <img src="front/images/sad.png">
					</a>
				</div>
			</div>
			<div class="section_middle fl">
				<ul class="clearfix" id="div3" >
					<li><a href="#" target="_blank">
							<img src="front/images/smad.jpg" alt=""> <span
							class="section_middle_name">诺基亚c7</span> <span
							class="section_middle_price">¥<i>150</i></span>
					</a></li>
				</ul>
			</div>
			<div class="section_right fl">
				<div class="section_right_part">
					<a href="#" class="section_right_part_img" target="_blank"> <img
						src="front/images/tututu.png">
					</a>
					<h4>戴上耳机，倾听</h4>
					<p>想要暂时告别千篇一律的生活，踏上没有目的的旅途？记得在行囊里捎上自己心爱的耳机和音乐，有了它们，一路上，不寂寞。</p>
				</div>
				<div class="section_right_part">
					<a href="#" class="section_right_part_img" target="_blank"> <img
						src="front/images/tututu2.png">
					</a>
					<h4>戴上耳机，倾听</h4>
					<p>想要暂时告别千篇一律的生活，踏上没有目的的旅途？记得在行囊里捎上自己心爱的耳机和音乐，有了它们，一路上，不寂寞。</p>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div class="footer">
		<ul class="wrap clearfix">
			<li><img src="front/images/footer_03.png" alt=""> <span>卖家实名认证</span>
			</li>
			<li><img src="front/images/footer_05.png" alt=""> <span>支付宝担保交易</span>
			</li>
			<li><img src="front/images/footer_07.png" alt=""> <span>专业团队支撑</span>
			</li>
			<li><img src="front/images/footer_09.jpg" alt=""> <span>官方微博</span>
			</li>
		</ul>
	</div>
	<!-- 底部一堆 -->
	<div class="footer_1 wrap">
		<a href="#" target="_blank">关于我们</a> <a href="#" target="_blank">合作伙伴</a>
		<a href="#" target="_blank">营销中心</a> <a href="#" target="_blank">廉正举报</a>
		<a href="#" target="_blank">联系客服</a> <a href="#" target="_blank">开放平台</a>
		<a href="#" target="_blank">诚征英才</a> <a href="#" target="_blank">联系我们</a>
		<a href="#" target="_blank">网站地图</a> <a href="#" target="_blank">法律声明及隐私权政策</a>
		<a href="#" target="_blank">知识产权</a> <span>1999-<i id="year"></i>
			ujiuye.com 版权所有
		</span>
		<script type="text/javascript">
			var day = new Date();
			var year = day.getFullYear();
			document.getElementById('year').innerHTML = year;
		</script>
	</div>
	<div class="footer_2 wrap">
		<a href="#" target="_blank"><img src="front/images/ft1.gif"></a>
		<a href="#" target="_blank"><img src="front/images/ft_01.jpg"></a>
		<a href="#" target="_blank"><img src="front/images/ft_03.jpg"></a>
		<a href="#" target="_blank"><img src="front/images/ft_05.jpg"></a>
		<a href="#" target="_blank"><img src="front/images/ft_07.jpg"></a>
		<a href="#" target="_blank"><img src="front/images/ft_09.jpg"></a>
		<a href="#" target="_blank"><img src="front/images/ft_11.jpg"></a>
		<a href="#" target="_blank"><img src="front/images/ft_13.jpg"></a>
		<a href="#" target="_blank"><img src="front/images/ft_15.jpg"></a>
	</div>
</body>
</html>
