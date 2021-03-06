<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<#include "/commons/commoncss.ftl">
<link rel="stylesheet" type="text/css"
	href="/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/common/box.css" />
<link rel="stylesheet" type="text/css" href="/css/uploadimg.css" />
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

.tittle-label{
	text-align: center;
	height:50px;
	font-size:20px;
}
.biankuang{
	border:1px solid #CCCCCC;
	padding: 0;
    overflow: hidden;
    padding:10px;
}
.photo-p{
	display:inline-block;
}
#map{
    position: absolute;
    top: 0;
    left: 0;
    display: none;
    background-color: rgba(9, 9, 9, 0.63);
    width: 100%;
    height: 100%;
    z-index: 1000;
}
.model-content {
    width: 90%;
    text-align: center;
    background: #ffffff;
    border-radius: 6px;
    margin: 20px auto;
    line-height: 30px;
    z-index: 10001;
}
.map-top{
	width:100%;
	height:50px;
	line-height:50px;
	display:flex;
	justify-content:center;
	align-items:center;
}
.map-top input:hover{
	border:2px solid #39B549;
}
.map-button:hover{
	background-color:#009344;
}
.map-button{
	display:block;
	margin-left:10px;
	background-color:#39B549;
	font-size:12px;
	width:40px;
	height:30px;
	line-height:30px;
	border-radius: 3px;
	color:white;
}
.togetmap{
	font-size:12px;
	margin-left:10px;
	color:#CCCCCC;
}
.togetmap:hover{
	color:black;
}
 .bodyone p{
	color:	#888888;
}
.img_list_ul, .img_list_ul li{
	list-style:none;
	padding:0;
	margin:0;
}
.img_list_ul li{
	margin-right:20px;
	float:left;
}
.form-group{
	margin-bottom:2px;
}
.pipe-table>thead>tr>td, .pipe-table>tbody>tr>td{
	border:1px solid #CCCCCC;
	text-align:center;
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	font-weight:600;
}
.pipetype-table-td{
	border-left:1px solid #CCCCCC;
	border-right:1px solid #CCCCCC;
}
.pipe-table>tbody>tr>td input{
	width:100%;
	border:none;
}
.pipetype-table{
	display:flex;
	flex-direction:row;
}
.pipe-table>tbody>tr input:hover{
	background-color:#cccccc;
}
.pipetype-table-x{
	width:10%;
	border-left:1px solid #CCCCCC;
	border-right:1px solid #CCCCCC;
}
.node-del-btn{
	color:red;
	padding: 2px;
}
.node-del-btn:hover{
	font-weight:bold;
	font-size:14px;
}
.group-none{
	display: none;
}
</style>
</head>
<body style="background-color: #ecf0f5;">
	<div class="row" style="padding-top: 10px;">
		<div class="col-md-2">
		 	<#if dcnode??>
				<h1 style="font-size: 24px; margin: 0;" class="">详情</h1>
			<#else>
				<h1 style="font-size: 24px; margin: 0;" class="">新增</h1>
			</#if>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
				<#if dcnode??>
					<a disabled="disabled">详情</a>
				<#else>
					<a disabled="disabled">新增</a>
				</#if>
		</div>
	</div>
	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12">
			<!--id="container"-->
			<div class="bgc-w box">
				<form action="dcnodesave" method="post" onsubmit="return check();" enctype="multipart/form-data">
					<!--盒子头-->
					<div class="box-header">
						<h3 class="box-title">
							<a href="javascript:history.back();" class="label label-default" style="padding: 5px;">
								<i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
							</a>
							<#if dcnode??>
							<a href="#" id="to_xiugai" class="label xiugai" style="margin-left:20px;">
									<span id="xiugai_span" class="glyphicon glyphicon-edit"></span><span id="xiugai_title">修改</span></a>
							</#if>
						</h3>
					</div>
					<div class="box-body no-padding">
							<#if dcnode??>
								<!--盒子身体1详情-->
								<div class="box-body bodyone" style="display:${(bodyone)!''}">
									<#include "diaochanodedetail.ftl">
								</div>
								<!--盒子身体2修改-->
								<div class="box-body bodytwo" style="display:${(bodytwo)!''}">
									<#include "diaochanodeupdate.ftl">
								</div>
							<#else>
								<!--盒子身体3新增-->
								<div class="box-body bodythree" style="display:${(bodythree)!''}">
									<#include "diaochanodeadd.ftl">
								</div>
							</#if>
							<!--图片上传-->
							<div class="box-body no-padding" style="">
								<#include "diaochanodeimgupload.ftl">
							</div>
							<!-- 管道信息 -->
							<div class="box-body">
								<#include "editdiaochapipe.ftl">
							</div>
					</div>
					<div class="box-footer">
							<input class="btn btn-primary" id="save" type="submit" value="保存" />
							<input class="btn btn-default" id="cancel" type="button" value="取消"
							onclick="javascript:history.back();" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x9SLjNT2Qnfj45CDm5Rrz2Eln6vL3O6i"></script>
<script type="text/javascript" src="/plugins/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/easyui/jquery.js"></script>
<script type="text/javascript" src="/js/investigation/dc_uploadImg.js"></script>
<script type="text/javascript" src="/js/investigation/investigation.js"></script>
<#include "/commons/modalTip.ftl"/> 
<script type="text/javascript">

</script>
</html>