<!DOCTYPE html>
<html>
<head lang="en">
	<link rel="stylesheet" href="/css/pdf/pdfpage.css"></link>
    <style>
        @page {
            size: 210mm 297mm; 
          	margin: 0.25in;
            @bottom-center{
                content:"深圳麦斯迪埃 © 版权所有";
                font-family: SimSun;
                font-size: 12px;
                color:red;
            };
            @top-center { content: element(header) };
            @bottom-right{
                content:"第" counter(page) "页  共 " counter(pages) "页";
                font-family: SimSun;
                font-size: 12px;
                color:#000;
            };
        }
    </style>
    <style type="text/css">
    	html{
    		border:1px solid black;
    		width:197mm;
    		height:283mm;
    		background-color:#E0E0E0;
    	}
    	.border-outer{
    		width:100%;
		}
		.content-top{
			display:flex;
			height:50px;
			flex-direction:row;
		}
		.content-icon{
			width:30px;
		}
		.content-title{
			font-size:10px;
			flex:1;
		}
		.page-name{
			font-size:10px;
			width:50px;
		}
    </style>
</head>
<body style="font-family: 'SimSun'">
	<div class="border-outer">
		<div class="content-top">
			<table>
				<tr>
					<td width="20%"><label class="content-icon"><img alt="" src="/images/pdficon.png"></img> </label></td>
					<td width="50%"><label class="content-title">The UtilityINFO Group CO.,Ltd(TUG)</label></td>
					<td width="30%"><label class="page-name"> IDMS Manhole Record Card</label></td>
				</tr>
			</table>
			
		</div>
	</div>

</body>
</html>