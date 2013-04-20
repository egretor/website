(function(window) {
	var framework = {};

	framework.websiteRoot = frameworkConfig.websiteRoot;

	framework.format = {
		jsonDateTime : function(value) {
			var result;

			var values = value.split('T');
			result = values[0] + ' ' + values[1];

			return result;
		},
		jsonDate : function(value) {
			var result;

			var values = value.split('T');
			result = values[0];

			return result;
		},
		jsonTime : function(value) {
			var result;

			var values = value.split('T');
			result = values[1];

			return result;
		},
		booleanYesNo : function(value) {
			var result = '否';

			if (value) {
				result = '是';
			}

			return result;
		}
	};

	window.framework = framework;
})(window);

(function(window) {
	var self = window;
	var parent = null;

	if (!parent && self.parentWindow) {
		parent = self.parentWindow;
	}
	if (!parent && self.parent) {
		parent = self.parent;
	}
	if (!parent && window.frameElement && window.frameElement.parentNode) {
		parent = window.frameElement.parentNode;
	}
	if (!parent && self.parentNode) {
		parent = self.parentNode;
	}

	while (self && parent && (self !== parent)) {
		self = parent;
		parent = null;
		if (!parent && self.parentWindow) {
			parent = self.parentWindow;
		}
		if (!parent && self.parent) {
			parent = self.parent;
		}
		if (!parent && self.window && self.window.frameElement && self.window.frameElement.parentNode) {
			parent = self.window.frameElement.parentNode;
		}
		if (!parent && self.parentNode) {
			parent = self.parentNode;
		}
	}

	if (self) {
		window.framework.top = self;
	} else {
		window.framework.top = window;
	}
	window.framework.layout = window.framework.top.framework.layout;
})(window);