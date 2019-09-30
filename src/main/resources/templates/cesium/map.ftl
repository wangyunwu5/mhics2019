<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- Tell IE to use the latest, best version. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Make the application on mobile take up the full browser screen and disable user scaling. -->
<meta name="viewport"
    content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<title>Hello World!</title>
<script src="/Cesium/Cesium.js"></script>
<style>
@import url(/Cesium/Widgets/widgets.css);

html, body, #cesiumContainer {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden;
}
</style>
</head>
<body>
    <div id="cesiumContainer"></div>
      <script>
	      var viewer = new Cesium.Viewer('cesiumContainer', {
	          animation: false,
	          baseLayerPicker: false,
	          geocoder: true,
	          timeline: false,
	          sceneModePicker: true,
	          navigationHelpButton: false,
	          infoBox: true,
	          vrButton:false,
	          homeButton:false,
	          selectionIndicator: false,//是否显示选取指示器组件
	      });
	      
	      viewer._cesiumWidget._creditContainer.style.display = "none";		//去掉左下角那个不可爱的图标
	   
	      //    viewer.extend(Cesium.viewerCesiumInspectorMixin);         //那些个特效
	      viewer.camera.setView({
	          destination:Cesium.Cartesian3.fromDegrees(114.00, 22.59, 100000),
	          orientation:{
	              heading : Cesium.Math.toRadians(0),
	              pitch : Cesium.Math.toRadians(-90),
	              roll : Cesium.Math.toRadians(0)         //heading、pitch和roll就是镜头相对于xyz轴的角度，比如pitch为-90°而另外两个为0时，就是90°向下俯视地球。
	          }
	      });
	      
	      var layerone = viewer.scene.imageryLayers.addImageryProvider(new Cesium.WebMapTileServiceImageryProvider({
	    	  url: 'https://services.arcgisonline.com/arcgis/rest/services/Demographics/USA_Population_Density/MapServer/WMTS/',  
	          layer: "tdtImgBasicLayer",
	          style: "default",
	          format: "image/jpeg",
	          tileMatrixSetID: "GoogleMapsCompatible",
	          show: false
	      }));//卫星影像 */
	      
	   /*    var layerone = viewer.scene.imageryLayers.addImageryProvider(new Cesium.WebMapTileServiceImageryProvider({
	          url: "http://t0.tianditu.com/img_w/wmts?tk=834a48b96fc46a53d599efec2cd107c3&service=wmts&request=GetTile&version=1.0.0&LAYER=img&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default&format=tiles",
	          layer: "tdtImgBasicLayer",
	          style: "default",
	          format: "image/jpeg",
	          tileMatrixSetID: "GoogleMapsCompatible",
	          show: false
	      }));//卫星影像 */
