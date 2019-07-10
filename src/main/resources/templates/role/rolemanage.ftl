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
		<h1 style="font-size: 24px; margin: 0;" class="">角色管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">角色管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="deptedit" class="label label-success" style="padding: 5px;">
						<span class="glyphicon glyphicon-plus"></span> 新增
					</a>
				</h3>
			</div>
			<!--盒子身体-->
			<div class="box-body no-padding">
				<div class="table-responsive">
					<table class="table table-hover table-striped">
						<tr>
							<th scope="col">角色名称</th>
							<th scope="col">备注</th>
							<th scope="col">操作</th>
						</tr>
						<#list roles as role>
							<tr>
								<td><span>${role.roleName}</span></td>
								<td><span>${role.remark}</span></td>
								<td>
									<a href="roleset?id=${role.roleId}" class="label sheding">
							  <span class="glyphicon glyphicon-asterisk"></span>权限设定</a>
									<a href="roleedit?roleid=${role.roleId}" class="label xiugai">
									<span class="glyphicon glyphicon-edit"></span> 修改</a> 
									<a href="deleterole?roleid=${role.roleId}" class="label shanchu"><span
										class="glyphicon glyphicon-remove"></span> 删除</a></td>
							</tr>
						</#list>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
