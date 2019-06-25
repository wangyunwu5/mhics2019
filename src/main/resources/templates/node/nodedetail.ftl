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
}
.photo-p{
	display:inline-block;
}
</style>
</head>

<body style="background-color: #ecf0f5;">
	<div class="row" style="padding-top: 10px;">
		<div class="col-md-2">
			<h1 style="font-size: 24px; margin: 0;" class="">沙井信息</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">沙井信息</a>
		</div>
	</div>
	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12">
			<!--id="container"-->
			<div class="bgc-w box">
				<form action="nodesave" method="post" onsubmit=";">
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
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井编号</span></label> 
									<p>
									${node.nodeNo}
									</p>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>项目编号</span></label>
									<p>${node.project.projectNo}</p>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>工作编号</span></label>
									<p>${node.workNo}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>IDMS Manhole ID</span></label> 
									<p>${node.idmsManholeId}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>DSD ref</span></label> 
									<p>${node.dsdRef}</p>
								</div> 
								<div class="col-md-2 form-group">	
									<label class="control-label"><span>地图区域代码</span></label> 
									<p>${node.drainageAreaCode}</p>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井坐标</span></label> 
									<p>${node.zbx}--${node.zby}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>调查人</span></label> 
									<p>${node.insertMan.userAccount}</p>
								</div>
								<div class="col-md-1 form-group">
									<span> <label class="control-label">调查日期</label>
									</span> <p>${node.surveyDate}</p>
								</div>
								<div class="col-md-1 form-group">
									<span> <label class="control-label">建造年份</label>
									</span>  <p>${node.yearLaid}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井状况</span></label> 
									<p>${node.status}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井用途</span></label> 
									<p>${node.function}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井类别</span></label> 
									<p>${node.nodeType}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井地址</span></label> 
									<p>${node.location}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖形状</span></label> 
									<p>${node.coverShape}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖类型</span></label> 
									<p>${node.coverType}</p>
								</div>  
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有无铰链</span></label> 
									<p>${node.hinged}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有无锁</span></label>
									<p>${node.locked}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖厚度</span></label> 
								    <p>${node.coverDuty}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井盖尺寸</span></label> 
									  <p>长:${node.coverSizec} 宽:${node.coverSizek}</p>
								</div> 
								
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井颈侧入口(有/无)</span></label> 
									<p>${node.shaftSideEntry}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井颈砖层数量</span></label> 
									<p>${node.shaftRegularCourse}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井颈厚度(mm)</span></label> 
									<p>${node.shaftDepth}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井颈尺寸(长或半径,mm)</span></label> 
									<p>长:${node.shaftSizec} 宽:${node.shaftSizek}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>胆顶形状</span></label> 
									<p>${node.chamberSoffit}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>台阶数量</span></label> 
									<p>${node.chamberSteps}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>梯子数量</span></label> 
									<p>${node.chamberLadders}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>LNDGS</span></label>
									<p>${node.chamberLndgs}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井胆尺寸(长或半径,mm)</span></label> 
									<p>长:${node.chamberSizec} 宽:${node.chamberSizek}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>有毒气体</span></label> 
									<p>${node.toxic}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>害虫证据</span></label>
									<p>${node.vermin}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>井胆建造方法</span></label> 
									<p>${node.constructCode}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>流动深度(mm)</span></label>
									<p>${node.depthOfFlow}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>淤泥深度(mm)</span></label> 
									<p>${node.depthOfSilt}</p>
								</div> 
								<div class="col-md-2 form-group">
									<label class="control-label"><span>Height surch(mm)</span></label>
									<p>${node.heightSurch}</p>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>MH depth(m)</span></label> 
									<p>${node.mhDepth}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>海拔(m)</span></label> 
									<p>${node.coverLevel}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utr</span></label> 
									<p>${node.utr}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utl</span></label> 
									<p>${node.utl}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>utga</span></label> 
									<p>${node.utga}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>uts</span></label> 
									<p>${node.uts}</p>
								</div> 
								<div class="col-md-1 form-group">
									<label class="control-label"><span>jetting</span></label> 
									<p>${node.jetting}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>是否在斜坡</span></label> 
									<p>${node.onSlope}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>斜坡编号</span></label>
									<p>${node.slopeNo}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井盖损坏</span></label> 
									<p>${node.coverCondition}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>梯子损坏</span></label> 
									<p>${node.ladderCondition}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井颈损坏</span></label> 
									<p>${node.shaftCondition}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>井胆损坏</span></label> 
									<p>${node.chamberCondition}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>台阶损坏</span></label> 
									<p>${node.benchingCondition}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>其他损坏</span></label> 
									<p>${node.othersCondition}</p>
								</div>
								<div class="col-md-2 form-group">
									<label class="control-label"><span>record plan difference</span></label> 
									<p>${node.recordPlanDifference}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>CCTV COND</span></label> 
									<p>${node.cctvCond}</p>
								</div>
								<div class="col-md-1 form-group">
									<label class="control-label"><span>Crity</span></label> 
									<p>${node.crity}</p>
								</div>
								<div class="col-md-6 form-group">
									<label class="control-label"><span>备注</span></label> 
									<p>${node.remark}</p>
								</div>
								 <!-- <div class="col-md-12 form-group ">
										<label class="control-label"><span>location photo</span></label> 
										<div class="form-group biankuang" id="container1">
											<div class="btn btn-default" style="position: relative; overflow: hidden;">
												<i class="glyphicon glyphicon-open"></i> 上传照片
											 	<input type="file" name="locationPhoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
												style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											</div>
											<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
										</div>
								</div>
								<div class="col-md-12 form-group ">
									<label class="control-label"><span>internal photo</span></label> 
										<div class="form-group biankuang" id="container2">
											<div class="btn btn-default" style="position: relative; overflow: hidden;">
												<i class="glyphicon glyphicon-open"></i> 上传照片
											 	<input type="file" name="internalPhoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
												style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
											</div>
											<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
										</div>
								</div>
								<div class="col-md-12 form-group ">
									<label class="control-label"><span>location sketch</span></label> 
									<div class="form-group biankuang" id="container3">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="locationSketch" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group">
									<label class="control-label"><span>plan of mh</span></label> 
								    <div class="form-group biankuang" id="container4">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="planOfMh" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>cover photo</span></label> 
									<div class="form-group biankuang" id="coverCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="coverPhoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>ladder photo</span></label>
									<div class="form-group biankuang" id="ladderCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="ladderPhoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>shaft photo</span></label> 
									<div class="form-group biankuang" id="shaftCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="shaftPhoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>chamber photo</span></label> 
									<div class="form-group biankuang" id="chamberCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="chamberPhoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>benching photo</span></label> 
									<div class="form-group biankuang" id="benchingCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="benchingPhoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div>
								<div class="col-md-12 form-group " style="display:none">
									<label class="control-label"><span>others photo</span></label> 
									<div class="form-group biankuang" id="othersCondition">
										<div class="btn btn-default" style="position: relative; overflow: hidden;">
											<i class="glyphicon glyphicon-open"></i> 上传照片
										 	<input type="file" name="othersPhoto" multiple accept = 'image/gif,image/jpeg,image/jpg,image/png'
											style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
										</div>
										<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
									</div>
								</div> -->
							</div>
						</div>
					</div>
					<!--盒子尾-->
					<div class="box-footer">
							<input class="btn btn-primary" id="save" type="submit" value="保存" />
							<input class="btn btn-default" id="cancel" type="button" value="取消"
							onclick="window.history.back();return false;" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
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