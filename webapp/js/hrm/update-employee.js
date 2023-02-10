var names = ['full name', 'phone number', 'date of birth', 'account', 'password'];
var arrId = ['#fullName', '#phoneNumber', '#dateOfBirth', '#account', '#password']

$(document).ready(function () {
    function checkLength() {
        let isFullNameLengthError = checkLengthError($(arrId[0]), 5, 32)
        let isPhoneLengthError = checkLengthError($(arrId[1]), 10, 15)
        let isAccountLenghtError = checkLengthError($(arrId[3]), 5, 32)
        let lengthSuccess = !isFullNameLengthError && !isPhoneLengthError && !isAccountLenghtError
        return lengthSuccess
    }

    function checkEmpty() {
        let isEmptyError = checkEmptyInvalid([$(arrId[0]), $(arrId[1]), $(arrId[2]), $(arrId[3])])
        return !isEmptyError
    }

    function checkFormat() {
        let isPhoneFormatError = checkPhoneError($(arrId[1]))
        let isDateOfBirthError = checkBirthDate($(arrId[2]), 18)

        let isEmailFormatError = false
        let isEmailLengthError = false
        let emailValue = $('#email').val().trim()
        if (emailValue !== null && emailValue !== '') {
            isEmailLengthError = checkLengthError($('#email'), 8, 32)
            isEmailFormatError = checkEmailError($('#email'))
        }
        else {
            showSuccess($('#email'))
        }

        let formatSuccess = !isEmailFormatError && !isPhoneFormatError && !isDateOfBirthError && !isEmailLengthError
        return formatSuccess
    }

    $('form').submit(function (e) {
        let emptySuccess = checkEmpty()
        let lengthSuccess = checkLength()
        let formatSuccess = checkFormat()
        console.log("empty: "+emptySuccess)
        console.log("length: "+lengthSuccess)
        console.log("format: "+formatSuccess)
        let successAll = emptySuccess && lengthSuccess && formatSuccess
        console.log(successAll)
        if (successAll) {
            $('form').submit()
        } else {
            e.preventDefault()
        }
    })
});