//	      layerone.alpha = 0.3;
//	      layerone.brightness = 2.0;
	     var layertwo =  viewer.scene.imageryLayers.addImageryProvider(new Cesium.WebMapTileServiceImageryProvider({
	          url: "http://t0.tianditu.com/cia_w/wmts?tk=834a48b96fc46a53d599efec2cd107c3&service=wmts&request=GetTile&version=1.0.0&LAYER=cia&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default&format=tiles",
	          layer: "tdtImgAnnoLayer",
	          style: "default",
	          format: "image/jpeg",
	          tileMatrixSetID: "GoogleMapsCompatible",
	          show: false
	      }));//注记图层
		
	      
	      var URL_MODEL = "/officalCesium/Apps/baseData/";
	      
	      $('#upLoadFile').change(function () {
	          var file =  $('#upLoadFile').get(0).files[0];
	          var filename = file.name;
	          var t = filename.lastIndexOf(".");
	          var s = filename.substring(t+1,filename.length).toUpperCase();
	   
	          var dataType = document.getElementById("typeInput");
	          var value = dataType.options[dataType.selectedIndex].value.toUpperCase();
	   
	          $('#addLayerModal').modal('hide');          //隐藏对话框
	   
	          if(s == value){
	   
	              if(value == "GEOJSON"){
	                  var filepath = URL_MODEL+filename;
	                  var geosonView = viewer.dataSources.add(Cesium.GeoJsonDataSource.load(filepath,{
	                      stroke: Cesium.Color.YELLOW,       //设置为TRANSPARENT的时候，透明
	                      fill: Cesium.Color.YELLOW,
	                      strokeWidth: 5,
	                      markerSymbol: '?',
	                  }));
	                  viewer.flyTo(geosonView);
//	                  alert(filepath+"");
	              }
	   
	              else if (value == "JSON" && filename.toUpperCase() == "TILESET.JSON"){
	                  var filepath = URL_MODEL+filename;
	                  var tileset = viewer.scene.primitives.add(new Cesium.Cesium3DTileset({
	                      url: filepath,  //数据路径
	                      maximumScreenSpaceError: 2,//默认16,最大屏幕空间错误
	                                                           //maximumNumberOfLoadedTiles: 1000,
	                      maximumMemoryUsage:1024//默认512,内存MB的最大数量
	                  }));
	                      viewer.flyTo(tileset);
//	                  alert(filepath+"");
	              }
	              else if(value == "KML"){
	                  var filepath = URL_MODEL+filename;
	                  var kml_view = Cesium.KmlDataSource.load(filepath);
	                  viewer.flyTo(kml_view);
//	                  alert(filepath+"");
	              }else if(value == "CZML"){
	                  var filepath = URL_MODEL+filename;
	                var dataRecourse = new Cesium.CzmlDataSource(filepath);
	                dataRecourse.load();
	                viewer.dataSources.add(dataRecourse);
	                viewer.flyTo(data_resouce);
	              }
	          }else {
	              alert("上传失败，不是."+value+"类型的文件");
	          }
	      });

	    //飞行到某个点
	      function dingwei(lon,lat,height){
	          viewer.camera.flyTo({
	              destination :  Cesium.Cartesian3.fromDegrees(lon,lat,height), // 设置位置
	              orientation: {
	                  heading : Cesium.Math.toRadians(20.0), // 方向
	                  pitch : Cesium.Math.toRadians(-90.0),// 倾斜角度
	                  roll : 0
	              },
	              duration:5, // 设置飞行持续时间，默认会根据距离来计算
	              complete: function () {
	                  // 到达位置后执行的回调函数
	                  console.log('到达目的地');
	              },
	              cancle: function () {
	                  // 如果取消飞行则会调用此函数
	                  console.log('飞行取消')
	              },
	              pitchAdjustHeight: -90, // 如果摄像机飞越高于该值，则调整俯仰俯仰的俯仰角度，并将地球保持在视口中。
	              maximumHeight:500, // 相机最大飞行高度
	              flyOverLongitude: 100, // 如果到达目的地有2种方式，设置具体值后会强制选择方向飞过这个经度
	          });
	      }
	      //复位地图
	      function clearMap(){
//	      	 dingwei(115.446105254,22.771558650,2000);
	          viewer.flyTo(tileset);
	          clearAllPan();
	      }
	      //清空地图
	      function clearAll(){
	          clearAllPan();
	      }
	      //* 测距测面  */
	      var scene = viewer.scene;
	      var canvas = viewer.canvas;
	      var clock = viewer.clock;
	      var camera = viewer.scene.camera;
	   
	      //布尔型变量
	      var isPoint = false;
	      var isPolyline = false;
	      var isPolygon_line = false;
	   
	      //是否开始绘制标识
	      var isStartDraw = false;
	      var isclear = false;
	      var points = viewer.entities.add(new Cesium.Entity());
	      var polylines = viewer.entities.add(new Cesium.Entity());
	      var Polygons_Line = viewer.entities.add(new Cesium.Entity());
	   
	      //画多边形过程中展示的线最后要移除或者不显示
	      var Polygon_Lines_remove = viewer.entities.add(new Cesium.Entity());
	   
	      var ellipsoid = scene.globe.ellipsoid;
	      canvas.onclick = function () {
	          canvas.focus();
	      };
	      var handler = new Cesium.ScreenSpaceEventHandler(canvas);
	      viewer.zoomTo(viewer.entities);
	      defaultZoomAmount_ = 3000000.0;
	      var lastPointLon = -999.0;
	      var lastPointLat = -999.0;
	   
	   
	      var firstPointLon = -999.0;
	      var firstPointLat = -999.0;
	   
	      var measurePointsArray=new Array();
	      measurePointsArray.splice(0,measurePointsArray.length);
	      var endCartographic = new Cesium.Cartographic();
	      var geodesic = new Cesium.EllipsoidGeodesic();
	      var PolygonPointArray_line = null;
	      var PolygonPointArray_fill = null;
	      //鼠标移动时的那条线
	      var moveLine_first = viewer.entities.add({
	          id: "moveLine_first",
	          name: 'line on the surface',
	          polyline: {
	              show: false,
	              width: 2,
	              material: Cesium.Color.WHITE
	          }
	      });
	      var moveLine_second = viewer.entities.add({
	          id: "moveLine_second",
	          name: 'line on the surface',
	          polyline: {
	              show: false,
	              width: 2,
	              material: Cesium.Color.WHITE
	          }
	      });
	   
	      /*    handler.setInputAction(function(){},
	              Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);*/
	      //鼠标移动时做的操作
	      handler.setInputAction(function (movement) {
	        
	   
	          //捕获椭球体，将笛卡尔二维平面坐标转为椭球体的笛卡尔三维坐标，返回球体表面的点
	          var cartesian=viewer.camera.pickEllipsoid(movement.endPosition, ellipsoid);
	          if(cartesian) {
	              //将笛卡尔三维坐标转为地图坐标（弧度）
	              var cartographic = viewer.scene.globe.ellipsoid.cartesianToCartographic(cartesian);
	              //将地图坐标（弧度）转为十进制的度数
	              var lat_String = Cesium.Math.toDegrees(cartographic.latitude).toFixed(4);
	              var log_String = Cesium.Math.toDegrees(cartographic.longitude).toFixed(4);
	              var alti_String = (viewer.camera.positionCartographic.height / 1000).toFixed(2);
	              longitude_show.innerHTML = log_String;
	              latitude_show.innerHTML = lat_String;
	              altitude_show.innerHTML = alti_String;
	          }
	      }, Cesium.ScreenSpaceEventType.MOUSE_MOVE);
	   
	   
	   
	      function clearAllPan() {
	          viewer.entities.removeAll();
	          isStartDraw = false;
	          isclear = true;
	          document.body.style.cursor = "pointer";
	          document.getElementById("map_container").style.cursor = "pointer";
	          handler.setInputAction(function(){
	          },Cesium.ScreenSpaceEventType.LEFT_CLICK);
	      }
	   
	      var QQ=0;
	   
	      function clearAllPan1(id) {
	          if(id!=undefined){
	              var tempmark = viewer.entities.getById(id);
	              viewer.entities.remove(tempmark);
	          }
	          QQ=1;
	      }
	   
	      //双击停止加线面
	      function shuangji(){
	          isPolyline = false;
	          isPolygon_line = false;
	          isPolygon_fill = false;
	          isStartDraw = false;
	   
	      }
	   
	      //加点
	      function addPoint() {
	          isPoint = true;
	          isPolyline = false;
	          isPolygon_line = false;
	          isPolygon_fill = false;
	          isStartDraw = false;
	          QQ=0;
	      }
	   
	      //加线
	      function measureLength() {
	          var select_measure = document.getElementById("selOpt");
	          var value_measure = select_measure.options[select_measure.selectedIndex].value;
	          if(value_measure == 2){
	              isPoint = false;
	              isPolyline = true;
	              isPolygon_line = false;
	              isPolygon_fill = false;
	              isStartDraw = false;
	              QQ=0;
	              document.body.style.cursor = "url(resource/pic/icons/magnifier3.cur) 12 12,crosshair";
	              document.getElementById("map_container").style.cursor = "url(resource/pic/icons/magnifier3.cur) 12 12,crosshair";
	              addOnClickListener();
	          }
	   
	      }
	   
	      function addOnClickListener(){
	   
	          handler.setInputAction(function(){},
	              Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);
	          //鼠标移动时做的操作
	          handler.setInputAction(function (movement) {
	              if (isPolyline || isPolygon_line ) {
	                  var cartesian = viewer.camera.pickEllipsoid(movement.endPosition, scene.globe.ellipsoid);
	                  if (cartesian && isStartDraw) {
	                      //做清除工作把全局变量moveLine清除掉了 ，需要重新加到entities上 否则显示不正常
	                      if (isclear) {
	                          viewer.entities.add(moveLine_first);
	                          viewer.entities.add(moveLine_second);
	                          isclear = false;
	                      }
	                      var cartographic = Cesium.Cartographic.fromCartesian(cartesian);
	                      var curMovementLon = Cesium.Math.toDegrees(cartographic.longitude).toFixed(12);
	                      var curMovementLat = Cesium.Math.toDegrees(cartographic.latitude).toFixed(12);
	   
	                      viewer.entities.getById("moveLine_first").polyline.positions = Cesium.Cartesian3.fromDegreesArray([lastPointLon, lastPointLat ,curMovementLon,
	                          curMovementLat]);//修改属性
	                      viewer.entities.getById("moveLine_first").polyline.show = true;
	                      if (PolygonPointArray_line != null) {
	                          if (PolygonPointArray_line.length >= 3) {
	                              viewer.entities.getById("moveLine_second").polyline.positions = Cesium.Cartesian3.fromDegreesArray([curMovementLon, curMovementLat, firstPointLon, firstPointLat]);//修改属性
	                              viewer.entities.getById("moveLine_second").polyline.show = true;
	                          }
	                      }
	                  }
	              }
	              //捕获椭球体，将笛卡尔二维平面坐标转为椭球体的笛卡尔三维坐标，返回球体表面的点
	              var cartesian=viewer.camera.pickEllipsoid(movement.endPosition, ellipsoid);
	              if(cartesian){
	                  //将笛卡尔三维坐标转为地图坐标（弧度）
	                  var cartographic=viewer.scene.globe.ellipsoid.cartesianToCartographic(cartesian);
	                  //将地图坐标（弧度）转为十进制的度数
	                  var lat_String=Cesium.Math.toDegrees(cartographic.latitude).toFixed(4);
	                  var log_String=Cesium.Math.toDegrees(cartographic.longitude).toFixed(4);
	                  var alti_String=(viewer.camera.positionCartographic.height/1000).toFixed(2);
	                  longitude_show.innerHTML=log_String;
	                  latitude_show.innerHTML=lat_String;
	                  altitude_show.innerHTML=alti_String;
	              }
	          }, Cesium.ScreenSpaceEventType.MOUSE_MOVE);
	   
	   
	          //鼠标左击做的操作
	          handler.setInputAction(function (click) {
	              if(QQ==1){
	                  var pickedObject = viewer.scene.pick(click.position);
	   
	                  if (Cesium.defined(pickedObject) && (pickedObject.id != undefined)) {
	                      actEntity = pickedObject.id;
	                      clearAllPan1(actEntity._id);
	                  }
	   
	              }
	   
	              if (isPoint || isPolyline || isPolygon_line ) {
	                  var cartesian = viewer.camera.pickEllipsoid(click.position, scene.globe.ellipsoid);
	                  if (cartesian) {
	                      var cartographic = Cesium.Cartographic.fromCartesian(cartesian);
	                      var currentClickLon = Cesium.Math.toDegrees(cartographic.longitude).toFixed(12);
	                      var currentClickLat = Cesium.Math.toDegrees(cartographic.latitude).toFixed(12);
	   
	   
	                      /*   var currentClickHeight = cartographic.height;
	                        console.log(currentClickHeight); */
	   
	                      if (!isStartDraw) {
	                          viewer.entities.add({
	                              position: cartesian,
	                              point: {
	                                  parent: points,
	                                  pixelSize: 5,
	                                  color: Cesium.Color.YELLOW
	                              }
	                          });
	                          firstPointLon = currentClickLon;
	                          firstPointLat = currentClickLat;
	   
	                          PolygonPointArray_line = null;
	                          PolygonPointArray_fill = null;
	                          measurePointsArray.splice(0,measurePointsArray.length);
//	                          var startCartographic = Cesium.Cartographic.fromDegrees(firstPointLon, firstPointLat);
	                          measurePointsArray.push(cartographic);
	                          isStartDraw = true;
	                      } else {
	                          if (isPoint) {
	                              viewer.entities.add({
	                                  position: cartesian,
	                                  point: {
	                                      parent: points,
	                                      pixelSize: 5,
	                                      color: Cesium.Color.YELLOW
	                                  }
	                              });
	                          }
	                          if (isPolyline || isPolygon_line )
	                          {
	                              //                       endCartographic = Cesium.Cartographic.fromDegrees(currentClickLon, currentClickLat,currentClickHigh);
	                              endCartographic = Cesium.Cartographic.fromDegrees(currentClickLon, currentClickLat);
	                              console.log(endCartographic);
	                              measurePointsArray.push(endCartographic);
	                              var arrLength=measurePointsArray.length;
	                              var tmpDis=0;
	                              var sumDis=0;
	                              for(var i=1;i<arrLength;i++)
	                              {
	                                  geodesic.setEndPoints(measurePointsArray[i-1], measurePointsArray[i]);
	                                  tmpDis=Math.round(geodesic.surfaceDistance);
	                                  sumDis=sumDis+tmpDis;
	                              }
	                              if(sumDis>1000)
	                              {
	                                  var polylineDis= (sumDis / 1000).toFixed(1) + " km";
	                              }
	                              else{
	                                  var polylineDis= sumDis + " m";
	                              }
	                              //  console.log(dis);
	                              viewer.entities.add({
	                                  parent: polylines,
	                                  polyline: {
	                                      //                               positions: Cesium.Cartesian3.fromDegreesArray([lastPointLon, lastPointLat,lastPointHigh, currentClickLon, currentClickLat,currentClickHigh]),
	                                      positions: Cesium.Cartesian3.fromDegreesArray([lastPointLon, lastPointLat, currentClickLon, currentClickLat]),
	                                      width: 2,
	                                      material: Cesium.Color.RED
	                                  },
	                                  label: {
	                                      text: polylineDis.toString(),
	                                      font: '20px SimHei ',
	                                      Width: 10,
	                                      style: Cesium.LabelStyle.FILL_AND_OUTLINE,
	                                      fillColor: Cesium.Color.YELLOW,
	                                      outlineColor : Cesium.Color.GRAY,
	                                      outlineWidth :5,
	                                      horizontalOrigin: Cesium.HorizontalOrigin.CENTER,
	                                      verticalOrigin: Cesium.VerticalOrigin.BOTTOM
	                                  },
	                                  /*  label : {
	                                        // This callback updates the length to print each frame.
	                                        text: polylineDis.toString(),
	                                        font : '25px',
	                                        pixelOffset : new Cesium.Cartesian2(1, 20)
	                                    },*/
//	                              position: Cesium.Cartesian3.fromDegrees(currentClickLon, currentClickLat,currentClickHigh)
	                                  position: Cesium.Cartesian3.fromDegrees(currentClickLon, currentClickLat)
	                              });
	                              viewer.entities.getById("moveLine_first").polyline.show = false;
	                              viewer.entities.getById("moveLine_second").polyline.show = false;
	                          }
	                      }
	                      //记录鼠标点击的当前位置 作为下一次画线的起始点位置
	                      lastPointLon = currentClickLon;
	                      lastPointLat = currentClickLat;
//	  				lastPointHigh = currentClickHigh;
	   
	                      if (isPolygon_line) {
	                          if (PolygonPointArray_line == null)
	                              PolygonPointArray_line = new Array();
	                          PolygonPointArray_line.push(currentClickLon);
	                          PolygonPointArray_line.push(currentClickLat);
//	                      PolygonPointArray_line.push(currentClickHigh);
	                      }
	                  }
	              }
	          }, Cesium.ScreenSpaceEventType.LEFT_CLICK);
	   
	          //鼠标双击时做的操作
	          handler.setInputAction(function (click)
	          {
	   
	              if (isPolyline || isPolygon_line )
	              {
	                  var cartesian = viewer.camera.pickEllipsoid(click.position, scene.globe.ellipsoid);
	                  if (cartesian && isStartDraw)
	                  {
	                      var cartographic = Cesium.Cartographic.fromCartesian(cartesian);
	                      var endPointLon = Cesium.Math.toDegrees(cartographic.longitude).toFixed(12);
	                      var endPointLat = Cesium.Math.toDegrees(cartographic.latitude).toFixed(12);
	                      var endPointHigh = Cesium.Math.toDegrees(cartographic.height).toFixed(12);
	   
	                      measurePointsArray.push(cartographic);
	                      var arrLength=measurePointsArray.length;
	                      var tmpDis=0;
	                      var sumDis=0;
	                      for(var i=1;i<arrLength;i++)
	                      {
	                          geodesic.setEndPoints(measurePointsArray[i-1], measurePointsArray[i]);
	                          tmpDis=Math.round(geodesic.surfaceDistance);
	                          sumDis=sumDis+tmpDis;
	                      }
	                      //考虑多边形最后显示距离
	                      geodesic.setEndPoints(measurePointsArray[0], measurePointsArray[arrLength-1]);
	                      tmpDis=Math.round(geodesic.surfaceDistance);
	                      sumDis1=sumDis+tmpDis;
	   
	                      if(sumDis>1000)
	                      {
	                          var polylineDis= (sumDis / 1000).toFixed(1) + " km";
	                          var polygonDis = (sumDis1 / 1000).toFixed(1) + " km";
	                      }
	                      else{
	                          var polylineDis= (sumDis) + " m";
	                          var polygonDis = (sumDis1) + " m";
	                      }
	                      if (isPolyline || isPolygon_line )
	                      {
	                          //画末线段
	                          viewer.entities.add({
	                              name: 'line on the surface',
	                              parent: polylines,
	                              polyline: {
	                                  positions: Cesium.Cartesian3.fromDegreesArray([lastPointLon, lastPointLat, endPointLon, endPointLat]),
	                                  width: 5,
	                                  material: Cesium.Color.RED
	                              },
	                              label: {
	                                  text: polylineDis.toString(),
	                                  font: '20px SimHei ',
	                                  Width: 10,
	                                  style: Cesium.LabelStyle.FILL_AND_OUTLINE,
	                                  fillColor: Cesium.Color.YELLOW,
	                                  outlineColor : Cesium.Color.GRAY,
	                                  outlineWidth :5,
	                                  horizontalOrigin: Cesium.HorizontalOrigin.CENTER,
	                                  verticalOrigin: Cesium.VerticalOrigin.BOTTOM
	                              },
	                              /*label : {
	                                  // This callback updates the length to print each frame.
	                                  text: polylineDis.toString(),
	                                  font : '25px',
	                                  pixelOffset : new Cesium.Cartesian2(1, 20)
	                              },*/
	                              position: Cesium.Cartesian3.fromDegrees(endPointLon, endPointLat)
	                          });
	                          if ( isPolygon_line )
	                          {
	                              viewer.entities.add({
	                                  name: 'line on the surface',
	                                  parent: polylines,
	                                  polyline: {
	                                      positions: Cesium.Cartesian3.fromDegreesArray([endPointLon, endPointLat, firstPointLon, firstPointLat]),
	                                      width: 5,
	   
	                                      material: Cesium.Color.RED
	                                  }
	                              });
	                              viewer.entities.getById("moveLine_second").polyline.show = false;
	                          }
	                          viewer.entities.getById("moveLine_first").polyline.show = false;
	                      }
	                      //画多边形 不带填充
	                      if (isPolygon_line)
	                      {
	                          if (PolygonPointArray_line != null) {
	                              PolygonPointArray_line.push(endPointLon);
	                              PolygonPointArray_line.push(endPointLat);
	                          }
	                          //当多边形数组中点的个数大于等于3时添加多边形
	                          if (PolygonPointArray_line.length >= 3) {
	                              viewer.entities.add({
	                                  name: 'polygon on surface',
	                                  polygon: {
	                                      hierarchy: Cesium.Cartesian3.fromDegreesArray(PolygonPointArray_line),
	                                      material: Cesium.Color.RED,
	                                      fill: false,  //不显示填充
	                                      outline: true,
	                                      outlineWidth: 5.0,
	                                      outlineColor: Cesium.Color.RED
	                                  },
	                                  label: {
	                                      text: polygonDis.toString(),
	                                      font: '20px SimHei ',
	                                      Width: 10,
	                                      style: Cesium.LabelStyle.FILL_AND_OUTLINE,
	                                      fillColor: Cesium.Color.YELLOW,
	                                      outlineColor : Cesium.Color.GRAY,
	                                      outlineWidth :5,
	                                      horizontalOrigin: Cesium.HorizontalOrigin.CENTER,
	                                      verticalOrigin: Cesium.VerticalOrigin.BOTTOM
	                                  },
	                                  /*  label : {
	                                        // This callback updates the length to print each frame.
	                                        text: polygonDis.toString(),
	                                        font : '25px',
	                                        pixelOffset : new Cesium.Cartesian2(1, 1)
	                                    },*/
	                                  position: Cesium.Cartesian3.fromDegrees(firstPointLon, firstPointLat)
	                              });
	                          }
	                          PolygonPointArray_line = null;
	                          viewer.entities.getById("moveLine_first").polyline.show = false;
	                          viewer.entities.getById("moveLine_second").polyline.show = false;
	                      }
	                      isStartDraw = false;
	                  }
	              }
	          }, Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);
	      }
	   
	      //加多边形不带填充
	      function measureArea() {
	          var select_measure = document.getElementById("selOpt");
	          var value_measure = select_measure.options[select_measure.selectedIndex].value;
	          if(value_measure == 2){
	              isPoint = false;
	              isPolyline = false;
	              isPolygon_line = true;
	              isPolygon_fill = false;
	              isStartDraw = false;
	              QQ=0;
	              document.body.style.cursor = "url(resource/pic/icons/magnifier3.cur) 12 12,crosshair";
	              document.getElementById("map_container").style.cursor = "url(resource/pic/icons/magnifier3.cur) 12 12,crosshair";
	              addOnClickListener();
	          }
	      }
      
      </script>
    </body>
</html>