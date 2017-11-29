<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
	.table td {
		width:auto;
		text-align:center;
	}
	.table th {
		width:auto;
		text-align:center;
	}
	.table .td_2 {
		width:600px;
	}
	</style>
</head>

<body>
        <form class="form-inline definewidth m20" action="index.html" method="get">
        		    图片描述：
            <input type="text" name="rolename" id="rolename" class="abc input-default">
            &nbsp;&nbsp;
            <button type="submit" class="btn btn-primary" onClick="formSubmit('selectone','_self');this.blur();">
               	 查询
            </button>
             &nbsp;&nbsp;
            <button type="button" class="btn btn-success" onClick="formSubmit('delete','_self');this.blur();">
                	删除
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
                       名称
                    </th>
                    <th>
                      创建时间
                    </th>
                    <th>
                       	图片
                    </th>
                    <th>
                        描述
                    </th>
                    <th>
                       查看次数
                    </th>
					<th>
                        操作
                    </th>
                </tr>
            </thead>
          <c:forEach items="${petShowList }" var="petshow" varStatus="status">
          	  <tr>
				<td><input type="checkbox" name="userId" value="${petshow.userId}"/></td>
                <td>${petshow.name }</td>
                <td class="td_1"><fmt:formatDate value="${petshow.createTime }" pattern="yyyy-MM-dd"/></td>
                <td>
                    <img alt="图片" src="${ctx }/getImage.action?imgurl=${petshow.imgurl}" border="0" width="200px" height="200px;">
                </td>
				<td class="td_2">${petshow.description }</td>
				
                <td>
                    ${petshow.times }
                </td>
                <td>
                    <a href="${ctx }/pic/edit?id=${petshow.id}">编辑</a>
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