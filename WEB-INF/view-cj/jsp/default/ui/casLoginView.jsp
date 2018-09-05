<!DOCTYPEhtml>

<%@page pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@taglib  prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html lang="zh_CN">
<head>
 <meta charset="UTF-8"/>
   <meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>认证系统-登录中心</title>
<meta name="_csrf"  content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<spring:theme code="standard.custom.css.file" var="customCssFile"/>
<link  rel="stylesheet"  href="<c:url  value="${customCssFile}"/>"/>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

</head>
<body>
	<div class="login_logo">
		<span class="logo"></span><span class="name">中医院集成平台</span>
	</div>
	<div class="login_content">
		<div class="login_banner"></div>
		<div class="login">
			<span class="title">登录</span>
			 <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="false">
				<form:errors path="*" id="msg" cssClass="errors" element="div" htmlEscape="false" />
				<div class="inputName">
					<div class="input_group_prepend">
						<i class="i01"></i>
					</div>
            <c:choose>
                <c:when test="${not empty sessionScope.openIdLocalId}">
                    <strong><c:out value="${sessionScope.openIdLocalId}" /></strong>
                    <input type="hidden" id="username" name="username" value="<c:out value="${sessionScope.openIdLocalId}" />" />
                </c:when>
                <c:otherwise>
                    <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
					<form:input cssClass="required" cssErrorClass="error" name="username" id="username" type="text"
					accesskey="${userNameAccessKey}" path="username" autocomplete="off"
						placeholder="请输入用户名" />
                    
                </c:otherwise>
            </c:choose>
					
				</div>
				<div class="inputPassword">
					<div class="input_group_prepend">
						<i class="i02"></i>
					</div>
					<spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
           <form:password cssClass="required" cssErrorClass="error" id="password" path="password"  accesskey="${passwordAccessKey}" autocomplete="off" placeholder="请输入密码"/>
            <span id="capslock-on" style="display:none;"><p><img src="images/warning.png" valign="top"> <spring:message code="screen.capslock.on" /></p></span>
					
				</div>
				<div class="forget">
					<div class="state">
						<input name="" type="checkbox" id="check1" value="" />
						<label for="check1" style="cursor:pointer;">保持登录状态</label>
					</div>
					<div class="password">
						<a href="#">忘记密码?</a>
					</div>
					<div class="clear"></div>
				</div>
				<div class="loginButtonBox">
					<input type="hidden" name="execution" value="${flowExecutionKey}" />
				    <input type="hidden" name="_eventId" value="submit" />
					<input type="submit" name="submit" value="立即登录" accesskey="l"
						style="width: 2.9rem; height: 0.5rem; background: #2461f6; color: #fff; font-size: 0.16rem; border: none;cursor:pointer;">
					<!-- <span>立即登录</span> -->
					<i class="anticon anticon-swap-right"></i> </input>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>