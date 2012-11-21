<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.pighouse.server.constants.ModelConstant"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link href="<c:url value="/resources/css/base.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/pin.css" />" rel="stylesheet">
	  
	 <!-- Styling for your grid blocks -->
	 <link rel="stylesheet" href="<c:url value="/resources/css/wookmark.css" />">

	<!-- Le javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/resources/js/jquery-1.7.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<style type="text/css">
		html {
		      min-height:101%;
		}
	</style>
  </head>
  <body>
  
	<jsp:include page="component/htmlHead.jsp"></jsp:include>
	
    <div class="content-wrapper container">
	    <div class="navbar" style="margin-bottom:15px">
		    <div class="navbar-inner">
			    <div class="content-wrapper">
				    <a class="brand" href="#">趣图搜索</a>
				        <form class="navbar-form form-search pull-left">
						      	<div class="input-append">
									<input type="text" class="span2 search-query">
									<button type="submit" class="btn"><i class="icon-search"></i></button>
								</div>
					    </form>
			    </div>
		    </div>
	    </div>
    </div>

  <div id="container" class="minWidth700">
    <div id="main" role="main">
      <ul id="tiles">
        <!-- These is where we place content loaded from the Wookmark API -->
      </ul>
    </div>

    <footer>
		<div id="loading"><div><img src="<c:url value="/resources/img/loading-small.gif"/>"/><h4>精彩正在载入……</h4></div></div>
    </footer>
  </div>
   
  
  <!-- Include the plug-in -->
  <script type="text/javascript" src="<c:url value="/resources/js/waterfall/jquery.wookmark.js" />" ></script>
   <script type="text/javascript" src="<c:url value="/resources/js/jquery.masonry.js"  />"></script>
  <script type="text/javascript">
    var handler = null;
    var page = 1;
    var isLoading = false;
    var apiURL = 'http://www.wookmark.com/api/json/popular';
    
    var options = {
      autoResize: true,
      container: $('#tiles'),
      offset: 15, // 每列之间的间距
      itemWidth: 220 //一列总宽度:#tiles li width+2* #tiles li padding
    };
    
    function onScroll(event) {
      if(!isLoading) {
        var closeToBottom = ($(window).scrollTop() + $(window).height() > $(document).height() - 100);
        if(closeToBottom) {
          loadData();
        }
      }
    };
    
    function applyLayout() {
      if(handler) handler.wookmarkClear();
      handler = $('#tiles li');
      handler.wookmark(options);
    };
    
    function loadData() {
      isLoading = true;
	  $("#loading").show();
      $.ajax({
        url: apiURL,
        dataType: 'jsonp',
        data: {page: page}, // Page parameter to make sure we load new data
        success: onLoadData
      });
    };
    
    function onLoadData(data) {
      isLoading = false;
      page++;
      var html = '';
      var i=0, length=data.length, image;
      for(; i<length; i++) {
        image = data[i];
		html += '<li><div class="pin">';
		html += '<div class="ilike">'+
		'<a class="btn btn-danger btn-small" style="margin-bottom:5px"><i class="icon-heart icon-white"></i>&nbsp;<span>收藏</span></a>'+
		'<br><a class="btn btn-small"><i class="icon-comment"></i>&nbsp;<span>评论</span></a></div>';
        // Image tag (preview in Wookmark are 200px wide, so we calculate the height based on that).
        html += '<img src="'+image.preview+'" width="200" height="'+Math.round(image.height/image.width*200)+'">';
        
		html += '<p class="description">好看的美女</p>'+
		
		'<div class="convo attribution clearfix">'+
        '<a class="ImgLink" title="Crystal Seibert" href="/cseibert/">'+
          '<img alt="Profile picture of Crystal Seibert" src="http://media-cache-ec5.pinterest.com/avatars/cseibert_1337063947.jpg">'+
        '</a>'+
        '<p>'+
            '<a href="/cseibert/">天亮说晚安</a> 分享于 <a href="/cseibert/mark-that-off-the-list/">2012-10-10 09：23:15</a>'+
        '</p>'+
    '</div>'+
    '<hr style="margin:0px">'+
      '<div class="colormuted">'+
            '<div comment-id="141441450675021121" class="comment convo clearfix">'+
				'<a class="ImgLink" href="/aneetan/">'+
				'<img alt="Profile picture of Aneeta Nashad" class="profile user_image" src="http://media-cache-ec5.pinterest.com/avatars/aneetan_1337071264.jpg">'+
				'</a>'+
				'<p><a href="/aneetan/">Aneeta Nashad</a><br>很好看</p>'+
            '</div>'+

            '<div class="comment convo clearfix ">'+
				'<a class="ImgLink" href="/SwaggerEpic/">'+
				'<img alt="Profile picture of epic swag" class="profile user_image" src="<c:url value="/resources/img/unRegUser.jpg"/>">'+
				'</a>'+
				'<p><a href="/SwaggerEpic/">天亮说晚安</a><br> thats cool! Follow me</p>'+
            '</div>'+
          '<a class="all comment convo clearfix" href="/pin/141441244516855961/">'+
            '查看全部78条评论...'+
          '</a>'+
        
      '</div>';
        
        html += '</div></li>';
      }
      $('#tiles').append(html);
      applyLayout();
      $("#loading").hide();
	  
    };
    
    function setHeaderWidth(){
		var web_width = $(window).width();
		 var columnWidth = options.offset+options.itemWidth;
		 var columns = Math.floor((web_width+options.offset)/columnWidth);
		 $(".content-wrapper").css("width",columns*columnWidth-options.offset);
	}
  
    
    $( function() {
    	setHeaderWidth();
    	loadData();
		$(window).bind('scroll', onScroll);		
    });
  </script>
</body>
</html>