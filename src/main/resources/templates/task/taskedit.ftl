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
			<h1 style="font-size: 24px; margin: 0;" class="">任务管理</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">任务管理</a>
		</div>
	</div>
	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12">
			<!--id="container"-->
			<div class="bgc-w box">
				<form action="taskedit" method="post" onsubmit=";">
					<#if task??>
						<input type="hidden" name="xg" value="xg"/>	
					<#else>
						<input type="hidden" name="xg" value="add"/>				
					</#if>
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
									<label class="control-label"><span>任务内容</span></label> 
									<input name="content" class="form-control" value="${(task.content)!''}"/>
								</div>
								<div class="col-md-6 form-group">
									<label class="control-label"><span>项目编号</span></label>
									<select class="deptselect form-control" name="projectid">
									<#if task??>
										<option value="${(task.project.projectId)!''}">${task.project.projectNo}</option>
									</#if>
									<#list projects as project>
										<option value="${project.projectId}">${project.projectNo}</option>
									</#list>
								</select>
								</div>
								<div class="col-md-6 form-group">
									<label class="control-label"> <span>创建人</span></label>
									 <select class="form-control" name="userid">
										<#if task??>
											<option value="${(task.person.userId)!''}">${task.person.userAccount}</option>
										</#if>
										<#list users as user>
											<option value="${user.userId}">${user.userAccount}</option>
										</#list>
									</select>
								</div>
								<div class="col-md-6 form-group">
										<span> <label class="control-label">创建时间</label></span> 
										<#if task??>
										<input name="createTime" readonly="readonly" class="form-control" id="start" onclick=""
											value="${(task.createTime)!''}"/>
										<#else>
										<input name="createTime" class="form-control" id="start" onclick="WdatePicker()"
											value="${(task.createTime)!''}"/>
										</#if>
								</div>
								<div class="col-md-6 form-group">
									<span> <label class="control-label">开始时间</label>
									</span> <input name="startTime" class="form-control" id="start" onclick="WdatePicker()"
										value="${(task.startTime)!''}"/>
								</div>
								<div class="col-md-6 form-group">
									<span> <label class="control-label">结束时间</label>
									</span> <input name="endTime" class="form-control" id="start" onclick="WdatePicker()"
										value="${(task.endTime)!''}"/>
								</div>
								<input type="hidden" name="taskId" value="${(task.taskId)!''}">
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
<script type="text/javascript" src="/plugins/My97DatePicker/WdatePicker.js"></script>
<#include "/commons/modalTip.ftl"/> 
<#if isread??>
	<script type="text/javascript">
		$('.form-control').attr("readOnly","true");
	</script>
</#if>
<script type="text/javascript">
function alertCheck(errorMess){
	
	$('.alert-danger').css('display', 'block');
	// 提示框的错误信息显示
	$('.error-mess').text(errorMess);
}
//表单提交前执行的onsubmit()方法；返回false时，执行相应的提示信息；返回true就提交表单到后台校验与执行
function check() {
	console.log("开始进入了");
	//提示框可能在提交之前是block状态，所以在这之前要设置成none
	$('.alert-danger').css('display', 'none');
	var isRight = 1;
	$('.form-control').each(function(index) {
		// 如果在这些input框中，判断是否能够为空
		if ($(this).val() == "") {
			// 排除哪些字段是可以为空的，在这里排除
			if (index == 2 || index == 3 || index == 4 || index == 5 || index == 6) {
				return true;
			}
			// 获取到input框的兄弟的文本信息，并对应提醒；
			var brother = $(this).siblings('.control-label').text();
			var errorMess = "[" + brother + "输入框信息不能为空]";
			// 对齐设置错误信息提醒；红色边框
			$(this).parent().addClass("has-error has-feedback");
			$('.alert-danger').css('display', 'block');
			// 提示框的错误信息显示
			$('.error-mess').text(errorMess);
			// 模态框的错误信息显示
			$('.modal-error-mess').text(errorMess);
			isRight = 0;
			return false;
		} else {
			
			if(index == 0){
				var $name=$(this).val();
 				
 				if(isChinaName($name) == false){
 					$(this).parent().addClass("has-error has-feedback");
 					alertCheck("请输入中文名称");
 					isRight = 0;
 		 			return false;
 				}
			} 
			
			if(index == 3){
				var $mail=$(this).val();
 				if(isMailNo($mail) == false){
 					$(this).parent().addClass("has-error has-feedback");
 					alertCheck("邮箱格式错误");
 					isRight = 0;
 		 			return false;
 				}
			}
			// 在这个里面进行其他的判断；不为空的错误信息提醒
			return true;
		}
	});
	if (isRight == 0) {
		//modalShow(0);
		 return false;
	} else if (isRight == 1) {
		//modalShow(1);
		 return true;
	}
//	return false;
}


//验证中文名称
function isChinaName(name) {
 var pattern = /^[\u4E00-\u9FA5]{1,6}$/;
 return pattern.test(name);
}

</script>
</html>