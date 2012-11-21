<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.pighouse.server.constants.ModelConstant"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="com.pighouse.server.domain.cache.CommonCache" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pighouse.server.domain.TopicType" %>
<%
	List<TopicType> topicTypes = CommonCache.getAllTopicTypes();
	request.setAttribute("topicTypes", topicTypes);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><%=ModelConstant.APP_TITLE %></title>
    <!-- Le styles -->
    <link href="<c:url value="/resources/css/jquery.fileupload-ui.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-responsive.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/base.css" />" rel="stylesheet">

	<!-- Le javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/resources/js/jquery-1.7.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
  </head>
  <body style="height:0px">
  
	<jsp:include page="../component/htmlHead.jsp"></jsp:include>

	<div class="container" style="padding-top:0px;height:0px">
		<div class="modal" style="z-index: -999">
			
				<div class="modal-header">
					<h3 id="myModalLabel">我要分享</h3>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="span3">
							<form:form modelAttribute="addNewTopicVo" method="post">
								<div class="control-group">
									<label class="control-label">标题</label>
								    <div class="controls">
								    	<input type="text" id="title" name="title" value="请输入标题" />
								    </div>
								</div>
								<div class="control-group">
								    <label class="control-label">分类</label>
								    <div class="controls">
								    	<select name="topicType">
								    		<c:forEach items="${topicTypes}" var="topic">
										  		<option value="${topic.code}">${topic.name}</option>
											</c:forEach>
										</select>
								    </div>
							    </div>
								<div class="control-group">
								    <label class="control-label">简介</label>
								    <div class="controls">
								    	<textarea rows="3" name="desc"></textarea>
								    </div>
							    </div>
							    <input type="hidden" name="picName"/>
							</form:form>
						    <div class="control-group">
						    	<form id="photoupload" action="<c:url value="/photo/upload"/>" method="post">
								    <div class="controls">
								    	<span class="btn btn-success fileinput-button">
						                    <i class="icon-plus icon-white"></i>
						                    <span>选择照片</span>
						                    <input type="file" id="picture" name="imageFile" multiple>
						                </span>
								    </div>
							    </form>
						    </div>
						</div>
						<div class="span2">
						    <div class="control-group">
						    	<label class="control-label">&nbsp;</label>
							    <div class="controls" style="width:210px">
							    	<div style="border:1px dashed #000;width:210px;height:210px">
							    	</div>
							    </div>
						    </div>
						    <div class="control-group">
						    	<label class="control-label">&nbsp;</label>
							    <div class="controls" style="width:210px">
							    	<div id="alertMessage" class="alert alert-error">
							    		请输入标题，并选择图片
							    	</div>
							    </div>
						    </div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" id="addNewTopicVoCommit">提交</button>
				</div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/jquery.form.js"/>"></script>
	<script type="text/javascript">
 		$(function(){
 			$("#alertMessage").hide();
 			$("#addNewTopicVoCommit").click(function(){
 				$("#alertMessage").hide();
 				if($("#title").val().length == 0 || $("#picture").val().length == 0)
				{
					$("#alertMessage").show();
					return false;
				}else{
					var fileType = $(this).val().substring($(this).val().lastIndexOf(".") + 1);
					$("#addNewTopicVo").attr("action","<c:url value="/topic/add" />");
					$("#addNewTopicVo").submit();
				}
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
 		
			$('#picture').change(function(){
				$("#photoupload").submit();
			});
 		});
	</script>
</body>
</html>