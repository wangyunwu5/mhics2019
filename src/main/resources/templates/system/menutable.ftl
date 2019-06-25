<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th scope="col">菜单名称</th>
							<th scope="col">图标</th>
							<th scope="col">路径</th>
							<th scope="col">类型</th>
							<th scope="col">排序</th>
							<th scope="col">显示</th>
						</tr>
						<#list allpamenu as one>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>${(one.name)!''}</td>
							<td><span class="glyphicon ${(one.menuIcon)!''}"></span></td>
							<td><span>${(one.menuUrl)!''}</span></td>
							<td><span>
							<#if one.parentId==0>
								父级
								<#else>
								子级菜单栏
							</#if>
							</span></td>
							<td><span>${(one.sortId)!''}</span></td>
							<#if one.isShow==true>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<#else>
								<td><span class="labels"><label><input type="checkbox" disabled><i>✓</i></label></span></td>
							</#if>
						</tr>
						<#if allsonmenu??>
						<#list allsonmenu as two>
						<#if one.menuId==two.parentId>
						<tr>
							<td>${(two.name)!''}</td>
							<td><span class="glyphicon ${(two.menuIcon)!''}"></span></td>
							<td><span>${(two.menuUrl)!''}</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>${(two.sortId)!''}</span></td>
							<#if two.isShow==true>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<#else>
								<td><span class="labels"><label><input type="checkbox" disabled><i>✓</i></label></span></td>
							</#if>
						</tr>
						</#if>
						</#list>
						</#if>
						</#list>
					</table>
				</div>