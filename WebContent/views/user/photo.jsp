<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap, from Twitter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
	<link href="<c:url value="/resources/css/jcrop/jquery.Jcrop.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	
	<!-- for upload button -->
	<link href="<c:url value="/resources/css/fileupload/jquery.fileupload-ui.css" />" rel="stylesheet">
    <style type="text/css">
	body {
		padding-top: 60px;
		padding-bottom: 40px;
	}
    </style>
    <link href="<c:url value="/resources/css/bootstrap-responsive.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/jqueryui/jquery-ui-1.8.23.custom.css" />" rel="stylesheet">
  </head>
  
  <body>
	
    <div class="container">		
		<!-- Main hero unit for a primary marketing message or call to action -->
		<div class="hero-unit">
			<div class="row fileupload-buttonbar">
				<form id="fileupload" action="<c:url value="/photo/upload" />" method="POST" enctype="multipart/form-data">
			        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
						<div class="span7">
							<img src="" id="photoPic"/>
						</div>
			    
			    <div class="span7">
	                <!-- The fileinput-button span is used to style the file input field as button -->
	                <span class="btn btn-success fileinput-button">
	                    <i class="icon-plus icon-white"></i>
	                    <span>选择照片</span>
	                    <input type="file" id="uploadPictures" name="imageFile" multiple>
	                </span>
	                <button class="btn btn-warning" type="submit">
	                	<i class="icon-upload icon-white"></i>上传照片
	                </button>
	                </form>
            </div>
			</div>
			<hr>
			
			<div id="bar" style="display:block">
				<div class="alert alert-info">
  					<span id="fileName">请选择文件</span>
				</div>
				
			</div>
		</div> <!-- /container -->
	</div>
	
	
	<form action="#" method="get">
		<input type="hidden" id="x" name="x" />
		<input type="hidden" id="y" name="y" />
		<input type="hidden" id="w" name="w" />
		<input type="hidden" id="h" name="h" />
	</form>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value="/resources/js/jquery.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/jcrop/jquery.Jcrop.min.js" />"></script>
	<script src="<c:url value="/resources/js/fileupload/jquery.form.js" />"></script>
	<script src="<c:url value="/resources/js/jqueryui/jquery-ui-1.8.23.custom.min.js" />"></script>

	<script language="Javascript">

		$(function(){
			
			// 图片上传
			var bar = $('#bar');
			$('#fileupload').ajaxForm({
			    beforeSend: function() {
			    	$("#fileName").html($("#uploadPictures").val()+"：正在上传"+'<img src="<c:url value="/resources/img/13221811.gif" />');
			        bar.show();
			    },
				complete: function(response) {
					var url = "<c:url value="/photo/get" />?date=" + new Date();
					var jcrop_api;
			        var $dialog = $('<div><div class="jc-dialog"><img src="' + url + '" style="width:50%; height:50%" /></div></div>');
			        $dialog.find('img').Jcrop({},function(){
			          jcrop_api = this;
			          $dialog.dialog({
			            modal: true,
			            title: '头像裁剪',
			            close: function(){ $dialog.remove(); },
			            width: jcrop_api.getBounds()[0]+34,
			            resizable: false,
			            buttons: {
				            "确定": function() {},
							"取消": function() {
								$dialog.remove();
							}
			            }
			          })
			        });
					bar.hide();
				}
			}); 
			
			// for others
		});
		
		function showCoords(c)
	    {
	      $('#x').val(c.x);
	      $('#y').val(c.y);
	      $('#w').val(c.w);
	      $('#h').val(c.h);
	    };

	</script>
  </body>
</html>

</body>
</html>