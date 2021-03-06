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
        <td class="tableleft">商品id</td>
        <td><input type="hidden" name="userId" value="${prod.productId}"/></td>
    </tr>  
     <tr>
        <td class="tableleft">商品名称</td>
        <td><input type="text" name="name" value="${prod.name}"/></td>
    </tr>  
     <tr>
        <td class="tableleft">商品数量</td>
        <td><input type="text" name="num" value="${prod.num}"/></td>
    </tr> 
     <tr>
        <td class="tableleft">商品价格</td>
        <td><input type="text" name="price" value="${prod.price}"/></td>
    </tr> 
     <tr>
        <td class="tableleft">商品图片</td>
        <td><img alt="图片" src="${ctx}/getImage.action?imgurl=${prod.imgurl}" border="0" style="width:200px;height:120px"></td>
    </tr>
    <tr>
        <td class="tableleft">商品描述</td>
        <td><input type="text" name="description" value="${prod.description}"/></td>
    </tr> 
      <tr>
        <td class="tableleft">商品种类</td>
        <td><input type="text" name="kind" value="${user.kind}"/></td>
    </tr>   
     <tr>
        <td class="tableleft"></td>
        <td>
            
			<button type="button" class="btn btn-success" id="backid" onClick="window.history.back();">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>

