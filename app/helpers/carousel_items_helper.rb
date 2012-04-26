module CarouselItemsHelper

	def switch_path(item)
    	'carousel_items/'+item.id.to_s+'/switch'
 	end

 	def switcher_style(item)
 		style = item.active ? 'success' : 'danger'
 		'btn btn-mini btn-' + style
 	end

 	def switcher_name(item)
 		item.active ? 'Ja' : 'Nej'
 	end


end
