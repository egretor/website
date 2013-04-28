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
	
	if (window !== window.framework.top){
		window.framework.layout = window.framework.top.framework.layout;
	}
})(window);