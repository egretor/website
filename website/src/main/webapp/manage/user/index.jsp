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
		/*
		var pl = parseInt($('#dataGrid').css('padding-left'));
		var pr = parseInt($('#dataGrid').css('padding-right'));
		var ml = parseInt($('#dataGrid').css('margin-left'));
		var mr = parseInt($('#dataGrid').css('margin-right'));
		var bl = parseInt($('#dataGrid').css('border-left-width'));
		var br = parseInt($('#dataGrid').css('border-right-width'));
		alert(pl + '#' + pr + '#' + ml + '#' + mr + '#' + bl + '#' + br);

		$('#dataGrid').css('min-width', parseInt($('body').css('width')) - (pl + pr + ml + mr + bl + br));
		 */

		var ow = parseInt($('#dataGrid').outerWidth()) - parseInt($('#dataGrid').innerWidth());
		$('#dataGrid').css('min-width', parseInt($('body').css('width')) - ow);

		var queryDatas = function() {
			$.ajax({
				url : '${websiteRoot}/manage/user!executeQueryDataGrid.action',
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

		$('#dataGrid').prepend('<div id="test"></div>');

		toolbar = new dijit.Toolbar({}, "test");
		dojo.forEach([ "Cut", "Copy", "Paste" ], function(label) {
			var button = new dijit.form.Button({
				// note: should always specify a label, for accessibility reasons.
				// Just set showLabel=false if you don't want it to be displayed normally
				label : label,
				showLabel : false,
				iconClass : "dijitEditorIcon dijitEditorIcon" + label
			});
			toolbar.addChild(button);
		});

		$('#dataGrid').append('<div id="test2"></div>');

		toolbar = new dijit.Toolbar({}, "test2");
		dojo.forEach([ "上一页", "下一页", "跳页", "跳页1", "跳页2", "跳页3", "跳页4", "跳页5" ], function(label) {
			var button = new dijit.form.Button({
				// note: should always specify a label, for accessibility reasons.
				// Just set showLabel=false if you don't want it to be displayed normally
				label : label,
				showLabel : true,
				iconClass : "frameworkIconQuery"
			});
			toolbar.addChild(button);
		});

		//$('#dataGrid').prepend($('#first'));
		$('#dataGrid').append($('#last'));
	});
</script>
</head>

<body class="${dojoStyle}">
	<!-- 
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
					</div> -->
	<table id="dataGrid" data-dojo-type="dojox/grid/DataGrid"
		data-dojo-props="autoHeight:true, autoWidth:true">
		<thead>
			<tr>
				<th field="name" width="100px">名称</th>
				<th field="account" width="100px">帐号</th>
				<!-- 
								<th field="password" width="250px">密码</th>
								<th field="prerogative" formatter="framework.format.booleanYesNo" width="100px">特权用户</th>
								<th field="uuid" width="250px">编号</th>
								<th field="insertUserId" width="250px">新增操作用户编号</th>
								<th field="insertTime" width="150px" formatter="framework.format.jsonDateTime">新增操作时间</th>
								<th field="updateUserId" width="250px">修改操作用户编号</th>
								<th field="updateTime" width="150px" formatter="framework.format.jsonTime">修改操作时间</th>
								<th field="remark" width="300px">备注</th>
								 -->
			</tr>
		</thead>
	</table>
	<div id="first">this is add first</div>
	<div id="last">this is add last</div>
</body>
</html>