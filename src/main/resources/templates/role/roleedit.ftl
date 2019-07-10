<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<#include "/commons/commoncss.ftl">
<link rel="stylesheet" type="text/css"
	href="/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/common/box.css" />
<style type="text/css">
a {
	color: black;
}
a:hover {
	text-decoration: none;
}
.bgc-w {
	background-color: #fff;
}
</style>
</head>

<body style="background-color: #ecf0f5;">
	<div class="row" style="padding-top: 10px;">
		<div class="col-md-2">
			<h1 style="font-size: 24px; margin: 0;" class="">角色管理</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">角色管理</a>
		</div>
	</div>
	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12">
			<!--id="container"-->
			<div class="bgc-w box">
				<form action="rolesave" method="post" onsubmit="return check();">
					<!--盒子头-->
					<div class="box-header">
						<h3 class="box-title">
							<a href="javascript:history.back();" class="label label-default" style="padding: 5px;">
							<i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
						</a>
						</h3>
					</div>
					<!--盒子身体-->
					<div class="box-body no-padding">
						<div class="box-body">
							<div class="alert alert-danger alert-dismissable" role="alert"
								style="display: none;">
								错误信息:<button class="close thisclose" type="button">&times;</button>
								<span class="error-mess"></span>
							</div>
							<div class="row">
								<div class="col-md-6 form-group">
									<label class="control-label"><span>角色名称</span></label> 
									<input name="roleName" class="form-control" value="${(role.roleName)!''}"/>
								</div>
								<div class="col-md-6 form-group">
									<label class="control-label"><span>备注</span></label> 
									<input name="remark" class="form-control" value="${(role.remark)!''}"/>
								</div>
								<input type="hidden" name="roleId" value="${(role.roleId)!''}">
							</div>
						</div>
					</div>
					<!--盒子尾-->
					<div class="box-footer">
							<input class="btn btn-primary" id="save" type="submit" value="保存" />
							<input class="btn btn-default" id="cancel" type="button" value="取消"
							onclick="window.history.back();" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function alertCheck(errorMess){
	$('.alert-danger').css('display', 'block');
	$('.error-mess').text(errorMess);
}
function check() {
	$('.alert-danger').css('display', 'none');
	var isRight = 1;
	$('.form-control').each(function(index) {
		if ($(this).val() == "") {
			var brother = $(this).siblings('.control-label').text();
			var errorMess = "[" + brother + "输入框信息不能为空]";
			$(this).parent().addClass("has-error has-feedback");
			$('.alert-danger').css('display', 'block');
			$('.error-mess').text(errorMess);
			$('.modal-error-mess').text(errorMess);
			isRight = 0;
			return false;
	});
}


</script>
</html>