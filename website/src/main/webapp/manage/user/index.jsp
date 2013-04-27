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
		var page = new framework.Page();
		page.initialize({
			operationSyncDisable : true
		});
		window.refreshPage = function(){
			$('#query_manageUser_account').val('root');
			page.queryDatas();
		};

		// 查询
		$('#operationQuery').click(function() {
			var dojoQueryDialog = framework.utility.dojo('queryDialog');
			dojoQueryDialog.show();
		});
		$('#queryDialogOk').click(function() {
			var dojoQueryDialog = framework.utility.dojo('queryDialog');
			dojoQueryDialog.hide();

			page.queryDatas();

			return false;
		});
		$('#queryDialogOk').trigger('click');

		// 保存
		$('#operationInsert').click(function() {
			/*
			$('#editDialogReset').trigger('click');
			$('#edit_manageUser_uuid').removeAttr('value');

			var dojoEditDialog = framework.utility.dojo('editDialog');
			dojoEditDialog.show();
			 */
			// openTab : function(id, name, url, closable)
			// framework.top.framework.layout.openTab('test', 'test', 'http://www.ifeng.com', true);
			framework.top.framework.layout.refreshDialog('新增用户', framework.format.concat('[1]/manage/user!executeInput.action', framework.websiteRoot));
		});
		$('#operationUpdate').click(function() {
			var dojoDataGrid = framework.utility.dojo('dataGrid');
			var items = dojoDataGrid.selection.getSelected();
			if ((items) && (items.length > 0)) {
				$('#editDialogReset').trigger('click');
				$('#edit_manageUser_uuid').val(items[0]['uuid']);

				framework.utility.dojo('edit_manageUser_name').setValue(items[0]['name']);
				framework.utility.dojo('edit_manageUser_account').setValue(items[0]['account']);
				framework.utility.dojo('edit_manageUser_password').setValue(items[0]['password']);
				framework.utility.dojo('edit_repeat_password').setValue(items[0]['password']);

				if ((items[0]['prerogative']) && (items[0]['prerogative'][0])) {
					framework.utility.dojo('edit_manageUser_prerogative').set('value', 'true');
					framework.utility.dojo('edit_manageUser_prerogative').set('checked', true);
				} else {
					framework.utility.dojo('edit_manageUser_prerogative').set('value', 'false');
					framework.utility.dojo('edit_manageUser_prerogative').set('checked', false);
				}
				//alert(items[0]['remark']);
				// framework.utility.dojo('edit_manageUser_remark').attr('value', items[0]['remark']);
				if (items[0]['remark']) {
					framework.utility.dojo('edit_manageUser_remark').set('value', items[0]['remark'][0]);
				}

				var dojoEditDialog = framework.utility.dojo('editDialog');
				dojoEditDialog.show();
			} else {
				var dojoMessageDialog = framework.utility.dojo('messageDialog');

				$('#messageDialogMessage').html('请先选择数据项！');

				dojoMessageDialog.show();
			}
		});
		$('#edit_manageUser_prerogative').change(function() {
			var value = framework.utility.dojo('edit_manageUser_prerogative').get('checked');
			framework.utility.$('edit_manageUser_prerogative').val(!value);
		});
		$('#editDialogSave').click(function() {
			var dojoEditDialog = framework.utility.dojo('editDialog');
			dojoEditDialog.hide();

			var jQueryForm = framework.utility.$('editForm');
			var currentPage = page;
			$.ajax({
				url : jQueryForm.attr('action'),
				type : 'POST',
				dataType : 'json',
				data : jQueryForm.serialize()
			}).done(function(data) {
				if (data) {
					var dojoMessageDialog = framework.utility.dojo('messageDialog');

					$('#messageDialogMessage').html(data.message);

					dojoMessageDialog.show();
				}
				currentPage.queryDatas();
			});

			return false;
		});

		// 删除
		$('#operationDelete').click(function() {
			var dojoDataGrid = framework.utility.dojo('dataGrid');
			var items = dojoDataGrid.selection.getSelected();
			if ((items) && (items.length > 0)) {
				$('#delete_manageUser_uuid').val(items[0]['uuid']);
				$('#deleteDialogMessage').html(framework.format.concat('是否删除帐号为<font style="color:#ff0000">“[1]”</font>的用户?', items[0]['account']));
				var dojoDeleteDialog = framework.utility.dojo('deleteDialog');
				dojoDeleteDialog.show();
			} else {
				var dojoMessageDialog = framework.utility.dojo('messageDialog');

				$('#messageDialogMessage').html('请先选择数据项！');

				dojoMessageDialog.show();
			}
		});
		$('#deleteDialoYes').click(function() {
			var dojoDeleteDialog = framework.utility.dojo('deleteDialog');
			dojoDeleteDialog.hide();

			var jQueryForm = framework.utility.$('deleteForm');
			var currentPage = page;
			$.ajax({
				url : jQueryForm.attr('action'),
				type : 'POST',
				dataType : 'json',
				data : jQueryForm.serialize()
			}).done(function(data) {
				if (data) {
					var dojoMessageDialog = framework.utility.dojo('messageDialog');

					$('#messageDialogMessage').html(data.message);

					dojoMessageDialog.show();
				}
				currentPage.queryDatas();
			});

			return false;
		});
		$('#deleteDialoNo').click(function() {
			var dojoDeleteDialog = framework.utility.dojo('deleteDialog');
			dojoDeleteDialog.hide();

			return false;
		});

		// 提示
		$('#messageDialogClose').click(function() {
			var dojoMessageDialog = framework.utility.dojo('messageDialog');
			dojoMessageDialog.hide();

			return false;
		});

		// 校验
		dijit.byId('edit_repeat_password').validator = function() {
			return this.getValue() == dijit.byId('edit_manageUser_password').getValue();
		};
	});
