<%@ page extends="cn.com.ufgov.hainan.framework.action.ModuleJsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<title>${websiteTitle}</title>
<%@ include file="/framework/resource/global.jsp"%>
<script type="text/javascript">
	dojo.ready(function() {
		var queryDatas = function() {
			$.ajax({
				url : '${websiteRoot}/manage/catalog!executeQueryDataGrid.action',
				type : 'POST',
				dataType : 'json'
			}).done(function(data) {
				if (data) {
					if (data.dojoDataGrid) {
						dijit.registry.byId('dataGrid').store = new dojo.data.ItemFileReadStore({
							data : data.dojoDataGrid
						});
						dijit.registry.byId('dataGrid').render();
					}
				}
			});
		};

		queryDatas();

		$('#dataGrid').append('<div>paging...</div>');
	});
</script>
</head>

<body class="${dojoStyle}">
	<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
		<tbody>
			<tr>
				<td>
					<div id="toolbar" data-dojo-type="dijit/Toolbar">
						<div data-dojo-type="dijit/form/Button" id="executeSync"
							data-dojo-props="iconClass:'frameworkIconSync', showLabel:true">同步</div>
						<span data-dojo-type="dijit/ToolbarSeparator"></span>
						<div data-dojo-type="dijit/form/Button" id="executeQuery"
							data-dojo-props="iconClass:'frameworkIconQuery', showLabel:true">查询</div>
						<span data-dojo-type="dijit/ToolbarSeparator"></span>
						<div data-dojo-type="dijit/form/Button" id="executeInsert"
							data-dojo-props="iconClass:'frameworkIconInsert', showLabel:true">新增</div>
						<div data-dojo-type="dijit/form/Button" id="executeUpdate"
							data-dojo-props="iconClass:'frameworkIconUpdate', showLabel:true">修改</div>
						<div data-dojo-type="dijit/form/Button" id="executeDelete"
							data-dojo-props="iconClass:'frameworkIconDelete', showLabel:true">删除</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<table id="dataGrid" data-dojo-type="dojox/grid/DataGrid"
						data-dojo-props="autoHeight:true, autoWidth:true"
						style="margin: 0px; padding: 0px">
						<thead>
							<tr>
								<th field="uuid" width="100px">编号</th>
								<th field="insertUserId" width="300px">新增操作用户编号</th>
								<th field="insertTime" width="150px">新增操作时间</th>
								<th field="updateUserId" width="200px">修改操作用户编号</th>
								<th field="updateTime">修改操作时间</th>
								<th field="remark">备注</th>
								<th field="name">名称</th>
								<th field="serial">序号</th>
							</tr>
						</thead>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>