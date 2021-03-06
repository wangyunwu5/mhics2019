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
					<a href="dcnodeedit" class="label label-success" style="padding: 5px;margin-left:10px;">
						<span class="glyphicon glyphicon-plus"></span> 新增调查
					</a>
					<a href="#" class="label label-success" style="padding: 5px;margin-left:10px;">
						<span class="glyphicon glyphicon-plus"></span> 导入excel表
					</a>
					<a href="tomap" class="label label-success" style="padding: 5px;margin-left:10px;">
						<span class="glyphicon glyphicon-plus"></span> 地图展示
					</a>
				</h3>
				<div class="box-tools">
					<div class="input-group" style="width: 150px;">
						<input type="text" class="form-control input-sm cha"
							placeholder="查找..." />
						<div class="input-group-btn chazhao">
							<a class="btn btn-sm btn-default"><span
								class="glyphicon glyphicon-search"></span></a>
						</div>
					</div>
				</div>
			</div>
			<!--盒子身体-->
			<div class="box-body no-padding">
				<div class="table-responsive">
					<table class="table table-hover table-striped">
						<tr>
							<th width="15%">井编号</th>
							<th width="15%">井类型</th>
							<th width="15%">井用途</th>
							<th width="15%">目前状态</th>
							<th width="15%">调查时间</th>
							<th width="25%">操作</th>
						</tr>
						<#if inves??>
							<#list inves as inve>
									<tr>
										<td><span>${inve.nodeNo}</span></td>
										<td><span>${inve.nodeType}</span></td>
										<td><span>${inve.function}</span></td>
										<td><span>${inve.status}</span></td>
										<td><span>${inve.surveyDate}</span></td>
										<td>
											<a href="/diaochanode/dcnodeedit?dcnodeid=${inve.dcNodeId}" class="label xiugai">
											<span class="glyphicon glyphicon-edit"></span>查看详情</a>
											<a href="dcnodedelete?dcnodeid=${inve.dcNodeId}" onclick=" return confirm('你确定删除么？');" class="label shanchu"><span
												class="glyphicon glyphicon-remove"></span> 删除</a>
											<a href="/diaochanode/topdfreport?dcnodeid=${inve.dcNodeId}" class="label reports"><span
												class="glyphicon glyphicon-paperclip"></span>生成pdf报告</a>
											<a href="/diaochanode/towordreport?dcnodeid=${inve.dcNodeId}" class="label reports"><span
												class="glyphicon glyphicon-paperclip"></span>生成word报告</a>
										</td>
									</tr>
							</#list>
						<#else>
							<tr><td colspan="5" style="text-align:center;">暂时没有调查数据哦<td></tr>
						</#if>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
