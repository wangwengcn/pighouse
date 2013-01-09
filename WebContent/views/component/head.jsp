<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.pighouse.server.utils.SessionUtil"%>
<%@ page import="com.pighouse.server.domain.User"%>
<%
	User currUser = SessionUtil.getloginUser(request);
%>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container containerWrapper">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="#">Project name</a>
			<div class="nav-collapse collapse">
				<ul class="nav">
					<li class="active"><a href="#">Home</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Dropdown <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="nav-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<div class="navbar-form pull-right">
					<button id="newTopic" class="btn btn-primary">分享</button>
					<button id="loginButton" <%= currUser != null ? "style='display:none'" : "" %> class="btn btn-danger">Sign in</button>
					<div id="myInfo" <%= currUser == null ? "style='display:none'" : "" %> class="btn-group">
		                <button data-toggle="dropdown" class="btn btn-warning dropdown-toggle">
		                	<i class="icon-user icon-white"></i>
		                	<span id="showDisplayName"><%= currUser != null ? currUser.getDisplayName() :"" %></span>
		                	<span class="caret"></span>
		                </button>
		                <ul class="dropdown-menu">
		                  <li><a href="#">我的头像</a></li>
		                  <li class="divider"></li>
		                  <li><a href="<c:url value="/user/logout" />">退出登录</a></li>
		                </ul>
	              </div>
				</div>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>
<div id="popupWindow" class="modal hide fade" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h3 id="popupWindowTitle"></h3>
	</div>
	<div class="modal-body">
		<form id="loginForm" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="email">Email</label>
				<div class="controls">
					<input type="text" name="email" id="email" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">Password</label>
				<div class="controls">
					<input type="password" name="password" id="password" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<label class="checkbox"> <input type="checkbox" />Remember
						me
					</label>
				</div>
			</div>
		</form>
		<form id="newTopicForm" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="email">标题</label>
				<div class="controls">
					<input type="text" name="title" id="title" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">描述</label>
				<div class="controls">
					<textarea name="desc" id="desc"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">图片</label>
				<div class="controls">
					<input type="file" name="picture" id="picture" />
				</div>
			</div>
		</form>
		<form id="loadingForm" class="form-horizontal">
			<div style="max-width: 400px; margin: 0 auto 10px; text-align: center" class="well">
              <img src="<c:url value="/resources/assets/img/loading-50.gif" />"/>
            </div>
		</form>
	</div>
	<div class="modal-footer">
		<button id="loginSubmitButton" class="btn btn-large btn-primary"
			type="submit">提交</button>
	</div>
</div>

<script>
	$(function() {
		// 0:null,1:login,2:new topic
		var windowType = 0;
		// 0:un-login,1:login
		var loginStatus = 0;
		// 登录相关
		var validator = $('#loginForm').validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				password : {
					required : true,
					minlength : 6
				}
			},
			errorClass : 'text-error',
			submitHandler : function(form) {
				showLoading();
				$('#loginForm').ajaxSubmit({
					dataType : 'xml',
					type : 'post',
					url : '<c:url value="/user/signIn" />',
					success : loginSubmitHandler
				});
			}
		});

		$("#loginButton").click(function() {
			windowType = 1;
			popUpWindow();
			$('#loginForm').show();
			validator.resetForm();
			$('#popupWindowTitle').html("Please sign in");
		});

		$("#loginSubmitButton").click(function() {
			if(windowType == 1)
			{
				$('#loginForm').submit();
			}
			else if(windowType == 2)
			{
				$('#newTopicForm').submit();
			}
		});

		// 主题相关
		$("#newTopic").click(function() {
			popUpWindow();
			showLoading();
			$('#popupWindowTitle').html("处理中...");
			$.ajax({
				  type: 'POST',
				  dataType: 'xml',
				  url: '<c:url value="/user/getloginFlag" />?date=' + new Date(),
				  success: function(xml) {
					  		$('#loadingForm').hide();
					  		var result = $(xml).find("result").text();
					  		if(result == 'true')
				  			{
					  			windowType = 1;
					  			$('#popupWindowTitle').html("我要分享");
					  			$('#newTopicForm').show();
				  			}
					  		else
				  			{
					  			windowType = 1;
					  			validator.resetForm();
					  			$('#popupWindowTitle').html("请先登录再发表分享");
					  			$('#loginForm').show();
				  			}
						}
				});
		});
		
		function loginSubmitHandler(xml) 
		{
			var $errorItems = $(xml).find("errorItem");
			if($errorItems.length == 0)
			{
				// 登录成功
				$('#popupWindow').modal("hide");
				$('#loginButton').hide();
				$('#myInfo').show();
				$('#showDisplayName').html($(xml).find("displayName"));
			}
	  		else
			{
	  			$('#loadingForm').hide();
	 			// 显示错误消息
	 			$errorItems.each(function(){
	 				var obj = new Object();
	 				obj[$(this).find("propertyName").text()] = $(this).find("errorMessage").text();
	 				validator.showErrors(obj);
	 			});
			}
		}
		
		function popUpWindow()
		{
			$('#popupWindow').modal();
			$('#loginForm').hide();
			$('#newTopicForm').hide();
			$('#loadingForm').hide();
		}
		
		function showLoading()
		{
			$('#loadingForm').show();
		}

	});
	
</script>