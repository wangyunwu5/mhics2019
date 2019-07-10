
<div class="alert alert-danger alert-dismissable" role="alert"
	style="display: none;">
	错误信息:
	<button class="close thisclose" type="button">&times;</button>
	<span class="error-mess"></span>
</div>
<div class="row">
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井编号</span></label> <input
			name="nodeNo" class="form-control only-nodeno"
			value="${(node.nodeNo)!''}" /> <input type="hidden"
			class="onlynodeno" value="" /> <input type="hidden" name="nodeId"
			value="${(node.nodeId)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>项目编号</span></label>
		<input type="hidden" id="projectno" value="${(node.project.projectNo)!''}">
		 <select class="form-control" name="projectId" id="projectid">
			 <#list projects as project>
				<option value="${(project.projectId)!''}">${(project.projectNo)!''}</option>
			</#list>
		</select>
		<script type="text/javascript">
		$(document).ready(function(){  
			var key=$("#projectno").val();
			console.log("projectno为"+key)
		     //根据值让option选中 
		     $("#projectid option").each(function(){
		    	 var options=$(this).text();
		    	 if(options == key){
		    		 console.log("sda"+options);
		    		 $(this).attr("selected","selected"); 
		    	 }
		     });
		}); 
		</script>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>工作编号</span></label> <input
			name="workNo" class="form-control" value="${(node.workNo)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>IDMS Manhole ID</span></label> <input
			name="idmsManholeId" class="form-control nocheck"
			value="${(node.idmsManholeId)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>DSD ref</span></label> <input
			name="dsdRef" class="form-control nocheck"
			value="${(node.dsdRef)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>地图区域代码</span></label> <input
			name="drainageAreaCode" class="form-control nocheck"
			value="${(node.drainageAreaCode)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井坐标</span></label> <label>
			<a href="#" class="togetmap" onClick="showModel()">去获取坐标</a>
		</label> <input id="zuobiao" name="zuobiao" class="form-control"
			value="${(node.zbx)!''},${(node.zby)!''}" />
	</div>
	<div id="map">
		<div class="model-content"><#include "map.ftl"></div>
	</div>
	<div class="col-md-2 form-group">
		<span> <label class="control-label">建造年份</label></span> <input
			name="yearLaid" class="form-control nocheck" id="start"
			onclick="WdatePicker()" value="${(node.yearLaid)?date}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井状况</span></label> <select
			class="form-control" name="status" >
			<option value="${(node.status)!''}">${(node.status)!''}</option>
			<#list standards as standard> <#if standard.descriptionEn =="status">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井用途</span></label> <select
			class="form-control" name="function" >
			<option value="${(node.function)!''}">${(node.function)!''}</option>
			<#list standards as standard> <#if standard.descriptionEn =="function">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井类别</span></label> <select
			class="form-control" name="nodeType" >
			<option value="${(node.nodeType)!''}">${(node.nodeType)!''}</option>
			<#list standards as standard> <#if standard.descriptionEn =="nodetype">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-3 form-group">
		<label class="control-label"><span>井地址</span></label> <input
			name="location" class="form-control" value="${(node.location)!''}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖形状</span></label> <select
			class="form-control" name="coverShape"> 
			<option value="${(node.coverShape)!''}">${(node.coverShape)!''}</option>
			<#list standards as standard> <#if standard.descriptionEn == "covershape">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖类型</span></label> <select
			class="form-control" name="coverType" >
			<option value="${(node.coverType)!''}">${(node.coverType)!''}</option>
			<#list standards as standard> <#if standard.descriptionEn ==
			"covertype">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有无铰链</span></label> <select
			class="form-control" name="hinged" >
			<option value="${(node.hinged)!''}">${(node.hinged)!''}</option>
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有无锁</span></label> <select
			class="form-control" name="locked" >
			<option value="${(node.locked)!''}">${(node.locked)!''}</option>
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖厚度</span></label> <select
			class="form-control" name="coverDuty" >
			<option value="${(node.coverDuty)!''}">${(node.coverDuty)!''}</option>
			<#list standards as standard> <#if standard.descriptionEn =="coverduty">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井盖尺寸(长或半径,mm)</span></label> <input
			name="coverSizec" class="form-control nocheck"
			value="${(node.coverSizec)?c}" />
	</div>

	<div class="col-md-2 form-group">
		<label class="control-label"><span>井盖尺寸(宽,mm)</span></label> <input
			name="coverSizek" class="form-control nocheck"
			value="${(node.coverSizek)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈侧入口(有/无)</span></label> <select
			class="form-control" name="shaftSideEntry">
			<option value="${(node.shaftSideEntry)!''}">${(node.shaftSideEntry)!''}</option>
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井颈砖层数量</span></label> <input
			name="shaftRegularCourse" class="form-control nocheck"
			value="${(node.shaftRegularCourse)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈厚度(mm)</span></label> <input
			name="shaftDepth" class="form-control nocheck"
			value="${(node.shaftDepth)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈尺寸(长或半径,mm)</span></label> <input
			name="shaftSizec" class="form-control nocheck"
			value="${(node.shaftSizec)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈尺寸(宽,mm)</span></label> <input
			name="shaftSizek" class="form-control nocheck"
			value="${(node.shaftSizek)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>胆顶形状</span></label> <select
			class="form-control" name="chamberSoffit">
			<option value="${(node.chamberSoffit)!''}">${(node.chamberSoffit)!''}</option>
			 <#list standards as standard> <#if standard.descriptionEn == "soffit">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>台阶数量</span></label> <input
			name="chamberSteps" class="form-control nocheck"
			value="${(node.chamberSteps)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>梯子数量</span></label> <input
			name="chamberLadders" class="form-control nocheck"
			value="${(node.chamberLadders)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>LNDGS</span></label> <input
			name="chamberLndgs" class="form-control nocheck"
			value="${(node.chamberLndgs)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井胆尺寸(长或半径,mm)</span></label> <input
			name="chamberSizec" class="form-control nocheck"
			value="${(node.chamberSizec)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井胆尺寸(宽,mm)</span></label> <input
			name="chamberSizek" class="form-control nocheck"
			value="${(node.chamberSizek)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有毒气体</span></label> <select
			class="form-control" name="toxic" >
			<option value="${(node.toxic)!''}">${(node.toxic)!''}</option>
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>害虫证据</span></label> <select
			class="form-control" name="vermin" >
			<option value="${(node.vermin)!''}">${(node.vermin)!''}</option>
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井胆建造方法</span></label> <select
			class="form-control" name="constructCode">
			<option value="${(node.constructCode)!''}">${(node.constructCode)!''}</option> 
			<#list standards as standard> <#if standard.descriptionEn == "constructcode">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>流动深度(mm)</span></label> <input
			name="depthOfFlow" class="form-control nocheck"
			value="${(node.depthOfFlow)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>淤泥深度(mm)</span></label> <input
			name="depthOfSilt" class="form-control nocheck"
			value="${(node.depthOfSilt)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>Height surch(mm)</span></label> <input
			name="heightSurch" class="form-control nocheck"
			value="${(node.heightSurch)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>MH depth(m)</span></label> <input
			name="mhDepth" class="form-control nocheck"
			value="${(node.mhDepth)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>海拔(m)</span></label> <input
			name="coverLevel" class="form-control nocheck"
			value="${(node.coverLevel)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utr</span></label> <select
			class="form-control" name="utr">
			<option  value="${(node.utr)!''}">${(node.utr)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utl</span></label> <select
			class="form-control" name="utl">
			<option  value="${(node.utl)!''}">${(node.utl)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utga</span></label> <select
			class="form-control" name="utga">
			<option  value="${(node.utga)!''}">${(node.utga)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>uts</span></label> <select
			class="form-control" name="uts" >
			<option value="${(node.uts)!''}">${(node.uts)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>jetting</span></label> <select
			class="form-control" name="jetting">
			<option  value="${(node.jetting)!''}">${(node.jetting)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>是否在斜坡</span></label> <select
			class="form-control slopeNo" name="onSlope">
			<option value="${(node.onSlope)!''}">${(node.onSlope)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group" style="display: none">
		<label class="control-label"><span>斜坡编号</span></label> <input
			name="slopeNo" id="onSlope" class="form-control nocheck"
			value="${(node.slopeNo)!''}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖损坏</span></label> <select
			class="form-control condition" name="coverCondition">
			<option value="${(node.coverCondition)!''}">${(node.coverCondition)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>梯子损坏</span></label> <select
			class="form-control condition" name="ladderCondition">
			<option value="${(node.ladderCondition)!''}">${(node.ladderCondition)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井颈损坏</span></label> <select
			class="form-control condition" name="shaftCondition">
			<option value="${(node.shaftCondition)!''}">${(node.shaftCondition)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井胆损坏</span></label> <select
			class="form-control condition" name="chamberCondition">
			<option value="${(node.chamberCondition)!''}">${(node.chamberCondition)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>台阶损坏</span></label> <select
			class="form-control condition" name="benchingCondition">
			<option value="${(node.benchingCondition)!''}">${(node.benchingCondition)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>其他损坏</span></label> <select
			class="form-control condition" name="othersCondition">
			<option value="${(node.othersCondition)!''}">${(node.othersCondition)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>record plan
				difference</span></label> <select class="form-control" name="recordPlanDifference">
			<option value="${(node.recordPlanDifference)!''}">${(node.recordPlanDifference)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>CCTV COND</span></label> <select
			class="form-control" name="cctvCond" >
			<option value="${(node.cctvCond)!''}">${(node.cctvCond)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>Crity</span></label> <select
			class="form-control" name="crity" >
			<option value="${(node.crity)!''}">${(node.crity)!''}</option>
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-6 form-group">
		<label class="control-label"><span>备注</span></label> <input
			name="remark" class="form-control nocheck"
			value="${(node.remark)!''}" />
	</div>
</div>
