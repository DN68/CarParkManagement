// var names = ['license plate', 'car type', 'car color', 'company', 'parking lot'];
// var arrId = ['#licensePlate', '#carType', '#carColor', '#company', '#parkingLot']

var names = ['license plate', 'company', 'parking lot'];
var arrId = ['#licensePlate', '#company', '#parkingLot']

$(document).ready(function () {
    function checkLength() {
        let isLicensePlateLengthError = checkLengthError($(arrId[0]), 5, 32)

        let isCarTypeLengthError = false;
        let typeValue = $('#carType').val().trim();
        if (typeValue !== null && typeValue !== '') {
            isCarTypeLengthError = checkLengthError($('#carType'), 5, 32)
        } else {
            showSuccess($('#carType'))
        }

        let isCarColorLengthError = false;
        let colorValue = $('#carColor').val().trim();
        if (colorValue !== null && colorValue !== '') {
            isCarColorLengthError = checkLengthError($('#carColor'), 3, 32)
        } else {
            showSuccess($('#carColor'))
        }


        let lengthSuccess = !isLicensePlateLengthError && !isCarTypeLengthError && !isCarColorLengthError
        return lengthSuccess
    }

    function checkEmpty() {
        let isEmptyError = checkEmptyInvalid([$(arrId[0]), $(arrId[1]), $(arrId[2])])
        return !isEmptyError
    }

    $('form').submit(function (e) {
        let emptySuccess = checkEmpty()
        let lengthSuccess = checkLength()
        let successAll = emptySuccess && lengthSuccess
        if (successAll) {
            $('form').submit()
        } else {
            e.preventDefault()
        }
    })
});