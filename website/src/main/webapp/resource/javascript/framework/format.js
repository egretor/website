(function(window) {
	window.framework.format = {
		// format '[1][2][3]...'
		concat : function(format) {
			var values = arguments;
			return format.replace(/\[(\d+)\]/g, function(value, index) {
				return values[index];
			});
		},
		jsonDateTime : function(value) {
			var result = null;

			if (value) {
				var values = value.split('T');
				if (values && (values.length == 2)) {
					result = values[0] + ' ' + values[1];
				}
			}

			return result;
		},
		jsonDate : function(value) {
			var result = null;

			if (value) {
				var values = value.split('T');
				if (values && (values.length == 2)) {
					result = values[0];
				}
			}

			return result;
		},
		jsonTime : function(value) {
			var result = null;

			if (value) {
				var values = value.split('T');
				if (values && (values.length == 2)) {
					result = values[1];
				}
			}

			return result;
		},
		booleanYesNo : function(value) {
			var result = framework.local.FORMAT_NO;

			if (value) {
				result = framework.local.FORMAT_YES;
			}

			return result;
		}
	};
})(window);