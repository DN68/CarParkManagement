var names = ['email', 'password']
var arrId = ['#email', '#password']

$(document).ready(function (){
    function checkLength() {
        let isEmailLengthError = checkLengthError($(arrId[0]), 5, 32)
        let lengthSuccess = !isEmailLengthError
        return lengthSuccess
    }

    function checkFormat() {
        let isEmailFormatError = false
        // let isEmailFormatError = checkEmailError($(arrId[0]))
        let isPasswordError = checkPassError($(arrId[1]))
        let formatSuccess = !isEmailFormatError && !isPasswordError
        return formatSuccess
    }

    function checkEmpty() {
        let isEmptyError = checkEmptyInvalid([$(arrId[0]), $(arrId[1])])
        return !isEmptyError
    }

    $('form').submit(function(e) {
        let emptySucess = checkEmpty()
        let lengthSuccess = checkLength()
        let formatSuccess = checkFormat()
        let successAll = emptySucess && lengthSuccess && formatSuccess

        if(successAll) {
            $('form').submit()
        }
        else {
            e.preventDefault()
        }
    })
});