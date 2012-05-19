jQuery ->
  $('form').on 'click', '.remove_fields', (event) -> #when user clicks on remove field link
    $(this).prev('input[type=hidden]').val('1') #set the hidden field to true (1) (right before the link)
    $(this).closest('fieldset').hide() #hide the fieldset where the link was
    event.preventDefault() # do not reload page when click link
    
  $('form').on 'click', '.add_fields', (event) -> #when user click add fields link
    time = new Date().getTime() #make a new unique id useing current tim
    regexp = new RegExp($(this).data('id'), 'g') #test ig string contains 
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()  # do not reload page when click link