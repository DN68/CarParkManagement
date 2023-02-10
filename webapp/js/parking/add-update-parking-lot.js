var names = ['booking office name', 'place', 'quantity', 'area', 'price'];
var arrId = ['#parkingName', '#place', '#quantity', '#area', '#price']

$(document).ready(function (){
    function checkLength() {
        let isParkingNameLengthError = checkLengthError($(arrId[0]), 5, 32)
        let lengthSuccess = !isParkingNameLengthError
        return lengthSuccess
    }

    function checkFormat() {
        // let isAreaLengthError = checkNumberError($(arrId[2]))
        // let isPriceLenghtError = checkNumberError($(arrId[3]))
        // let formarSuccess = !isAreaLengthError && !isPriceLenghtError
        // return formarSuccess
    }

    function checkEmpty() {
        let isEmptyError = checkEmptyInvalid([$(arrId[0]), $(arrId[1]), $(arrId[2]), $(arrId[3]), $(arrId[4])])
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
