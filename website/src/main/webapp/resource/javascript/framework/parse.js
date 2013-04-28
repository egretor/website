(function(window) {
	window.framework.parse = {
		datagrid : function(value) {
			var result = null;

			if (value) {
				if (value instanceof Array) {
					result = value[0];
				} else {
					result = value;
				}
			}

			return result;
		}
	};
})(window);