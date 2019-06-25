<#include "/commons/commoncss.ftl">
<#include "/commons/modalTip.ftl"/> 
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
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">任务管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">任务管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="taskedit" class="label label-success" style="padding: 5px;">
						<span class="glyphicon glyphicon-plus"></span> 新增
					</a>
				</h3>
			</div>
			<!--盒子身体-->
			<div class="box-body no-padding">
				<div class="table-responsive">
					<table class="table table-hover table-striped">
						<tr>
							<th scope="col">项目编号</th>
							<th scope="col">内容</th>
							<th scope="col">创建人</th>
							<th scope="col">创建时间</th>
							<th scope="col">开始时间</th>
							<th scope="col">结束时间</th>
							<th scope="col">目前状态</th>
							<th scope="col">操作</th>
						</tr>
						<#list tasks as task>
							<tr>
								<td><span>${task.project.projectNo}</span></td>
								<td><span>${task.content}</span></td>
								<td><span>${task.person.userAccount}</span></td>
								<td><span>${task.createTime}</span></td>
								<td><span>${task.startTime}</span></td>
								<td><span>${task.endTime}</span></td>
								<td><span>
									<#if task.statusId==0>
										未分派
									<#elseif task.statusId==1>
									          已分派
									 <#elseif task.statusId==2>
									   	 已接收
									 <#elseif task.statusId==3>
									   	 进行中
									 <#else>
										已完成									 
									</#if>
								</span>
								</td>
								<td>
									<a href="taskedit?taskid=${task.taskId}" class="label xiugai">
									<span class="glyphicon glyphicon-edit"></span> 修改</a> 
									<a href="taskdelete?taskid=${task.taskId}" class="label shanchu"><span
										class="glyphicon glyphicon-remove"></span> 删除</a>
									<#if task.statusId==0>
									 <a href="assigntask?taskid=${task.taskId}" class="label"><span
										class="label label-success">去分派任务</span> </a>
									</#if>
								</td>
							</tr>
						</#list>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
