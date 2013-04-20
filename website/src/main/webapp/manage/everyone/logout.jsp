<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<title>${websiteTitle}</title>
<%@ include file="/framework/resource/jquery.jsp"%>
<%@ include file="/framework/resource/javascript.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		var url = '${websiteRoot}/manage/everyone!executeLogin.action';

		framework.top.location = url;
	});
</script>
</head>
<body>
</body>
</html>