<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
    <title>注册</title>
 	<link href="${ctx }/staticfile/css/home.css?v=2" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx }/staticfile/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<div class="wrap">
  <div class="banner-show" id="js_ban_content">
    <div class="cell bns-01">
      <div class="con"> </div>
    </div>
    <div class="cell bns-02" style="display:none;">
      <div class="con"> <a href="http://www.js-css.cn" target="_blank" class="banner-link"> <i>圈子</i></a> </div>
    </div>
    <div class="cell bns-03" style="display:none;">
      <div class="con"> <a href="http://www.js-css.cn" target="_blank" class="banner-link"> <i>企业云</i></a> </div>
    </div>
  </div>
  <div class="banner-control" id="js_ban_button_box"> <a href="javascript:;" class="left">左</a> <a href="javascript:;" class="right">右</a> </div>
  <script type="text/javascript">
		function _change() {
			var ele = document.getElementById("vCode");
			ele.src = "<c:url value='verifycode.action'/>?xxx=" + new Date().getTime();
		}
	</script>
  <script type="text/javascript">
                ;(function(){
                    var defaultInd = 0;
                    var list = $('#js_ban_content').children();
                    var count = 0;
                    var change = function(newInd, callback){
                        if(count) return;
                        count = 2;
                        $(list[defaultInd]).fadeOut(400, function(){
                            count--;
                            if(count <= 0){
                                if(start.timer) window.clearTimeout(start.timer);
                                callback && callback();
                            }
                        });
                        $(list[newInd]).fadeIn(400, function(){
                            defaultInd = newInd;
                            count--;
                            if(count <= 0){
                                if(start.timer) window.clearTimeout(start.timer);
                                callback && callback();
                            }
                        });
                    }
                    
                    var next = function(callback){
                        var newInd = defaultInd + 1;
                        if(newInd >= list.length){
                            newInd = 0;
                        }
                        change(newInd, callback);
                    }
                    
                    var start = function(){
                        if(start.timer) window.clearTimeout(start.timer);
                        start.timer = window.setTimeout(function(){
                            next(function(){
                                start();
                            });
                        }, 8000);
                    }
                    
                    start();
                    
                    $('#js_ban_button_box').on('click', 'a', function(){
                        var btn = $(this);
                        if(btn.hasClass('right')){
                            //next
                            next(function(){
                                start();
                            });
                        }
                        else{
                            //prev
                            var newInd = defaultInd - 1;
                            if(newInd < 0){
                                newInd = list.length - 1;
                            }
                            change(newInd, function(){
                                start();
                            });
                        }
                        return false;
                    });
                    
                })();
            </script>
 <!-- <script type="text/javascript">
		function _change() {
			var ele = document.getElementById("vCode");
			ele.src = "<c:url value='VerifyCodeServlet'/>?xxx=" + new Date().getTime();
		}
	</script> -->
  
  <div class="container">
    <div class="register-box">
    <form action="<c:url value='/regist.action'/>" method="post">
   
      <div class="reg-slogan"> 新用户注册</div>
      <div class="reg-form" id="js-form-mobile"> <br>
 <p style="color:red;font-size:16px;font-weight:900">${msg }</p>
        
	
	<p style="color:#333;font-size:17px;float:left;padding-top:19px;">用户名：</p>
		<input class="in" type="text" name="username" value="${user.username }"/><br/>
	<p style="color:red;font-weight:900">${errors.username }</p>
	
	<p style="color:#333;font-size:17px;float:left;padding-top:19px;">密&nbsp;&nbsp;&nbsp;码：</p>
		<input class="in" type="text" name="password" value="${user.password }"/><br/>
	<p style="color:red;font-weight:900">${errors.username }</p>
	
	<p style="color:#333;font-size:17px;float:left;padding-top:19px;">确认密码：</p>
		<input class="in" type="text" name="password2" value="${user.password2 }"/><br/>
	<p style="color:red;font-weight:900">${errors.username }</p>
	
	<p style="color:#333;font-size:17px;float:left;padding-top:19px;">邮箱：</p>
		<input class="in" type="text" name="email" value="${user.email }"/><br/>
	<p style="color:red;font-weight:900">${errors.username }</p>
	
	<p style="color:#333;font-size:17px;float:left;padding-top:19px;">验证密码：</p>
	<input class="in" type="text" id="verifyCode" name="verifyCode"/><br/>
		<img id="vCode" src="<c:url value='${ctx }/verifycode.action'/>" border="1"/>
		<a href="javascript:_change()">换一张</a>
		<p style="color:red;font-weight:900;font-size:15px;">${errors.verifyCode }</p><br/>
	
        <div class="bottom"> <a id="js-mail_btn" href="javascript:;" class="button btn-green"><input type="submit" value="立即注册"/></a></div>
        
      </div>
     </form> 
    </div>
  </div>
</div>
</body>
</html>
