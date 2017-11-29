<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />


<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/css/basic.css" />

<div id="footer">
	<div id="slide">
		<div id="f1">
			<div id="f1_top">
				<div id="f1_top1">
					<p>喵呜宠物谢谢你的兴趣！假如你是宠物店店主，正好也想降低经营成本、解决库存积压、</p>
					<p>构建客情关系、有一个自己的微店等，请使用以下信息请联系我们。</p>
				</div>
				<div id="f1_top2">

					<ul>
						<li><p>关注我们：</p></li>
						<li class="si_serviceleftLI1" style=""><a target="_blank"
							href="#"><img src="${ctx }/staticfile/images/wei1.jpg" border="0" /></a>
							<div style="display: none;">
								<img src="${ctx }/staticfile/images/wb2wm.png">
							</div></li>
						<li class="si_serviceleftLI2" style=""><a target="_blank"
							href="#"><img src="${ctx }/staticfile/images/w2.jpg" border="0" /></a>
							<div style="display: none;">
								<img src="${ctx }/staticfile/images/wx2wm.png">
							</div></li>
					</ul>
				</div>
			</div>
			<div id="f1_bottom"></div>
		</div>
		<div id="f2">
			<div id="f2_left">
				<img src="${ctx }/staticfile/images/s1.jpg" border="0" />
				<div id="s1">
					<p>IT行业发展到今我们差的只是一个可以打开的窗口，窗口的另</p>
					<p>而我们的行业资讯是IT行业走向DT时代的一扇窗，</p>
					<p>了解最新行业动态推开这扇窗走进DT时代！</p>
				</div>
				<div id="s2">
					<p class="p1">188&nbsp;9449&nbsp;2180</p>
					<p class="p2">2195542745@qq.com</p>
				</div>
				<div id="s4">
					<p>@2017.All rights reserved Designed by PSD Booster.</p>
				</div>
			</div>

			<div id="f2_right">
				<div id="login_cnzz" class="login_cnzz">
					<h1>给我们留言</h1>
					<div class="row">
						<input type="text" name="username" value="" id="username"
							class="name" maxlength="20" placeholder="用户名"> <input
							type="text" name="tel" value="" id="tel" maxlength="20"
							placeholder="手机"> <input type="text" name="company"
							value="" id="company" class="companyName" maxlength="20"
							placeholder="地址">
					</div>
					<div class="row">
						<textarea name="content" id="content" value="说点什么吧..." cols="30"
							rows="10" placeholder="说点什么吧..."></textarea>
						<a href="javascript:void(0)" class="btn" onClick="ajax_sub()" style="float: right">提交留言</a>
						<span id="msg" style="float: left; margin-left: 5px"></span>
						<h1></h1>
						<a href="javascript:void(0)" class="btn" onClick="back_sub()" style="float: right">后台进入</a>
					</div>

					<div id="hdsy">
						<a href="#">回到顶部</a>
					</div>
					

				</div>
			</div>

		</div>
	</div>
</div>


<script>
	function back_sub() {
		window.location.href="backIndex.action";	
	}
	function ajax_sub() {
		var name = $('#username').val();
		var tel = $('#tel').val();
		var company = $('#company').val();
		var content = $('#content').val();
		if (name == "") {
			$('#username').attr("placeholder", "请输入用户名");
			$('#username').focus();
			$('#username').select();
			return false;
		}
		if (tel == "") {
			$('#tel').attr("placeholder", "请输入手机号码");
			$('#tel').focus();
			$('#tel').select();
			return false;
		}
		if (tel) {
			var tel = $("input[name=tel]").val();
			var me = false;
			var reg0 = /^13\d{9}$/;
			var reg1 = /^153\d{8}$/;
			var reg2 = /^159\d{8}$/;
			var reg3 = /^15\d{9}$/;
			var reg4 = /^18\d{9}$/;
			var my = false;
			if (reg0.test(tel))
				my = true;
			if (reg1.test(tel))
				my = true;
			if (reg2.test(tel))
				my = true;
			if (reg3.test(tel))
				my = true;
			if (reg4.test(tel))
				my = true;
			if (!my) {
				$('#tel').val('');
				$('#tel').attr("placeholder", "手机号码输入有误，请重新输入");
				$('#tel').focus();
				$('#tel').select();
				return false;
			}
		}

		if (company == "") {
			$('#company').attr("placeholder", "请输入地址");
			$('#company').focus();
			$('#company').select();
			return false;
		}
		if (content == "") {
			$('#content').attr("placeholder", "请输入详细内容");
			$('#content').focus();
			$('#content').select();
			return false;
		}
		/* 这里是提交地址 */

		$.post('index.php?g=Home&m=Index&a=csend', 
				{
			username : name,
			tel : tel,
			company : company,
			content : content
		}, function(json) {
			if (json == 0) {
				$('#username').val('');
				$('#tel').val('');
				$('#company').val('');
				$('#content').val('');
				$("#msg").show().html(
						"<font color='#FF0000'>对不起，每天只能提交3次！</font>").fadeOut(
						2500);
			} else if (json == 1) {
				$("#msg").show().html("<font color='#FF0000'>请正确输入信息！</font>")
						.fadeOut(2500);
			} else if (json == 2) {
				$('#username').val('');
				$('#tel').val('');
				$('#company').val('');
				$('#content').val('');
				$("#msg").show().html(
						"<font color='#FF0000'>提交成功，我们会尽快电话联系您！</font>")
						.fadeOut(2500);
			} else {
				$('#username').val('');
				$('#tel').val('');
				$('#company').val('');
				$('#content').val('');
				$("#msg").show().html("<font color='#FF0000'>提交失败，请重试！</font>")
						.fadeOut(2500);
			}

		}, 'json');
	}
</script>




<script>
	$(function() {

		$(".si_serviceleftLI1").hover(function() {
			$(".si_serviceleftLI1 div").fadeIn(0);
		}, function() {
			$(".si_serviceleftLI1 div").fadeOut(0);
		})
		$(".si_serviceleftLI2").hover(function() {
			$(".si_serviceleftLI2 div").fadeIn(0);
		}, function() {
			$(".si_serviceleftLI2 div").fadeOut(0);
		})
	})
</script>