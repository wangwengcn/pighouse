<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>照片墙</title>
<!-- Le javascript ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<c:url value="/resources/assets/js/jquery-1.8.2.js" />"></script>
<script src="<c:url value="/resources/assets/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.masonry.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.validate.bootstrap.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.form.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.fancybox.js" />"></script>
<<<<<<< HEAD
<script src="<c:url value="/resources/assets/js/jquery.pnotify.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/topic.op.js" />"></script>
=======
>>>>>>> branch 'master' of https://github.com/wangwengcn/pighouse.git
<script src="<c:url value="/resources/assets/js/jquery.scrollTo-1.4.3.1-min.js" />"></script>
<<<<<<< HEAD
<script src="<c:url value="/resources/assets/js/login.js" />"></script>
=======
<script src="<c:url value="/resources/assets/js/topic.op.js" />"></script>
>>>>>>> branch 'master' of https://github.com/wangwengcn/pighouse.git
<script
	src="<c:url value="/resources/assets/js/bootstrap-fileupload.js" />"></script>
<!-- Le styles -->
<link href="<c:url value="/resources/assets/css/bootstrap.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/jasny-bootstrap.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/waterfall.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/jquery.fancybox.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/assets/css/jquery.pnotify.default.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/jquery.pnotify.default.icons.css" />"
	rel="stylesheet" />
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
	min-width: 920px;
}
img {
  max-width: 900px;
}
</style>
<link href="<c:url value="/resources/assets/css/bootstrap-responsive.css" />"
	rel="stylesheet" />
</head>

<body>
	<jsp:include page="component/head.jsp"></jsp:include>
	<div id="wallpull" class="transitions-enabled centered clearfix">
		
	</div>
	<div class="content-wrapper container">
		<div id="loading" style="text-align:center">
			<img src="<c:url value="/resources/assets/img/loading-small.gif"/>"/>
			<h4>内容载入中……</h4>
		</div>
	</div>
	<script>
		$(function() {
			$("#loading").hide();
			// 初始化
			topicOp.init('<c:url value="/"/>', $('#wallpull'));
			
			
			// load data for page
			$(window).bind('scroll', onScroll);
			
			function onScroll(event) {
			      if(!topicOp.isLoading) {
			        var closeToBottom = ($(window).scrollTop() + $(window).height() > $(document).height() - 100);
			        if(closeToBottom) {
			        	topicOp.loadData();
			        }
			      }
			    };
		});
	</script>
</body>
</html>
