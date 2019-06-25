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
		<h1 style="font-size: 24px; margin: 0;" class="">井调查列表</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > 
		<a disabled="disabled">井调查列表</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="javascript:history.back();" class="label label-default" style="padding: 5px;">
								<i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
					</a>
					<a href="nodeedit" class="label label-success" style="padding: 5px;margin-left:10px;">
						<span class="glyphicon glyphicon-plus"></span> 新增调查
					</a>
				</h3>
			</div>
			<!--盒子身体-->
			<div class="box-body no-padding">
				<div class="table-responsive">
					<table class="table table-hover table-striped">
						<tr>
							<th scope="col">井编号</th>
							<th scope="col">井类型</th>
							<th scope="col">井用途</th>
							<th scope="col">目前状态</th>
							<th scope="col">调查时间</th>
							<th scope="col">操作</th>
						</tr>
						<#list nodes as node>
							<tr>
								<td><span>${node.nodeNo}</span></td>
								<td><span>${node.nodeType}</span></td>
								<td><span>${node.function}</span></td>
								<td><span>${node.status}</span></td>
								<td><span>${node.surveyDate}</span></td>
								<td>
									<a href="nodeedit?nodeid=${node.dcNodeId}" class="label xiugai">
									<span class="glyphicon glyphicon-edit"></span>查看详情</a>
									<a href="nodedelete?taskid=" class="label shanchu"><span
										class="glyphicon glyphicon-remove"></span> 删除</a>
								</td>
							</tr>
						</#list>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
