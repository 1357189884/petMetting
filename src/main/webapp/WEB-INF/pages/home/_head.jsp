<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>



	<div id="header">
		<div id="header1">
			
		</div>
		<div id="input_1">
			<c:if test="${not empty _CURRENT_USER}">
				<span style="color:#fff;">欢迎您:${_CURRENT_USER.username }</span>
				<span style="color:#fff;"></span><a style="color:#fff;" href="${ctx }/logout.action">注销</a></span>
			</c:if>
			<c:if test="${empty _CURRENT_USER }">
				<div id="input1">
					<a href="${ctx }/toregist.action"><img src="${ctx }/staticfile/images/regist.png" border="0"/></a>
				</div>
				<div id="input2">
					<a href="${ctx }/tologin.action"><img src="${ctx }/staticfile/images/login.png" border="0"/></a>
				</div>	
			</c:if>
		</div>
	</div>
	
	
	<div id="nav">
		<ul>
			<li><a href="${ctx }/home.action">网站首页</a></li>
			<li><a href="#">购物车</a></li>
			<li><a href="toView.action">我的订单</a></li>
			<li><a href="#content1">宠物秀</a></li>
			<li class="li_1"><a href="prodList">购买宠物</a></li>

		</ul>
	</div>