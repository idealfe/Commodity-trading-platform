<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>点赞次数统计</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/member/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/member/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/member/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/member/css/personal.css" media="all">
	<script type="text/javascript" src="/secondproductssm/layer/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/member/js/echarts.js"></script>  
<script type="text/javascript" src="<%=path %>/member/js/china.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=53oVIOgmSIejwV7EfphPgTynOZbIiVYu"></script>
	<style type="text/css">
	 .layui-input-inline li {
	  float: left;
	  }
	</style>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            
		         <!-- 操作日志 -->
                <div class="layui-form news_list" >
                    <div  id="tx" style="width: 100%;height:450px;">
    </div>
    
    <!-- s -->
      <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('tx'));



    option = {
    	    title: {
    	        text: '订单量走势图',
    	        subtext: ''
    	    },
    	    tooltip: {
    	        trigger: 'axis'
    	    },
    	    
    	    toolbox: {
    	        show: true,
    	        feature: {
    	            dataZoom: {
    	                yAxisIndex: 'none'
    	            },
    	            dataView: {readOnly: false},
    	            magicType: {type: ['line', 'bar']},
    	            restore: {},
    	            saveAsImage: {}
    	        }
    	    },
    	    xAxis:  {
    	        type: 'category',
    	        boundaryGap: false,
    	        data: ${nlist}
    	    },
    	    yAxis: {
    	        type: 'value',
    	        axisLabel: {
    	        formatter: '¥{value} '
    	        }
    	    },
    	    series: [
    	        {
    	            name:'订单量',
    	            type:'line',
    	            data:${slist},
    	            markPoint: {
    	                data: [
    	                    {type: 'max', name: '最大值'},
    	                    {type: 'min', name: '最小值'}
    	                ]
    	            },
    	            markLine: {
    	                data: [
    	                    {type: 'average', name: '平均值'}
    	                ]
    	            }
    	        }
    	    ]
    	};

	
    myChart.setOption(option);
	</script>
      <!-- e -->
                     <div class="larry-table-page clearfix">
			         </div>
			    </div>
			     <!-- 登录日志 -->
		    </div>
		</div>
	
</section>
<script type="text/javascript" src="<%=path %>/member/common/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/member/js/newslist.js"></script>
<script type="text/javascript">
	layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),
              laypage = layui.laypage;

            
          laypage({
					cont: 'page',
					pages: 10 //总页数
						,
					groups: 5 //连续显示分页数
						,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
						}
					}
				});

          laypage({
					cont: 'page2',
					pages: 10 //总页数
						,
					groups: 5 //连续显示分页数
						,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
						}
					}
				});
    });


</body>
</html>