<div class="col-md-12 black-p" >
	<!--导航栏左侧按钮，-->
	
	<!--右侧导航栏-->
	<ul class="nav navbar-nav navbar-right moredeep">

		<li><a href="javascript:changepath('/infromlist');" class="green-none"><span
				class="glyphicon glyphicon-bell"></span>
					<span class="badge blue-badge badge-notice"></span>
				</a>
		</li>
		<li><a href="javascript:changepath('/mytask');" class="green-none"><span
				class="glyphicon glyphicon-flag"></span>
					<span class="badge red-badge"></span>
				</a>
		</li>
		<li class="dropdown">
		<!--设置导航栏头像面板--> 
		<a href="#" class="green-none white" data-toggle="dropdown">
				<img src="/images/userimg.jpg" class="user-image" /> <span>苗人凤</span>  <span
				class="glyphicon glyphicon-triangle-bottom"></span>
		</a>
		 <!--设置点击按钮弹出用户面板层-->
			<ul class="dropdown-menu" style="padding:0;">
				<li class="user-header green"><img src="/images/userimg.jpg"
					class="img-circle" style="width: 100px;height:100px;" />
					<p class="white" style="">
						<span>研发部 </span> / <span> 超级管理员</span><br> <small>后台开发人员</small>
					</p></li>
				<li class="user-footer">
					<div class="pull-left">
						<a href="javascript:changepath('userpanel');" class="btn btn-default">用户面板</a>
					</div>
					<div class="pull-right">
						<a href="/login/loginout" class="btn btn-danger">退出登录</a>
					</div>
				</li>
			</ul>
		</li>
		<li style="position: relative;margin-right:50px;"></li>
</ul>
</div>
<script>
	function changeemail(){
		var email=$('.badge-mail').text().trim();
		var emailNum=parseInt(email);
		if(emailNum>1){
			$('.badge-mail').text((emailNum-1));
		}else{
			$('.badge-mail').text("");
		}
	}
	function changeinformation(){
		var email=$('.badge-notice').text().trim();
		var emailNum=parseInt(email);
		if(emailNum>1){
			$('.badge-notice').text((emailNum-1));
		}else{
			$('.badge-notice').text("");
		}
	}
	//从右往左滑动效果
	$(function() {
		var num = 1;
		$("#history").click(function() {
			num++;
			if (num % 2 == 0) {
				$("#historypanel").css({ //从右边飞入，使用绝对定位来操作 
					"width" : "230px",
					"right" : "-230px"
				}).show().animate({
					"right" : "0"
				}, "fast");
			} else
				$("#historypanel").animate({
					"width" : "toggle"
				}, "slow");
			$('#historypanel').load('/userlogs');
		})
	})
</script>