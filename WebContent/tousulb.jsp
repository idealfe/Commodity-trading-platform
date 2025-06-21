<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    
    <title>投诉列表</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/normalize.css">

    <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.8.3.min.js"><\/script>')</script>
    <script src="js/html5.js"></script>
    <script src="js/main.js"></script>
    <script src="js/radio.js"></script>
    <script src="js/checkbox.js"></script>
    <script src="js/selectBox.js"></script>
    <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="js/jquery.jqzoom-core.js"></script>
    <script src="js/jquery.transit.js"></script>
    <script src="js/jquery.easing.1.2.js"></script>
    <script src="js/jquery.anythingslider.js"></script>
    <script src="js/jquery.anythingslider.fx.js"></script>
</head>
<body>
    <jsp:include page="top.jsp"></jsp:include>
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">投诉列表</h1>
                </header>
                    
                <article>
                    
                  <div class="grid_12" >
			<div id="wrapper_tab" class="tab1">
			    <a href="#" class="tab1 tab_link">投诉信息</a>

			    <div class="clear"></div>

			    <div class="tab1 tab_body">
					<table>
				      <tr class="bg">
					   <th>商品</th><th>卖家</th><th>投诉内容</th><th>日期</th><th>投诉反馈</th><th style="width: 100px;">操作</th>
				      </tr>
				     <c:forEach items="${list}" var="tousu">
					  <tr>
						  <td>${tousu.product.productname}</td>
						  <td>${tousu.seller.uname}</td>
						  <td>${tousu.content}</td>
						  <td>${tousu.savetime}</td>
						  <td>${tousu.hfcontent}</td>
						  <td>
						  <a href="javascript:void(0)" onclick="tousuDel('${tousu.id}')" style="text-decoration: none;font-family: '楷体';color:#6F8921;font-weight: bold;">删除</a>
						  </td>
					  </tr>
					  </c:forEach>
				</table>
			    </div><!-- .tab1 .tab_body -->


			    <div class="clear"></div>
			</div>​<!-- #wrapper_tab -->
			<div class="clear"></div>
		    </div>
                    
		</article>
                    
                <div class="clear"></div>
            </div><!-- #content -->

            <div class="clear"></div>
        </div><!-- .container_12 -->
    </section><!-- #main -->
    <div class="clear"></div>
        
    <jsp:include page="foot.jsp"></jsp:include>
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<script type="text/javascript">
function tousuDel(id){
	location.replace("tousuDel.do?id="+id);
}
</script>
</html>
