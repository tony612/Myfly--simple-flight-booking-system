$(document).ready(function(){

$.validator.addMethod("isDate", function(value, element){
  var ereg = /^(\d{1,2})(-|\/)(\d{1,2})(-|\/)(\d{4})$/;
  var r = value.match(ereg);
  if (r === null) {
    return false;
  } else {
    var d = new Date(r[5], r[1] - 1, r[3]);
    var result = (d.getFullYear() == r[5] && (d.getMonth() + 1) == r[1] && d.getDate() == r[3]);
    return this.optional(element) || (result);
  }
}, "Please enter the time of right format");

$.validator.addMethod("pickLength", function(value, element, param){
  var length = $.isArray(value) ? value.length : this.getLength($.trim(value), element);
  return this.optional(element) || (length == param[0] || length == param[1]);
}, "Please enter the string of right length.");

$.validator.addMethod("isRound", function(value, element){
  var ereg = /^(\d{1,2})(-|\/)(\d{1,2})(-|\/)(\d{4})$/;
  var r = value.match(ereg);
  if (r === null) {
    return false;
  } else {
    var d = new Date(r[5], r[1] - 1, r[3]);
    var result = (d.getFullYear() == r[5] && (d.getMonth() + 1) == r[1] && d.getDate() == r[3]);
    return this.optional(element) || (result);
  }
}, "Please enter the time of right format");

//$.validator.addMethod("roundWay", function(value, element, param){
//  return false;
  //if($("#tripTypeRound").attr("checked") === "checked"){
  //    if ( !this.depend(param, element) ) {
	//			return "dependency-mismatch";
	//		}
	//		if ( element.nodeName.toLowerCase() === "select" ) {
	//			// could be an array for select-multiple or a string, both are fine this way
	//			var val = $(element).val();
	//			return val && val.length > 0;
	//		}
	//		if ( this.checkable(element) ) {
	//			return this.getLength(value, element) > 0;
	//		}
	//		return $.trim(value).length > 0;
//
//  } else{
//    return true;
//  }
  
//}, "Please enter the return time");

  $("#new_flight").validate({
    rules: {
      "flight[leave_city]": "required",
      "flight[arrive_city]": "required",
      "flight[leave_time]": {
        required: true,
        isDate: true
      },
      "return_time": {
        //isRound: true
      }
    },
    messages: {
      "flight[leave_city]": "Please enter your leaving city",
      "flight[arrive_city]": "Please enter yout arriving city",
      "flight[leave_time]": {
        required: "Please enter your leaving time",
        isDate: "The leaving time must be the format of mm/dd/yyyy"
      },
      "return_time": {
        isRound: "Please enter your returning time"
      }
    }
  });

  $("#new_order").validate({
    ignore: ".ignore",
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

  $("#deliver_way").validate({
    rules:{
      "address[SBP][name]":"required",
      "address[SBP][province]": "required",
      "address[SBP][city]": "required",
      "address[SBP][area]": "required",
      "address[SBP][street]": "required",
      "address[SBP][postcode]": "required",
      "address[GIA][day]": {
        required:true,
        isDate: true
      },
      "address[SWC][info]": "required",
      "address[SWC][day]":{
        required: true,
        isDate: true
      },
      "address[GWC][day]": {
        required: true,
        isDate: true
      }
    }
  });

  $("#loginModal").validate({
    rules:{
      "user[email]": {
        isDate: true
      }
    }
  });

});
