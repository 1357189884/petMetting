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
       <!--  	 <input type="text" name="rolename" id="rolename" class="abc input-default">
      &nbsp;&nbsp; -->
			<button type="submit" class="btn btn-primary" href="#" onclick="window.history.back();">
       	   返回
       	    </button> 
      	<table class="table table-bordered table-hover definewidth m10">
      		<tr>
      			<td>订单号</td>
      			<td>${order.orderId }</td>
      		</tr>
      		<tr>
      			<td>所属用户</td>
      			<td>${order.user.username}</td>
      		</tr>
      		<tr>
      			<td>用户姓名</td>
      			<td>${order.user.name}</td>
      		</tr>
      		<tr>
      			<td>用户地址</td>
      			<td>${order.user.address}</td>
      		</tr>
      		<tr>
      			<td>下单时间</td>
      			<td>${order.ordertime}</td>
      		</tr>
      		<tr>
      			<td>订单金额</td>
      			<td>${order.orderMoney}</td>
      		</tr>
      		<tr>
      			<td>订单收货地址</td>
      			<td>${order.orderAddress}</td>
      		</tr>
    	</table>
    	<h3>订单订购宠物</h3>
    	<table class="table table-bordered table-hover definewidth m10">
    		<tr>
    			<td>序号</td>
    			<td>宠物科种</td>
    			<td>宠物名</td>
    			<td>年龄</td>
    			<td>价格</td>
    			<td>购买数量</td>
    			<td>宠物描述</td>
    		</tr>
    		<c:forEach items="${pets}" var="pet" varStatus="status">
    		<tr>
    			<td>${status.index+1}</td>
    			<td>${pet.kind }</td>
    			<td>${pet.petName }</td>
    			<td>${pet.age }</td>
    			<td>${pet.price }</td>
    			<td>${pet.order_info.petBuyNum }</td>
    			<td>${pet.remark }</td>
    		</tr>
    		</c:forEach>
    	</table>
    	<h3>订单订购商品</h3>
    	<table class="table table-bordered table-hover definewidth m10">
    		<tr>
    			<td>序号</td>
    			<td>商品种类</td>
    			<td>商品名</td>
    			<td>商品价格</td>
    			<td>购买数量</td>
    			<td>商品描述</td>
    		</tr>
    		<c:forEach items="${products}" var="pro" varStatus="status">
    		<tr>
    			<td>${status.index+1}</td>
    			<td>${pro.kind }</td>
    			<td>${pro.name }</td>
    			<td>${pro.price }</td>
    			<td>${pro.order_info.productBuyNum}</td>
    			<td>${pro.description }</td>
    		</tr>
    		</c:forEach>
    	</table>
	    </form>
	 </body>
</html>