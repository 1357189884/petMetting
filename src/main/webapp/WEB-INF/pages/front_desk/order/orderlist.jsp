<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	  <head>
        <title>
        </title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css"
        />
        <link rel="stylesheet" type="text/css" href="../Css/style.css" />
        <script type="text/javascript" src="../Js/jquery.js">
        </script>
        <script type="text/javascript" src="../Js/jquery.sorted.js">
        </script>
        <script type="text/javascript" src="../Js/bootstrap.js">
        </script>
        <script type="text/javascript" src="../Js/ckform.js">
        </script>
        <script type="text/javascript" src="../Js/common.js"></script>
		
        <script type="text/javascript">
    	$(function () {
			$('#addnew1111').click(function(){
					window.location.href="add.html";
			 });
    	});
		/* 全选*/
		function checkAll(who, obj){
			var curCheckBox = document.getElementsByName(who);
			for(i = 0; i < curCheckBox.length; i++){
				curCheckBox.item(i).checked = obj.checked;
			}
		}
		
		function formSubmit (url,sTarget){
			document.forms[0].target = sTarget
			document.forms[0].action = url;
			document.forms[0].submit();
			return true;
		}
		</script>
   
        <style type="text/css">
            body { padding-bottom: 40px; } .sidebar-nav { padding: 9px 0; } @media
            (max-width: 980px) { /* Enable use of floated navbar text */ .navbar-text.pull-right
            { float: none; padding-left: 5px; padding-right: 5px; } }
        </style>
    </head>
    <body>
        <form class="form-inline definewidth m20" action="index.html" method="get">
			  订单编号：
      <input type="text" name="rolename" id="rolename" class="abc input-default">
      &nbsp;&nbsp;
      <button type="submit" class="btn btn-primary" onClick="formSubmit('select','_self');this.blur();">
       	   查询
      </button>  
       <button type="submit" class="btn btn-primary" onClick="formSubmit('toviewOrderAndProPet','_self');this.blur();">
       	   详情
      </button>  
      <button type="submit" class="btn btn-primary" onClick="formSubmit('toreport','_self');this.blur();">
       	   生成报表
      </button> 
      	<table class="table table-bordered table-hover definewidth m10">
      		<tr>
      			<th><input type="checkbox" name="selid" onclick="checkAll('orderId',this)"></th>
      			<th>订单次序</th>
      			<th>用户名</th>
      			<th>真实名字</th>
      			<th>用户地址</th>
      			<th>下单时间</th>
      			<th>订单金额</th>
      			<th>订单收货地址</th>
      		</tr>
      		 <c:forEach items="${orderUsers}" var="ou" varStatus="status">
      		<tr>
      			<td><input type="checkbox" name="orderId" value="${ou.orderId}"/></td>
      			<td>${status.index+1}</td>
      			<td>${ou.user.username}</td>
      			<td>${ou.user.name }</td>
      			<td>${ou.user.address }</td>
      			<td>${ou.ordertime}</td>
      			<td>${ou.orderMoney}</td>
      			<td>${ou.orderAddress}</td>
      		</tr>
      		    </c:forEach>
    	</table>
    	<div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="backList.action?pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="backList.action?pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="backList.action?pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="backList.action?pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="backList.action?pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="backList.action?pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="backList.action?pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="backList.action?pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
	    </form>
	 </body>
</html>