
    <div style="width:100%">
	    <div class="map-top">
		        请输入查询地址：<input id="address" type="text" value="深圳"  style="height:30px;width:500px"/>
		        查询结果(经纬度)：<input id="coordinate" type="text" style="height:30px;width:200px"/>
		   <span class="map-button"  onclick="searchByStationName();">查询</span>
		   <span class="map-button" onclick="saveValue()">确定</span>
		   <span class="map-button" onclick="closeModel()">关闭</span>
	    </div>   
        <div id="container" style=" width:100%; height:800px;border-top:1px solid gray; overflow:hidden;"></div>
    </div>
