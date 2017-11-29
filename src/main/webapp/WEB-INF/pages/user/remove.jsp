<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title></title>
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
		用户编号： <input type="text" name="userIde" id="selid"
			class="abc input-default"> &nbsp;&nbsp;
		<button type="submit" class="btn btn-primary"
			onClick="formSubmit('removes','_self');this.blur();">删除</button>
		&nbsp;&nbsp;
		

	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
					<th><input type="checkbox" name="selid"
						onClick="checkAll('userIde',this)"></th>
				
				<th>用户序号</th>
				<th>用户名</th>
				<th>密码</th>
				<th>姓名</th>
				<th>创建时间</th>
				<th>身份证</th>
				<th>邮箱</th>
				<th>电话</th>
				<th>地址</th>
				<th>账户余额</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody class="tableBody">

			<c:forEach items="${userList}" var="d" varStatus="status">
				<tr class="odd" onmouseover="this.className='highlight'"
					onmouseout="this.className='odd'">
					<td><input type="checkbox" name="userIde" value="${d.userId}" /></td>
					
					<td>${status.index+1}</td>		
					<td>${d.username}</td>
					<td>${d.password}</td>
					<td>${d.name}</td>	
					<td>${d.createTime}</td>	
					<td>${d.cardNo}</td>	
					<td>${d.email}</td>	
					<td>${d.tel}</td>	
					<td>${d.address}</td>	
					<td>${d.money}</td>	
					<td>
			        <c:if test="${d.state==1}"><font color="green">启用</font></c:if>
			        <c:if test="${d.state==0}"><font color="red">停用</font></c:if>
		            </td>
							
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
	
</body>
</html>