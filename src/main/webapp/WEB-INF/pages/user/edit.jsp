<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>
	
	<script type="text/javascript">
		function formSubmit (url,sTarget){
			document.forms[0].target = sTarget
			document.forms[0].action = url;
			document.forms[0].submit();
			return true;
		}
		</script>
    <style type="text/css">
	
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<form action="index.html" method="post">
<table class="table table-bordered table-hover definewidth m10">
<tr>
        <td class="tableleft">用户id</td>
        <td><input type="text" name="userId" value="${user.userId}"/></td>
    </tr>  
     <tr>
        <td class="tableleft">用户名</td>
        <td><input type="text" name="username" value="${user.username}"/></td>
    </tr>  
     <tr>
        <td class="tableleft">密码</td>
        <td><input type="text" name="password" value="${user.password}"/></td>
    </tr> 
     <tr>
        <td class="tableleft">姓名</td>
        <td><input type="text" name="name" value="${user.name}"/></td>
    </tr> 
     <tr>
        <td class="tableleft">创建时间</td>
        <td><input type="Date" name="createTime" value="${user.createTime}"/></td>
    </tr>
    <tr>
        <td class="tableleft">身份证</td>
        <td><input type="text" name="cardNo" value="${user.cardNo}"/></td>
    </tr> 
      <tr>
        <td class="tableleft">邮箱</td>
        <td><input type="text" name="email" value="${user.email}"/></td>
    </tr>
      
      
     <tr>
        <td class="tableleft">电话</td>
        <td><input type="text" name="tel" value="${user.tel}"/></td>
    </tr>
     <tr>
        <td class="tableleft">地址</td>
        <td><input type="text" name="address" value="${user.address}"/></td>
    </tr>
     <tr>
        <td class="tableleft">账户余额</td>
        <td><input type="text" name=".money" value="${user.money}"/></td>
    </tr> 
      <tr>
        <td class="tableleft">状态</td>
		<td>
		<c:if test="${user.state==1 }">启用</c:if>
		<c:if test="${user.state==0 }">停用</c:if>
		</td>
    </tr> 
     <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" onClick="formSubmit('saving','_self');this.blur();">保存</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-success" id="backid" onClick="window.history.back();">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>

