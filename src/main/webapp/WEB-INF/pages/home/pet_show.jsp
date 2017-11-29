<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>
<div id="content1">
		<div id="content1_head">
			<h1>宠物秀</h1>
			<h2><img src="${ctx }/staticfile/images/content1_h2.jpg" border="0"/></h2>
		</div>
		<div class="common">
			<div class="stylesgoleftt" id="goleftt" style="float:left;width:21px;height:28px;background:url(../../images/arrowhead.png) no-repeat left top;margin:106px 5px 0px 0px;cursor:pointer;"></div>
			  <ul>
			 	 <c:forEach items="${petShowList }" var="pet" begin="0" end="2">
				<li class="listbox mr20">
				  <div class="listimg"> <a href="${ctx }/petshow/content.action?id=${pet.id}">
				  	<img src="${ctx }/getImage.action?imgurl=${pet.imgurl}" border="0" class="attachment-thumbnail wp-post-image" alt="WordPress中文博客主题Truepixel" /></a>
					<div class="summary">
					  <div class="summarytxt">
						<p>${pet.description }</p>
					  </div>
					</div>
				  </div>
				  <div class="listinfo">
					<div class="listtitle"><a href="${ctx }/petshow/content.action?id=${pet.id}"  target="_blank">${pet.name }</a></div>
					<div class="listtag"><a href="" rel="tag">喵呜~</a><a href="http://www.lanrentuku.com/" rel="tag">贴心宠物</a></div>
					<div class="listdate">2020-08-25</div>
					<div class="listview">6253</div>
					<div class="listcomment">16</div>
					<div class="listdemo"><a href="#">演示</a></div>
				  </div>
				</li>
				</c:forEach>
			  </ul>
			  <div class="stylesgoright" id="goright"></div>
		</div>
	</div>
	