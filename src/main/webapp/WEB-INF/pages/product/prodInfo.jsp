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
				<img src="${ctx }/staticfile/img/prodInfo/prod.jpg"/>
			</div>
			<div id="left_bottom">
				<img id="lf_img" src="${ctx }/staticfile/img/prodInfo/lf.jpg"/>
				<img id="mid_img" src="${ctx }/staticfile/img/prodInfo/prod.jpg" width="60px" height="60px"/>
				<img id="rt_img" src="${ctx }/staticfile/img/prodInfo/rt.jpg"/>
			</div>
		</div>
		<div id="right">
			<div id="right_top">
				<span id="prod_name">华为 荣耀6 Plus 标准版 双卡双待双通 移动4G 16GB存储（白色） <br/></span>
				<br>
				<span id="prod_desc">双眼看世界，荣耀独创后置平行双800万像素镜头设计，前置800万像素拍照神器！<br/></span>
			</div>
			<div id="right_middle">
				<span id="right_middle_span">
						EasyMall 价：<span class="price_red">￥${prod.price }<br/>
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