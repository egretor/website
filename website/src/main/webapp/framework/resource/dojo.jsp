<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dojo/resources/dojo.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dijit/themes/claro/claro.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dijit/themes/nihilo/nihilo.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dijit/themes/soria/soria.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dijit/themes/tundra/tundra.css" />

<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dojox/grid/resources/Grid.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dojox/grid/resources/Grid_rtl.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dojox/grid/resources/claroGrid.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dojox/grid/resources/nihiloGrid.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dojox/grid/resources/soriaGrid.css" />
<link rel="stylesheet"
	href="${websiteRoot}/resource/javascript/dojo/dojox/grid/resources/tundraGrid.css" />

<script type="text/javascript">
	dojoConfig = {
		parseOnLoad : true,
		isDebug : false
	};
</script>

<script type="text/javascript"
	src="${websiteRoot}/resource/javascript/dojo/dojo/dojo.js"></script>

<script type="text/javascript">
	dojo.require('dojo.data.ItemFileReadStore');
	dojo.require('dojo.parser');
	dojo.require('dijit.form.NumberSpinner');
	dojo.require('dijit.layout.AccordionContainer');
	dojo.require('dijit.layout.ContentPane');
	dojo.require('dijit.layout.BorderContainer');
	dojo.require('dijit.layout.TabContainer');
	dojo.require('dijit.registry');
	dojo.require('dijit.Dialog');
	dojo.require('dijit.Toolbar');
	dojo.require('dojox.layout.TableContainer');
	dojo.require('dojox.grid.DataGrid');
</script>