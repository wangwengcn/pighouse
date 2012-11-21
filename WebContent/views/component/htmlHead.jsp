<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.pighouse.server.constants.ModelConstant"%>
<%@ page import="com.pighouse.server.domain.TopicType"%>
<%@ page import="com.pighouse.server.domain.cache.CommonCache"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	List<TopicType> topicTypes = CommonCache.getAllTopicTypes();
	request.setAttribute("topicTypes", topicTypes);
%>
  <div class="navbar  navbar-fixed-top">
      <div class="navbar-inner">
		<div class="container content-wrapper">
		  <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
		  <a class="brand" href="<c:url value="/" />"><strong><%=ModelConstant.APP_NAME %></strong></a>
		  
		  <ul class="nav" role="navigation">
			<li class="dropdown">
			  <a id="drop1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"><span>类型</span> <b class="caret"></b></a>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
					<c:forEach items="${topicTypes}" var="topic">
				  		<li><a tabindex="-1" href="${topic.code}">${topic.name}</a></li>
					</c:forEach>
			  </ul>
			</li>
			<li class="dropdown">
			  <a href="#" id="drop2" role="button" class="dropdown-toggle" data-toggle="dropdown"><span>范围</span><b class="caret"></b></a>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="drop2">
				<li><a tabindex="-1" href="#">全国</a></li>
			  </ul>
			</li>
		  </ul>
		  
		  <ul class="nav pull-right">
            <div class="btn-toolbar" style="margin: 0;">
            	<div class="btn-group">
            		<a role="button" class="btn btn-primary" href="<c:url value="/topic/add" />">我要分享</a>
            	</div>
            	<c:choose> 
					<c:when test="${empty loginUser}"> 
		              <div class="btn-group">
						<a href="<c:url value="/user/register" />" id="regTrigger" class="btn btn-danger white" data-toggle="modal">注册</a>
		              </div>
		              <div class="btn-group">
		                <a href="#" id="loginTrigger" class="btn btn-success white" data-toggle="modal">登录</a>
		              </div>
              		</c:when>
              		<c:otherwise>
              			<div class="btn-group">
			                <button class="btn btn-info"><i class="icon-user icon-white"></i>${loginUser.displayName}</button>
			                <button class="btn btn-info dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
			                <ul class="dropdown-menu">
			                  <li><a href="#">我的粉丝</a></li>
			                  <li><a href="#">我的评论</a></li>
							  <li><a href="<c:url value="/user/edit" />">修改密码</a></li>
			                  <li><a href="<c:url value="/user/edit" />">修改头像</a></li>
			                </ul>
			             </div><!-- /btn-group -->
              		</c:otherwise> 
              </c:choose>
              
			  <div class="btn-group">
                <button class="btn btn-warning">About</button>
                <button class="btn btn-warning dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu" width="100">
                  <li><a href="#">关于我们</a></li>
                  <li><a href="#">开发动态</a></li>
                  <li class="divider"></li>
                  <li><a href="#">帮助</a></li>
				  <li><a href="#">反馈</a></li>
                </ul>
              </div><!-- /btn-group -->
              <c:choose> 
	              <c:when test="${!empty loginUser}"> 
		              <div class="btn-group">
		              		<a role="button" class="btn"  href="<c:url value="/user/logout" />">退出登录</a>
		              </div><!-- /btn-group -->
	             </c:when>
	          </c:choose>
		  </ul>
		</div>
      </div>
    </div>
    <c:choose> 
		<c:when test="${empty loginUser}">
			<!-- Login Window -->
			<div class="modal hide fade" aria-hidden="false" id="loginWindow">
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
								<img class="securityCode" style="cursor:pointer;"  alt="点击刷新"/>
								<form:errors path="securityCode" cssClass="alert alert-error font10" />
							</div>
						</div>
						<div class="control-group warning">
							<div class="controls">
								<label class="checkbox">
									<input type="checkbox">记住我  &nbsp; &nbsp; &nbsp; &nbsp;没有帐号？<a href="<c:url value="/user/register" />">注册</a>
								</label>
							</div>
						</div>
					</form:form>
				</div>
				<div class="modal-footer">
					<button id="loginButton" class="btn btn-success">登录</button>
					<a role="button" class="btn btn-primary" aria-hidden="true" data-dismiss="modal" style="color:white" href="#">关闭</a>
				</div>
			</div>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	  </c:choose>
	  <script type="text/javascript">
		$(function(){
			$(".securityCode").click(function(){
				this.src = "<c:url value="/securityCode/get" />?"+new Date();
			});
			$("#loginTrigger").click(function(){
				$("#loginWindow .securityCode").attr("src","<c:url value="/securityCode/get" />?"+new Date());
				$("#loginWindow").modal();
			});
			$("#loginButton").click(function(){
				$("#signInCredentialVo").attr("action","<c:url value="/user/login" />");
				$("#signInCredentialVo").submit();
			});
		});
	</script>