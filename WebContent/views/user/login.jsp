<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.pighouse.server.constants.ModelConstant"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><%=ModelConstant.APP_TITLE %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-responsive.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/base.css" />" rel="stylesheet">

	<!-- Le javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/resources/js/jquery-1.7.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script type="text/javascript">
		$(function(){
			// login button
			$("#loginButton").click(function(){
				$("#signInCredentialVo").submit();
			});
			$("#loginWindow .securityCode").click(function(){
				this.src = "<c:url value="/securityCode/get" />?"+new Date();
			});
		});
	</script>

  </head>
  <body>
  
<jsp:include page="../component/htmlHead.jsp"></jsp:include>

<div class="container" style="padding-top:0px">
		<div class="modal"  style="z-index: -999" id="loginWindow"><!--  style="position:relative;z-index:-999;top:350px" -->
			<div class="modal-header">
				<h3 id="myModalLabel"><img src="<c:url value="/resources/img/logo.png" />" style="width:89px;height:30px"/>欢迎登录</h3>
			</div>
			<div class="modal-body">
				<form:form cssClass="form-horizontal" modelAttribute="signInCredentialVo" method="post">
					<div class="control-group warning">
						<label class="control-label" for="inputEmail">Email</label>
						<div class="controls">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span>
								<input type="text" id="signInName" name="signInName" placeholder="Email"  style="width:160px" value="<c:out value="${signInCredentialVo.signInName}" />">
							</div>
							<form:errors path="signInName" cssClass="alert alert-error font10" />
						</div>
					</div>
					<div class="control-group warning">
						<label class="control-label" for="inputPassword">密码</label>
						<div class="controls">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-briefcase"></i></span>
								<input type="password" id="signInPassword" name="signInPassword" placeholder="密码"  style="width:160px" value="<c:out value="${signInCredentialVo.signInPassword}" />">
							</div>
							<form:errors path="signInPassword" cssClass="alert alert-error font10" />
						</div>
					</div>
					<div class="control-group warning">
						<label class="control-label" for="inputSecurityCode">验证码</label>
						<div class="controls">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-wrench"></i></span>
								<input type="text" id="securityCode" name="securityCode" placeholder="验证码"  style="width:95px"  value="<c:out value="${signInCredentialVo.securityCode}" />">
							</div>
							<img class="securityCode" src="<c:url value="/securityCode/get" />" style="cursor:pointer;"  alt="点击刷新"/>
							<form:errors path="securityCode" cssClass="alert alert-error font10" />
						</div>
					</div>
					<div class="control-group warning">
						<div class="controls">
							<label class="checkbox">
								<input type="checkbox">记住我
							</label>
						</div>
					</div>
				</form:form>
				
			</div>
			<div class="modal-footer">
				<button id="loginButton" class="btn btn-success">登录</button>
				<a role="button" class="btn btn-primary" style="color:white" href="<c:url value="/" />">首页</a>
			</div>
		</div>
</div>
</body>
</html>