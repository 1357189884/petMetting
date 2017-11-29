<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<form action="index.html" method="post" enctype="multipart/form-data">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td class="tableleft">宠物名</td>
				<td><input type="text" name="petName" /></td>
			</tr>
			<tr>
				<td class="tableleft">价格</td>
				<td><input type="text" name="price" /></td>
			</tr>
			<tr>
				<td class="tableleft">生日</td>
				<td><input type="date" name="birthday" /></td>
			</tr>
			<tr>
				<td class="tableleft">年龄</td>
				<td><input type="text" name="age" /></td>
			</tr>
			<tr>
				<td>种类：</td>
				<td class="tableleft"><select name="kind">
						<option>无</option>
						<option>宠物狗</option>
						<option>宠物猫</option>
						<option>啮齿类</option>
						<option>水族</option>
						<option>鸟类</option>
						<option>虫类</option>
						<option>爬行类</option>
						<option>其他</option>
				</select></td>
			</tr>
			<tr>
				<td class="tableleft">图片</td>
				<td><input name="picFile" type="file" /></td>
			</tr>
			<tr>
				<td class="tableleft">喜好</td>
				<td><input type="text" name="fancy" /></td>
			</tr>
			<tr>
				<td class="tableleft">数量</td>
				<td><input type="text" name="num" /></td>
			</tr>
			<tr>
				<td>健康：</td>
				<td><input type="radio" name="health" value="1">健康
					&nbsp;&nbsp; <input type="radio" name="health" value="0">非健康</td>
			</tr>
			<tr>
				<td>备注信息：</td>
				<td><textarea style="resize: none;" cols="80" rows="5" name="remark"></textarea></td>
			</tr>

			<tr>
				<td class="tableleft"></td>
				<td>
					<button type="submit" class="btn btn-primary"
						onClick="formSubmit('save','_self');this.blur();">增加</button>&nbsp;&nbsp;
					<span style="color: red"><c:if test="${!empty errorInfo}">${errorInfo}</c:if></span>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>
