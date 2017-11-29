<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="../Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="../Css/style.css" />
<script type="text/javascript" src="../Js/jquery.js"></script>
<script type="text/javascript" src="../Js/jquery.sorted.js"></script>
<script type="text/javascript" src="../Js/bootstrap.js"></script>
<script type="text/javascript" src="../Js/ckform.js"></script>
<script type="text/javascript" src="../Js/common.js"></script>

<script type="text/javascript">
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

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
.table input {
		width:auto;
		height:30px;
	}
</style>
</head>
<body>
	<form action="index.html" method="post">
	&emsp;&emsp;
		<span style="color: red"><c:if test="${!empty errorInfo}">${errorInfo}</c:if></span>

		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td><input name="petId" value="${pet.petId} " type="hidden"></td>
			</tr>
			<tr>
				<td class="tableleft">宠物名</td>
				<td><input type="text" name="petName" value="${pet.petName}" /></td>
			</tr>
			<tr>
				<td class="tableleft">价格</td>
				<td><input type="text" name="price" value="${pet.price }" /></td>
			</tr>
			<tr>
				<td class="tableleft">生日</td>
				<td><input type="date" name="birthday"
					value="<fmt:formatDate value='${pet.birthday}'
								pattern="yyyy-MM-dd" />" /></td>
				</td>
			</tr>
			<tr>
				<td class="tableleft">年龄</td>
				<td><input type="text" name="age" value="${pet.age }"/></td>
			</tr>
			<tr>
				<td class="tableleft">种类</td>
				<td><select name="kind">
						<option value="无"
							<c:if test="${pet.kind=='无'}">selected="selected"</c:if>>无</option>
						<option value="宠物狗"
							<c:if test="${pet.kind=='宠物狗'}">selected="selected"</c:if>>宠物狗</option>
						<option value="宠物猫"
							<c:if test="${pet.kind=='宠物猫'}">selected="selected"</c:if>>宠物猫</option>
						<option value="啮齿类"
							<c:if test="${pet.kind=='啮齿类'}">selected="selected"</c:if>>啮齿类</option>
						<option value="水族"
							<c:if test="${pet.kind=='水族'}">selected="selected"</c:if>>水族</option>
						<option value="虫类"
							<c:if test="${pet.kind=='虫类'}">selected="selected"</c:if>>虫类</option>
						<option value="爬行类"
							<c:if test="${pet.kind=='爬行类'}">selected="selected"</c:if>>爬行类</option>
						<option value="其他"
							<c:if test="${pet.kind=='其他'}">selected="selected"</c:if>>其他</option>


				</select></td>
			</tr>
			<tr>
				<td class="tableleft">喜好</td>
				<td><input type="text" name="fancy" value="${pet.fancy}" /></td>
			</tr>
			<tr>
				<td>健康</td>

				<td><input type="radio" name="health" value="1"
					<c:if test="${pet.health==1 }">checked="checked"</c:if> />健康 <input
					type="radio" name="health" value="0"
					<c:if test="${pet.health==0 }">checked="checked"</c:if> />非健康</td>

			</tr>
			<tr>
				<td>备注信息</td>
				<td><textarea name="remark" style="resize: none;">${pet.remark }</textarea></td>

			</tr>

			<tr>
				<td class="tableleft"></td>
				<td>
					<button type="submit" class="btn btn-primary"
						onClick="formSubmit('toupdate','_self');this.blur();">修改</button>&nbsp;&nbsp;
					&nbsp;
					<button type="submit" class="btn btn-primary"
						onClick="formSubmit('petEdit','_self');this.blur();">返回</button>


				</td>

			</tr>
		</table>
	</form>
</body>
</html>
