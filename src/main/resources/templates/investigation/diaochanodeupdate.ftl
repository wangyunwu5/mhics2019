
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
			value="${(dcnode.nodeNo)!''}" /> <input type="hidden"
			class="onlynodeno" value="" /> <input type="hidden" name="dcNodeId"
			value="${(dcnode.dcNodeId)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>项目编号</span></label> <select
			class="form-control" name="projectId"
			value="${(dcnode.project.projectNo)!''}"> <#list projects as
			project>
			<option value="${(project.projectId)!''}">${(project.projectNo)!''}</option>
			</#list>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>工作编号</span></label> <input
			name="workNo" class="form-control" value="${(dcnode.workNo)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>IDMS Manhole ID</span></label> <input
			name="idmsManholeId" class="form-control nocheck"
			value="${(dcnode.idmsManholeId)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>DSD ref</span></label> <input
			name="dsdRef" class="form-control nocheck"
			value="${(dcnode.dsdRef)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>地图区域代码</span></label> <input
			name="drainageAreaCode" class="form-control nocheck"
			value="${(dcnode.drainageAreaCode)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井坐标</span></label> <label>
			<a href="#" class="togetmap" onClick="showModel()">去获取坐标</a>
		</label> <input id="zuobiao" name="zuobiao" class="form-control"
			value="${(dcnode.zbx)!''},${(dcnode.zby)!''}" />
	</div>
	<div id="map">
		<div class="model-content"><#include "map.ftl"></div>
	</div>
	<div class="col-md-1 form-group">
		<span> <label class="control-label">建造年份</label></span> <input
			name="yearLaid" class="form-control nocheck" id="start"
			onclick="WdatePicker()" value="${(dcnode.yearLaid)?date}" />
	</div>
	<div class="col-md-1 form-group">
		<span> <label class="control-label">调查日期</label></span> <input
			name="surveyDate" class="form-control nocheck" id="start"
			onclick="WdatePicker()" value="${(dcnode.surveyDate)?date}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井状况</span></label> <select
			class="form-control" name="status" value="${(dcnode.status)!''}">
			<#list standards as standard> <#if standard.descriptionEn ==
			"status">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井用途</span></label> <select
			class="form-control" name="function" value="${(dcnode.function)!''}">
			<#list standards as standard> <#if standard.descriptionEn ==
			"function">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井类别</span></label> <select
			class="form-control" name="nodeType" value="${(dcnode.nodeType)!''}">
			<#list standards as standard> <#if standard.descriptionEn ==
			"nodetype">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-3 form-group">
		<label class="control-label"><span>井地址</span></label> <input
			name="location" class="form-control" value="${(dcnode.location)!''}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖形状</span></label> <select
			class="form-control" name="coverShape"
			value="${(dcnode.coverShape)!''}"> <#list standards as
			standard> <#if standard.descriptionEn == "covershape">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖类型</span></label> <select
			class="form-control" name="coverType" value="${(dcnode.coverType)!''}">
			<#list standards as standard> <#if standard.descriptionEn ==
			"covertype">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有无铰链</span></label> <select
			class="form-control" name="hinged" value="${(dcnode.hinged)!''}">
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有无锁</span></label> <select
			class="form-control" name="locked" value="${(dcnode.locked)!''}">
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖厚度</span></label> <select
			class="form-control" name="coverDuty" value="${(dcnode.coverDuty)!''}">
			<#list standards as standard> <#if standard.descriptionEn ==
			"coverduty">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井盖尺寸(长或半径,mm)</span></label> <input
			name="coverSizec" class="form-control nocheck"
			value="${(dcnode.coverSizec)?c}" />
	</div>

	<div class="col-md-2 form-group">
		<label class="control-label"><span>井盖尺寸(宽,mm)</span></label> <input
			name="coverSizek" class="form-control nocheck"
			value="${(dcnode.coverSizek)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈侧入口(有/无)</span></label> <select
			class="form-control" name="shaftSideEntry"
			value="${(dcnode.shaftSideEntry)!''}">
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井颈砖层数量</span></label> <input
			name="shaftRegularCourse" class="form-control nocheck"
			value="${(dcnode.shaftRegularCourse)!''}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈厚度(mm)</span></label> <input
			name="shaftDepth" class="form-control nocheck"
			value="${(dcnode.shaftDepth)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈尺寸(长或半径,mm)</span></label> <input
			name="shaftSizec" class="form-control nocheck"
			value="${(dcnode.shaftSizec)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈尺寸(宽,mm)</span></label> <input
			name="shaftSizek" class="form-control nocheck"
			value="${(dcnode.shaftSizek)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>胆顶形状</span></label> <select
			class="form-control" name="chamberSoffit"
			value="${(dcnode.chamberSoffit)!''}"> <#list standards as
			standard> <#if standard.descriptionEn == "soffit">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>台阶数量</span></label> <input
			name="chamberSteps" class="form-control nocheck"
			value="${(dcnode.chamberSteps)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>梯子数量</span></label> <input
			name="chamberLadders" class="form-control nocheck"
			value="${(dcnode.chamberLadders)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>LNDGS</span></label> <input
			name="chamberLndgs" class="form-control nocheck"
			value="${(dcnode.chamberLndgs)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井胆尺寸(长或半径,mm)</span></label> <input
			name="chamberSizec" class="form-control nocheck"
			value="${(dcnode.chamberSizec)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井胆尺寸(宽,mm)</span></label> <input
			name="chamberSizek" class="form-control nocheck"
			value="${(dcnode.chamberSizek)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有毒气体</span></label> <select
			class="form-control" name="toxic" value="${(dcnode.toxic)!''}">
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>害虫证据</span></label> <select
			class="form-control" name="vermin" value="${(dcnode.vermin)!''}">
			<option value="无">无</option>
			<option value="有">有</option>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井胆建造方法</span></label> <select
			class="form-control" name="constructCode"
			value="${(dcnode.constructCode)!''}"> <#list standards as
			standard> <#if standard.descriptionEn == "constructcode">
			<option value="${(standard.codeSimple)!''}">${(standard.codeSimple)!''}</option>
			</#if> </#list>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>流动深度(mm)</span></label> <input
			name="depthOfFlow" class="form-control nocheck"
			value="${(dcnode.depthOfFlow)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>淤泥深度(mm)</span></label> <input
			name="depthOfSilt" class="form-control nocheck"
			value="${(dcnode.depthOfSilt)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>Height surch(mm)</span></label> <input
			name="heightSurch" class="form-control nocheck"
			value="${(dcnode.heightSurch)?c}" />
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>MH depth(m)</span></label> <input
			name="mhDepth" class="form-control nocheck"
			value="${(dcnode.mhDepth)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>海拔(m)</span></label> <input
			name="coverLevel" class="form-control nocheck"
			value="${(dcnode.coverLevel)?c}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utr</span></label> <select
			class="form-control" name="utr" value="${(dcnode.utr)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utl</span></label> <select
			class="form-control" name="utl" value="${(dcnode.utl)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utga</span></label> <select
			class="form-control" name="utga" value="${(dcnode.utga)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>uts</span></label> <select
			class="form-control" name="uts" value="${(dcnode.uts)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>jetting</span></label> <select
			class="form-control" name="jetting" value="${(dcnode.jetting)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>是否在斜坡</span></label> <select
			class="form-control slopeNo" name="onSlope"
			value="${(dcnode.onSlope)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group" style="display: none">
		<label class="control-label"><span>斜坡编号</span></label> <input
			name="slopeNo" id="onSlope" class="form-control nocheck"
			value="${(dcnode.slopeNo)!''}" />
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖损坏</span></label> <select
			class="form-control condition" name="coverCondition"
			value="${(dcnode.coverCondition)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>梯子损坏</span></label> <select
			class="form-control condition" name="ladderCondition"
			value="${(dcnode.ladderCondition)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井颈损坏</span></label> <select
			class="form-control condition" name="shaftCondition"
			value="${(dcnode.shaftCondition)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井胆损坏</span></label> <select
			class="form-control condition" name="chamberCondition"
			value="${(dcnode.chamberCondition)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>台阶损坏</span></label> <select
			class="form-control condition" name="benchingCondition"
			value="${(dcnode.benchingCondition)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>其他损坏</span></label> <select
			class="form-control condition" name="othersCondition"
			value="${(dcnode.othersCondition)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>record plan
				difference</span></label> <select class="form-control" name="recordPlanDifference"
			value="${(dcnode.recordPlanDifference)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>CCTV COND</span></label> <select
			class="form-control" name="cctvCond" value="${(dcnode.cctvCond)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>Crity</span></label> <select
			class="form-control" name="crity" value="${(dcnode.crity)!''}">
			<option value="否">否</option>
			<option value="是">是</option>
		</select>
	</div>
	<div class="col-md-6 form-group">
		<label class="control-label"><span>备注</span></label> <input
			name="remark" class="form-control nocheck"
			value="${(dcnode.remark)!''}" />
	</div>
</div>
