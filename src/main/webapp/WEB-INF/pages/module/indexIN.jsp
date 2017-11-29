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
        <form class="form-inline definewidth m20" action="index.html" method="get">
            订单编号：
            <input type="text" name="rolename" id="rolename" class="abc input-default">
            &nbsp;&nbsp;
            <button type="submit" class="btn btn-primary" onClick="formSubmit('insertM','_self');this.blur();">
               添加
            </button>
            &nbsp;&nbsp;
            
        </form>
        <table class="table table-bordered table-hover definewidth m10">
            <thead>
                <tr>
					<th>
                       	<input type="checkbox" name="selid" onClick="checkAll('deptId',this)">
                    </th>
					<th>
                       	序号
                    </th>
                    <th>
                      	 模块名称	
                    </th>
                    <th>
                     	  类型	
                    </th>
                    <th>
                   	    上级模块名称 
                    </th>
                    <th>
                   	  排序 
                    </th>
					<th>
                    	说明
                    </th>
                    <th>
                    	状态
                    </th>
                </tr>
            </thead>
            <tr>
           	  <c:forEach items="${modules}" var="m" varStatus="status">
				<td><input type="checkbox" name="moduleId" value="${m.moduleId}"/></td>
                <td>
                   ${status.index+1}
                </td>
                <td>
                   <a href="toview?moduleId=${m.moduleId}">${m.name}</a>
                </td>
                <td>
                    <c:if test="${m.ctype==1 }">主菜单</c:if><c:if test="${m.ctype==2 }">侧边栏菜单</c:if><c:if test="${m.ctype==3 }">按钮</c:if>
                </td>
				<td>
                    ${m.parentModel.name}
                </td>
                <td>${m.orderno}</td>
                <td>${m.remark}</td>
             <td>
			<c:if test="${m.state==1}"><font color="green">启用</font></a></c:if>
			<c:if test="${m.state==0}"><font color="red">停用</font></a></c:if>
		</td>
            </tr>
            </c:forEach>
        </table>
        <div class="inline pull-right page">
            10122 条记录 1/507 页
            <a href='#'>
                下一页
            </a>
            <span class='current'>
                1
            </span>
            <a href='#'>
                2
            </a>
            <a href='/chinapost/index.php?m=Label&a=index&p=3'>
                3
            </a>
            <a href='#'>
                4
            </a>
            <a href='#'>
                5
            </a>
            <a href='#'>
                下5页
            </a>
            <a href='#'>
                最后一页
            </a>
        </div>
    </body>

</html>
