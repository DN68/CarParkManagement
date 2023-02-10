var names = ['customer name', 'booking time', 'trip', 'license plate'];
var arrId = ['#customerName', '#bookingTime', '#trip', '#licensePlate']

$(document).ready(function (){
    function checkLength() {
        let isCustomerNameLengthError = checkLengthError($(arrId[0]), 5, 32)
        let lengthSuccess = !isCustomerNameLengthError
        return lengthSuccess
    }

    function checkFormat() {
        // let isAreaLengthError = checkNumberError($(arrId[3]))
        // let isPriceLenghtError = checkNumberError($(arrId[4]))
        // let formarSuccess = !isAreaLengthError && !isPriceLenghtError
        // return formarSuccess
    }

    function checkEmpty() {
        let isEmptyError = checkEmptyInvalid([$(arrId[0]), $(arrId[1]), $(arrId[2]), $(arrId[3])])
        return !isEmptyError
    }

    $('form').submit(function(e) {
        let emptySucess = checkEmpty()
        let lengthSuccess = checkLength()
        // let formatSuccess = checkFormat()
        let successAll = emptySucess && lengthSuccess

        if(successAll) {
            $('form').submit()
        }
        else {
            e.preventDefault()
        }
    })
});