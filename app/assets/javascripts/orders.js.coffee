
$('.best_in_place').best_in_place()

$(document).ready(->

  return window.nestedEvents.insertFields =(content, assoc, link)->
    tab_content = $(link).closest(".controls").siblings ".tab-content"
    tab_content.append content
    return tab_content.children().last()
)

$('form').live('nested:passAdded', (content)->
  field = content.field.addClass 'tab-pane'
  new_tab = $("<li><a data-toggle='tab' href='##{field.attr('id')}' 
    data-passno='#{field.attr('id')}'>Passenger #{field.attr('id').split('_')[1]}</a></li>")
  parent_group = field.closest '.control-group'
  controls = parent_group.children '.controls'
  nav = controls.children '.nav'
  content = parent_group.children '.tab-content'
  nav.append new_tab
  new_tab.children('a').tab 'show'
  nav.select(':hidden').show 'slow'
  content.select(':hidden').show 'slow'
  #return toggler.addClass('active').removeClass('disables')

)

$('form').live('nested:passRemoved', (content)->
  field = content.field
  nav = field.closest(".control-group").children('.controls').children('.nav')
  current_li = nav.children('li').has("a[href=##{field.attr('id')}]")
  parent_group = field.closest(".control-group")
  controls = parent_group.children('.controls')
  (if current_li.next().length then current_li.next() else current_li.prev()).children('a:first').tab('show')
  current_li.remove()
)
