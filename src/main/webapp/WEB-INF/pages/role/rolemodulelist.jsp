<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    
    <head>
        <title>
        </title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css"
        />
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
    	$(function () {
        
			$('#addnew1111').click(function(){
	
					window.location.href="add.html";
			 });
    	});
	
		/* 全选*/
		function checkAll(who, obj){
			var curCheckBox = document.getElementsByName(who);
			for(i = 0; i < curCheckBox.length; i++){
				curCheckBox.item(i).checked = obj.checked;
			}
		}
		function formSubmit (url,sTarget){
			document.forms[0].target = sTarget
			document.forms[0].action = url;
			document.forms[0].submit();
			return true;
		}
		</script>
   
        <style type="text/css">
            body { padding-bottom: 40px; } .sidebar-nav { padding: 9px 0; } @media
            (max-width: 980px) { /* Enable use of floated navbar text */ .navbar-text.pull-right
            { float: none; padding-left: 5px; padding-right: 5px; } }
        </style>
    </head>
    
    <body>
   <form class="form-inline definewidth m20" action="index.html"
		method="get">
		角色编号： <input type="text" name="petId" id="rolename"
			class="abc input-default"> &nbsp;&nbsp;
		<button type="submit" class="btn btn-primary"
			onClick="formSubmit('toModule','_self');this.blur();">模块</button>
		&nbsp;&nbsp;


		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
				<th><input type="checkbox" name="selid"
						onClick="checkAll('roleId',this)"></th>
					<th>角色id</th>
					<th>角色名</th>
					<th>角色描述</th>
					<th>状态</th>
				</tr>
			</thead>
             <c:forEach items="${roles}" var="r" >
            <tr>
				<td><input type="checkbox" name="roleId" value="${r.roleId}"/></td>
               
                   <td>${r.roleId}</td>
   					<td>${r.name}</td>
   					<td>${r.remarks}</td>
   					<td>
		<c:if test="${r.state==1}"><a href="stop?roleId=${r.roleId}"><font color="green">启用</font></a></c:if>
		<c:if test="${r.state==0}"><a href="start?roleId=${r.roleId}"><font color="red">停用</font></a></c:if>		</td>
   					
   					</c:forEach>
        </table>
      
        </form>
    </body>

</html>
