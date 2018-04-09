<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>U闲交易平台</title>
    	<link rel="stylesheet" type="text/css" href="front/css/register.css">
    <link rel="icon" href="front/images/icon.ico">
     <script type="text/javascript" src="front/js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
	
		function changeee(){
		var psw=$('#psw1').val();
		$.ajax({
		url: 'updatepsw_front',
		data:'psw='+psw+'',
		success: function(data){
		if(data=='success')
		{
		parent.location.href="front/login.jsp";
		}
		else
		{
		alert("修改失败");
		}
		},
		});
		}
		function check() {
			var oxy = $('#oxy').val();
			$.ajax(
				{
					url : 'check_front',
					data : 'oxy=' + oxy + '',
					success : function(data) {
						if (data == 'ok') {
							$('#m1').html("<font color='green'>√</font>");
							$('#psw1').removeAttr('readonly')
							$('#psw2').removeAttr('readonly')
						}
						else
						{
						$('#m1').html("<font color='red'>×</font>");
						}
					},
					error : function() {
					
						
					}
				});
		}
		function checksamepsw(){
		var psw1=$('#psw1').val();
		var psw2=$('#psw2').val();
		if(psw1==psw2)
		{
		$('#bt').removeAttr('disabled');
		}
		else
		{
		alert("密码不一致");
		}
		}
	
	</script>
</head>
<body>
    <!-- header -->
    <div class="header">
        <div class="header_main wrap">
            <h1><a href="#"><img src="front/images/logo-2.png"></a></h1>
            <h2>让你的闲置游起来!</h2>
            <ul class="header_menu clearfix">
                <li><a href="front/index.jsp" target="_blank">首页</a></li>
                <li><a href="#">手机二手</a></li>
                <li><a href="#">二手车估价</a></li>
                <li><a href="#">降降降</a></li>
                <li><a href="publish" target="_blank">发布闲置</a></li>
                <li class="header_wdxz">
                    <a href="#">我的闲置</a>
                    <ul class="header_xz">  
                        <li><a href="#">出售中：<span>0</span></a></li>  
                        <li><a href="#">交易中：<span>0</span></a></li>  
                        <li><a href="#">新留言：<span>0</span></a></li>
                        <li><a href="#">新会话：<span>0</span></a></li>    
                    </ul> 
                </li>
                <li class="header_mycenter">
                    <a href="#" class="active">个人中心</a>
                    <ul class="header_center">  
                        <li><a href="front/wanshan.jsp">完善个人信息</a></li>  
                        <li><a href="front/updatepsw.jsp">修改密码</a></li>  
                        <li><a href="#">我的收藏</a></li>  
                    </ul> 
                </li>
                <li class="quit"><a href="front/exit_front">退出</a></li>
            </ul>
        </div>
    </div> 
    
    <!-- 注册 -->
    <div class="register">
        <form  id="bdyz">
            <div class="tel clearfix">
                <span>原密码</span>
                <input type="text" id="oxy"  onblur="check()" name="phone_front" id="txt1">
               <i id="m1"></i> 
            </div> 
             <div class="tel clearfix">
                <span>新密码</span>
                <input type="text" id="psw1" readonly="readonly" name="oldpsw_front">
                <i id="txt2"></i>
            </div>
             <div class="tel clearfix">
                <span>确认密码</span>
                <input type="text" readonly="readonly" onblur="checksamepsw()" id="psw2" name="newpsw_front">
                <i id="txt2"></i>
            </div>
            <div class="tel clearfix">
                <span></span>
                <input type="button" id="bt" onclick="changeee()" disabled="disabled" value="修改" class="sub">
            </div>
        </form>
        <script>
            window.onload = function()
            {
                var oTxt = document.getElementById('txt1');
                var input = document.getElementById("txt1");

                input.onblur = function()
                {

                    var re =/^[1][3,4,5,7,8][0-9]{9}$/; 
                    if( re.test(oTxt.value) )
                    {
                        var oText = document.getElementById('text2');
                        oText.removeAttribute("disabled");  
                    }
                    else
                    {
                        document.getElementById('txt2').innerHTML="请输入正确的手机号";
                    };


                };

            };

        </script>
    </div>
    <!-- footer -->
    <div class="footer">
        <ul class="wrap clearfix">
            <li>
                <img src="front/images/footer_03.png" alt="">
                <span>卖家实名认证</span>
            </li>
            <li>
                <img src="front/images/footer_05.png" alt="">
                <span>支付宝担保交易</span>
            </li>
            <li>
                <img src="front/images/footer_07.png" alt="">
                <span>专业团队支撑</span>
            </li>
            <li>
                <img src="front/images/footer_09.jpg" alt="">
                <span>官方微博</span>
            </li>
        </ul>
    </div>
    <!-- 底部一堆 -->
    <div class="footer_1 wrap">
        <a href="#" target="_blank">关于我们</a>
        <a href="#" target="_blank">合作伙伴</a>
        <a href="#" target="_blank">营销中心</a>
        <a href="#" target="_blank">廉正举报</a>
        <a href="#" target="_blank">联系客服</a>
        <a href="#" target="_blank">开放平台</a>
        <a href="#" target="_blank">诚征英才</a>
        <a href="#" target="_blank">联系我们</a>
        <a href="#" target="_blank">网站地图</a>
        <a href="#" target="_blank">法律声明及隐私权政策</a>
        <a href="#" target="_blank">知识产权</a>
        <span>1999-<i id="year"></i> ujiuye.com 版权所有</span>
        <script type="text/javascript">
            var day = new Date();
            var year = day.getFullYear();
            document.getElementById('year').innerHTML=year;
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
