jQuery.validator.addMethod("isDate", function(value, element){
  var ereg = /^(\d{1,2})(-|\/)(\d{1,2})(-|\/)(\d{1,4})$/;
  var r = value.match(ereg);
  if (r == null) {
    return false;
  }
  var d = new Date(r[5], r[1] - 1, r[3]);
  var result = (d.getFullYear() == r[5] && (d.getMonth() + 1) == r[1] && d.getDate() == r[3]);
  return this.optional(element) || (result);
}, "Please enter the time of right format");

$.validator.addMethod("pickLength", function(value, element, param){
  var length = $.isArray(value) ? value.length : this.getLength($.trim(value), element);
  return this.optional(element) || (length == param[0] || length == param[1]);
}, "Please enter the string of right length.");

$().ready(function() {
  $("#new_flight").validate({
    rules: {
      "flight[leave_city]": "required",
      "flight[arrive_city]": "required",
      "flight[leave_time]": {
        required: true,
        isDate: true
      }
    },
    messages: {
      "flight[leave_city]": "Please enter your leaving city",
      "flight[arrive_city]": "Please enter yout arriving city",
      "flight[leave_time]": {
        required: "Please enter your leaving time",
        isDate: "The leaving time must be the format of mm/dd/yyyy"
      }
    }
  });

  $("#new_order").validate({
    rules:{
      "order[passengers_attributes][new_1][name]": "required",
      "order[passengers_attributes][new_2][name]": "required",
      "order[passengers_attributes][new_3][name]": "required",
      "order[passengers_attributes][new_4][name]": "required",
      "order[passengers_attributes][new_5][name]": "required",
      "order[passengers_attributes][new_1][cred_number]": {
        required: true,
        digits: true,
        pickLength: [15, 18]
      },
      "order[passengers_attributes][new_2][cred_number]": {
        required: true,
        digits: true,
        pickLength: [15, 18]
      },
      "order[passengers_attributes][new_3][cred_number]": {
        required: true,
        digits: true,
        pickLength: [15, 18]
      },
      "order[passengers_attributes][new_4][cred_number]": {
        required: true,
        digits: true,
        pickLength: [15, 18]
      },
      "order[passengers_attributes][new_5][cred_number]": {
        required: true,
        digits: true,
        pickLength: [15, 18]
      },
      "order[contact_name]": "required",
      "order[contact_phone]": {
        required: true,
        digits: true,
        minlength: 11,
        maxlength: 11
      },
      "order[contact_email]": {
        required: true,
        email:true
      }
    },
    messages: {
      "order[passengers_attributes][new_1][cred_number]": "Please input ID number of 15 or 18",
      "order[passengers_attributes][new_2][cred_number]": "Please input ID number of 15 or 18",
      "order[passengers_attributes][new_3][cred_number]": "Please input ID number of 15 or 18",
      "order[passengers_attributes][new_4][cred_number]": "Please input ID number of 15 or 18",
      "order[passengers_attributes][new_5][cred_number]": "Please input ID number of 15 or 18"
    }
  
  });
});

