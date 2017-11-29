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
     
	        <c:forEach items="${orderItems}" var="oit" >
	        	<div>
	        	<table class="table table-bordered table-hover definewidth m10">
	        		<tr>
	        			<th>用户ID</th>
	        			<th>用户名</th>
	        			<th>用户电话</th>
	        			<th>用户地址</th>
	        		</tr>
	        		<tr>
	        			<td>${oit.user.userId }</td>
	        			<td>${oit.user.username }</td>
	        			<td>${oit.user.tel }</td>
	        			<td>${oit.user.address }</td>
	        		</tr>
	        	</table>
	        		<c:forEach items="${oit.orders}" var="oito" >
		        		<table class="table table-bordered table-hover definewidth m10">
		        		<tr>
		        			<th>订单id</th>
		        			<th>下单日期</th>
		        			<th>送货地址</th>
		        		</tr>
		        		<tr>
	        				<td>${oito.orderId }</td>
	        				<td>${oito.ordertime }</td>
	        				<td>${oito.orderAddress }</td>
	        			</tr>
		        	</table>
	        		<c:forEach items="${oito.pets}" var="oitop" >
		        		<table class="table table-bordered table-hover definewidth m10">
		        		<tr>
		        			<th>宠物id</th>
		        			<th>宠物名字</th>
		        			<th>宠物价格</th>
		        			<th>购买数量</th>
		        			<th>宠物种类</th>
		        		</tr>
		        		<tr>
	        				<td>${oitop.petId }</td>
	        				<td>${oitop.petName  }</td>
	        				<td>${oitop.price }</td>
	        				<td>${oitop.buyNum  }</td>
	        				<td>${oitop.kind  }</td>
	        			</tr>
		        	</table>
	        		</c:forEach>
	        		<c:forEach items="${oito.products}" var="oitopd" >
		        		<table class="table table-bordered table-hover definewidth m10">
		        		<tr>
		        			<th>商品id</th>
		        			<th>商品名字</th>
		        			<th>商品价格</th>
		        			<th>购买数量</th>
		        		</tr>
		        		<tr>
	        				<td>${oitopd.productId }</td>
	        				<td>${oitopd.name }</td>
	        				<td>${oitopd.price }</td>
	        				<td>${oitopd.buyNum  }</td>
	        			</tr>
		        	</table>
	        		</c:forEach>
	        		</c:forEach>
	        	</table>
	        	</div>
	        </c:forEach>
	        
	    </form>
    </body>

</html>
