
<div class="alert alert-danger alert-dismissable" role="alert"
	style="display: none;">
	错误信息:
	<button class="close thisclose" type="button">&times;</button>
	<span class="error-mess"></span>
</div>
<div class="row bodyone">
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井编号</span></label>
		<p>${(dcnode.nodeNo)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>项目编号</span></label>
		<p>${(dcnode.project.projectNo)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>工作编号</span></label>
		<p>${(dcnode.workNo)!''}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>IDMS Manhole ID</span></label>
		<p>${(dcnode.idmsManholeId)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>DSD ref</span></label>
		<p>${(dcnode.dsdRef)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>地图区域代码</span></label>
		<p>${(dcnode.drainageAreaCode)!''}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井坐标</span></label> <#if dcnode?? &
		dcnode.zbx?? && dcnode.zby??>
		<p>${(dcnode.zbx)!''},${(dcnode.zby)!''}</p>
		<#else>
		<p>,</p>
		</#if>
	</div>
	<div class="col-md-1 form-group">
		<span> <label class="control-label">建造年份</label>
		</span>
		<p>${(dcnode.yearLaid)?date}</p>
	</div>
	<div class="col-md-1 form-group">
		<span> <label class="control-label">调查时间</label>
		</span>
		<p>${(dcnode.surveyDate)?date}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井状况</span></label>
		<p>${(dcnode.status)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井用途</span></label>
		<p>${(dcnode.function)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井类别</span></label>
		<p>${(dcnode.nodeType)!''}</p>
	</div>

	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖形状</span></label>
		<p>${(dcnode.coverShape)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖类型</span></label>
		<p>${(dcnode.coverType)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有无铰链</span></label>
		<p>${(dcnode.hinged)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有无锁</span></label>
		<p>${(dcnode.locked)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖厚度</span></label>
		<p>${(dcnode.coverDuty)!''}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井盖尺寸</span></label>
		<p>长:${(dcnode.coverSizec)?c} 宽:${(dcnode.coverSizek)?c}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈侧入口(有/无)</span></label>
		<p>${(dcnode.shaftSideEntry)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井颈砖层数量</span></label>
		<p>${(dcnode.shaftRegularCourse)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井颈厚度(mm)</span></label>
		<p>${(dcnode.shaftDepth)?c}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井颈尺寸(长或半径,mm)</span></label>
		<p>长:${(dcnode.shaftSizec)?c} 宽:${(dcnode.shaftSizek)?c}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>胆顶形状</span></label>
		<p>${(dcnode.chamberSoffit)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>台阶数量</span></label>
		<p>${(dcnode.chamberSteps)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>梯子数量</span></label>
		<p>${(dcnode.chamberLadders)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>LNDGS</span></label>
		<p>${(dcnode.chamberLndgs)!''}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>井胆尺寸(长或半径,mm)</span></label>
		<p>长:${(dcnode.chamberSizec)?c} 宽:${(dcnode.chamberSizek)?c}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>有毒气体</span></label>
		<p>${(dcnode.toxic)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>害虫证据</span></label>
		<p>${(dcnode.vermin)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井胆建造方法</span></label>
		<p>${(dcnode.constructCode)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>流动深度(mm)</span></label>
		<p>${(dcnode.depthOfFlow)?c}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>淤泥深度(mm)</span></label>
		<p>${(dcnode.depthOfSilt)?c}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>Height surch(mm)</span></label>
		<p>${(dcnode.heightSurch)?c}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>MH depth(m)</span></label>
		<p>${(dcnode.mhDepth)?c}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>海拔(m)</span></label>
		<p>${(dcnode.coverLevel)?c}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utr</span></label>
		<p>${(dcnode.utr)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utl</span></label>
		<p>${(dcnode.utl)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>utga</span></label>
		<p>${(dcnode.utga)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>uts</span></label>
		<p>${(dcnode.uts)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>jetting</span></label>
		<p>${(dcnode.jetting)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>是否在斜坡</span></label>
		<p>${(dcnode.onSlope)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>斜坡编号</span></label>
		<p>${(dcnode.slopeNo)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井盖损坏</span></label>
		<p>${(dcnode.coverCondition)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>梯子损坏</span></label>
		<p>${(dcnode.ladderCondition)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井颈损坏</span></label>
		<p>${(dcnode.shaftCondition)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>井胆损坏</span></label>
		<p>${(dcnode.chamberCondition)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>台阶损坏</span></label>
		<p>${(dcnode.benchingCondition)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>其他损坏</span></label>
		<p>${(dcnode.othersCondition)!''}</p>
	</div>
	<div class="col-md-2 form-group">
		<label class="control-label"><span>record plan
				difference</span></label>
		<p>${(dcnode.recordPlanDifference)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>CCTV COND</span></label>
		<p>${(dcnode.cctvCond)!''}</p>
	</div>
	<div class="col-md-1 form-group">
		<label class="control-label"><span>Crity</span></label>
		<p>${(dcnode.crity)!''}</p>
	</div>
	<div class="col-md-4 form-group">
		<label class="control-label"><span>井地址</span></label> <#if dcnode?? &
		dcnode.location?? & dcnode.location!="">
		<p>${(dcnode.location)!''}</p>
		<#else>
		<p>--</p>
		</#if>
	</div>
	<div class="col-md-6 form-group">
		<label class="control-label"><span>备注</span></label> <#if dcnode?? &
		dcnode.remark?? & dcnode.remark !="">
		<p>${(dcnode.remark)!''}</p>
		<#else>
		<p>--</p>
		</#if>
	</div>
</div>