</script>
</head>

<body class="${dojoStyle}">
	<%-- 查询表单 --%>
	<div id="queryDialog" data-dojo-type="dijit/Dialog" title="查询"
		class="frameworkForm">
		<div data-dojo-type="dijit/form/Form" id="dataGridForm"
			action="${websiteRoot}/manage/user!executeQueryDataGrid.action">
			<div class="dijitDialogPaneContentArea">
				<div data-dojo-type="dojox.layout.TableContainer"
					data-dojo-props="cols:1, spacing:5">
					<div id="query_manageUser_name" name="manageUser.name"
						data-dojo-type="dijit.form.TextBox" title="名称："></div>
					<div id="query_manageUser_account" name="manageUser.account"
						data-dojo-type="dijit.form.TextBox" title="帐户："></div>
					<select id="query_manageUser_prerogative"
						name="manageUser.prerogative" data-dojo-type="dijit/form/Select"
						title="特权用户：">
						<option value="" selected="selected">&nbsp;</option>
						<option value="true">是</option>
						<option value="false">否</option>
					</select>
				</div>
			</div>
			<div class="dijitDialogPaneActionBar">
				<button id="queryDialogOk" data-dojo-type="dijit/form/Button"
					type="button">查询</button>
				<button id="queryDialogReset" data-dojo-type="dijit/form/Button"
					type="reset">重置</button>
			</div>
		</div>
	</div>

	<%-- 编辑表单 --%>
	<div id="editDialog" data-dojo-type="dijit/Dialog" title="编辑"
		class="frameworkForm">
		<div data-dojo-type="dijit/form/Form" id="editForm"
			action="${websiteRoot}/manage/user!executeSave.action">
			<div class="dijitDialogPaneContentArea">
				<div data-dojo-type="dojox.layout.TableContainer"
					data-dojo-props="cols:1, spacing:5">
					<div id="edit_manageUser_name" name="manageUser.name"
						data-dojo-type="dijit.form.ValidationTextBox" required="true"
						missingMessage="请输入名称！" title="名称(*)："></div>
					<div id="edit_manageUser_account" name="manageUser.account"
						data-dojo-type="dijit.form.ValidationTextBox" required="true"
						missingMessage="请输入帐户！" title="帐户(*)(-)："></div>
					<div id="edit_manageUser_password" name="manageUser.password"
						data-dojo-type="dijit.form.ValidationTextBox" required="true"
						missingMessage="请输入密码！" type="password" title="密码(*)："></div>
					<div id="edit_repeat_password" name="repeatPassword"
						data-dojo-type="dijit.form.ValidationTextBox" type="password"
						invalidMessage="两次输入的密码不一致！" title="重复密码："></div>
					<div id="edit_manageUser_prerogative" name="manageUser.prerogative"
						data-dojo-type="dijit/form/CheckBox" title="特权用户：" value="false"></div>
					<textarea id="edit_manageUser_remark" name="manageUser.remark"
						data-dojo-type="dijit/form/SimpleTextarea"
						data-dojo-props="rows:'5'" rows="5" title="备注："></textarea>
				</div>
			</div>
			<div class="dijitDialogPaneActionBar">
				<input id="edit_manageUser_uuid" name="manageUser.uuid"
					type="hidden" />
				<button id="editDialogSave" data-dojo-type="dijit/form/Button"
					type="button">保存</button>
				<button id="editDialogReset" data-dojo-type="dijit/form/Button"
					type="reset">重置</button>
			</div>
		</div>
	</div>

	<%-- 删除表单 --%>
	<div id="deleteDialog" data-dojo-type="dijit/Dialog" title="删除"
		class="frameworkForm">
		<div data-dojo-type="dijit/form/Form" id="deleteForm"
			action="${websiteRoot}/manage/user!executeDelete.action">
			<div id="deleteDialogMessage" class="dijitDialogPaneContentArea">
			</div>
			<div class="dijitDialogPaneActionBar">
				<input id="delete_manageUser_uuid" name="manageUser.uuid"
					type="hidden" />
				<button id="deleteDialoYes" data-dojo-type="dijit/form/Button"
					type="button">是</button>
				<button id="deleteDialoNo" data-dojo-type="dijit/form/Button"
					type="button">否</button>
			</div>
		</div>
	</div>

	<%-- 提示消息 --%>
	<div id="messageDialog" data-dojo-type="dijit/Dialog" title="提示"
		class="frameworkForm">
		<div id="messageDialogMessage" class="dijitDialogPaneContentArea"></div>
		<div class="dijitDialogPaneActionBar">
			<button id="messageDialogClose" data-dojo-type="dijit/form/Button"
				type="button">关闭</button>
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
								<th field="account" width="100px">帐号</th>
								<th field="password" width="250px">密码</th>
								<th field="prerogative"
									formatter="framework.format.booleanYesNo" width="100px">特权用户</th>
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