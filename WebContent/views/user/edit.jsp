<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.pighouse.server.constants.ModelConstant"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title><%=ModelConstant.APP_TITLE %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="<c:url value="/resources/css/jquery.Jcrop.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-responsive.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/base.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/docs.css"/>" rel="stylesheet">

    <style type="text/css">
	body {
		padding-top: 60px;
		padding-bottom: 40px;
	}
    </style>
  </head>

  <body>
	
	<jsp:include page="../component/htmlHead.jsp"></jsp:include>
    
	<div class="container">
	     <div class="row">
	     	<div class="span3 bs-docs-sidebar">
		        <ul id="headNav" class="nav nav-list bs-docs-sidenav affix-top" style="margin:0 0 0 0;">
			         <li><a href="#">我的资料<i class="icon-user"></i></a></li>
			         <li target="info-basic" class="active"><a href="#">基本信息<i class="icon-chevron-right"></i></a></li>
		             <li target="info-photo"><a href="#">修改头像<i class="icon-chevron-right"></i></a></li>
		             <li target="info-pwd"><a href="#">修改密码<i class="icon-chevron-right"></i></a></li>
		        </ul>
		   </div>
	        
			<div class="span3">
				<div class="customerModal1" id="info-basic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<form id="basicInfo" action="<c:url value="/user/setting/basic"/>" method="POST" enctype="multipart/form-data" class="form-horizontal">
						<div class="modal-header">
							<h4 id="myModalLabel">基本信息</h4>
						</div>
						<div class="modal-body">
						    <div class="control-group">
							    <label class="control-label" for="inputEmail">Email</label>
							    <div class="controls">
							    	<span class="uneditable-input">wangwengcn@163.com</span>
							    </div>
							</div>
						    <div class="control-group">
							    <label class="control-label" for="inputPassword">昵称</label>
							    <div class="controls">
							    	<input type="text" name="displayName">
							    </div>
						    </div>
						    <div class="control-group">
							    <label class="control-label" for="inputPassword">生日</label>
							    <div class="controls">
							    	<input type="text" name="birthday">
							    </div>
							    <div class="controls">(填写生日会有意想不到的惊喜哦)</div>
						    </div>
						    <div class="control-group">
						    	<label class="control-label" for="inputPassword">性别</label>
							    <div class="controls">
								    <label class="radio">
										<input type="radio" name="sex" value="男" checked>帅哥
									</label>
									<label class="radio">
										<input type="radio" name="sex" value="女">美女
									</label>
							    </div>
						    </div>
						    <div class="control-group">
							    <label class="control-label" for="inputEmail">上次登录</label>
							    <div class="controls">
							    	<span class="uneditable-input">2012-09-21 12:56:53</span>
							    </div>
							</div>
							<div class="control-group">
							    <label class="control-label" for="inputEmail">注册时间</label>
							    <div class="controls">
							    	<span class="uneditable-input">2012-07-21 09:23:15</span>
							    </div>
							</div>
						</div>
						<div class="modal-footer">
							<button id="picSave" class="btn btn-primary">保存</button>
						</div>
					</form>
				</div>
				   
				<div style="display:none" class="customerModal1" id="info-photo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<form id="photoupload" action="<c:url value="/photo/upload"/>" method="POST" enctype="multipart/form-data">
						<div class="modal-header">
							<h4 id="myModalLabel">修改头像</h4>
						</div>
						<div class="modal-body">
							<div id="photoContainer" style="width:525px;height:400px;background-color:gray;">
							</div>
						</div>
						<div class="modal-footer">
							<span class="btn btn-success fileinput-button">
			                    <i class="icon-plus icon-white"></i>
			                    <span>选择照片</span>
			                    <input type="file" id="uploadPictures" name="uploadPictures" multiple>
			                </span>
							<button id="picSave" class="btn btn-primary">保存</button>
						</div>
					</form>
				</div>
				  
				<div style="display:none" class="customerModal1" id="info-pwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<form id="pwd" action="<c:url value="/user/setting/pwd"/>" method="POST" enctype="multipart/form-data" class="form-horizontal">
						<div class="modal-header">
							<h4 id="myModalLabel">修改密码</h4>
						</div>
						<div class="modal-body">
							<div class="control-group">
							    <label class="control-label" for="inputEmail">Email</label>
							    <div class="controls">
							    	<span class="uneditable-input">wangwengcn@163.com</span>
							    </div>
							</div>
						    <div class="control-group">
							    <label class="control-label" for="inputPassword">原密码</label>
							    <div class="controls">
							    	<input type="password" id="inputPassword">
							    </div>
						    </div>
						    <div class="control-group">
							    <label class="control-label" for="inputPassword">新密码</label>
							    <div class="controls">
							    	<input type="password" id="inputPassword">
							    </div>
						    </div>
						    <div class="control-group">
							    <label class="control-label" for="inputPassword">重复新密码</label>
							    <div class="controls">
							    	<input type="password" id="inputPassword">
							    </div>
						    </div>
						</div>
						<div class="modal-footer">
							<button type="submit" id="picSave" class="btn btn-primary">保存</button>
						</div>
					</form>
				</div>
	    	</div>
	    	
    	</div>
	</div>
	<form id="finalPicForm" action="#" method="get">
		<input type="hidden" id="x" name="x" />
		<input type="hidden" id="y" name="y" />
		<input type="hidden" id="w" name="w" />
		<input type="hidden" id="h" name="h" />
	</form>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value="/resources/js/jquery-1.7.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.Jcrop.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.form.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.imagesloaded.js"/>"></script>

	<script>

		$(function(){
			
			$('#headNav li[target]').click(function(){
				setTab(this);
			});
			
			// 图片上传
			$('#photoupload').ajaxForm({
				dataType:'xml',
				success: function(data) {
				    $xml = $( data ),
				    $result = $xml.find( "result" );
					if($result.text() == "OK")
					{
						showPictrueWindow();
					}else{
						alert($result.text());
					}
				}
			});
			
			$('#uploadPictures').change(function(){
				$("#photoupload").submit();
				$(".alert-error").hide();
			});
			
			$('#picSave').click(function(){
				if($('#x').val().length == 0)
				{
					alert("请编辑您选择的图片");
				}else{
					alert("left:"+$('#x').val()+" "+"width:"+$('#w').val());
				}
				return false;
			});
		});
		
		var jcrop_api;
		function showPictrueWindow()
		{
			var picUrl = '<c:url value="/photo/get?"/>'+new Date().getTime();
			if($("#photoContainer img").length == 0)
			{
				var $pic = $('<img src="'+picUrl+'" />');
		        $("#photoContainer").html($pic);
		        $pic.Jcrop(
	           		{
	   					aspectRatio: 1,
	   					onChange: showCoords,
	   					minSize:[192,192],
	   					setSelect:[1,1,193,193]
	   				},function(){
	   					jcrop_api = this;
			     });
			}
			else
			{
				jcrop_api.setImage(picUrl);
				jcrop_api.setSelect([1,1,193,193]);
			}
   		    return false;
		}
		function showCoords(c)
	    {
	      $('#x').val(c.x);
	      $('#y').val(c.y);
	      $('#w').val(c.w);
	      $('#h').val(c.h);
	    };
	    
	    function setTab(li)
	    {
	    	$('#headNav li').removeClass("active");
			$(li).addClass("active");
			$(".customerModal1").hide();
			$("#"+$(li).attr("target")).show();
	    }
		
	    
	</script>
	
  </body>
</html>
