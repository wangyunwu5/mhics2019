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
					<input class="imgpath" type="hidden"
						value="${(node.locationPhoto)!''}" /> <input class="nodeno"
						type="hidden" value="${(node.nodeNo)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if node?? & node.locationPhoto?? & node.locationPhoto!=''> <a
					href="#" id="xiugai" class="label xiugai"
					style="margin-left: 20px;"> <span
					class="glyphicon glyphicon-edit"></span>修改
				</a> </#if>
			</div>
		</div>
		<div class="col-md-12 form-group ">
			<label class="control-label"><span>internal photo</span></label>
			<div class="form-group biankuang" id="container2">
				<div class="btn btn-default"
					style="position: relative; overflow: hidden;">
					<i class="glyphicon glyphicon-open"></i> 上传照片 <input type="file"
						name="internalphoto" multiple
						accept='image/gif,image/jpeg,image/jpg,image/png'
						style="opacity: 0; position: absolute; top: 0; right: 0; min-width: 100%; min-height: 100%;">
					<input class="imgpath" type="hidden"
						value="${(node.internalPhoto)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
				<#if node?? & node.internalPhoto?? & node.internalPhoto!=''> <a
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
					<input class="imgpath" type="hidden"
						value="${(node.locationSketch)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
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
					<input class="imgpath" type="hidden" value="${(node.planOfMh)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
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
					<input class="imgpath" type="hidden"
						value="${(node.coverPhoto)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
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
					<input class="imgpath" type="hidden"
						value="${(node.ladderPhoto)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
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
					<input class="imgpath" type="hidden"
						value="${(node.shaftPhoto)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
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
					<input class="imgpath" type="hidden"
						value="${(node.chamberPhoto)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
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
					<input class="imgpath" type="hidden"
						value="${(node.benchingPhoto)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
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
					<input class="imgpath" type="hidden"
						value="${(node.othersPhoto)!''}" />
				</div>
				<p class="help-block photo-p">尺寸在512*512以内，大小在500KB以内</p>
			</div>
		</div>
	</div>
</div>