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
		$('#test').click(function() {
			var currentTab = framework.top.framework.layout.currentTab;
			var tab = eval('framework.top.' + currentTab.id);

			tab.refreshPage();

			framework.top.framework.layout.closeDialog();
		});
	});
</script>
</head>

<body class="${dojoStyle}">
	<div id="test">测试！</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>