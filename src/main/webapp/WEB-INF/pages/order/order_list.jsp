<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>我的订单</title>
	<link href="${ctx }/staticfile/css/orderList_o.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${ctx }/staticfile/js/jquery-1.4.2.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".del").click(function(){
				if(confirm("您确定要删除吗？")){
					//获取订单id
					var id=$(this).attr("id");
					location.href="/deleteding?id="+id;
				}
			});
		
		});
		
	</script>
</head>
<body style="text-align:center;">
<%@include file="../home/_head.jsp"%>
<c:forEach items="${list }" var="info">
		<dl class="Order_information">
			<dt>
				<h3>订单信息</h3>
			</dt>
			<dd>
				订单编号：${info.order.orderid }<br />
				 下单时间：${info.order.ordertime }<br /> 
				 订单金额：${info.order.money }<br /> 
				 支付状态：
				 <c:if test="${info.order.paystate==0 }">
						<font color="red">未支付</font>&nbsp;&nbsp;&nbsp;
						<a class="del" href="javascript:void(0)"id="${info.order.orderid }"><img src="${ctx }/staticfile/img/orderList/sc.jpg" width="69" height="19"></a></br> 
				 		<a href="${app}/pay.jsp?id=${info.order.orderid}&money=${info.order.money}"> <img src="${ctx }/staticfile/img/orderList/zx.jpg" width="69" height="19"></a><br />
				 		</c:if>
				 		<c:if test="${info.order.paystate==1 }">
						<font color="blue">已支付</font>
						</c:if>
				 
				 收货地址：${info.order.info }<br/> 
				支付方式：在线支付
			</dd>
		</dl>
	
		<table width="1200" border="0" cellpadding="0"
			cellspacing="1" style="background:#d8d8d8;color:#333333">
			<tr>
				<th width="276" height="30" align="center" valign="middle" bgcolor="#f3f3f3">商品图片</th>
				<th width="247" align="center" valign="middle" bgcolor="#f3f3f3">商品名称</th>
				<th width="231" align="center" valign="middle" bgcolor="#f3f3f3">商品单价</th>
				<th width="214" align="center" valign="middle" bgcolor="#f3f3f3">购买数量</th>
				<th width="232" align="center" valign="middle" bgcolor="#f3f3f3">总价</th>
			</tr>
			<c:forEach items="${info.orderitem }" var="entry">
			<tr>
				<td align="center" valign="middle" bgcolor="#FFFFFF">
					<img src="${ctx }/getImage.action?imgurl=${entry.key.imgurl}" width="90" height="105">
				</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.key.name }</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.key.price }元</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.value }件</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.key.price*entry.value }元</td>
			</tr>
			</c:forEach>
			<c:forEach items="${info.petorderitem }" var="entry">
			<tr>
				<td align="center" valign="middle" bgcolor="#FFFFFF">
					<img src="${ctx }/getImage.action?imgurl=${entry.key.imgurl}" width="90" height="105">
				</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.key.petname }</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.key.price }元</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.value }件</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.key.price*entry.value }元</td>
			</tr>
			</c:forEach>
		</table>
		<div class="Order_price">${info.order.money }元</div>
		</c:forEach>
		<%@include file="../home/_foot.jsp"%>
</body>
</html>
