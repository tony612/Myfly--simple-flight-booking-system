$(function($) {

  window.NestedEvents = function() {
    this.addFields = $.proxy(this.addFields, this);
    this.removeFields = $.proxy(this.removeFields, this);
  };

  NestedEvents.prototype = {
    addFields: function(e) {
      var assoc, content, field, last_id, last_name, link, name, new_id, regexp;
      link = e.currentTarget;
      assoc = $(link).attr('data-association');
      name = $(link).attr('data-name');
      content = $('#' + name).html();
      regexp = new RegExp('new_' + assoc, 'g');
      last_name = $('#passenger_nav a:last').attr('data-passno');
      console.log("The last name is " + last_name);
      last_id = parseInt(last_name.split('_')[1]);
      new_id = (last_id + 1).toString();
      content = content.replace(regexp, 'new_' + new_id);
      field = this.insertFields(content, assoc, link);
      $(link).closest("form").trigger({
        type: 'nested:passAdded',
        field: field
      }).trigger({
        type: 'nested:passAdded:' + assoc,
        field: field
      });
      return false;
    },
     insertFields: function(content, assoc, link) {
      return $(content).insertBefore(link);
    },
    removeFields: function(e) {
      var field, hiddenField, link;
      link = e.currentTarget;
      if ($(link).closest(".tab-pane").attr("id") === "new_1"){
        return false
      }
      hiddenField = $(link).prev('input[type=hidden]');
      hiddenField.val('1');
      field = $(link).closest('.fields');
      field.hide();
      $(link).closest("form").trigger({
        type: 'nested:passRemoved',
        field: field
      });
      field.remove();
      return false;
    }
  };

  window.nestedEvents = new NestedEvents();

  //$('#passenger_control a').live('click', nestedEvents.addFields);
  console.log($('#passenger_control a').attr('data-association'))
  $('.tab-content a.remove_passengers_fields').live('click', nestedEvents.removeFields);

});
