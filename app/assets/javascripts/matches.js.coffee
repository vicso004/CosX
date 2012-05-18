# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#Datepicker
jQuery ->
  $('#match_datum').datepicker({
   dateFormat: 'yy-mm-dd',
   firstDay: 1, #Börja på måndag
  monthNames: ['Januari','Februari','Mars','April','Maj','Juni',
			'Juli','Augusti','September','Oktober','November','December'],
  dayNamesMin: ['Sö','Må','Ti','On','To','Fr','Lö']
#  prevText: '<<',
#  nextText: '>>'
  });
  
#Chosen  
  $('#match_player_ids').chosen()  

 
  
  


