<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE>
<html>
<head>
<title>商品列表页</title>
<link href="${ctx }/staticfile/css/prodList.css" rel="stylesheet"
	type="text/css">
	<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/css/basic.css" />
</head>

<!-- 引入头部 -->
<%@include file="../home/_head.jsp"%>

<div id="content">
	<div id="search_div">
		<form method="post" action="#">
			<span class="input_span">商品名：<input type="text" name="name" /></span>
			<span class="input_span">商品种类：<input type="text"
				name="category" /></span> <span class="input_span">商品价格区间：<input
				type="text" name="minprice" /> - <input type="text" name="maxprice" /></span>
			<input type="submit" value="查询">
		</form>
	</div>
	<div id="prod_content">
		<div id="prod_div">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div" style="margin-right: 0px;">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
		<div id="prod_div" style="margin-right: 0px;">
			<img src="${ctx }/staticfile/img/prodlist/prod.jpg"></img>
			<div id="prod_name_div">华为荣耀6plus</div>
			<div id="prod_price_div">￥2099元</div>
			<div>
				<div id="gotocart_div">
					<a href="#">加入购物车</a>
				</div>
				<div id="say_div">133人评价</div>
			</div>
		</div>
	</div>
	<div style="clear: both"></div>
</div>
<!-- 引入底部 -->
<%@include file="../home/_foot.jsp"%>
</html>