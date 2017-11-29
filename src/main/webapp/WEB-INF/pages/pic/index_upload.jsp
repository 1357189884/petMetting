<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<title>上传</title>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${ctx }/Css/bootstrap.css" />
	<link rel="stylesheet" type="text/css"href="${ctx }/Css/bootstrap-responsive.css" />
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
		width:auto;
		height:30px;
	}
	</style>
</head>

<body>
	<span style="color:red;font-size:16px;font-weight:bold;font-family:'微软雅黑';">${msg }</span>
	<form class="form-inline definewidth m20" action="pic/uploadPic"  enctype="multipart/form-data"
		method="post" >
		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
					<th>标题</th>
					<th>描述</th>
					<th>上传</th>
				</tr>
			</thead>
			<tr>
				<td><input name="name" type="text"/></td>
				<td><input name="description" type="text"/></td>
				<td><input name="picFile" type="file"/><input type="button" onclick="formSubmit('uploadPic','_self')" value="提交"/></td>
			</tr>
		</table>
	</form>
	<div class="inline pull-right page">
		10122 条记录 1/507 页 <a href='#'> 下一页 </a> <span class='current'>
			1 </span> <a href='#'> 2 </a> <a
			href='/chinapost/index.php?m=Label&a=index&p=3'> 3 </a> <a href='#'>
			4 </a> <a href='#'> 5 </a> <a href='#'> 下5页 </a> <a href='#'> 最后一页 </a>
	</div>

</body>
</html>