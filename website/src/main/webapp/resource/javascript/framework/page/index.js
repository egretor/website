dojo.ready(function() {
	var page = new framework.Page();
	page.initialize(pageConfiguration.datagrid);

	// 消息
	var notification = function(message) {
		var dojoMessageDialog = framework.utility.dojo('messageDialog');

		$('#messageDialogContent').html(message);

		dojoMessageDialog.show();
	};
	$('#messageDialogClose').click(function() {
		var dojoMessageDialog = framework.utility.dojo('messageDialog');

		dojoMessageDialog.hide();

		return false;
	});

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

	// 新增
	$('#operationInsert').click(function() {
		pageConfiguration.prepareInsert();
		var dojoInsertDialog = framework.utility.dojo('insertDialog');
		dojoInsertDialog.show();
	});
	$('#insertDialoOk').click(function() {
		var dojoForm = framework.utility.dojo('insertForm');
		if (dojoForm.isValid()) {
			var dojoInsertDialog = framework.utility.dojo('insertDialog');
			dojoInsertDialog.hide();

			var jQueryForm = framework.utility.$('insertForm');
			var currentPage = page;
			$.ajax({
				url : jQueryForm.attr('action'),
				type : 'POST',
				dataType : 'json',
				data : jQueryForm.serialize()
			}).done(function(data) {
				if (data) {
					notification(data.message);
				}
				currentPage.queryDatas();
			});
		}

		return false;
	});

	// 修改
	$('#operationUpdate').click(function() {
		var dojoDataGrid = framework.utility.dojo('dataGrid');
		var items = dojoDataGrid.selection.getSelected();
		if ((items) && (items.length > 0)) {
			var item = items[0];
			$('#update_uuid').val(framework.parse.datagrid(item['uuid']));
			pageConfiguration.prepareUpdate(item);
			var dojoUpdateDialog = framework.utility.dojo('updateDialog');
			dojoUpdateDialog.show();
		} else {
			notification('请先选择数据项！');
		}
	});
	$('#updateDialoOk').click(function() {
		var dojoForm = framework.utility.dojo('updateForm');
		if (dojoForm.isValid()) {
			var dojoUpdateDialog = framework.utility.dojo('updateDialog');
			dojoUpdateDialog.hide();

			var jQueryForm = framework.utility.$('updateForm');
			var currentPage = page;
			$.ajax({
				url : jQueryForm.attr('action'),
				type : 'POST',
				dataType : 'json',
				data : jQueryForm.serialize()
			}).done(function(data) {
				if (data) {
					notification(data.message);
				}
				currentPage.queryDatas();
			});
		}

		return false;
	});

	// 删除
	$('#operationDelete').click(function() {
		var dojoDataGrid = framework.utility.dojo('dataGrid');
		var items = dojoDataGrid.selection.getSelected();
		if ((items) && (items.length > 0)) {
			var item = items[0];
			$('#delete_uuid').val(framework.parse.datagrid(item['uuid']));
			pageConfiguration.prepareDelete(item);
			var dojoDeleteDialog = framework.utility.dojo('deleteDialog');
			dojoDeleteDialog.show();
		} else {
			notification('请先选择数据项！');
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
				notification(data.message);
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
});