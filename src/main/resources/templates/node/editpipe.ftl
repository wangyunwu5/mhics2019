
<div class="row">
	<div class="col-md-12 form-group">
		<label class="control-label"> <span>管道信息</span> <a
			href="javascript:;" class="label label-success addpipe"
			style="padding: 5px; margin-left: 10px;"> <span
				class="glyphicon glyphicon-plus"></span> 新增管道
		</a> <a href="javascript:;" class="label  deletepipe"
			style="background-color: #d9534f; padding: 5px; margin-left: 10px;">
				<span class="glyphicon glyphicon-remove"></span> 删除管道
			<input type="hidden" name="delpipe" id="delpipe" value="">
		</a>
		</label>
		<div class="form-group biankuang">
			<table style="width: 100%" class="pipe-table" id="pipe-table">
				<thead>
					<tr>
						<td width="3%">编号</td>
						<td width="6%">pipe no</td>
						<td width="6%">pipe type</td>
						<td width="6%">pipe shape</td>
						<td width="15%">pipe size(mm)</td>
						<td width="8%">backdrop(mm)</td>
						<td width="8%">pipe material*</td>
						<td width="6%">lining</td>
						<td width="8%">pipe depth(m)</td>
						<td width="8%">invert(mPD)</td>
						<td width="8%">photo</td>
						<td width="6%">wall no.</td>
						<td width="8%">location</td>
						<td width="6%"></td>
					</tr>
				</thead>
				<tbody class="pipe-table-body"  id="pipe-table-body">
					<#if node?? && pipes??>
					 <#list pipes as pipe>
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
							name="pipe[${pipe_index}].pipeId" type="hidden" class="pipeid"
							value="${(pipe.pipeId)!''}"></td>
						<td><label onclick="delpipebyone(${(pipe.pipeId)!''})" class="label node-del-btn"><span class="glyphicon glyphicon-remove"></span> 删除</label></td>
					</tr>
					</#list>
					</#if>
				</tbody>
			</table>
		</div>
	</div>
</div>
