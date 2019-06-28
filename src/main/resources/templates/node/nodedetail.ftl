<div class="box-body">
	<div class="alert alert-danger alert-dismissable" role="alert"
		style="display: none;">
		错误信息:
		<button class="close thisclose" type="button">&times;</button>
		<span class="error-mess"></span>
	</div>
	<div class="row bodyone">
		<div class="col-md-1 form-group">
			<label class="control-label"><span>井编号</span></label>
			<p>${(node.nodeNo)!''}</p>
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
			<label class="control-label"><span>井坐标</span></label> <#if node?? &
			node.zbx?? && node.zby??>
			<p>${(node.zbx)!''},${(node.zby)!''}</p>
			<#else>
			<p>,</p>
			</#if>
		</div>
		<div class="col-md-2 form-group">
			<span> <label class="control-label">建造年份</label>
			</span>
			<p>${(node.yearLaid)!''}</p>
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
			<p>长:${(node.coverSizec)?c} 宽:${(node.coverSizek)?c}</p>
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
			<p>${(node.shaftDepth)?c}</p>
		</div>
		<div class="col-md-2 form-group">
			<label class="control-label"><span>井颈尺寸(长或半径,mm)</span></label>
			<p>长:${(node.shaftSizec)?c} 宽:${(node.shaftSizek)?c}</p>
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
			<p>长:${(node.chamberSizec)?c} 宽:${(node.chamberSizek)?c}</p>
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
			<p>${(node.depthOfFlow)?c}</p>
		</div>
		<div class="col-md-1 form-group">
			<label class="control-label"><span>淤泥深度(mm)</span></label>
			<p>${(node.depthOfSilt)?c}</p>
		</div>
		<div class="col-md-2 form-group">
			<label class="control-label"><span>Height surch(mm)</span></label>
			<p>${(node.heightSurch)?c}</p>
		</div>
		<div class="col-md-2 form-group">
			<label class="control-label"><span>MH depth(m)</span></label>
			<p>${(node.mhDepth)?c}</p>
		</div>
		<div class="col-md-1 form-group">
			<label class="control-label"><span>海拔(m)</span></label>
			<p>${(node.coverLevel)?c}</p>
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
			<label class="control-label"><span>record plan
					difference</span></label>
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
			<label class="control-label"><span>井地址</span></label> <#if node?? &
			node.location?? & node.location!="">
			<p>${(node.location)!''}</p>
			<#else>
			<p>--</p>
			</#if>
		</div>
		<div class="col-md-6 form-group">
			<label class="control-label"><span>备注</span></label> <#if node?? &
			node.remark?? & node.remark !="">
			<p>${(node.remark)!''}</p>
			<#else>
			<p>--</p>
			</#if>
		</div>
	</div>
</div>