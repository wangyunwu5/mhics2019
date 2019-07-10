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
		<h1 style="font-size: 24px; margin: 0;" class="">报告预览</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
		<a disabled="disabled">报告预览</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary">
			<div class="box-header">
				<div class="" style="height:30px;text-align:center;">
				  <div style="position:absolute;left:15px;top:15px;">
					<a href="javascript:history.back();" class="label label-default" style="padding: 5px;">
								<i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
					</a>
				  </div>
				  <form action="getreport" method="POST"  enctype="multipart/form-data">
						<label><input type="radio" name="reportway" value="1">生成PDF报告</label>
						<label><input type="radio" name="reportway" value="2">生成WORD报告</label>
						<input type="hidden" name="dcnodeid" value="${dcnodeid}">
						<label><input class="btn btn-primary" type="submit" value="确定"></label>
				</form>
				</div>
			</div>
			<div class="box-body">
				<div class="box-body">
					<div class="row"></div>
				</div>
			</div>
		</div>
	</div>
</div>
