<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
  <head>
    <title>宠物管理系统</title>
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
  <div class="container">
    <div class="register-box">
    <form action="<c:url value='/login.action'/>" method="post">
   
      <div class="reg-slogan">用户登录</div>
      <div class="reg-form" id="js-form-mobile"> <br>
 	<p style="color:red;font-size:16px;font-weight:900">${msg }</p>
        
	<p style="color:#333;font-size:16px;float:left;padding-top:19px;">用户名：</p>
	<input class="in" type="text" name="username" value="${cookie.remname.value }"/><br/>
	<p style="color:red;font-weight:900">${errors.username }</p>
	
	<p style="color:#333;font-size:16px;float:left;padding-top:19px;">密　码：</p>
	<input class="in" type="password" name="password" value="${form.password }"/><br/>
	<p style="color:red;font-weight:900">${errors.password }</p>
	
	
	<p style="color:#333;font-size:16px;float:left;padding-top:19px;">密　码：</p>
	<input class="in" type="checkbox" name="password" value="${form.password }"/><br/>
	<p style="color:red;font-weight:900">${errors.password }</p>
	
	
	<%-- <tr>
		<td>
			<input type="checkbox" name="remname" value="true" 
				${empty cookie.remname?"": "checked='checked'" } />
				<span style="font-size:16px;font-family:'微软雅黑';color:#333;">记住用户名</span>
		</td>
		<td>
			<input type="checkbox" name="autologin" value="true" 
				${empty cookie.autologin?"": "checked='checked'" } />
				<span style="font-size:16px;font-family:'微软雅黑';color:#333;">30天内自动登陆</span>
		</td>
	</tr> --%>
        <div class="bottom"> 
         <a id="js-mail_btn" href="javascript:;" class="button btn-green">
          <input type="submit" value="立即登录"/>
         </a>
        </div>
   
      </div>
     </form> 
    </div>
  </div>
</div>
</body>
</html>
