var topicOp = {
	/* variables */
	isLoading : false,
	page : 1,
	contextPath: null,
	container: null,
	initial: true,
	hasNext: true,
		
	/* functions */
	init: function(_contextPath, _container)
	{
		this.contextPath = _contextPath;
		this.container = _container;
		this.container.masonry({
			itemSelector : '.item',
			isFitWidth : true,
			isAnimated: true
		});
		this.loadData();
	},
	
	loadData: function() 
	{
		if(this.isLoading || !this.hasNext)
		{
			return;
		}
		if(this.contextPath == null)
			alert("Please init contextPath");
		this.isLoading = true;
        if($("#loading").length > 0)
        	$("#loading").show();
	  	$.ajax({
	        url: this.contextPath + 'topic/getTopics',
	        dataType: 'xml',
	        type : 'post',
	        data: {page: this.page}, // Page parameter to make sure we load new data
	        success: this.onLoadData
	      });
     },
     
     onLoadData: function(datas)
     {
    	 this.page++;
    	 topicOp.show_topics(datas);
	 },
     
     show_topics: function(topics)
	 {
    	$topics = $(topics).find('topic');
    	if($topics.length == 0)
		{
    		// 没有更多了
    		this.hasNext = false;
		}
    	else
    	{
    		var newElems = "";
    		for(var i=0; i<$topics.length; i++)
			{
    			newElems += this.show_topic($topics[i]);
			}
    		var $newElems = $(newElems);
    		// hide new items while they are loading
    		this.container.append( $newElems );
    		if(this.initial)
    		{
    			this.container.masonry( 'appended', $newElems, true).resize();
    			this.initial = false;
    		}
    		else
    			this.container.masonry( 'appended', $newElems, true);
    		// 显示大图
    		$('.bigPicture').fancybox({
    			type:'image',
    			openEffect : 'elastic',
				openSpeed  : 'slow',
				closeEffect : 'fade',
				closeSpeed  : 'normal',
				closeClick : true
			});
    	}
    	this.isLoading = false;
    	if($("#loading").length > 0)
        	$("#loading").hide();
	 },
	 
	 show_topic: function(topic)
	 {
		var $topic = $(topic);
		var topicId = $topic.children("id").text();
		var imgId = $topic.children("pictures").children("id").text();
		var height = $topic.children("pictures").children("height").text();
		var width = $topic.children("pictures").children("width").text();
		var title = $topic.children("title").text();
		var createUser = $topic.children("createUser").children("displayName").text();
		if(width > 200)
		{
			height = height*200/width;
			width = 200;
		}
		var newItem = '<div class="thumbnail item">'+
						'<a class="bigPicture" href="'+ this.contextPath + 'topic/getPicture/' + imgId+'" title="'+title+ ' by '+createUser+ '" data-fancybox-group="bigPicture">'+
			  				'<img style="width: '+width+'px; height:  '+height+'px;" src="'+ this.contextPath + 'topic/getPicture/' + imgId+'"/>'+
			  			'</a>'+
		  			  	'<div class="caption font-size-13" style="padding:0px">'+
		  			  		'<table>'+
		  			  			'<tr>'+
		  			  				'<td width="130px">'+
		  			  					'<h5>'+title+'</h5>'+
		  			  				'</td>'+
			  			  			'<td>'+
	  			  						'<img src="'+this.contextPath+'resources/assets/img/heart.png"/>'+
	  			  					'</td>'+
		  			  			'</tr>'+
		  			  		'</table>'+
							'<ul class="rep_list font-size-13">'+
								'<li>'+
									'<p>'+
										'<img src="'+ this.contextPath + 'resources/assets/img/unuser24.jpg' + '">&nbsp;'+
										'<a href="#">'+createUser+'</a>加入分享'+
									'</p>'+
								'</li>'+
								'<li>'+
									'<p>'+
										'<img src="'+ this.contextPath + 'resources/assets/img/unuser24.jpg' + '">&nbsp;'+
										'<a href="#" target="_blank">张三</a>：很漂亮。。'+
									'</p>'+
								'</li>'+
								'<li>'+
									'<p>'+
										'<img src="'+ this.contextPath + 'resources/assets/img/unuser24.jpg' + '">&nbsp;'+
										'<a href="#">李四</a>：我要买一件。。'+
									'</p>'+
								'</li>'+
							'</ul>'+
							'<div class="ilike text-center">'+
								'<button class="btn btn-danger btn-small" onclick="topicOp.add_like('+topicId+')"><i class="icon-heart icon-white"></i>&nbsp;喜欢</button><br>'+
								'<button class="btn btn-primary btn-small" onclick="topicOp.add_comment('+topicId+')" style="margin-top:5px"><i class="icon-pencil icon-white"></i>&nbsp;评论</button>'+
							'</div>'+
							'<div class="input-append dis-n">'+
							    '<textarea id="comment'+topicId+'" style="width:180px;height:40px"/>'+
						    '</div>'+
		  				'</div>'+
					  '</div>';
		return newItem;
	 },
	 
	 add_comment: function(topicId)
	 {
		 var $commentInput = $('#comment'+topicId);
		 $commentInput.parent().show();
		 $commentInput.focus();
		 this.container.masonry().resize();
		 $commentInput.focusout(function(){
			 if($.trim(this.value).length == 0)
			 {
				 $commentInput.parent().hide();
				 topicOp.container.masonry().resize();
			 }
		 });
	 },
	 
	 add_like: function(topicId)
	 {
		 
	 }
};