<div class="box-body">
	<div class="row">
		<div class="col-md-12 form-group">
			<label class="control-label"><span>location photo</span></label>
			<div class="form-group biankuang" id="container1">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="locationphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="lophopath" class="imgpath" type="hidden"
						value="${(dcnode.locationPhoto)!''}" /> <input name="lophodelpath" class="deletepath"
						type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if dcnode?? & dcnode.locationPhoto?? & dcnode.locationPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group">
			<label class="control-label"><span>internal photo</span></label>
			<div class="form-group biankuang" id="container2">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="internalphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="inphopath" class="imgpath" type="hidden" value="${(dcnode.internalPhoto)!''}" />
					<input name="inphodelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if dcnode?? & dcnode.internalPhoto?? & dcnode.internalPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group ">
			<label class="control-label"><span>location sketch</span></label>
			<div class="form-group biankuang" id="container3">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="locationsketch" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="loskepath" class="imgpath" type="hidden" value="${(dcnode.locationSketch)!''}" />
					<input name="loskedelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if dcnode?? & dcnode.locationSketch?? & dcnode.locationSketch!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group">
			<label class="control-label"><span>plan of mh</span></label>
			<div class="form-group biankuang" id="container4">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="planofmh" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="pompath" class="imgpath" type="hidden" value="${(dcnode.planOfMh)!''}" />
					<input name="pomdelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if dcnode?? & dcnode.planOfMh?? & dcnode.planOfMh!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group " style="display: none">
			<label class="control-label"><span>cover photo</span></label>
			<div class="form-group biankuang" id="coverCondition">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="coverphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="cophopath" class="imgpath" type="hidden" value="${(dcnode.coverPhoto)!''}" />
					<input name="cophodelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
					<#if dcnode?? & dcnode.coverPhoto?? & dcnode.coverPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group " style="display: none">
			<label class="control-label"><span>ladder photo</span></label>
			<div class="form-group biankuang" id="ladderCondition">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="ladderphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="laphopath" class="imgpath" type="hidden" value="${(dcnode.ladderPhoto)!''}" />
					<input name="laphodelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if dcnode?? & dcnode.ladderPhoto?? & dcnode.ladderPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group " style="display: none">
			<label class="control-label"><span>shaft photo</span></label>
			<div class="form-group biankuang" id="shaftCondition">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="shaftphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="shphopath" class="imgpath" type="hidden" value="${(dcnode.shaftPhoto)!''}" />
					<input name="shphodelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if dcnode?? & dcnode.shaftPhoto?? & dcnode.shaftPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
			</div>
		</div>
		<div class="col-md-12 form-group " style="display: none">
			<label class="control-label"><span>chamber photo</span></label>
			<div class="form-group biankuang" id="chamberCondition">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="chamberphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="chphopath" class="imgpath" type="hidden" value="${(dcnode.chamberPhoto)!''}" />
					<input name="chphodelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
					<#if dcnode?? & dcnode.chamberPhoto?? & dcnode.chamberPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group " style="display: none">
			<label class="control-label"><span>benching photo</span></label>
			<div class="form-group biankuang" id="benchingCondition">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="benchingphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="bephopath" class="imgpath" type="hidden" value="${(dcnode.benchingPhoto)!''}" />
					<input name="bephodelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if dcnode?? & dcnode.benchingPhoto?? & dcnode.benchingPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group" style="display: none">
			<label class="control-label"><span>others photo</span></label>
			<div class="form-group biankuang" id="othersCondition">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="otherphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input name="otphopath" class="imgpath" type="hidden" value="${(dcnode.othersPhoto)!''}" />
					<input name="otphodelpath" class="deletepath" type="hidden" value="" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if dcnode?? & dcnode.othersPhoto?? & dcnode.othersPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
	</div>
</div>