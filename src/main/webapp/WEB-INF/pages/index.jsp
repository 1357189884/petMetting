<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>
<html>
<head>
<title>后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx }/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="header">
		<div class="dl-title">
			<!--<img src="/chinapost/Public/${ctx }/assets/img/top.png">-->
		</div>
		<div class="dl-log">
			欢迎您， <span class="dl-log-user"> root </span> <a href="logout.action"
				title="退出系统" class="dl-log-quit"> [退出] </a>
		</div>
	</div>
	<div class="content">
		<div class="dl-main-nav">
			<div class="dl-inform">
				<div class="dl-inform-title">
					<s class="dl-inform-icon dl-up"> </s>
				</div>
			</div>
			<ul id="J_Nav" class="nav-list ks-clear">
				<li class="nav-item dl-selected">
                        <div class="nav-item-inner nav-home">
                            	订单管理
                        </div>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">基本信息</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">用户管理</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">宠物管理</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">角色管理</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">模块管理</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">宠物服务</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">我的图片</div>
				</li>
			</ul>
		</div>
		<ul id="J_NavContent" class="dl-tab-conten">
		</ul>
	</div>
	<script type="text/javascript" src="${ctx }/assets/js/jquery-1.8.1.min.js">
		
	</script>
	<script type="text/javascript" src="${ctx }/assets/js/bui-min.js">
		
	</script>
	<script type="text/javascript" src="${ctx }/assets/js/common/main-min.js">
		
	</script>
	<script type="text/javascript" src="${ctx }/assets/js/config-min.js">
		
	</script>
	<script>
		BUI.use('common/main', function() {
			var config = [
			 {
				id : '3',
				homePage : '4',
				menu : [ {
					text : '管理',
					items : [ {
						id : '4',
						text : '订单管理',
						href : 'front_desk/backList.action'
					}, 
					]
				} ]
			},   {
				id : '4',
				homePage : '9',
				menu : [ {
					text : '基本信息',
					items : [ {
						id : '9',
						text : '我的信息',
						href : 'baseinfo/index.html'
					}, {
						id : '10',
						text : '用户信息',
						href : 'baseinfo/index.html'
					} ]
				} ]
			}, {
				id : '5',
				homePage : '9',
				menu : [ {
					text : '用户管理',
					items : [ {
						id : '9',
						text : '查看用户',
						href : 'userlist.action'
					}, {
						id : '10',
						text : '增加用户',
						href : 'user/add.html'
					}, {
						id : '11',
						text : '删除用户',
						href : 'user/index.html'
					}, {
						id : '12',
						text : '编辑用户',
						href : 'user/edit.html'
					} ]
				} ]
			}, {
				id : '6',
				homePage : '9',
				menu : [ {
					text : '宠物管理',
					items : [ {
						id : '9',
						text : '查看宠物',
						href : 'pet/petList.action'
					}, {
						id : '10',
						text : '增加宠物',
						href : 'pet/petAdd.action'
					}, {
						id : '11',
						text : '删除宠物',
						href : 'pet/petDelete.action'
					}, {
						id : '12',
						text : '编辑宠物',
						href : 'pet/petEdit.action'
					}]
				} ]
			}, {
				id : '7',
				homePage : '9',
				menu : [ {
					text : '角色管理',
					items : [ {
						id : '9',
						text : '查看角色',
						href : 'rolelist.action'
					}, {
						id : '10',
						text : '增加角色',
						href : 'rolecreate.action'
					}, {
						id : '11',
						text : '删除角色',
						href : 'deletelist.action'
					}, {
						id : '12',
						text : '编辑角色',
						href : 'updatelist.action'
					}, {
						id : '13',
						text : '模块管理',
						href : 'rolemodulelist.action'
					} ]
				} ]
			}, {
				id : '8',
				homePage : '9',
				menu : [ {
					text : '模块管理',
					items : [ {
						id : '9',
						text : '查看模块',
						href : 'module.action'
					}, {
						id : '10',
						text : '增加模块',
						href : 'insertM.action'
					}, {
						id : '11',
						text : '删除模块',
						href : 'deleteM.action'
					}, {
						id : '12',
						text : '编辑模块',
						href : 'editM.action'
					} ]
				} ]
			}, {
				id : '9',
				homePage : '9',
				menu : [ {
					text : '宠物服务',
					items : [ {
						id : '9',
						text : '服务分类',
						href : 'petinfo/index.html'
					}, {
						id : '10',
						text : '报表分析',
						href : 'petinfo/index.html'
					} ]
				} ]
			}, {
				id : '10',
				homePage : '9',
				menu : [ {
					text : '我的图片',
					items : [ {
						id : '9',
						text : '上传图片',
						href : 'pic/upload.action'
					}, {
						id : '10',
						text : '图片下载',
						href : 'pic/download.action'
					}, {
						id : '11',
						text : '图片管理',
						href : 'pic/manager.action'
					}, ]
				} ]
			} ];
			new PageUtil.MainPage({
				modulesConfig : config
			});
		});
	</script>
</body>

</html>