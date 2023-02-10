var names = ['destination', 'departure time', 'driver', 'car type', 'maximum online ticket number', 'departure date'];
var arrId = ['#destination', '#departureTime', '#driver', '#carType', '#maxTicketNumber', '#departureDate']

$(document).ready(function (){
    function checkLength() {
        let isDestinationLengthError = checkLengthError($(arrId[0]), 5, 32)
        let isDriverLengthError = checkLengthError($(arrId[2]), 5, 32)
        let isCarTypeLengthError = checkLengthError($(arrId[3]), 5, 32)
        let lengthSuccess = !isDestinationLengthError && !isDriverLengthError && !isCarTypeLengthError
        return lengthSuccess
    }

    function checkFormat() {
        let isDepartureDateError = checkDateCurrent($(arrId[5]))
        let formarSuccess = !isDepartureDateError
        return formarSuccess
    }

    function checkEmpty() {
        let isEmptyError = checkEmptyInvalid([$(arrId[0]), $(arrId[1]), $(arrId[2]), $(arrId[3]), $(arrId[4]), $(arrId[5])])
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