(function(window) {
	window.framework.utility = {
		$ : function(id) {
			var result = null;
			
			result = $(framework.format.concat('#[1]', id));
			
			return result;
		},
		dojo : function(id) {
			var result = null;
			
			result = dijit.registry.byId(id);
			
			return result;
		}
	};
})(window);