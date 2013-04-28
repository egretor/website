(function(window) {
	window.framework.Page = function() {
	};
	window.framework.Page.prototype = {
		formId : 'dataGridForm',
		dataGridId : 'dataGrid',
		operationToolbarId : 'operationToolbar',
		operationSyncId : 'operationSync',
		operationQueryId : 'operationQuery',
		operationInsertId : 'operationInsert',
		operationUpdateId : 'operationUpdate',
		operationDeleteId : 'operationDelete',
		indexToolbarId : 'indexToolbar',
		indexRadius : 5,
		pagingToolbarId : 'pagingToolbar',
		currentPageInputName : 'paging.currentPage',
		pageCountInputName : 'paging.pageCount',
		initialize : function(configuration) {
			if (configuration) {
				if (configuration.formId) {
					this.formId = configuration.formId;
				}
				if (configuration.dataGridId) {
					this.dataGridId = configuration.dataGridId;
				}
				if (configuration.operationToolbarId) {
					this.operationToolbarId = configuration.operationToolbarId;
				}
				if (configuration.operationSyncId) {
					this.operationSyncId = configuration.operationSyncId;
				}
				if (configuration.operationQueryId) {
					this.operationQueryId = configuration.operationQueryId;
				}
				if (configuration.operationInsertId) {
					this.operationInsertId = configuration.operationInsertId;
				}
				if (configuration.operationUpdateId) {
					this.operationUpdateId = configuration.operationUpdateId;
				}
				if (configuration.operationDeleteId) {
					this.operationDeleteId = configuration.operationDeleteId;
				}
				if (configuration.indexToolbarId) {
					this.indexToolbarId = configuration.indexToolbarId;
				}
				if (configuration.indexRadius) {
					this.indexRadius = configuration.indexRadius;
				}
				if (configuration.pagingToolbarId) {
					this.pagingToolbarId = configuration.pagingToolbarId;
				}
				if (configuration.currentPageInputName) {
					this.currentPageInputName = configuration.currentPageInputName;
				}
				if (configuration.pageCountInputName) {
					this.pageCountInputName = configuration.pageCountInputName;
				}

				if (configuration.operationToolbarDisable) {
					this.operationToolbarId = null;
				}
				if (configuration.operationSyncDisable) {
					this.operationSyncId = null;
				}
				if (configuration.operationQueryDisable) {
					this.operationQueryId = null;
				}
				if (configuration.operationInsertDisable) {
					this.operationInsertId = null;
				}
				if (configuration.operationUpdateDisable) {
					this.operationUpdateId = null;
				}
				if (configuration.operationDeleteDisable) {
					this.operationDeleteId = null;
				}
				if (configuration.indexToolbarDisable) {
					this.indexToolbarId = null;
				}
				if (configuration.pagingToolbarDisable) {
					this.pagingToolbarId = null;
				}
			}
			if (this.formId) {
				this._initializeForm();
			}
			if (this.dataGridId) {
				this._initializeDataGrid();
			}
			if (this.operationToolbarId) {
				this._initializeOperationToolbar();
			}
			if (this.indexToolbarId) {
				this._initializeIndexToolbar();
			}
			if (this.pagingToolbarId) {
				this._initializePagingToolbar();
			}
		},
		_initializeForm : function() {
			var jQueryForm = framework.utility.$(this.formId);

			var currentPageInputHtmlFormat = '<input type="hidden" name="[1]" value="1" />';
			var currentPageInputHtml = framework.format.concat(currentPageInputHtmlFormat, this.currentPageInputName);
			jQueryForm.append(currentPageInputHtml);

			var pageCountInputHtmlFormat = '<input type="hidden" name="[1]" value="1" />';
			var pageCountInputHtml = framework.format.concat(pageCountInputHtmlFormat, this.pageCountInputName);
			jQueryForm.append(pageCountInputHtml);
		},
		_initializeDataGrid : function() {
			var jQueryDatagrid = framework.utility.$(this.dataGridId);

			var outerWidth = parseInt(jQueryDatagrid.outerWidth());
			var innerWidth = parseInt(jQueryDatagrid.innerWidth());
			var bodyWidth = parseInt($('body').css('width'));
			var dataGridWidth = bodyWidth - (outerWidth - innerWidth);

			jQueryDatagrid.css('min-width', dataGridWidth);
		},
		_initializeOperationToolbar : function() {
			var dojoOperationToolbar = new dijit.Toolbar({}, this.operationToolbarId);

			if (this.operationSyncId) {
				var dojoSyncButton = new dijit.form.Button({
					id : this.operationSyncId,
					label : framework.local.PAGE_SYNC,
					showLabel : true,
					iconClass : 'frameworkIconSync'
				});
				dojoOperationToolbar.addChild(dojoSyncButton);

				dojoOperationToolbar.addChild(new dijit.ToolbarSeparator({}));
			}

			if (this.operationQueryId) {
				var dojoQueryButton = new dijit.form.Button({
					id : this.operationQueryId,
					label : framework.local.PAGE_QUERY,
					showLabel : true,
					iconClass : 'frameworkIconQuery'
				});
				dojoOperationToolbar.addChild(dojoQueryButton);

				dojoOperationToolbar.addChild(new dijit.ToolbarSeparator({}));
			}

			if (this.operationInsertId) {
				var dojoInsertButton = new dijit.form.Button({
					id : this.operationInsertId,
					label : framework.local.PAGE_INSERT,
					showLabel : true,
					iconClass : 'frameworkIconInsert'
				});
				dojoOperationToolbar.addChild(dojoInsertButton);
			}

			if (this.operationUpdateId) {
				var dojoUpdateButton = new dijit.form.Button({
					id : this.operationUpdateId,
					label : framework.local.PAGE_UPDATE,
					showLabel : true,
					iconClass : 'frameworkIconUpdate'
				});
				dojoOperationToolbar.addChild(dojoUpdateButton);
			}

			if (this.operationDeleteId) {
				var dojoDeleteButton = new dijit.form.Button({
					id : this.operationDeleteId,
					label : framework.local.PAGE_DELETE,
					showLabel : true,
					iconClass : 'frameworkIconDelete'
				});
				dojoOperationToolbar.addChild(dojoDeleteButton);
			}
		},
		_initializeIndexToolbar : function() {
			var page = this;
			var dojoIndexToolbar = new dijit.Toolbar({}, this.indexToolbarId);

			var pageIndexCount = (this.indexRadius * 2) + 1;
			var i = 0;
			for (i = 0; i < pageIndexCount; i++) {
				var indexButtonId = framework.format.concat('[1]Index[2]', this.indexToolbarId, i);
				dojoIndexToolbar.addChild(new dijit.form.Button({
					id : indexButtonId,
					title : '',
					showLabel : false
				}));

				framework.utility.$(indexButtonId).click(function() {
					var jQueryCurrentPage = $(framework.format.concat('input[name="[1]"]', page.currentPageInputName));

					var currentPage = jQueryCurrentPage.val();
					var dojoIndexButton = framework.utility.dojo($(this).attr('id'));
					var jumpPage = dojoIndexButton.attr('value');

					if (jumpPage != currentPage) {
						jQueryCurrentPage.val(jumpPage);

						page.queryDatas();
					}
				});
			}
		},
		_initializePagingToolbar : function() {
			var page = this;
			var dojoPagingToolbar = new dijit.Toolbar({}, this.pagingToolbarId);

			var firstButtonId = framework.format.concat('[1]First', this.pagingToolbarId);
			var dojoFirstButton = new dijit.form.Button({
				id : firstButtonId,
				label : framework.local.PAGE_FIRST,
				showLabel : true,
				iconClass : 'frameworkIconFirst'
			});
			dojoPagingToolbar.addChild(dojoFirstButton);

			var previousButtonId = framework.format.concat('[1]Previous', this.pagingToolbarId);
			var dojoPreviousButton = new dijit.form.Button({
				id : previousButtonId,
				label : framework.local.PAGE_PREVIOUS,
				showLabel : true,
				iconClass : 'frameworkIconPrevious'
			});
			dojoPagingToolbar.addChild(dojoPreviousButton);

			var nextButtonId = framework.format.concat('[1]Next', this.pagingToolbarId);
			var dojoNextButton = new dijit.form.Button({
				id : nextButtonId,
				label : framework.local.PAGE_NEXT,
				showLabel : true,
				iconClass : 'frameworkIconNext'
			});
			dojoPagingToolbar.addChild(dojoNextButton);

			var lastButtonId = framework.format.concat('[1]Last', this.pagingToolbarId);
			var dojoLastButton = new dijit.form.Button({
				id : lastButtonId,
				label : framework.local.PAGE_LAST,
				showLabel : true,
				iconClass : 'frameworkIconLast'
			});
			dojoPagingToolbar.addChild(dojoLastButton);

			framework.utility.$(firstButtonId).click(function() {
				var jQueryCurrentPage = $(framework.format.concat('input[name="[1]"]', page.currentPageInputName));

				jQueryCurrentPage.val(1);

				page.queryDatas();
			});

			framework.utility.$(previousButtonId).click(function() {
				var jQueryCurrentPage = $(framework.format.concat('input[name="[1]"]', page.currentPageInputName));

				var currentPage = jQueryCurrentPage.val();
				currentPage--;
				if (currentPage < 1) {
					currentPage = 1;
				}

				jQueryCurrentPage.val(currentPage);

				page.queryDatas();
			});

			framework.utility.$(nextButtonId).click(function() {
				var jQueryCurrentPage = $(framework.format.concat('input[name="[1]"]', page.currentPageInputName));
				var jQueryPageCount = $(framework.format.concat('input[name="[1]"]', page.pageCountInputName));

				var currentPage = jQueryCurrentPage.val();
				var pageCount = jQueryPageCount.val();
				currentPage++;
				if (currentPage > pageCount) {
					currentPage = pageCount;
				}

				jQueryCurrentPage.val(currentPage);

				page.queryDatas();
			});

			framework.utility.$(lastButtonId).click(function() {
				var jQueryCurrentPage = $(framework.format.concat('input[name="[1]"]', page.currentPageInputName));
				var jQueryPageCount = $(framework.format.concat('input[name="[1]"]', page.pageCountInputName));

				var pageCount = jQueryPageCount.val();

				jQueryCurrentPage.val(pageCount);

				page.queryDatas();
			});

			dojoPagingToolbar.addChild(new dijit.ToolbarSeparator({}));

			var jumpButtonId = framework.format.concat('[1]Jump', this.pagingToolbarId);
			var dojoJumpButton = new dijit.form.Button({
				id : jumpButtonId,
				label : framework.local.PAGE_JUMP,
				showLabel : true,
				iconClass : 'frameworkIconJump'
			});
			dojoPagingToolbar.addChild(dojoJumpButton);

			var pageNumberSpinnerId = framework.format.concat('[1]Page', this.pagingToolbarId);
			var dojoPageNumberSpinner = new dijit.form.NumberSpinner({
				id : pageNumberSpinnerId,
				constraints : {
					min : 1,
					max : 1,
					places : 0
				},
				value : 1,
				style : 'width : 128px'
			});
			dojoPagingToolbar.addChild(dojoPageNumberSpinner);

			framework.utility.$(jumpButtonId).click(function() {
				var jQueryCurrentPage = $(framework.format.concat('input[name="[1]"]', page.currentPageInputName));

				var pageNumberSpinnerId = framework.format.concat('[1]Page', page.pagingToolbarId);
				var dojoPageNumberSpinner = framework.utility.dojo(pageNumberSpinnerId);

				jQueryCurrentPage.val(dojoPageNumberSpinner.attr('value'));

				page.queryDatas();
			});

			var labelButtonId = framework.format.concat('[1]Label', this.pagingToolbarId);
			var dojoLabelButton = new dijit.form.Button({
				id : labelButtonId,
				showLabel : true
			});
			dojoPagingToolbar.addChild(dojoLabelButton);
		},
		_processDatas : function(data) {
			if (data) {
				if (data.paging) {
					var rowsPerPage = 1;
					var currentPage = 1;
					var rowCount = 0;
					var pageCount = 0;

					if (data.paging.rowsPerPage) {
						rowsPerPage = data.paging.rowsPerPage;
					}
					if (data.paging.currentPage) {
						currentPage = data.paging.currentPage;
					}
					if (data.paging.rowCount) {
						rowCount = data.paging.rowCount;
					}
					if (data.paging.pageCount) {
						pageCount = data.paging.pageCount;
					}

					var jQueryCurrentPage = $(framework.format.concat('input[name="[1]"]', this.currentPageInputName));
					var jQueryPageCount = $(framework.format.concat('input[name="[1]"]', this.pageCountInputName));

					jQueryCurrentPage.val(currentPage);
					jQueryPageCount.val(pageCount);

					if (this.pagingToolbarId) {
						var pageNumberSpinnerId = framework.format.concat('[1]Page', this.pagingToolbarId);
						var dojoPageNumberSpinner = framework.utility.dojo(pageNumberSpinnerId);
						var labelButtonId = framework.format.concat('[1]Label', this.pagingToolbarId);
						var dojoLabelButton = framework.utility.dojo(labelButtonId);

						dojoPageNumberSpinner.constraints.max = pageCount;
						dojoPageNumberSpinner.attr('value', currentPage);

						dojoLabelButton.attr('label', framework.format.concat(framework.local.PAGE_LABEL_FORMAT, dojo.number.format(rowsPerPage), dojo.number.format(rowCount), dojo.number.format(pageCount)));
					}

					if (this.indexToolbarId) {
						var pageIndexCount = (this.indexRadius * 2) + 1;
						var minPage = currentPage - this.indexRadius;
						var maxPage = currentPage + this.indexRadius;
						var i = 0;
						if (minPage < 1) {
							minPage = 1;
							maxPage = minPage + pageIndexCount - 1;
							if (maxPage > pageCount) {
								maxPage = pageCount;
							}
						}
						if (maxPage > pageCount) {
							maxPage = pageCount;
							minPage = maxPage - pageIndexCount + 1;
							if (minPage < 1) {
								minPage = 1;
							}
						}
						for (i = 0; i < pageIndexCount; i++) {
							var indexButtonId = framework.format.concat('[1]Index[2]', this.indexToolbarId, i);
							var dojoIndexButton = framework.utility.dojo(indexButtonId);

							var indexLabelFormat = '';
							var indexLabel = '';
							var indexValue = '';
							var indexShowlabel = false;

							if (minPage <= maxPage) {
								indexLabelFormat = (minPage == currentPage) ? 'frameworkPageCurrentIndex' : 'frameworkPageIndex';
								indexLabel = framework.format.concat('<div class="[1]">[2]</div>', indexLabelFormat, minPage);
								indexValue = minPage;
								indexShowlabel = true;
							}

							dojoIndexButton.attr('label', indexLabel);
							dojoIndexButton.attr('value', indexValue);
							dojoIndexButton.attr('showLabel', indexShowlabel);
							minPage++;
						}
					}
				}
				if (data.dojoDataGrid) {
					if (this.dataGridId) {
						var dojoDataGrid = framework.utility.dojo(this.dataGridId);

						dojoDataGrid.selection.deselectAll();
						dojoDataGrid.setStore(new dojo.data.ItemFileReadStore({
							data : data.dojoDataGrid
						}));
					}
				}
			}
		},
		queryDatas : function() {
			if (this.formId) {
				var page = this;
				var jQueryForm = framework.utility.$(this.formId);

				$.ajax({
					url : jQueryForm.attr('action'),
					type : 'POST',
					dataType : 'json',
					data : jQueryForm.serialize()
				}).done(function(data) {
					page._processDatas(data);
				});
			}
		}
	};
})(window);