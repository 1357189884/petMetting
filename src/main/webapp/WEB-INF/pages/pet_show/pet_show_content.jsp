<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/css/content.css" />

	<%@include file="../home/_head.jsp" %>
	
	<div id="list">
		<div id="list_content">
			<div id="list_content_top">
				<h1>宠</h1>
				<h2>物秀</h2>
			</div>
			<div id="list_content_bottom">
				<h1>${pet.name }</h1>
				<h2 style="margin-bottom:20px;">浏览字数：${pet.times }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：
					<fmt:formatDate value="${pet.createTime }" pattern="yyyy-MM-dd"/></h2>
				<span style="width:784px;height:600px;background:red;margin-left:220px;">
					<img alt="图片" src="${ctx }/getImage.action?imgurl=${pet.imgurl}" width="600px" height="400px" border="0">
				</span>
				<p>
					${pet.description }
				</p>
			</div>
		</div>
	</div>

	<%@include file="../home/_foot.jsp" %>

