<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<title>${websiteTitle}</title>
<style type="text/css">
html,body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	overflow: hidden;
	font-family: 微软雅黑, 新宋体, 宋体, Tahoma, Consolas, Courier New, Arial;
	font-size: 12pt;
	font-weight: bolder;
}

input {
	font-family: 微软雅黑, 新宋体, 宋体, Tahoma, Consolas, Courier New, Arial;
	font-size: 12pt;
	font-weight: bolder;
	width: 160px;
	height: 30px;
}
</style>
<%@ include file="/framework/resource/jquery.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		var layout = function() {
			var container = $('#container');
			var panel = $('#panel');
			var backgroundImage = $('#backgroundImage');

			var containerWidth = parseInt(container.css('width'));
			var containerHeight = parseInt(container.css('height'));

			var backgroundImageWidth = parseInt(backgroundImage.css('width'));
			var backgroundImageHeight = parseInt(backgroundImage.css('height'));

			backgroundImageHeight = backgroundImageHeight * (containerWidth / backgroundImageWidth);
			backgroundImageWidth = containerWidth;

			backgroundImage.css('width', backgroundImageWidth);
			backgroundImage.css('height', backgroundImageHeight);

			var panelWidth = parseInt(panel.css('width'));
			var panelHeight = parseInt(panel.css('height'));

			var panelTop = (containerHeight - panelHeight) / 2;
			var panelLeft = (containerWidth - panelWidth) / 2;

			panel.css('top', panelTop);
			panel.css('left', panelLeft);
		};

		layout();

		$('#account').val('root');
		$('#password').val('password');
		$('#account').focus();
	});
</script>
</head>
<body id="container">
	<img id="backgroundImage" border="0"
		src="${websiteRoot}/resource/image/manage/login/background.png"
		style="position: absolute; z-index: 1024" />
	<s:form id="form" name="form" action="everyone!executeVerity.action"
		method="post">
		<table id="panel" border="0" cellpadding="0" cellspacing="0"
			style="width: 640px; height: 360px; position: absolute; z-index: 2048">
			<tbody>
				<tr style="height: 35px">
					<td style="width: 10px; text-align: center">&nbsp;</td>
					<td style="width: 160px; text-align: right">&nbsp;</td>
					<td style="width: 320px; text-align: left">&nbsp;</td>
					<td style="width: 150px; text-align: center">&nbsp;</td>
				</tr>
				<tr style="height: 50px">
					<td style="text-align: center">&nbsp;</td>
					<td style="text-align: right">帐号：</td>
					<td style="text-align: left"><s:textfield id="account"
							name="manageUser.account"></s:textfield></td>
					<td style="text-align: center">&nbsp;</td>
				</tr>
				<tr style="height: 50px">
					<td style="text-align: center">&nbsp;</td>
					<td style="text-align: right">密码：</td>
					<td style="text-align: left"><s:password id="password"
							name="manageUser.password"></s:password></td>
					<td style="text-align: center">&nbsp;</td>
				</tr>
				<tr style="height: 50px">
					<td style="text-align: center">&nbsp;</td>
					<td style="text-align: right">&nbsp;</td>
					<td style="text-align: left"><s:submit id="ok" name="ok"
							value="登录"></s:submit></td>
					<td style="text-align: center">&nbsp;</td>
				</tr>
				<tr style="height: 175px">
					<td style="text-align: center">&nbsp;</td>
					<td style="text-align: right">&nbsp;</td>
					<td style="text-align: left">&nbsp;</td>
					<td style="text-align: center">&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</s:form>
</body>
</html>