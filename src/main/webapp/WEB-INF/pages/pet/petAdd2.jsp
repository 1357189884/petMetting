<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>宠物列表</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="../Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="../Css/style.css" />
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
</style>
</head>

<body>

	<form class="form-inline definewidth m20" action="index.html" 
		method="get">
		添加成功! &nbsp;&nbsp;
		<button type="submit" class="btn btn-primary"
			onClick="formSubmit('petAdd','_self');this.blur();">返回</button>


		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
					<th>编号</th>
					<th>宠物名</th>
					<th>价格</th>
					<th>生日</th>
					<th>种类</th>
					<th>喜好</th>
					<th>健康</th>
					<th>备注信息</th>

				</tr>
			</thead>
			<td>${pet.petId}</td>
			<td>${pet.petName}</a></td>
			<td>${pet.price}</td>
			<td><fmt:formatDate value="${pet.birthday}" pattern="yyyy-MM-dd" /></td>
			<td>${pet.kind}</td>
			<td>${pet.fancy}</td>
			<td><c:if test="${pet.health==1}">
					<font color="green">健康</font>
				</c:if> <c:if test="${pet.health==0}">
					<font color="red">非健康</font>
				</c:if></td>
			<td><textarea name="remark" style="resize: none;"
					readonly="readonly">${pet.remark }</textarea></td>
			</tr>

		</table>
	</form>
</body>

</html>

