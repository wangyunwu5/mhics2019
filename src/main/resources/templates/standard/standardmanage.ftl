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
		<h1 style="font-size: 24px; margin: 0;" class="">标准管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">标准管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="standardedit" class="label label-success" style="padding: 5px;">
						<span class="glyphicon glyphicon-plus"></span> 新增</a>
				</h3>
				<div class="box-tools">
					<div class="input-group" style="width: 150px;">
						<input type="text" class="form-control input-sm"
							placeholder="查找..." />
						<div class="input-group-btn">
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
							<th scope="col">英文描述</th>
							<th scope="col">中文描述</th>
							<th scope="col">代码简写</th>
							<th scope="col">代码全写</th>
							<th scope="col">中文意思</th>
							<th scope="col">备注</th>
							<th scope="col">操作</th>
						</tr>
						<#list standards as standard>
							<tr>
								<td><span>
								 <#if standard.descriptionEn?? &&standard.descriptionEn!=''>
									${standard.descriptionEn}
								<#else>
									空
								</#if>
								</span></td>
								<td><span>
								 <#if standard.descriptionCn?? &&standard.descriptionCn!=''>
									${standard.descriptionCn}
								<#else>
									空
								</#if>
								</span></td>
							   <td><span>
							   <#if standard.codeSimple?? &&standard.codeSimple!=''>
							   		${standard.codeSimple}	
								<#else>
									空
								</#if>
							   </span></td>
								<td><span>
								<#if standard.codeFull?? &&standard.codeFull!=''>
									${standard.codeFull}
								<#else>
								 	空
								</#if>
								</span></td>
								<td><span>
								<#if standard.codeMean?? &&standard.codeMean!=''>
									${standard.codeMean}
								<#else>
									空
								</#if>
								</span></td>
								<td><span>
								<#if standard.remark?? &&standard.remark!=''>
									${standard.remark}
								<#else>
									空
								</#if>
								</span></td>
								<td>
									<a href="standardedit?standardid=${standard.standardId}" class="label xiugai">
									<span class="glyphicon glyphicon-edit"></span> 修改</a> 
									<a href="deletestandard?standardid=${standard.standardId}" class="label shanchu"><span
										class="glyphicon glyphicon-remove"></span> 删除</a></td>
							</tr>
						</#list>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
