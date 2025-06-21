<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    
    <title>找回密码</title>
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
    <script src="layer/layer.js"></script>
</head>
<body>
    <jsp:include page="top.jsp"></jsp:include>
    
    <section id="main" class="page-login">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">邮箱找回密码</h1>
                </header>
                    
                <article>
		
                    <div class="grid_6 registed_form">
			<form class="registed" action="findUpass.do" name="loginForm" method="post">
			    <h2>找回密码</h2>
			    <p>请认真填写信息</p>
			    
			    
			    <div class="email">
				<strong>用户名:</strong><sup>*</sup><br>
				<input type="text" name="uname" id="uname" class=""   required oninvalid="setCustomValidity('用户名不能为空')" oninput="setCustomValidity('');">
			    </div><!-- .email -->
			    
			    
			    <div >
				<strong>邮箱:</strong><sup>*</sup><br>
				<input type="email" name="email" class="" id="email" required oninvalid="setCustomValidity('邮箱不能为空')" oninput="setCustomValidity('');" style="width: 420px;height: 36px;border-radius:20px 20px;border: 1px solid #CCCCCC;outline:none;padding-left: 10px;">
			    </div>
			    
			     
			    <div class="remember">
			    </div>
			     
			    <div class="submit">										
				<input type="submit" value="找回密码">
			    </div><!-- .submit -->
			</form><!-- .registed -->
                    </div><!-- .grid_6 -->
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
<c:if test="${suc eq 'error'}">
  <script type="text/javascript">
  layer.alert('确保信息输入正确', {
	  title:'提示信息',
	  icon: 2,
	  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
	})
  </script>
</c:if>
<c:if test="${suc eq 'suc'}">
  <script type="text/javascript">
  layer.alert('密码已发至邮箱，请注意查收', {
	  title:'提示信息',
	  icon: 1,
	  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
	})
  </script>
</c:if>
</html>
