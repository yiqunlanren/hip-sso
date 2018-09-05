<!DOCTYPEhtml>
<%@page pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html  lang="zh_CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录验证中心</title>
<link href="css/authcenter.css" rel="stylesheet" type="text/css" />
</head>
<%String str= request.getParameter("str"); %>
<%String service= request.getParameter("service"); %>
 <script type="text/javascript">
	if(<%=str%>!=null){
		window.top.closeTopModal();
	}
</script>
<!--如果不是登陆后断出，则登陆时跳转到子系统页面-->
 <script type="text/javascript">
	<c:if test="${not empty service}">
	window.location.href = "${service}";
	</c:if>
</script>
 

<body>
<!--<div class="auth_logo">
	<span class="logo"></span><span class="name">中医院集成平台</span>
</div>-->
<div class="auth_content">
  <div class="auth_banner"></div>
  <div class="auth">
       <h5><span></span>恭喜您，登陆成功！</h5>
       <p>欢迎进入数据认证中心……</p>
    </div>
    <div class="clearfix"></div>
  <div class="border_line"></div>
    <div class="jump"><span id="mes">3</span>S后自动跳转</div>
</div>
</body>
<script language="javascript" type="text/javascript">
	var i = 3;
	var intervalid;
	intervalid = setInterval("fun()", 1000);
	function fun() {
	if (i == 0) {
	window.location.href = "http://221.232.157.70:8090/hip-portal/?to=hip-viewer";
	clearInterval(intervalid);
	}
	document.getElementById("mes").innerHTML = i;
	i--;
	}
</script>
</html>
