<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>
<html>
<head>
<link href="${ctx }/staticfile/css/prodInfo.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/css/basic.css" />
</head>
<body>
<!-- 引入头部 -->
<%@include file="../home/_head.jsp"%>

	<div id="warp">
		<div id="left">
			<div id="left_top">
				<img alt="图片" src="${ctx }/getImage.action?imgurl=${pet.imgurl}" border="0" width="200px" height="200px;">
			</div>
			<div id="left_bottom">
				<img id="lf_img" src="${ctx }/staticfile/img/prodInfo/lf.jpg"/>
				<img id="mid_img" src="${ctx }/staticfile/img/prodInfo/prod.jpg" width="60px" height="60px"/>
				<img id="rt_img" src="${ctx }/staticfile/img/prodInfo/rt.jpg"/>
			</div>
		</div>
		<div id="right">
			<div id="right_top">
				<span id="prod_name">${pet.petName } <br/></span>
				<br>
				<span id="prod_desc">${pet.remark }<br/></span>
			</div>
			<div id="right_middle">
				<span id="right_middle_span">
						${pet.kind }  价格：<span class="price_red">￥${pet.price }<br/>
			            运     费：满 100 免运费<br />
			            服     务：由EasyMall负责发货，并提供售后服务<br />
			            购买数量：
	            <a href="#" id="delNum" onclick="">-</a>
	            <input id="buyNumInp" name="" type="text" value="1" onblur="">
		        <a href="#" id="addNum" onclick="">+</a>
			</div>
			<div id="right_bottom">
				<input class="add_cart_but" type="button"/>	
			</div>
		</div>
	</div>
	<!-- 引入底部 -->
<%@include file="../home/_foot.jsp"%>
</body>
</html>