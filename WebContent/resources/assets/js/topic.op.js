var topicOp = {
	/* variables */
	isLoading : false,
	page : 1,
	contextPath: null,
	container: null,
	initial: true,
		
	/* functions */
	init: function(_contextPath, _container)
	{
		this.contextPath = _contextPath;
		this.container = _container;
		this.container.masonry({
			itemSelector : '.item',
			isFitWidth : true
		});
		this.loadData();
	},
	
	loadData: function() 
	{
		if(topicOp.contextPath == null)
			alert("Please init contextPath");
		topicOp.isLoading = true;
        if($("#loading").length > 0)
        	$("#loading").show();
	  	$.ajax({
	        url: topicOp.contextPath + 'topic/getTopics',
	        dataType: 'xml',
	        type : 'post',
	        data: {page: topicOp.page}, // Page parameter to make sure we load new data
	        success: topicOp.onLoadData
	      });
     },
     
     onLoadData: function(datas)
     {
    	topicOp.isLoading = false;
    	topicOp.page++;
    	topicOp.show_topics(datas);
	 },
     
     show_topics: function(topics)
	 {
    	$topics = $(topics).find('topic');
    	if($topics.length == 0)
		{
    		// 没有更多了
		}
    	else
    	{
    		var newElems = "";
    		for(var i=0; i<$topics.length; i++)
			{
    			newElems += topicOp.show_topic($topics[i]);
			}
    		var $newElems = $(newElems);
    		// hide new items while they are loading
    		topicOp.container.append( $newElems );
    		if(initial)
    		{
    			topicOp.container.masonry( 'appended', $newElems, true).resize();
    			initial = false;
    		}
    		else
    			topicOp.container.masonry( 'appended', $newElems, true);
    		$newElems.each(function(){
    			$(this).children(".bigPicture").colorbox({
        			opacity : 0.2,
        			photo:true
        		});
    		});
    	}
    	if($("#loading").length > 0)
        	$("#loading").hide();
	 },
	 
	 show_topic: function(topic)
	 {
		var imgId = $(topic).find("pictures").find("id").text();
		var height = $(topic).find("pictures").find("height").text();
		var width = $(topic).find("pictures").find("width").text();
		var title = $(topic).find("title").text();
		var createUser = $(topic).find("createUser").find("displayName").text();
		if(width > 200)
		{
			height = height*200/width;
			width = 200;
		}
		var newItem = '<div class="thumbnail item">'+
						'<a class="bigPicture" href="'+ topicOp.contextPath + 'topic/getPicture/' + imgId+'" title="'+title+'">'+
			  				'<img style="width: '+width+'px; height:  '+height+'px;" src="'+ topicOp.contextPath + 'topic/getPicture/' + imgId+'"/>'+
			  			'</a>'+
		  			  	'<div class="caption font-size-13" style="padding:0px">'+
							'<h5>'+title+'_'+imgId+'</h5>'+
							'<ul class="rep_list font-size-13">'+
							'<li>'+
								'<p>'+
									'<img src="'+ topicOp.contextPath + 'resources/assets/img/unuser24.jpg' + '">&nbsp;'+
									'<a href="/u/114lcya" target="_blank">'+createUser+'</a>加入分享'+
								'</p>'+
							'</li>'+
							'<li>'+
								'<p>'+
									'<img src="'+ topicOp.contextPath + 'resources/assets/img/unuser24.jpg' + '">&nbsp;'+
									'<a href="/u/114lcya" target="_blank">张三</a>：很漂亮。。'+
								'</p>'+
							'</li>'+
							'<li>'+
								'<p>'+
									'<img src="'+ topicOp.contextPath + 'resources/assets/img/unuser24.jpg' + '">&nbsp;'+
									'<a href="/u/114lcya" target="_blank">李四</a>：我要买一件。。'+
								'</p>'+
							'</li>'+
						'</ul>'+
						'<div class="text-center">'+
							'<a class="btn btn-danger btn-small" href="#"><i class="icon-heart icon-white"></i>&nbsp;喜欢</a>&nbsp;'+
							'<a class="btn btn-primary btn-small" href="#"><i class="icon-pencil icon-white"></i>&nbsp;评论</a>'+
						'</div>'+
		  				'</div>'+
					  '</div>';
		return newItem;
	 }
};