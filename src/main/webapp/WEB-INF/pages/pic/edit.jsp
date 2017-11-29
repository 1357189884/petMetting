<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html>
<head>
<title>上传</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx }/Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/Css/style.css" />
<script type="text/javascript" src="../Js/jquery.js">
	
</script>
<script type="text/javascript" src="../Js/jquery.sorted.js">
	
</script>
<script type="text/javascript" src="../Js/bootstrap.js">
	
</script>
<script type="text/javascript" src="../Js/ckform.js">
	
</script>
<script type="text/javascript" src="../Js/common.js"></script>

<script type="text/javascript">
	$(function() {

		$('#addnew1111').click(function() {

			window.location.href = "add.html";
		});
	});

	/* 全选*/
	function checkAll(who, obj) {
		var curCheckBox = document.getElementsByName(who);
		for (i = 0; i < curCheckBox.length; i++) {
			curCheckBox.item(i).checked = obj.checked;
		}
	}
	function formSubmit(url, sTarget) {
		document.forms[0].target = sTarget
		document.forms[0].action = url;
		document.forms[0].submit();
		return true;
	}
</script>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) { /* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}

.table input {
	width: 160px;
	height: 30px;
}

.table td {
	width: auto;
	text-align: center;
}
</style>
</head>
<body>
	<form action="index.html" method="post">
		<table class="table table-bordered table-hover definewidth m10">
			<input type="hidden" name="id" value="${petshow.id }"/>
			<tr>
				<td width="10%" class="tableleft">图片名称</td>
				<td><input type="text" name="name" value="${petshow.name }"/></td>
			</tr>
			<tr>
				<td class="tableleft">创建时间</td>
				<td><input type="text" name="createTime" value="<fmt:formatDate value="${petshow.createTime }" pattern="yyyy-MM-dd"/>
				" /></td>
			</tr>
			<tr>
				<td class="tableleft">图片</td>
				<td>
					<img alt="图片" src="${ctx }/getImage.action?imgurl=${petshow.imgurl}" border="0" width="200px" height="200px;">
				</td>
			</tr>
			<tr>
				<td class="tableleft">描述</td>
				<td>
					<textarea cols="70"
							rows="10" name="description" >${petshow.description }</textarea>
				</td>
			</tr>
			<tr>
				<td class="tableleft">查看次数</td>
				<td>${petshow.times }</td>
			</tr>
			<tr>
				<td class="tableleft"></td>
				<td>
					<button type="submit" class="btn btn-primary"
						onClick="formSubmit('editSubmit','_self');this.blur();">保存</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-success" id="backid"
						onClick="window.history.back();">返回列表</button>
				</td>
			</tr>
		</table>
	</form>
</body>

</html>