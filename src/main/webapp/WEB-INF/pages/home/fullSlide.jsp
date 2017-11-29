<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>
<style type="text/css">		
	.fullSlide{width:100%;position:relative;height:468px;background:#000;}
	.fullSlide .bd{margin:0 auto;position:relative;z-index:0;overflow:hidden;}
	.fullSlide .bd ul{width:100% !important;}
	.fullSlide .bd li{width:100% !important;height:468px;overflow:hidden;text-align:center;}
	.fullSlide .bd li a{display:block;height:468px;}
	.fullSlide .hd{width:100%;position:absolute;z-index:1;bottom:0;left:0;height:30px;line-height:30px;}
	.fullSlide .hd ul{text-align:center;}
	.fullSlide .hd ul li{cursor:pointer;display:inline-block;*display:inline;zoom:1;width:42px;height:11px;margin:1px;overflow:hidden;background:#000;filter:alpha(opacity=50);opacity:0.5;line-height:999px;}
	.fullSlide .hd ul .on{background:#f00;}
	.fullSlide .prev,.fullSlide .next{display:block;position:absolute;z-index:1;top:50%;margin-top:-30px;left:15%;z-index:1;width:40px;height:60px;background:url(${ctx }/staticfile/images/slider-arrow.png) -126px -137px #000 no-repeat;cursor:pointer;filter:alpha(opacity=50);opacity:0.5;display:none;}
	.fullSlide .next{left:auto;right:15%;background-position:-6px -137px;}
	</style>

	<div class="fullSlide">
		<div class="bd">
			<ul>
				<li _src="url(${ctx }/staticfile/images/g1.jpg)"><a href="#"></a></li>
				<li _src="url(${ctx }/staticfile/images/g2.jpg)"><a href="#"></a></li>
				<li _src="url(${ctx }/staticfile/images/g3.jpg)"><a href="#"></a></li>
				<li _src="url(${ctx }/staticfile/images/g4.jpg)"><a href="#"></a></li>
			</ul>
		</div>
		<div class="hd"><ul></ul></div>
		<span class="prev"></span>
		<span class="next"></span>
	</div><!--fullSlide end-->
  
	<script type="text/javascript">
		$(".fullSlide").hover(function(){
			$(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
		},
		function(){
			$(this).find(".prev,.next").fadeOut()
		});
		$(".fullSlide").slide({
			titCell: ".hd ul",
			mainCell: ".bd ul",
			effect: "fold",
			autoPlay: true,
			autoPage: true,
			trigger: "click",
			startFun: function(i) {
				var curLi = jQuery(".fullSlide .bd li").eq(i);
				if ( !! curLi.attr("_src")) {
					curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
				}
			}
		});
	</script>