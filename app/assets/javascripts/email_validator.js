var validateEmail = function(email){
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test(email);
};

var executeValidation = function(parent) {
  var input = parent.find('input');
  var span = parent.find('span');
    if(validateEmail(input.val())){
        setMessageAndClass(span, '', 'error');
        return true;
    }else{
        setMessageAndClass(span, 'O e-mail informado é inválido', 'error_required');
        return false;
  }
}
