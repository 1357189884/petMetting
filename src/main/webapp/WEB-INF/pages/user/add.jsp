<%@ page language="java" pageEncoding="UTF-8"%>

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
</style>
</head>
<form action="index.html" method="post">
	<table class="table table-bordered table-hover definewidth m10">
	<tr>
        <td class="tableleft">用户id</td>
        <td><input type="hidden" name="userId"/></td>
    </tr> 
		<tr>
			<td class="tableleft">用户名</td>
			<td><input type="text" name="username" /><font color="red">${info}</font></td>
			
		</tr>
		<tr>
			<td class="tableleft">密码</td>
			<td><input type="text" name="password" /><font color="red">${msg}</font></td>
			
		</tr>
		<tr>
			<td class="tableleft">姓名</td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td class="tableleft">身份证</td>
			<td><input type="text" name="cardNo" /></td>
		</tr>
		<tr>
			<td class="tableleft">创建时间</td>
			<td><input type="date" name="createTime" /></td>
		</tr>
		<tr>
			<td class="tableleft">邮箱</td>
			<td><input type="text" name="email" /></td>
		</tr>


		<tr>
			<td class="tableleft">电话</td>
			<td><input type="text" name="tel" /></td>
		</tr>
		<tr>
			<td class="tableleft">地址</td>
			<td><input type="text" name="address" /></td>
		</tr>
		<tr>
			<td class="tableleft">账户余额</td>
			<td><input type="text" name="money" /></td>
		</tr>
		<tr>
			<td>员工状态：</td>
			<td><input type="text" name="state" /></td>
		</tr>
		<tr>
			<td class="tableleft"></td>
			<td>
				<button type="submit" class="btn btn-primary"
					onClick="formSubmit('save','_self');this.blur();">保存</button>&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary"
					onClick="formSubmit('return','_self');this.blur();">返回</button>&nbsp;&nbsp;
                    
			</td>
		</tr>
	</table>
</form>
</body>
</html>

