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
		<h3 id="myModalLabel">Please sign in</h3>
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
					<label class="checkbox"> <input type="checkbox" />
						Remember me
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

<script>
	// 登录相关
	$(function() {
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
					url : '<c:url value="/user/getUser" />',
					success : function(xml) {
						alert($(xml).find("email").text());
					}
				});
			}
		});

		$("#loginButton").click(function() {
			validator.resetForm();
			$('#loginWindow').modal();
		});

		$("#loginSubmitButton").click(function() {
			$('#loginForm').submit();
		});

	});
</script>