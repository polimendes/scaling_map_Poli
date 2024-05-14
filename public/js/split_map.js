var Split_map = {
	// cont:{},
	init: function(section){
		leftmap = $('.'+section).attr('leftmap')
		rightmap = $('.'+section).attr('rightmap')
		$('.layers').each(function(ex){
			if($(this).attr('layer-id')==leftmap){
				leftmapurl = $(this).attr('layer-src')
			}
			if($(this).attr('layer-id')==rightmap){
				rightmapurl = $(this).attr('layer-src')
			}
		})
		var leftLayer = L.tileLayer(leftmapurl, {
		}).addTo(map);
		var rightLayer = L.tileLayer(rightmapurl, {
		}).addTo(map);
		sbs = L.control.sideBySide(leftLayer, rightLayer)
		sbs.addTo(map);
	},
	remove: function(){
		if(sbs){
			map.removeControl(sbs)
		}
	}
}