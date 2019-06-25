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
</style>
</head>
<body style="background-color: #ecf0f5;">
	<div class="row" style="padding-top: 10px;">
		<div class="col-md-2">
		 	<#if node??>
				<h1 style="font-size: 24px; margin: 0;" class="">详情</h1>
			<#else>
				<h1 style="font-size: 24px; margin: 0;" class="">新增</h1>
			</#if>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
				<#if node??>
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
				<form action="nodesave" method="post" onsubmit="return check();" enctype="multipart/form-data">
					<!--盒子头-->
					<div class="box-header">
						<h3 class="box-title">
							<a href="javascript:history.back();" class="label label-default" style="padding: 5px;">
								<i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
							</a>
							<a href="#" class="label xiugai" style="margin-left:20px;">
									<span class="glyphicon glyphicon-edit"></span>修改</a>
						</h3>
					</div>
					<!--盒子身体1-->
					<div class="box-body no-padding" style="display:${(bodyone)!''}">
						<div class="box-body">
							<div class="alert alert-danger alert-dismissable" role="alert"
								style="display: none;">
								错误信息:<button class="close thisclose" type="button">&times;</button>
								<span class="error-mess"></span>
							</div>
							<div class="row bodyone">
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井编号</span></label> 
									<p>
									${(node.nodeNo)!''}
									</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>项目编号</span></label>
									<p>${(node.project.projectNo)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>工作编号</span></label>
									<p>${(node.workNo)!''}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>IDMS Manhole ID</span></label> 
									<p>${(node.idmsManholeId)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>DSD ref</span></label> 
									<p>${(node.dsdRef)!''}</p>
								</div> 
								<div class="col-md-1 form-group">	
									<label class="control-label"><span>地图区域代码</span></label> 
									<p>${(node.drainageAreaCode)!''}</p>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井坐标</span></label> 
									<#if node?? & node.zbx?? && node.zby??>
										<p>${(node.zbx)!''},${(node.zby)!''}</p>
									<#else>
										<p>,</p>
									</#if> 
								</div>
								<div class="col-md-2 form-group">
									<span> <label class="control-label">建造年份</label>
									</span>  <p>${(node.yearLaid)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井状况</span></label> 
									<p>${(node.status)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井用途</span></label> 
									<p>${(node.function)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井类别</span></label> 
									<p>${(node.nodeType)!''}</p>
								</div>
								
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖形状</span></label> 
									<p>${(node.coverShape)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖类型</span></label> 
									<p>${(node.coverType)!''}</p>
								</div>  
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有无铰链</span></label> 
									<p>${(node.hinged)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有无锁</span></label>
									<p>${(node.locked)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖厚度</span></label> 
								    <p>${(node.coverDuty)!''}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井盖尺寸</span></label> 
									  <p>长:${(node.coverSizec)!''} 宽:${(node.coverSizek)!''}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井颈侧入口(有/无)</span></label> 
									<p>${(node.shaftSideEntry)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井颈砖层数量</span></label> 
									<p>${(node.shaftRegularCourse)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井颈厚度(mm)</span></label> 
									<p>${(node.shaftDepth)!''}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井颈尺寸(长或半径,mm)</span></label> 
									<p>长:${(node.shaftSizec)!''} 宽:${(node.shaftSizek)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>胆顶形状</span></label> 
									<p>${(node.chamberSoffit)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>台阶数量</span></label> 
									<p>${(node.chamberSteps)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>梯子数量</span></label> 
									<p>${(node.chamberLadders)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>LNDGS</span></label>
									<p>${(node.chamberLndgs)!''}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井胆尺寸(长或半径,mm)</span></label> 
									<p>长:${(node.chamberSizec)!''} 宽:${(node.chamberSizek)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有毒气体</span></label> 
									<p>${(node.toxic)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>害虫证据</span></label>
									<p>${(node.vermin)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井胆建造方法</span></label> 
									<p>${(node.constructCode)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>流动深度(mm)</span></label>
									<p>${(node.depthOfFlow)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>淤泥深度(mm)</span></label> 
									<p>${(node.depthOfSilt)!''}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>Height surch(mm)</span></label>
									<p>${(node.heightSurch)!''}</p>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>MH depth(m)</span></label> 
									<p>${(node.mhDepth)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>海拔(m)</span></label> 
									<p>${(node.coverLevel)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utr</span></label> 
									<p>${(node.utr)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utl</span></label> 
									<p>${(node.utl)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utga</span></label> 
									<p>${(node.utga)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>uts</span></label> 
									<p>${(node.uts)!''}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>jetting</span></label> 
									<p>${(node.jetting)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>是否在斜坡</span></label> 
									<p>${(node.onSlope)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>斜坡编号</span></label>
									<p>${(node.slopeNo)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖损坏</span></label> 
									<p>${(node.coverCondition)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>梯子损坏</span></label> 
									<p>${(node.ladderCondition)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井颈损坏</span></label> 
									<p>${(node.shaftCondition)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井胆损坏</span></label> 
									<p>${(node.chamberCondition)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>台阶损坏</span></label> 
									<p>${(node.benchingCondition)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>其他损坏</span></label> 
									<p>${(node.othersCondition)!''}</p>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>record plan difference</span></label> 
									<p>${(node.recordPlanDifference)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>CCTV COND</span></label> 
									<p>${(node.cctvCond)!''}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>Crity</span></label> 
									<p>${(node.crity)!''}</p>
								</div>
								<div class="col-md-4 form-group">
									<label class="control-label"><span>井地址</span></label> 
									<#if node?? & node.location?? & node.location!="">
										<p>${(node.location)!''}</p>
									<#else>
										<p>--</p>
									</#if>
								</div>
								<div class="col-md-6 form-group">
									<label class="control-label"><span>备注</span></label> 
									<#if node?? & node.remark?? & node.remark !="">
										<p>${(node.remark)!''}</p>
									<#else>
										<p>--</p>
									</#if>  
								</div>
							</div>
						</div>
					</div>
					<!--盒子身体2-->
					<div class="box-body no-padding" style="display:${(bodytwo)!''}">
						<div class="box-body">
							<div class="alert alert-danger alert-dismissable" role="alert"
								style="display: none;">
								错误信息:<button class="close thisclose" type="button">&times;</button>
								<span class="error-mess"></span>
							</div>
							<div class="row">
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井编号</span></label>
									<input name="nodeNo" class="form-control only-nodeno" value="${(node.nodeNo)!''}"/>
									<input type="hidden" class="onlynodeno" value=""/>
									
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>项目编号</span></label>
									<select class="form-control" name="projectId" value="${(node.project.projectNo)!''}">
										<#list projects as project>
												<option value="${(project.projectId)!''}">${(project.projectNo)!''}</option>
										</#list>
									</select>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>工作编号</span></label>
									<input name="workNo" class="form-control" value="${(node.workNo)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>IDMS Manhole ID</span></label>
									<input name="idmsManholeId" class="form-control" value="${(node.idmsManholeId)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>DSD ref</span></label>
									<input name="dsdRef" class="form-control" value="${(node.dsdRef)!''}"/>
								</div> 
								<div class="col-md-2 form-group">	
									<label class="control-label"><span>地图区域代码</span></label>
									<input name="drainageAreaCode" class="form-control" value="${(node.drainageAreaCode)!''}"/>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井坐标</span></label> <label>
									<a href="#" class="togetmap" onClick="showModel()">去获取坐标</a></label>
									<input id="zuobiao" name="zuobiao" class="form-control" value="${(node.zbx)!''}--${(node.zby)!''}"/>
								</div>
								<div id="map">
									 <div class="model-content">
								          <#include "map.ftl">
								     </div>
								</div>
								<div class="col-md-2 form-group">
									<span> <label class="control-label">建造年份</label></span>
									 <input name="yearLaid" class="form-control" id="start" onclick="WdatePicker()"
										value="${(node.yearLaid)!''}"/>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井状况</span></label>
									<select class="form-control" name="status" value="${(node.status)!''}">
										<#list standards as standard>
											<#if standard.descriptionEn == "status">
												<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
											</#if>
										</#list>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井用途</span></label>
									<select class="form-control" name="function" value="${(node.function)!''}">
										<#list standards as standard>
											<#if standard.descriptionEn == "function">
												<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
											</#if>
										</#list>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井类别</span></label> 
									<select class="form-control" name="nodeType" value="${(node.nodeType)!''}">
										<#list standards as standard>
											<#if standard.descriptionEn == "nodetype">
												<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
											</#if>
										</#list>
									</select>
								</div>
								<div class="col-md-3 form-group">
									<label class="control-label"><span>井地址</span></label>
									<input name="location" class="form-control" value="${(node.location)!''}"/>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖形状</span></label>
									<select class="form-control" name="coverShape" value="${(node.coverShape)!''}">
										<#list standards as standard>
											<#if standard.descriptionEn == "covershape">
												<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
											</#if>
										</#list>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖类型</span></label> 
									<select class="form-control" name="coverType" value="${(node.coverType)!''}">
										<#list standards as standard>
											<#if standard.descriptionEn == "covertype">
												<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
											</#if>
										</#list>
									</select>
								</div>  
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有无铰链</span></label>
									<select class="form-control" name="hinged" value="${(node.hinged)!''}">
									<option value="无">无</option>
									<option value="有">有</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有无锁</span></label>
									<select class="form-control" name="locked" value="${(node.locked)!''}">
									<option value="无">无</option>
									<option value="有">有</option>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖厚度</span></label>
									<select class="form-control" name="coverDuty" value="${(node.coverDuty)!''}">
										<#list standards as standard>
											<#if standard.descriptionEn == "coverduty">
												<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
											</#if>
										</#list>
									</select>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井盖尺寸(长或半径,mm)</span></label>
									<input name="coverSizec" class="form-control" value="${(node.coverSizec)!''}"/>
								</div> 
								
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井盖尺寸(宽,mm)</span></label>
									<input name="coverSizek" class="form-control" value="${(node.coverSizek)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井颈侧入口(有/无)</span></label>
									<select class="form-control" name="shaftSideEntry" value="${(node.shaftSideEntry)!''}">
									<option value="无">无</option>
									<option value="有">有</option>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井颈砖层数量</span></label>
									<input name="shaftRegularCourse" class="form-control" value="${(node.shaftRegularCourse)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井颈厚度(mm)</span></label>
									<input name="shaftDepth" class="form-control" value="${(node.shaftDepth)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井颈尺寸(长或半径,mm)</span></label>
									<input name="shaftSizec" class="form-control" value="${(node.shaftSizec)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井颈尺寸(宽,mm)</span></label> 
									<input name="shaftSizek" class="form-control" value="${(node.shaftSizek)!''}"/>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>胆顶形状</span></label>
									<select class="form-control" name="chamberSoffit" value="${(node.chamberSoffit)!''}">
										<#list standards as standard>
											<#if standard.descriptionEn == "soffit">
												<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
											</#if>
										</#list>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>台阶数量</span></label> 
									<input name="chamberSteps" class="form-control" value="${(node.chamberSteps)!''}"/>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>梯子数量</span></label>
									<input name="chamberLadders" class="form-control" value="${(node.chamberLadders)!''}"/>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>LNDGS</span></label>
									<input name="chamberLndgs" class="form-control" value="${(node.chamberLndgs)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井胆尺寸(长或半径,mm)</span></label>
									<input name="chamberSizec" class="form-control" value="${(node.chamberSizec)!''}"/>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井胆尺寸(宽,mm)</span></label>
									<input name="chamberSizek" class="form-control" value="${(node.chamberSizek)!''}"/>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有毒气体</span></label>
									<select class="form-control" name="toxic" value="${(node.toxic)!''}">
									<option value="无">无</option>
									<option value="有">有</option>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>害虫证据</span></label>
									<select class="form-control" name="vermin" value="${(node.vermin)!''}">
									<option value="无">无</option>
									<option value="有">有</option>
									</select>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井胆建造方法</span></label>
									<select class="form-control" name="constructCode" value="${(node.constructCode)!''}">
										<#list standards as standard>
											<#if standard.descriptionEn == "constructcode">
												<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
											</#if>
										</#list>
									</select>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>流动深度(mm)</span></label>
									<input name="depthOfFlow" class="form-control" value="${(node.depthOfFlow)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>淤泥深度(mm)</span></label>
									<input name="depthOfSilt" class="form-control" value="${(node.depthOfSilt)!''}"/>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>Height surch(mm)</span></label>
									<input name="heightSurch" class="form-control" value="${(node.heightSurch)!''}"/>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>MH depth(m)</span></label>
									<input name="mhDepth" class="form-control" value="${(node.mhDepth)!''}"/>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>海拔(m)</span></label>
									<input name="coverLevel" class="form-control" value="${(node.coverLevel)!''}"/>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utr</span></label> 
									<select class="form-control" name="utr" value="${(node.utr)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utl</span></label>
									<select class="form-control" name="utl" value="${(node.utl)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utga</span></label>
									<select class="form-control" name="utga" value="${(node.utga)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>uts</span></label>
									<select class="form-control" name="uts" value="${(node.uts)!''}">
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>jetting</span></label>
									<select class="form-control" name="jetting" value="${(node.jetting)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>是否在斜坡</span></label>
									<select class="form-control slopeNo" name="onSlope" value="${(node.onSlope)!''}">
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group" style="display:none">
									<label class="control-label"><span>斜坡编号</span></label>
									<input name="slopeNo" id="onSlope" class="form-control" value="${(node.slopeNo)!''}"/>
								</div>  
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖损坏</span></label>
									<select class="form-control condition" name="coverCondition" value="${(node.coverCondition)!''}">
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>梯子损坏</span></label>
									<select class="form-control condition"name="ladderCondition" value="${(node.ladderCondition)!''}"> 
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井颈损坏</span></label>
									<select class="form-control condition"name="shaftCondition" value="${(node.shaftCondition)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井胆损坏</span></label>
									<select class="form-control condition"name="chamberCondition" value="${(node.chamberCondition)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>台阶损坏</span></label>
									<select class="form-control condition" name="benchingCondition" value="${(node.benchingCondition)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>其他损坏</span></label>
									<select class="form-control condition" name="othersCondition" value="${(node.othersCondition)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>record plan difference</span></label>
									<select class="form-control" name="recordPlanDifference" value="${(node.recordPlanDifference)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>CCTV COND</span></label>
									<select class="form-control" name="cctvCond" value="${(node.cctvCond)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>Crity</span></label>
									<select class="form-control" name="crity" value="${(node.crity)!''}">
									<option value="否">否</option>
									<option value="是">是</option>
									</select>
								</div>
								<div class="col-md-6 form-group">
									<label class="control-label"><span>备注</span></label>
									<input name="remark" class="form-control" value="${(node.remark)!''}"/>
								</div>
							</div>
						</div>
					</div>
					<!--盒子尾-->
					<div class="box-body no-padding" >
						<div class="box-body">
							<div class="row">
								<div class="col-md-12 form-group">
										<label class="control-label"><span>location photo</span></label>
										<div class="form-group biankuang" id="container1">
											<div class="btn btn-default" style="position: relative; overflow: hidden;">
												<i class="glyphicon glyphicon-open"></i> 上传照片
											 	<input type="file" name="locationphoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
												style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
												<input class="imgpath" type="hidden" value="${(node.locationPhoto)!''}"/>
											</div>
											<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
										</div>
								</div>
								<div class="col-md-12 form-group ">
									<label class="control-label"><span>internal photo</span></label> 
										<div class="form-group biankuang" id="container2">
											<div class="btn btn-default" style="position: relative; overflow: hidden;">
												<i class="glyphicon glyphicon-open"></i> 上传照片
											 	<input type="file" name="internalphoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
												style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
												<input class="imgpath" type="hidden" value="${(node.internalPhoto)!''}"/>
											</div>
											<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
										</div>
								</div>
								<div class="col-md-12 form-group ">
									<label class="control-label"><span>location sketch</span></label> 
									<div class="form-group biankuang" id="container3">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="locationsketch" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											<input class="imgpath" type="hidden" value="${(node.locationSketch)!''}"/>
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group">
									<label class="control-label"><span>plan of mh</span></label> 
								    <div class="form-group biankuang" id="container4">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="planofmh" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											<input class="imgpath" type="hidden" value="${(node.planOfMh)!''}"/>
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>cover photo</span></label> 
									<div class="form-group biankuang" id="coverCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="coverphoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											<input class="imgpath" type="hidden" value="${(node.coverPhoto)!''}"/>
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>ladder photo</span></label>
									<div class="form-group biankuang" id="ladderCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="ladderphoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											<input class="imgpath" type="hidden" value="${(node.ladderPhoto)!''}"/>
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>shaft photo</span></label> 
									<div class="form-group biankuang" id="shaftCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="shaftphoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											<input class="imgpath" type="hidden" value="${(node.shaftPhoto)!''}"/>
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>chamber photo</span></label> 
									<div class="form-group biankuang" id="chamberCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="chamberphoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											<input class="imgpath" type="hidden" value="${(node.chamberPhoto)!''}"/>
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>benching photo</span></label> 
									<div class="form-group biankuang" id="benchingCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="benchingphoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											<input class="imgpath" type="hidden" value="${(node.benchingPhoto)!''}"/>
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>others photo</span></label> 
									<div class="form-group biankuang" id="othersCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="otherphoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											<input class="imgpath" type="hidden" value="${(node.othersPhoto)!''}"/>
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
							</div>
						</div>
					</div>
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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x9SLjNT2Qnfj45CDm5Rrz2Eln6vL3O6i"></script>
<script type="text/javascript" src="/plugins/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/easyui/jquery.js"></script>
<script type="text/javascript" src="/easyui/uploadImg.js"></script>
<#include "/commons/modalTip.ftl"/> 
<script type="text/javascript">
var params1 = { container: '#container1'};new UploadImg(params1);
var params2 = { container: '#container2'};new UploadImg(params2);
var params3 = { container: '#container3'};new UploadImg(params3);
var params4 = {container: '#container4'};new UploadImg(params4);
var cover = {container: '#coverCondition'};new UploadImg(cover);
var ladder = {container: '#ladderCondition'};new UploadImg(ladder);
var shaft = {container: '#shaftCondition'};new UploadImg(shaft);
var chamber = {container: '#chamberCondition'};new UploadImg(chamber);
var benching = {container: '#benchingCondition'};new UploadImg(benching);
var others = {container: '#othersCondition'};new UploadImg(others);
//控制六个图片按钮是否显示
$(".condition").each(function(){
	$(this).change(function(){
		var value = $(this).val();
		var name = $(this).attr("name");
		if(value =="否"){
			$("#"+name).parent().css("display","none")
		}
		else{
			$("#"+name).parent().css("display","block")
		}
	});
});
//是否在斜坡
$(".slopeNo").change(function(){
	var value = $(this).val();
	console.log("斜坡起反应了"+value);
	var name = $(this).attr("name");
	if(value =="否"){
		$("#"+name).parent().css("display","none")
	}
	else{
		$("#"+name).parent().css("display","block")
	}
});
function showModel() {
    document.getElementById('map').style.display = 'block';
}
function closeModel() {
    document.getElementById('map').style.display = 'none';
}
function saveValue(){
	document.getElementById("zuobiao").value = document.getElementById("coordinate").value;
    document.getElementById('map').style.display = 'none';
}
var map = new BMap.Map("container");
map.centerAndZoom("深圳市", 13);
map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件
map.addControl(new BMap.OverviewMapControl({ isOpen: true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT }));   //右下角，打开
map.addEventListener("click",function(e){
	 document.getElementById("coordinate").value = e.point.lng + "," + e.point.lat;
	 map.clearOverlays();//清空原来的标注
	 var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));  // 创建标注，为要查询的地方对应的经纬度
	 map.addOverlay(marker);
});

var localSearch = new BMap.LocalSearch(map);
localSearch.enableAutoViewport(); //允许自动调节窗体大小
function searchByStationName() {
	map.clearOverlays();//清空原来的标注
	var keyword = document.getElementById("address").value;
	localSearch.setSearchCompleteCallback(function (searchResult) {
	    var poi = searchResult.getPoi(0);
	    document.getElementById("coordinate").value = poi.point.lng + "," + poi.point.lat;
	    map.centerAndZoom(poi.point, 13);
	    var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地方对应的经纬度
	    map.addOverlay(marker);
	});
	localSearch.search(keyword);
}

$('.only-nodeno').on('blur',function(){
	$.post("onlynodeno",{"nodeno":$(this).val()},function(data){
		console.log("唯一编号数据："+data);
		$(".onlynodeno").val(data);
	});
});
$('.only-nodeno').focus(function(){
	$(this).parent().removeClass("has-error has-feedback");
	$('.alert-danger').css('display', 'none');
});


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
			// 排除哪些字段是可以为空的，并设置默认值为0
			if(index == 18 || index == 19|| index ==21 || index == 22 || index == 23|| index == 24 || index == 26 || index == 27 ||
					index == 28|| index == 29|| index == 30 || index == 34 || index == 35 || index == 36|| index == 37 || index == 38){
				console.log("index="+index);
				$(this).val("0");
				return true;
			}
			if(index==45){
				$(this).val("--");
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
				 var flag =$(".onlynodeno").val();
				if(flag=="false"){
					$(this).parent().addClass("has-error has-feedback");
 					alertCheck("该井编号已存在");
 					isRight=0;
 					return false;
				} 
			}
			// 在这个里面进行其他的判断；不为空的错误信息提醒
			return true;
		}
	});
	if (isRight == 0) {
		 return false;
	} else if (isRight == 1) {
		 return true;
	}
}

</script>
</html>