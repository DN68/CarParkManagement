var names = ['booking office name', 'trip', 'phone number', 'place', 'price', 'from date', 'to date'];
var arrId = ['#bookingOfficeName', '#trip', '#phoneNumber', '#place', '#price', '#fromDate', '#toDate']

$(document).ready(function (){
    function checkLength() {
        let isBookingOfficeNameLengthError = checkLengthError($(arrId[0]), 5, 32)
        let isPhoneLengthError = checkLengthError($(arrId[2]), 8, 32)
        let lengthSuccess = !isBookingOfficeNameLengthError && !isPhoneLengthError && !isPriceLenghtError
            && !isPriceLenghtError
        return lengthSuccess
    }

    function checkEmpty() {
        let isEmptyError = checkEmptyInvalid([$(arrId[0]), $(arrId[1]), $(arrId[2]), $(arrId[3]),
            $(arrId[4]), $(arrId[5]), $(arrId[6])])
        return !isEmptyError
    }

    function checkFormat() {
        let isPhoneFormatEror = checkPhoneError($(arrId[2]))
        // let isPriceLenghtError = checkNumberError($(arrId[4]))
        let formarSuccess = !isPhoneFormatEror
        return formarSuccess
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