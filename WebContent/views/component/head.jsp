<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<button id="loginButton" class="btn btn-primary">Sign in</button>
					<button id="newTopic" class="btn btn-primary">新主题</button>
				</div>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>
<div id="loginWindow" class="modal hide fade" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h3 id="loginWindowLabel"></h3>
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
	</div>
	<div class="modal-footer">
		<button id="loginSubmitButton" class="btn btn-large btn-primary"
			type="submit">Sign in</button>
	</div>
</div>

<div id="newTopicWindow" class="modal hide fade" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h3 id="newTopicWindowLabel">发表主题</h3>
	</div>
	<div class="modal-body">
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
					<input type="text" name="title" id="title" />
				</div>
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
				$('#loginForm').ajaxSubmit({
					dataType : 'xml',
					type : 'post',
					url : '<c:url value="/user/signIn" />',
					success : loginSubmitHandler
				});
			}
		});

		$("#loginButton").click(function() {
			validator.resetForm();
			$('#loginWindowLabel').html("Please sign in");
			$('#loginWindow').modal();
		});

		$("#loginSubmitButton").click(function() {
			$('#loginForm').submit();
		});

		// 主题相关
		$("#newTopic").click(function() {
			$.ajax({
				  type: 'POST',
				  dataType: 'xml',
				  url: '<c:url value="/user/getloginFlag" />?date=' + new Date(),
				  success: function(xml) {
					  		var result = $(xml).find("result").text();
					  		if(result == 'true')
				  			{
					  			$('#newTopicWindow').modal();
				  			}
					  		else
				  			{
					  			$('#loginWindowLabel').html("请先登录再发表新主题");
					  			$('#loginWindow').modal();
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
				alert($(xml).find("email").text());
			}
	  		else
			{
	 			// 显示错误消息
	 			$errorItems.each(function(){
	 				var obj = new Object();
	 				obj[$(this).find("propertyName").text()] = $(this).find("errorMessage").text();
	 				validator.showErrors(obj);
	 			});
			}
		}

	});
	
</script>