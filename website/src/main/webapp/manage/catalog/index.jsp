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
		window.pageConfiguration = {
			datagrid : {
				operationSyncDisable : true
			},
			prepareInsert : function() {

			},
			prepareUpdate : function(item) {
				framework.utility.dojo('update_manageCatalog_name').attr('value', framework.parse.datagrid(item['name']));
				framework.utility.dojo('update_manageCatalog_serial').attr('value', framework.parse.datagrid(item['serial']));
				framework.utility.dojo('update_manageCatalog_remark').attr('value', framework.parse.datagrid(item['remark']));
			},
			prepareDelete : function(item) {
				var warnFormat = '是否删除名称为<font style="color:#ff0000">“[1]”</font>的分类?';
				var warnMessage = framework.format.concat(warnFormat, framework.parse.datagrid(item['name']));
				$('#deleteDialogMessage').html(warnMessage);
			}
		};
	});
</script>
<%@ include file="/framework/resource/page/index.jsp"%>
</head>

<body class="${dojoStyle}">
	<%-- 提示消息 --%>
	<div id="messageDialog" data-dojo-type="dijit/Dialog" title="提示"
		class="frameworkForm">
		<div id="messageDialogContent" class="dijitDialogPaneContentArea"></div>
		<div class="dijitDialogPaneActionBar">
			<button id="messageDialogClose" data-dojo-type="dijit/form/Button"
				type="button">关闭</button>
		</div>
	</div>

	<%-- 查询表单 --%>
	<div id="queryDialog" data-dojo-type="dijit/Dialog" title="查询"
		class="frameworkForm">
		<div data-dojo-type="dijit/form/Form" id="dataGridForm"
			action="${websiteRoot}/manage/catalog!executeQueryDataGrid.action">
			<div class="dijitDialogPaneContentArea">
				<div data-dojo-type="dojox.layout.TableContainer"
					data-dojo-props="cols:1, spacing:5">
					<div id="query_manageCatalog_name" name="manageCatalog.name"
						data-dojo-type="dijit.form.TextBox" title="名称："></div>
				</div>
			</div>
			<div class="dijitDialogPaneActionBar">
				<button id="queryDialogOk" data-dojo-type="dijit/form/Button"
					type="button">查询</button>
			</div>
		</div>
	</div>

	<%-- 新增表单 --%>
	<div id="insertDialog" data-dojo-type="dijit/Dialog" title="新增"
		class="frameworkForm">
		<div data-dojo-type="dijit/form/Form" id="insertForm"
			action="${websiteRoot}/manage/catalog!executeInsert.action">
			<div class="dijitDialogPaneContentArea">
				<div data-dojo-type="dojox.layout.TableContainer"
					data-dojo-props="cols:1, spacing:5">
					<div id="insert_manageCatalog_name" name="manageCatalog.name"
						data-dojo-type="dijit.form.ValidationTextBox" required="true"
						title="名称(*)："></div>
					<div id="insert_manageCatalog_serial" name="manageCatalog.serial"
						data-dojo-type="dijit/form/NumberSpinner"
						data-dojo-props="constraints:{min:1, places:0}, value:1"
						required="true" title="序号："></div>
					<textarea id="insert_manageCatalog_remark"
						name="manageCatalog.remark"
						data-dojo-type="dijit/form/SimpleTextarea"
						data-dojo-props="rows:'5'" rows="5" title="备注："></textarea>
				</div>
			</div>
			<div class="dijitDialogPaneActionBar">
				<button id="insertDialoOk" data-dojo-type="dijit/form/Button"
					type="button">保存</button>
			</div>
		</div>
	</div>

	<%-- 修改表单 --%>
	<div id="updateDialog" data-dojo-type="dijit/Dialog" title="修改"
		class="frameworkForm">
		<div data-dojo-type="dijit/form/Form" id="updateForm"
			action="${websiteRoot}/manage/catalog!executeUpdate.action">
			<div class="dijitDialogPaneContentArea">
				<div data-dojo-type="dojox.layout.TableContainer"
					data-dojo-props="cols:1, spacing:5">
					<div id="update_manageCatalog_name" name="manageCatalog.name"
						data-dojo-type="dijit.form.ValidationTextBox" required="true"
						title="名称(*)："></div>
					<div id="update_manageCatalog_serial" name="manageCatalog.serial"
						data-dojo-type="dijit/form/NumberSpinner"
						data-dojo-props="constraints:{min:1, places:0}, value:1"
						required="true" title="序号："></div>
					<textarea id="update_manageCatalog_remark"
						name="manageCatalog.remark"
						data-dojo-type="dijit/form/SimpleTextarea"
						data-dojo-props="rows:'5'" rows="5" title="备注："></textarea>
				</div>
			</div>
			<div class="dijitDialogPaneActionBar">
				<input id="update_uuid" name="manageCatalog.uuid" type="hidden" />
				<button id="updateDialoOk" data-dojo-type="dijit/form/Button"
					type="button">保存</button>
			</div>
		</div>
	</div>

	<%-- 删除表单 --%>
	<div id="deleteDialog" data-dojo-type="dijit/Dialog" title="删除"
		class="frameworkForm">
		<div data-dojo-type="dijit/form/Form" id="deleteForm"
			action="${websiteRoot}/manage/catalog!executeDelete.action">
			<div id="deleteDialogMessage" class="dijitDialogPaneContentArea">
			</div>
			<div class="dijitDialogPaneActionBar">
				<input id="delete_uuid" name="manageCatalog.uuid" type="hidden" />
				<button id="deleteDialoYes" data-dojo-type="dijit/form/Button"
					type="button">是</button>
				<button id="deleteDialoNo" data-dojo-type="dijit/form/Button"
					type="button">否</button>
			</div>
		</div>
	</div>

	<table border="0" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td>
					<%-- 前置内容 --%>
				</td>
			</tr>
			<tr>
				<td>
					<%-- 操作栏 --%>
					<div id="operationToolbar"></div>
				</td>
			</tr>
			<tr>
				<td>
					<%-- 表格内容 --%>
					<table id="dataGrid" data-dojo-type="dojox/grid/DataGrid"
						data-dojo-props="selectionMode:'single', autoHeight:true, autoWidth:true"
						style="min-height: 320px">
						<thead>
							<tr>
								<%-- 表格标题 --%>
								<th field="name" width="100px">名称</th>
								<th field="serial" width="100px">序号</th>
								<th field="uuid" width="250px">编号</th>
								<th field="insertUserId" width="250px">新增操作用户编号</th>
								<th field="insertTime" width="150px"
									formatter="framework.format.jsonDateTime">新增操作时间</th>
								<th field="updateUserId" width="250px">修改操作用户编号</th>
								<th field="updateTime" width="150px"
									formatter="framework.format.jsonTime">修改操作时间</th>
								<th field="remark" width="300px">备注</th>
							</tr>
						</thead>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<%-- 页索引 --%>
					<div id="indexToolbar"></div>
				</td>
			</tr>
			<tr>
				<td>
					<%-- 分页器 --%>
					<div id="pagingToolbar"></div>
				</td>
			</tr>
			<tr>
				<td>
					<%-- 后置内容 --%>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>