$(document).ready(function() {
  $('#new_user input').focusout(function() {
    validateField($(this).parent());
  });

  $('#user_email').focusout(function() {
    if(isValidValue($(this))){
      executeValidation($(this).parent());
    }
  });

  $('#new_user :submit').click(function(event) {
    var $inputs = $('#new_user :input');
    var fails = 0;
    $inputs.each(function() {
      if(!validateField($(this).parent())){
        fails++;
      }
    });
    if(!!fails){
      event.preventDefault();
    }else{
      $('#new_user').submit();
    }
  });
});
