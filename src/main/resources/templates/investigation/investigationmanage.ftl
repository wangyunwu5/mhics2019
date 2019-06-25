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
		<h1 style="font-size: 24px; margin: 0;" class="">调查管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > 
		<a disabled="disabled">调查管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="investigationedit" class="label label-success" style="padding: 5px;">
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
							<tr>
								<td><span>1</span></td>
								<td><span>2</span></td>
								<td><span>3</span></td>
								<td><span>4</span></td>
								<td><span>5</span></td>
								<td><span>6</span></td>
								<td><span>7</span></td>
								<td>
									<a href="taskedit?taskid=" class="label xiugai">
									<span class="glyphicon glyphicon-edit"></span> 修改</a> 
									<a href="taskdelete?taskid=" class="label shanchu"><span 
										class="glyphicon glyphicon-remove"></span> 删除</a>
								</td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
