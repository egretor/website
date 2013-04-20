<%@ page extends="cn.com.ufgov.hainan.framework.action.ModuleJsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<title>${websiteTitle}</title>
<style type="text/css">
html,body {
	width: 100%;
	height: 100%;
	margin: 0;
	overflow: hidden;
}

#borderContainer {
	width: 100%;
	height: 100%;
}
</style>
<%@ include file="/framework/resource/global.jsp"%>
<script type="text/javascript">
	dojo.ready(function() {
		framework.layout = {
			leftZoom : function() {
				var button = dijit.byId('leftZoom');
				var iconClass = button.attr('iconClass');
				if (iconClass == 'frameworkIconDisableLeft') {
					button.attr('iconClass', 'frameworkIconEnableLeft');
					$('#layoutLeft').hide();
					$('#layoutLeftSeparator').hide();
				} else {
					button.attr('iconClass', 'frameworkIconDisableLeft');
					$('#layoutLeft').show();
					$('#layoutLeftSeparator').show();
				}
				dijit.byId('borderContainer').layout();
			},
			topZoom : function() {
				var button = dijit.byId('topZoom');
				var iconClass = button.attr('iconClass');
				if (iconClass == 'frameworkIconDisableTop') {
					button.attr('iconClass', 'frameworkIconEnableTop');
					$('#layoutTop').hide();
					$('#layoutTopSeparator').hide();
				} else {
					button.attr('iconClass', 'frameworkIconDisableTop');
					$('#layoutTop').show();
					$('#layoutTopSeparator').show();
				}
				dijit.byId('borderContainer').layout();
			},
			clickHomeCatalog : function() {
				var id = $('#homeCatalog');
				var name = '首页';
				var url = framework.websiteRoot + '/manage/home.action';

				framework.layout.openTab(id, name, url, false);
			},
			clickExitCatalog : function() {
				window.location.href = framework.websiteRoot + '/manage/everyone!executeLogout.action';
			},
			openTab : function(id, name, url, closable) {
				id += 'Tab';
				var tabContainer = dijit.byId('layoutCenter');
				var currentTab = dijit.byId(id);
				if (!currentTab) {
					currentTab = new dijit.layout.ContentPane({
						id : id,
						title : name,
						closable : closable,
						style : 'overflow: hidden; margin: 0px; padding: 0px',
						content : '<iframe src="' + url + '" style="width: 100%; height: 100%" frameborder="0"></iframe>'
					});
					tabContainer.addChild(currentTab);
				}
				tabContainer.selectChild(currentTab);
			},
			clickLink : function() {
				var linkId = this.id;
				var linkName = $(this).text();
				var linkUrl = $(this).attr('href');

				framework.layout.openTab(linkId, linkName, linkUrl, true);
			},
			clickCatalog : function() {
				var catalogId = this.id;
				$.ajax({
					url : '${websiteRoot}/manage/layout!executeQueryMenus.action',
					type : 'POST',
					data : {
						catalogId : catalogId
					},
					dataType : 'json'
				}).done(function(data) {
					$('#layoutLeft').html('');

					if (data) {
						if (data.manageMenus) {
							dojo.forEach(data.manageMenus, function(manageMenu) {
								var linkContent = '';

								if (manageMenu.manageLinks) {
									manageMenu.manageLinks.sort(function(x, y) {
										var result = 0;
										if (x.name > y.name) {
											result = 1;
										}
										if (x.name < y.name) {
											result = -1;
										}
										return result;
									});

									dojo.forEach(manageMenu.manageLinks, function(manageLink) {
										linkContent += '<div id="' + manageLink.uuid + '" class="linkButton" href="' + framework.websiteRoot + manageLink.url + '">' + manageLink.name + '</div><br />';
									});
								}

								var linkButton = new dijit.layout.ContentPane({
									title : manageMenu.name,
									content : linkContent
								});

								dijit.byId('layoutLeft').addChild(linkButton);
								dijit.byId('layoutLeft').selectChild(linkButton);
							});

							$('.linkButton').click(framework.layout.clickLink);
						}
					}
				});
			},
			queryCatalogs : function() {
				$.ajax({
					url : '${websiteRoot}/manage/layout!executeQueryCatalogs.action',
					type : 'POST',
					dataType : 'json'
				}).done(function(data) {
					if (data) {
						if (data.manageCatalogs) {
							var firstCatalog = true;

							dojo.forEach(data.manageCatalogs, function(manageCatalog) {
								dojo.create('button', {
									innerHTML : manageCatalog.name,
									id : manageCatalog.uuid
								}, dojo.byId('layoutCatalog'));
								new dijit.form.Button({}, dojo.byId(manageCatalog.uuid));

								$('#' + manageCatalog.uuid).addClass('catalogButton');
								$('.catalogButton').click(framework.layout.clickCatalog);

								if (firstCatalog) {
									firstCatalog = false;
									$('#' + manageCatalog.uuid).trigger('click');
								}
							});
						}
					}
				});
			}
		};

		$('#leftZoom').click(framework.layout.leftZoom);

		$('#topZoom').click(framework.layout.topZoom);

		$('#homeCatalog').click(framework.layout.clickHomeCatalog);

		$('#exitCatalog').click(framework.layout.clickExitCatalog);

		framework.layout.queryCatalogs();
		framework.layout.clickHomeCatalog();
	});
</script>
</head>

<body class="${dojoStyle}">
	<div id="borderContainer" data-dojo-type="dijit/layout/BorderContainer"
		data-dojo-props="gutters:false">
		<div id="layoutTop" data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'top'"
			style="overflow: hidden; height: 90px; margin: 0px; padding: 0px">
			<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
				<tbody>
					<tr style="height: 60px">
						<td rowspan="2" style="width: 160px"></td>
						<td colspan="2"></td>
					</tr>
					<tr style="height: 30px">
						<td style="text-align: right">
							<button id="homeCatalog" data-dojo-type="dijit/form/Button"
								data-dojo-props="iconClass:'frameworkIconHome'" type="button">首页</button>
							<span id="layoutCatalog"></span>
							<button id="exitCatalog" data-dojo-type="dijit/form/Button"
								type="button">退出</button>
						</td>
						<td style="width: 50px"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="layoutTopSeparator "
			data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'top'"
			style="overflow: hidden; height: 5px; margin: 0px; padding: 0px">
		</div>
		<div id="layoutLeft" data-dojo-type="dijit/layout/AccordionContainer"
			data-dojo-props="region:'left'"
			style="width: 320px; margin: 0px; padding: 0px">
			<div data-dojo-type="dijit/layout/ContentPane" title=""></div>
		</div>
		<div id="layoutLeftSeparator"
			data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'left'"
			style="width: 5px; margin: 0px; padding: 0px"></div>
		<div data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'center'" style="margin: 0px; padding: 0px">
			<div id="layoutCenter" data-dojo-type="dijit.layout.TabContainer"
				data-dojo-props=" region:'center'" style="margin: 0px; padding: 0px">
			</div>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'bottom'"
			style="overflow: hidden; height: 30px; margin: 0px; padding: 0px">
			<div data-dojo-type="dijit/Toolbar">
				<div data-dojo-type="dijit/form/Button" id="leftZoom"
					data-dojo-props="iconClass:'frameworkIconDisableLeft', showLabel:false"></div>
				<div data-dojo-type="dijit/form/Button" id="topZoom"
					data-dojo-props="iconClass:'frameworkIconDisableTop', showLabel:false"></div>
			</div>
		</div>
</body>
</html>