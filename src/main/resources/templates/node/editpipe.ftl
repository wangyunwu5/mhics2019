<div class="box-body">
	<div class="row">
		<div class="col-md-12 form-group">
			<label class="control-label"> <span>管道信息</span> <a
				href="javascript:;" class="label label-success addpipe"
				style="padding: 5px; margin-left: 10px;"> <span
					class="glyphicon glyphicon-plus"></span> 新增管道
			</a> <a href="javascript:;" class="label  deletepipe"
				style="background-color: #d9534f; padding: 5px; margin-left: 10px;">
					<span class="glyphicon glyphicon-remove"></span> 删除管道
			</a>
			</label>
			<div class="form-group biankuang">
				<table style="width: 100%" class="pipe-table" id="pipe-table">
					<thead>
						<tr>
							<td width="4%">编号</td>
							<td width="6%">pipe no</td>
							<td width="6%">pipe type</td>
							<td width="6%">pipe shape</td>
							<td width="16%">pipe size(mm)</td>
							<td width="8%">backdrop(mm)</td>
							<td width="8%">pipe material*</td>
							<td width="6%">lining</td>
							<td width="8%">pipe depth(m)</td>
							<td width="8%">invert(mPD)</td>
							<td width="6%">photo</td>
							<td width="8%">wall no.</td>
							<td width="8%">location</td>
						</tr>
					</thead>
					<tbody class="pipe-table-body">
						<#if pipes??> <#list pipes as pipe>
						<tr>
							<td>${pipe_index+1}</td>
							<td><input name="pipe[${pipe_index}].pipeNo" class=""
								value="${(pipe.pipeNo)!''}" placeholder="待输入" /></td>
							<td><input name="pipe[${pipe_index}].pipeType" id="myCar"
								list="pipetype" value="${(pipe.pipeType)!''}" placeholder="待输入" />
								<datalist id="pipetype">
									<option value="in">
									<option value="out">
								</datalist></td>
							<td><input name="pipe[${pipe_index}].pipeShape" class=""
								value="${(pipe.pipeShape)!''}" placeholder="待输入" /></td>
							<td>
								<div class="pipetype-table" style="width: 100%">
									<div style="width: 45%">
										<input name="pipe[${pipe_index}].pipeSizec" class=""
											value="${(pipe.pipeSizec)!''}" placeholder="长或半径" />
									</div>
									<div class="pipetype-table-x">X</div>
									<div style="width: 45%">
										<input name="pipe[${pipe_index}].pipeSizek" class=""
											value="${(pipe.pipeSizek)!''}" placeholder="宽" />
									</div>
								</div>
							</td>
							<td><input name="pipe[${pipe_index}].backDrop" class=""
								value="${(pipe.backDrop)!''}" placeholder="待输入" /></td>
							<td><input name="pipe[${pipe_index}].pipeMaterial" class=""
								value="${(pipe.pipeMaterial)!''}" placeholder="待输入" /></td>
							<td><input name="pipe[${pipe_index}].lining" class=""
								value="${(pipe.lining)!''}" placeholder="待输入" /></td>
							<td><input name="pipe[${pipe_index}].pipeDepth" class=""
								value="${(pipe.pipeDepth)!''}" placeholder="待输入" /></td>
							<td><input name="pipe[${pipe_index}].invert" class=""
								value="${(pipe.invert)!''}" /></td>
							<td><input name="pipe[${pipe_index}].pipePhoto" class=""
								value="${(pipe.pipePhoto)!''}" placeholder="待输入" /></td>
							<td><input name="pipe[${pipe_index}].wallNo" class=""
								value="${(pipe.wallNo)!''}" /></td>
							<td><input name="pipe[${pipe_index}].pipeLocation" class=""
								value="${(pipe.pipeLocation)!''}" /> <input
								name="pipe[${pipe_index}].pipeId" type="hidden"
								value="${(pipe.pipeId)!''}"></td>
						</tr>
						</#list> <#else>
						<tr>
							<td>1</td>
							<td><input name="pipe[0].pipeNo" class="" value=""
								placeholder="待输入" /></td>
							<td><input name="pipe[0].pipeType" id="myCar"
								list="pipetype" value="" placeholder="待输入" /> <datalist
									id="pipetype">
									<option value="in">
									<option value="out">
								</datalist></td>
							<td><input name="pipe[0].pipeShape" class="" value=""
								placeholder="待输入" /></td>
							<td>
								<div class="pipetype-table" style="width: 100%">
									<div style="width: 45%">
										<input name="pipe[0].pipeSizec" class="" value="0"
											placeholder="长或半径" />
									</div>
									<div class="pipetype-table-x">X</div>
									<div style="width: 45%">
										<input name="pipe[0].pipeSizek" class="" value="0"
											placeholder="宽" />
									</div>
								</div>
							</td>
							<td><input name="pipe[0].backDrop" class="" value="0"
								placeholder="待输入" /></td>
							<td><input name="pipe[0].pipeMaterial" class="" value=""
								placeholder="待输入" /></td>
							<td><input name="pipe[0].lining" class="" value=""
								placeholder="待输入" /></td>
							<td><input name="pipe[0].pipeDepth" class="" value="0"
								placeholder="待输入" /></td>
							<td><input name="pipe[0].invert" class="" value="0" /></td>
							<td><input name="pipe[0].pipePhoto" class="" value=""
								placeholder="待输入" /></td>
							<td><input name="pipe[0].wallNo" class="" value="--" /></td>
							<td><input name="pipe[0].pipeLocation" class="" value="--" /></td>
						</tr>
						</#if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>