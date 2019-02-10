$(document).ready(function() {

    var emailField = $('#report_email');
    var descriptionField = $('#description');
    var authorizeBox = $('#authorize-report');

    emailField.focusout(function() {
        validateField($(this).parent());
    });

    authorizeBox.focusout(function() {
        validateReportAuthorization($(this).parent());
    });

    descriptionField.focusout(function() {
        validateTextArea($(this).parent());
    });

    emailField.focusout(function() {
        validateEmailFormat(this);
    });

    submitReport();
});

var validateEmailFormat = function (email) {
    if(isValidValue($(email))){
        return executeValidation($(email).parent());
    }
}

var validateReportAuthorization = function(parent){
    var span = parent.find('span');

    if ($('#authorize-report:checked').length > 0) {
        setMessageAndClass(span, '', 'error');
        return true;
    } else {
        setMessageAndClass(span, 'Por favor, autorize o envio da denúncia', 'error_required');
        return false;
    }
}

var submitReport = function(){
    $('#report_service_form :submit').click(function(event) {
        var $inputs = $('#report_service_form .form-control');
        var fails = 0;

        $inputs.each(function() {
            if($(this).is("textarea")){
                if(!validateTextArea($(this).parent())){
                    fails++;
                }
            } else{
                if(!validateField($(this).parent())){
                    fails++;
                }
            }
        });

        if(!validateEmailFormat($('#report_email')) || !validateReportAuthorization($('#authorize-report').parent())){
            fails++;
        }

        if(!!fails){
            event.preventDefault();
        }else{
            $('#report_service_form').submit();
        }
    });
}