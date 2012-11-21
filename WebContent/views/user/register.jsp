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
		$("#regButton").click(function(){
			$("#signUpCredentialVo").submit();
		});
		$("#regWindow .securityCode").click(function(){
			this.src = "<c:url value="/securityCode/get" />?"+new Date();
		});
	});
</script>
</head>
  <body style="height:0px">
  
<jsp:include page="../component/htmlHead.jsp"></jsp:include>

<div class="container">
	<div class="modal"  style="z-index: -999" id="regWindow"><!--  style="position:relative;z-index:-999;top:350px" -->
		<div class="modal-header">
			<h3 id="myModalLabel">欢迎成为<%=ModelConstant.APP_NAME %>会员</h3>
		</div>
		<c:choose> 
			<c:when test="${empty regSuccessUser}"> 
				<div class="modal-body">
					<form:form cssClass="form-horizontal" modelAttribute="signUpCredentialVo" method="post">
						<div class="control-group warning">
							<label class="control-label">Email</label>
							<div class="controls">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-envelope"></i></span>
									<input type="text" name="signUpUserName" 
										placeholder="Email"  style="width:160px" value="<c:out value="${signUpCredentialVo.signUpUserName}" />">
								</div>
								<form:errors path="signUpUserName" cssClass="alert alert-error font10" />
							</div>
						</div>
						<div class="control-group warning">
							<label class="control-label">昵称</label>
							<div class="controls">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-envelope"></i></span>
									<input type="text" name="displayName" 
										placeholder="昵称"  style="width:160px" value="<c:out value="${signUpCredentialVo.displayName}" />">
								</div>
								<form:errors path="displayName" cssClass="alert alert-error font10" />
							</div>
						</div>
						<div class="control-group warning">
							<label class="control-label">密码</label>
							<div class="controls">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-briefcase"></i></span>
									<input type="password" name="signUpPassword" 
										placeholder="密码"  style="width:160px" value="<c:out value="${signUpCredentialVo.signUpPassword}" />">
								</div>
								<form:errors path="signUpPassword" cssClass="alert alert-error font10" />
							</div>
						</div>
						<div class="control-group warning">
							<label class="control-label">重复密码</label>
							<div class="controls">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-briefcase"></i></span>
									<input type="password" name="reSignUpPassword" 
										placeholder="重复密码"  style="width:160px" value="<c:out value="${signUpCredentialVo.reSignUpPassword}" />">
								</div>
								<form:errors path="" cssClass="alert alert-error font10" />
							</div>
						</div>
						<div class="control-group warning">
							<label class="control-label">验证码</label>
							<div class="controls">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-wrench"></i></span>
									<input type="text" name="securityCode" 
										placeholder="验证码"  style="width:95px"  value="<c:out value="${signUpCredentialVo.securityCode}" />">
								</div>
								<img class="securityCode" alt="点击刷新" src="<c:url value="/securityCode/get" />" style="cursor:pointer;left:0"/>
								
								<form:errors path="securityCode" cssClass="alert alert-error font10" />
							</div>
						</div>
					</form:form>
				</div>
				<div class="modal-footer">
					<button id="regButton" class="btn btn-success">注册</button>
					<a role="button" class="btn btn-primary" href="<c:url value="/" />">首页</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="modal-body">
					注册成功，3秒后自动回到<a href="<c:url value="/" />">首页</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div> <!-- /container -->
</body>
</html>