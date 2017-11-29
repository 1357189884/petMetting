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
.table th {
	width:auto;
	text-align:center;
}
.table td {
	width:auto;
	text-align:center;
}
</style>
</head>

<body>
	<form class="form-inline definewidth m20" action="index.html"
		method="get">
		宠物编号： <input type="text" name="petId" id="rolename"
			class="abc input-default"> &nbsp;&nbsp;
		<button type="submit" class="btn btn-primary"
			onClick="formSubmit('select','_self');this.blur();">查询</button>
		&nbsp;&nbsp;


		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
					<th>序号</th>
					<th>宠物名</th>
					<th>价格</th>
					<th>生日</th>
					<th>种类</th>
					<th>喜好</th>
					<th>健康</th>
					<th>图片</th>
					<th>备注信息</th>
				</tr>
			</thead>
			<tr>

				<c:forEach items="${pets}" var="p" varStatus="status">
					<tr>

						<td>${status.index+1}</td>
						<td>${p.petName}</a></td>
						<td>${p.price}</td>
						<td><fmt:formatDate value="${p.birthday}"
								pattern="yyyy-MM-dd" /></td>
						<td>${p.kind}</td>
						<td>${p.fancy}</td>
						<td><c:if test="${p.health==1}">
								<font color="green">健康</font>
							</c:if> <c:if test="${p.health==0}">
								<font color="red">非健康</font>
							</c:if></td>
						<td>
							<img alt="图片" src="${ctx }/getImage.action?imgurl=${p.imgurl}" border="0" width="150px" height="150px;">
						</td>
						<td><textarea name="remark" style="resize: none;"
								readonly="readonly">${p.remark }</textarea></td>

					</tr>

				</c:forEach>

			</tr>


		</table>
		<div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="petList?pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="petList?pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="petList?pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="petList?pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="petList?pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="petList?pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="petList?pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="petList?pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
	</form>

	
</body>

</html>

