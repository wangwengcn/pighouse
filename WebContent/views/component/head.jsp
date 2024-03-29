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
		<div class="container containerWrapper" style="min-width: 920px;">
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
					<button id="loginButton"
						<%=currUser != null ? "style='display:none'" : ""%>
						class="btn btn-danger">登录</button>
					<div id="myInfo"
						<%=currUser == null ? "style='display:none'" : ""%>
						class="btn-group">
						<button data-toggle="dropdown"
							class="btn btn-success dropdown-toggle">
							<i class="icon-user icon-white"></i> <span id="showDisplayName"><%=currUser != null ? currUser.getDisplayName() : ""%></span>
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
		</form>
		<form id="newTopicForm" class="form-horizontal" enctype="multipart/form-data">
			<div class="control-group">
				<label class="control-label" for="email">标题</label>
				<div class="controls">
					<input type="text" name="title" id="title" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">描述</label>
				<div class="controls">
					<textarea name="descript" id="descript"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">图片</label>
				<div class="controls">
					<div id="picFile" class="fileupload fileupload-new" data-provides="fileupload">
						<div class="fileupload-preview thumbnail" style="width: 200px; height: 150px;">
							<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image" />
						</div>
						<div>
							<div class="btn btn-file">
								<div class="fileupload-new">选择</div>
								<div class="fileupload-exists">更改</div>
								<input id="picture" name="picture" type="file" />
							</div> 
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<!-- 
		<div class="alert alert-warning">
			<strong>注意!</strong>图片预览仅在FireFox和IE10+可用.
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		 -->
		<img id="loadingForm" src="<c:url value="/resources/assets/img/loading-50.gif" />" />
		<button class="btn btn-large" data-dismiss="modal" aria-hidden="true">关闭</button>
		<button id="popupSubmitButton" class="btn btn-large btn-primary"
			type="submit">提交</button>
	</div>
</div>
<script>
	$(function() {
		
		$('#loginButton').click(function(){
			loginTool.popUp();
		});
		
		// 提交按钮点击事件
		$("#popupSubmitButton").click(function() {
			if (windowType == 1) {
				$('#loginForm').submit();
			} else if (windowType == 2) {
				$('#newTopicForm').submit();
			}
		});
	
		// 分享相关验证
		var topicValidator = $('#newTopicForm').validate({
			rules : {
				title : {
					required : true,
					maxlength : 10
				},
				picture : {
					required : true,
					image : true
				}
			},
			errorClass : 'text-error',
			submitHandler : function(form) {
				if($('#picture').val().length == 0)
				{
					var obj = new Object();
					obj["picture"] = "请选择合法的图片格式";
					topicValidator.showErrors(obj);
				}
				else
				{
					showLoading();
					$('#newTopicForm').ajaxSubmit({
						dataType : 'xml',
						type : 'post',
						url : '<c:url value="/topic/add" />',
						success : topicSubmitHandler
					});
				}
			}
		});
		
		// 新增分享返回结果处理方法
		function topicSubmitHandler(xml) {
			var $errorItems = $(xml).find("errorItem");
			if ($errorItems.length == 0) {
				// 分享成功
				$('#popupWindow').modal("hide");
				var $newItem = topicOp.show_topic($(xml).find('topic'));
				$('#wallpull').prepend( $newItem ).masonry( 'reload' );
				// 查看大图
				$newItem.children(".bigPicture").colorbox({
					opacity : 0.2,
					photo:true
				});
			} else {
				$('#loadingForm').hide();
				// 显示错误消息
				$errorItems.each(function() {
					var obj = new Object();
					obj[$(this).find("propertyName").text()] = $(this).find("errorMessage").text();
					topicValidator.showErrors(obj);
				});
			}
		}

		// 分享按钮点击事件
		$("#newTopic").click(
				function() {
					popUpWindow();
					showLoading();
					$('#popupWindowTitle').html("处理中...");
					$.ajax({
						type : 'POST',
						dataType : 'xml',
						url : '<c:url value="/user/getloginFlag" />?date=' + new Date(),
						success : function(xml) {
							$('#loadingForm').hide();
							var result = $(xml).find("result").text();
							if (result == 'true') {
								windowType = 2;
								$('#popupWindowTitle').html("我要分享");
								topicValidator.resetForm();
								$('#newTopicForm').show();
							} else {
								windowType = 1;
								loginValidator.resetForm();
								$('#popupWindowTitle').html("请先登录再发表分享");
								$('#loginForm').show();
							}
						}
					});
				});
		
		topicValidator.showLabel = function(element, message)
		{
			if(element.name == "picture")
				this.showLabelImpl($('#picFile'), message);
			else
				this.showLabelImpl(element, message);
		};
		
		$('#picture').change(function(){
			topicValidator.form();
		});
		

	});
</script>