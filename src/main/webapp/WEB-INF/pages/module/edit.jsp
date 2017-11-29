<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
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
</style>
</head>
<form action="index.html" method="post">
	<table class="table table-bordered table-hover definewidth m10">
		<tr>
			<td><input type="hidden" name="moduleId"
				value="${module.moduleId }" /></td>
		</tr>
		<tr>
			<td class="tableleft">模块名称：</td>
			<td><input type="text" name="name" value="${module.name }" /></td>
		</tr>
		<tr>
			<td class="tableleft">序号：</td>
			<td><input type="text" name="orderno" value="${module.orderno }" /></td>
		</tr>
		<tr>
			<td class="tableleft">上级模块：</td>
			<td><select name="parentModule.moduleId">
					<option>-无上级-</option>
					<!-- 先获取页面返回来的部门列表 然后遍历 -->
					<c:forEach items="${modules }" var="m">

						<option value="${m.moduleId }"
							<c:if test="${m.moduleId==module.parentModel.moduleId }">selected="selected"</c:if>>${m.name }
						</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td class="tableleft">类型：</td>
			<td><select name="ctype">

					<option value="1"
						<c:if test="${module.ctype==1 }">selected="selected"</c:if>>-主菜单-</option>
					<option value="2"
						<c:if test="${module.ctype==2 }">selected="selected"</c:if>>-侧边菜单-</option>
					<option value="3"
						<c:if test="${module.ctype==3 }">selected="selected"</c:if>>-按钮-</option>
			</select></td>
		</tr>



		<tr>
			<td class="tableleft">模块状态：</td>

			<td><input type="radio" name="state" value="1"
				<c:if test="${module.state==1 }">checked="checked"</c:if> /><a href="stopM?moduleId=${m.moduleId}">启用 <input
				type="radio" name="state" value="0"
				<c:if test="${module.state==0 }">checked="checked"</c:if> /><a href="startM?moduleId=${m.moduleId}">关闭</td>
		</tr>
		<tr>
			<td class="tableleft">模块介绍：</td>
			<td><input type="text" name="remark" value="${module.remark }" /></td>
		</tr>
		<tr>
			<td class="tableleft"></td>
			<td>
				<button type="submit" class="btn btn-primary"
					onClick="formSubmit('updateM','_self');this.blur();">保存</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-success" id="backid"
					onClick="window.history.back();">返回列表</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
