<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet"
	type="text/css" />
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">个人中心</a></li>
			<li><a href="#">修改密码</a></li>
		</ul>
	</div>

	<form>
		<div class="formbody">
			<div class="formtitle">
				<span>修改密码</span>
			</div>

			<ul class="forminfo">
				<li><label>旧密码</label> <input name="oldpsw" id="oxy"
					type="password" class="dfinput" onblur="check()" /> <i id="m1"></i>
				</li>
				<li><label>新密码</label> <input name="newpsw" type="password" id="psw1" readonly="readonly"
					class="dfinput" /> <i>请输入新密码</i></li>
				<li><label>确认密码</label> <input name="chpsw" type="password" id="psw2" readonly="readonly" onblur="checksamepsw()"
					class="dfinput" /> <i>请再次输入新密码</i></li> 
				<li><label>&nbsp;</label> <input name="" type="button" id="bt" disabled="disabled" onclick="changeee()"
					class="btn" value="确认保存" /></li>
			</ul>	

		</div>
	</form>

	<script src="<%=basePath%>js/upload.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery.js">
</script>
	<script>
		function changeee(){
		var psw=$('#psw1').val();
		$.ajax({
		url: 'changpsw',
		data:'psw='+psw+'',
		success: function(data){
		if(data=='success')
		{
		parent.location.href="login.jsp";
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
					url : 'changee',
					data : 'oxy=' + oxy + '',
					success : function(data) {
						if (data == 'ok') {
							$('#m1').html("<font color='green'>√</font>");
							$('#psw1').removeAttr('readonly')
							$('#psw2').removeAttr('readonly')
						}
					},
					error : function() {
						if (data == 'error') {
							$('#m1').html("<font color='green'>×</font>");
						}
						
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
</body>
</html>
