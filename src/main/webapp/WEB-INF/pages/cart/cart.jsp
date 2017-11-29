<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<link href="${app }/css/cart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.4.2.js"></script>

<script type="text/javascript">
	$(function() {
		function formSubmit (url,sTarget){
		    document.forms[0].target = sTarget
		    document.forms[0].action = url;
		    document.forms[0].submit();
		    return true;
		}
		$(".del").click(
				function() {
					if (confirm("您确定删除吗?")) {
						//如何获取商品
						var id = $(this).parent().parent().find("[type=text]")
								.attr("id");

						location.href = "/delete.action?id=" + id;

					}
				});
		$(".del1").click(
				function() {
					if (confirm("您确定删除吗?")) {
						//如何获取商品
						var id = $(this).parent().parent().find("[type=text]")
								.attr("id");

						location.href = "/delete1.action?id=" + id;

					}
				});
		//为“-”绑定点击事件
		$(".delNum1").click(
				function() {
					//获取购买的数量对应的输入框对象
					var $buyNumInput = $(this).next();
					//获取商品id
					var id = $buyNumInput.attr("id");
					//计算修改后购买数量
					var newBuyNum = $buyNumInput.val() - 1;
					//将修改后的结果影响到session
					if (newBuyNum <= 0) {//删除
						location.href = "/delete1.action?id=" + id;
					} else {//修改
						location.href = "/edit1.action?id=" + id
								+ "&newBuyNum=" + newBuyNum;
					}

				});
		//为+绑定点击事件
		$(".addNum1").click(
				function() {
					//获取对应输入框对象
					var $bin = $(this).prev();
					//获取商品id
					var id = $bin.attr("id");
					//修改后的属性=获取原购买数量+1
					var newBuyNum = parseInt($bin.val()) + 1;
					//跳转到CartEditServlet
					location.href = "/edit1.action?id=" + id + "&newBuyNum="
							+ newBuyNum;

				});

		//为输入框绑定失去焦点的事件
		$(".buyNumInp2").blur(
				function() {
					//获取商品id
					var id = $(this).attr("id");
					//获取旧的购买数量
					var oldNum = $("#hid_" + id).val();
					//获取修改后数量
					var newNum = $(this).val();

					var newBuyNum = newNum;
					if (oldNum != newNum) {
						if (newNum == 0) {
							location.href = "/delete1.action?id=" + id;
						} else if (/^[1-9][0-9]*$/.test(newNum)) {//
							location.href = "/edit1.action?id=" + id
									+ "&newBuyNum=" + newBuyNum;
						} else {
							alert("请输入当于等于0的整数");
							$(this).val(oldNum);
						}
					}
				});
		//为“-”绑定点击事件
		$(".delNum").click(
				function() {
					//获取购买的数量对应的输入框对象
					var $buyNumInput = $(this).next();
					//获取商品id
					var id = $buyNumInput.attr("id");
					//计算修改后购买数量
					var newBuyNum = $buyNumInput.val() - 1;
					//将修改后的结果影响到session
					if (newBuyNum <= 0) {//删除
						location.href = "/delete.action?id=" + id;
					} else {//修改
						location.href = "/edit.action?id=" + id + "&newBuyNum="
								+ newBuyNum;
					}

				});
		//为+绑定点击事件
		$(".addNum").click(
				function() {
					//获取对应输入框对象
					var $bin = $(this).prev();
					//获取商品id
					var id = $bin.attr("id");
					//修改后的属性=获取原购买数量+1
					var newBuyNum = parseInt($bin.val()) + 1;
					//跳转到CartEditServlet
					location.href = "/edit.action?id=" + id + "&newBuyNum="
							+ newBuyNum;

				});

		//为输入框绑定失去焦点的事件
		$(".buyNumInp1").blur(
				function() {
					//获取商品id
					var id = $(this).attr("id");
					//获取旧的购买数量
					var oldNum = $("#hid_" + id).val();
					//获取修改后数量
					var newNum = $(this).val();

					var newBuyNum = newNum;
					if (oldNum != newNum) {
						if (newNum == 0) {
							location.href = "/delete.action?id=" + id;
						} else if (/^[1-9][0-9]*$/.test(newNum)) {//
							location.href = "/edit.action?id=" + id
									+ "&newBuyNum=" + newBuyNum;
						} else {
							alert("请输入当于等于0的整数");
							$(this).val(oldNum);
						}
					}
				});

	});
</script>
<style type="text/css">
.buyNumInp2 {
	width: 60px;
	height: 30px;
	border-top: 1px solid #CCC;
	border-bottom: 1px solid #CCC;
	border-left: none;
	border-right: none;
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<%@include file="../home/_head.jsp"%>
	<div class="warp">
		<!-- 标题信息 -->
		<div id="title">
			<input name="allC" type="checkbox" value="" onclick="" /> <span
				id="title_checkall_text">选择</span> <span id="title_name">商品</span> <span
				id="title_price">单价（元）</span> <span id="title_buynum">数量</span> <span
				id="title_money">小计（元）</span> <span id="title_del">操作</span>
		</div>
		${msg }
		<!-- 购物信息 -->
		<c:set var="money" value="0"></c:set>
		<c:forEach items="${sessionScope.petcart }" var="entry">
			<div id="prods">
				<input name="petId" type="checkbox" value="${entry.key.petId}" />
				 <img src="${ctx }/getImage.action?imgurl=${entry.key.imgurl}"
				width="90" height="90" />  
				<span id="prods_name">${entry.key.petname}</span> <span
					id="prods_price">${entry.key.price }</span> <span id="prods_buynum">
					<a href="javascript:void(0)" class="delNum">-</a> <input
					id="${entry.key.petId}" class="buyNumInp1" type="text"
					value="${entry.value }"> <a href="javascript:void(0)"
					class="addNum">+</a> <input type="hidden"
					id="hid_${entry.key.petId }" value="${entry.value }">
				</span> <span id="prods_money">${entry.key.price*entry.value }</span>
				<c:set var="money" value="${money+entry.key.price*entry.value }" />
				<span id="prods_del"><a class="del" href="#">删除</a></span>
			</div>
		</c:forEach>
		<c:forEach items="${sessionScope.productcart }" var="entry">
			<div id="prods">
				<input name="productId" type="checkbox" value="${entry.key.productid}" />
				<img src="${ctx }/getImage.action?imgurl=${entry.key.imgurl}"
				width="90" height="90" />
				<span id="prods_name">${entry.key.name}</span> <span
					id="prods_price">${entry.key.price }</span> <span id="prods_buynum">
					<a href="javascript:void(0)" class="delNum1">-</a> <input
					id="${entry.key.productid}" class="buyNumInp2" type="text"
					value="${entry.value }"> <a href="javascript:void(0)"
					class="addNum1">+</a> <input type="hidden"
					id="hid_${entry.key.productid }" value="${entry.value }">
				</span> <span id="prods_money">${entry.key.price*entry.value }</span>
				<c:set var="money" value="${money+entry.key.price*entry.value }" />
				<span id="prods_del"><a class="del1" href="#">删除</a></span>
			</div>
		</c:forEach>
		<!-- 总计条 -->
		<div id="total">
			<div id="total_1">
				<span id="span_1">总价：</span> <span id="span_2">￥${money }</span>
			</div>
			<div id="total_2">
				<a id="goto_order" href="orderadd.action">去结算</a>
			</div>
		</div>
	</div>
<<<<<<< .mine
	<%@include file="../home/_foot.jsp"%>
=======
	<%@include file="../home/_foot.jsp" %>
>>>>>>> .r130
</body>
</html>