var loginTool = {
		
		validator : null,
		contextPath : window.location.pathname,
		
		popUp:function()
		{
			var loginHtml = this.buildHtml();
			$('body').append(loginHtml);
			$('#loginWindow').modal();
			this.addEventListerning();
		},
		
		addEventListerning:function(){
			$('#loginWindow').on('hidden', function () {
		    	$(this).remove();
	        });
		    $('#loginWindow .securityCode').click(function () {
		    	$(this).attr('src', loginTool.contextPath + 'securityCode/get?date='+new Date());
	        });
		    $('#loginWindow .login').click(function () {
		    	$('#loginWindow form').submit();
	        });
		    loginTool.buildValidator();
		},
		
		buildValidator:function(){
				validator = $('#loginWindow form').validate({
				rules : {
					email : {
						required : true,
						email : true
					},
					password : {
						required : true,
						minlength : 6
					},
					code : {
						required : true,
						fixedlength : 4
					}
				},
				submitHandler : function(form) {
					$('#loginWindow .login').attr("disabled",true).html('Loading...');
					$('#loginWindow form').ajaxSubmit({
						dataType : 'xml',
						type : 'post',
						url : loginTool.contextPath + 'user/signIn',
						success : function(xml){
							loginTool.loginSuccessHandler(xml);
						}
					});
				}
			});
		},
		
		loginSuccessHandler:function(xml){
			var $errorItems = $(xml).find("errorItem");
			// login successfully
			if ($errorItems.length > 0) {
				$('#loginWindow .login').attr("disabled",false).html('登录');
				validator.showErrorsInPage($errorItems);
			}
			else{
				$('#loginWindow').modal('hide');
				$.pnotify.defaults.delay = 3000;
				$.pnotify({
					text: $(xml).find('User').children('displayName').text()+'，欢迎回来！',
					history: false,
					opacity: .8
				});
			}
		},
		
		buildHtml:function(){
			var html = '<div class="modal hide fade" id="loginWindow">'+
							'<div class="modal-header">'+
								'<h3 style="color:#FF9900">欢迎登录</h3>'+
							'</div>'+
							'<div class="modal-body">'+
								'<form class="form-horizontal" method="post">'+
									'<div class="control-group warning">'+
										'<label class="control-label">邮箱</label>'+
										'<div class="controls">'+
											'<div class="input-prepend">'+
												'<span class="add-on"><i class="icon-envelope"></i></span>'+
												'<input type="text" name="email" placeholder="邮箱"  style="width:160px"/>'+
											'</div>'+
										'</div>'+
									'</div>'+
									'<div class="control-group warning">'+
										'<label class="control-label">密码</label>'+
										'<div class="controls">'+
											'<div class="input-prepend">'+
												'<span class="add-on"><i class="icon-briefcase"></i></span>'+
												'<input type="password" name="password" placeholder="密码"  style="width:160px"/>'+
											'</div>'+
										'</div>'+
									'</div>'+
//									'<div class="control-group warning">'+
//										'<label class="control-label">验证码</label>'+
//										'<div class="controls">'+
//											'<div class="input-prepend">'+
//												'<span class="add-on"><i class="icon-wrench"></i></span>'+
//												'<input type="text" name="code" placeholder="验证码"  style="width:95px"/>'+
//											'</div> '+
//											'<img class="securityCode" style="cursor:pointer;" src="'+this.contextPath+'securityCode/get?date='+new Date()+'"/>'+
//										'</div>'+
//									'</div>'+
								'</form>'+
							'</div>'+
							'<div class="modal-footer">'+
								'<button class="btn btn-warning login">登录</button>'+
								'<a role="button" class="btn btn-inverse" data-dismiss="modal" aria-hidden="true">关闭</a>'+
							'</div>'+
						'</div>';
			return html;
		}
};