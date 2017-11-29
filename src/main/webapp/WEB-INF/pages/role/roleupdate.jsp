<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>
	
	<script type="text/javascript">
		function formSubmit (url,sTarget){
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

        @media (max-width: 980px) {
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
	&emsp;&emsp;
	<%-- 	<span style="color: red"><c:if test="${!empty role}">${role}</c:if></span> --%>

		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td><input name="roleId" value="${role.roleId} " type="hidden"></td>
			</tr>
			<tr>
				<td class="tableleft">角色名</td>
				<td><input type="text" name="name" value="${role.name}" /></td>
			</tr>
			<tr>
				<td class="tableleft">角色描述</td>
				<td><input type="text" name="remarks" value="${role.remarks }" /></td>
			</tr>

    <tr>
        <td class="tableleft">状态</td>
        <td>
            <input type="radio" name="status" value="1" checked/> 启用
            <input type="radio" name="status" value="0"/> 禁用
        </td>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" onClick="formSubmit('update','_self');this.blur();">保存</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-success" id="backid" onClick="window.history.back();">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
