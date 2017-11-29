<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>
<html>
<head>
<title>喵呜~</title>
<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/css/index.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/css/basic.css" />
<link href="${ctx }/staticfile/css/lanrenzhijia.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/staticfile/css/lrtk.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/css/pet_show.css" />

<script type="text/javascript" src="${ctx }/staticfile/js/lanrenzhijia.js"></script>
<script type="text/javascript" src="${ctx }/staticfile/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctx }/staticfile/js/jquery.js"></script>
<script type="text/javascript" src="${ctx }/staticfile/js/superslide.2.1.js"></script>
<script type="text/javascript" src="${ctx }/staticfile/js/lrtk.js"></script>
</head>
<body>
	<c:if test="${empty petShowList }">
		<jsp:forward page="${ctx }/petshow/show.action"></jsp:forward>
	</c:if>
	<c:if test="${empty pets }">
		<jsp:forward page="${ctx }/pet/show.action"></jsp:forward>
	</c:if>
	<!-- <script type="text/javascript">
		window.location.href = "petshow/show.action";		//javascript页面跳转，防止页面嵌套，直接跳到最顶部窗口
	</script> -->
	
	<!-- 引入头部 -->
	<%@include file="_head.jsp" %>
	
	<!-- 引入滑动图片 -->
	<%@include file="fullSlide.jsp" %>
	
	<div class="case-content">
	
		<div class="case-item">
			<div class="ih-item circle effect1">
				<a href="#" target="_blank">
					<div class="spinner"></div>
					<div class="img"><img src="${ctx }/staticfile/images/1.png" alt="懒人图库"></div>
					<div class="info">
						<div class="info-back">
							<h3>库存管理</h3>
							<p>好好学习，天天向上</p>
						</div>
					</div>
				</a>
			</div>
			<div class="case-p">
				<p>实时更新库存信息</p>
			</div>
		</div>
		
		
		<div class="case-item">
			<div class="ih-item circle effect1">
				<a href="#" target="_blank">
					<div class="spinner"></div>
					<div class="img"><img src="${ctx }/staticfile/images/2.png" alt="懒人图库"></div>
					<div class="info">
						<div class="info-back">
							<h3>报表分析</h3>
							<p>好好学习，天天向上</p>
						</div>
					</div>
				</a>
			</div>
			<div class="case-p">
				<p>宠物生活一目了然</p>
			</div>
		</div>
		
		<div class="case-item">
			<div class="ih-item circle effect1">
				<a href="#" target="_blank">
					<div class="spinner"></div>
					<div class="img"><img src="${ctx }/staticfile/images/3.png" alt="懒人图库"></div>
					<div class="info">
						<div class="info-back">
							<h3>宠物o2o平台</h3>
							<p>好好学习，天天向上</p>
						</div>
					</div>
				</a>
			</div>
			<div class="case-p">
				<p>实现线上和线下的互联</p>
			</div>
		</div>
		
		<div class="case-item">
			<div class="ih-item circle effect1">
				<a href="#" target="_blank">
					<div class="spinner"></div>
					<div class="img"><img src="${ctx }/staticfile/images/4.png" alt="懒人图库"></div>
					<div class="info">
						<div class="info-back">
							<h3>定制</h3>
							<p>好好学习，天天向上</p>
						</div>
					</div>
				</a>
			</div>
			<div class="case-p">
				<p>操作最简单了</p>
			</div>
		</div>
	</div>
	
	
	<div id="nav1">
		<ul>
			<li><img src="${ctx }/staticfile/images/1_1.png"/></li>
			<li><img src="${ctx }/staticfile/images/1_2.png"/></li>
			<li><img src="${ctx }/staticfile/images/1_3.png"/></li>
			<li><img src="${ctx }/staticfile/images/1_4.png"/></li>
			<li><img src="${ctx }/staticfile/images/1_5.png"/></li>
			<li><img src="${ctx }/staticfile/images/1_6.png"/></li>
		</ul>
	</div>
	<div id="line">
		<div id="line1">
		
		</div>
	</div>
	
	<!--宠物秀-->
	<%@include file="pet_show.jsp" %>
	
	<div id="content3">
		<div id="content3_head">
			<h1>我们的展示</h1>
			<h2><img src="${ctx }/staticfile/images/content3_head.jpg" border="0"/></h2>
		</div>
	</div>
	
	
	
	
	<script type="text/javascript">
		window.onload = function () {
			var oBtnLeft = document.getElementById("goleft");
			var oBtnRight = document.getElementById("goright");
			var oDiv = document.getElementById("indexmaindiv");
			var oDiv1 = document.getElementById("maindiv1");
			var oUl = oDiv.getElementsByTagName("ul")[0];
			var aLi = oUl.getElementsByTagName("li");
			var now = -3 * (aLi[0].offsetWidth + 13);
			oUl.style.width = aLi.length * (aLi[0].offsetWidth + 13) + 'px';
			oBtnRight.onclick = function () {
				var n = Math.floor((aLi.length * (aLi[0].offsetWidth + 13) + oUl.offsetLeft) / aLi[0].offsetWidth);
		
				if (n <= 3) {
					move(oUl, 'left', 0);
				}
				else {
					move(oUl, 'left', oUl.offsetLeft + now);
				}
			}
			oBtnLeft.onclick = function () {
				var now1 = -Math.floor((aLi.length / 3)) * 3 * (aLi[0].offsetWidth + 13);
		
				if (oUl.offsetLeft >= 0) {
					move(oUl, 'left', now1);
				}
				else {
					move(oUl, 'left', oUl.offsetLeft - now);
				}
			}
			var timer = setInterval(oBtnRight.onclick, 5000);
				oDiv.onmouseover = function () {
					clearInterval(timer);
				}
				oDiv.onmouseout = function () {
					timer = setInterval(oBtnRight.onclick, 5000);
				}
			
			};

			function getStyle(obj, name) {
				if (obj.currentStyle) {
					return obj.currentStyle[name];
				}
				else {
					return getComputedStyle(obj, false)[name];
				}
			}
	
			function move(obj, attr, iTarget) {
				clearInterval(obj.timer)
				obj.timer = setInterval(function () {
					var cur = 0;
					if (attr == 'opacity') {
						cur = Math.round(parseFloat(getStyle(obj, attr)) * 100);
					}
					else {
						cur = parseInt(getStyle(obj, attr));
					}
					var speed = (iTarget - cur) / 6;
					speed = speed > 0 ? Math.ceil(speed) : Math.floor(speed);
					if (iTarget == cur) {
						clearInterval(obj.timer);
					}
					else if (attr == 'opacity') {
						obj.style.filter = 'alpha(opacity:' + (cur + speed) + ')';
						obj.style.opacity = (cur + speed) / 100;
					}
					else {
						obj.style[attr] = cur + speed + 'px';
					}
				}, 30);
			}  
		</script>

	
		<div class="indexmaindiv" id="indexmaindiv">
			<div class="indexmaindiv1 clearfix" >
				<div class="stylesgoleft" id="goleft"></div>
				<div class="maindiv1 " id="maindiv1">
					<ul id="count1">
					
						<c:forEach items="${pets }" var="p" varStatus="status">
							<li>
								<div class="playerdetail">
									<div class="teanames">${p.petName }</div>
									<div class="teadetail">${p.remark }</div>
									<a class="checkdetail" href="${ctx }/pet/petInfo.action?petId=${p.petId}"></a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="stylesgoright" id="goright"></div>
			</div>		
	</div>	

	<!-- 引入关于我们 -->
	<%@include file="about_us.jsp" %>

	<!-- 引入底部 -->
	<%@include file="_foot.jsp" %>

</body>
</html>