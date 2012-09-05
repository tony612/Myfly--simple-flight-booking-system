# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
change_deliver = (e)->
  #e.preventDefault()
  accordion = e.currentTarget
  acc_body = $(accordion).next()
  if acc_body and $.inArray("in", acc_body.attr("class"))
    $(accordion).closest('#deliver_way').children('#inputWay').val(acc_body.attr('data-deliver'))

$("#deliver_way > .accordion-group > .accordion-heading").live("click", change_deliver)

  
