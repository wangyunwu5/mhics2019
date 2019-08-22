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
        var viewer = new Cesium.Viewer('cesiumContainer');
        viewer._cesiumWidget._creditContainer.style.display="none";
        //viewer._cesiumWidget._creditContaniner.style.display="none";
      </script>
    </body>
</html>