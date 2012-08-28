###
window.NestedForEvents = ->
  this.addFields = $.proxy(this.addFields, this)
  this.removeFields = $.proxy(this.removeFields, this)

NestedForEvents.prototype = 
  addFields :(e)->
    link = e.currentTarget
    assoc = $(link).attr 'data-association'
    name = $(link).attr 'data-name'
    content = $('#' + name).html()

    regexp = new RegExp ('new_' + assoc), g
    last_name = $('#passenger_nav a:last').attr('data-passno')
    console.log "The last name is " + last_name
    last_id = parseInt last_name.split('_')[1]

    new_id = (last_id + 1).toString()
    content = content.replace regexp, ("new_" + new_id)

    field = this.insertFields content, assoc, link
    $(link).closest("form")
      .trigger {type: 'nested:fieldAdded', field:field}
      .trigger {type: 'nested:fieldAdded:' + assoc, field: field}
    return false

  insertFields:(content, assoc, link) ->
    return $(content).insertBefore link
  removeFields:(e)->
    link = e.currentTarget
    hiddenField = $(link).prev 'input[type=hidden]'
    hiddenField.val '1'
    
    field = $(link).closest '.fields'
    field.hide()
    $(link).closest("form").trigger {type: 'nested:fieldRemoved', field: field}
    return false
window.nestedFormEvents = new NestedForEvents
$('form a.add_nested_fields').live 'click', nestedFormEvents.addFields
$('form a.remove_nested_fields').live 'click', nestedFormEvents.removeFields
###