/**
 * Show message error input
 * @param {*} input
 * @param {*} message
 */
function showError(input, message) {
    let parent = input.parent();
    let small = parent.find('small');
    input.addClass('error');
    small.text(message)
}

/**
 * Show success input
 * @param {*} input
 */
function showSuccess(input) {
    let parent = input.parent();
    let small = parent.find('small');
    input.removeClass('error');
    small.text('');
}

/**
 * Check input empty
 * @param {*} listInput list input to validate
 * @returns if input is blank => return true else false
 */
function checkEmptyInvalid(listInput) {
    let isEmptyError = false;
    listInput.forEach((input, index) => {
        if (input.val().trim() == '') {
            isEmptyError = true;
            showError(input, `The ${names[index]} should not blank`)
            $(`${arrId[index]}`).removeClass('border_input')
        }
        else {
            showSuccess(input)
        }
    });
    return isEmptyError;
}


/**
 * Check email wrong fromat
 * @param {*} input email input
 * @returns if email wrong return true else false
 */
function checkEmailError(input) {
    const regexEmail =
        /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/i;

    let isEmailError = !regexEmail.test(input.val().trim());
    if (regexEmail.test(input.val())) {
        showSuccess(input);
    }
    else {
        showError(input, 'Please input your correct email address')
    }
    return isEmailError;
}

function checkNumberError(input) {
    const regexNumber =
        /^[0-9]$/i;

    let isNumberError = !regexNumber.test(input.val().trim());
    if (regexNumber.test(input.val())) {
        showSuccess(input);
    }
    else {
        showError(input, 'Please only input number')
    }
    return isNumberError;
}

/**
 * Check format phone
 * @param {*} input phone input
 * @returns if wrong phone return false else true
 */
function checkPhoneError(input) {
    const regexPhone =
        /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/i;

    let isPhoneError = !regexPhone.test(input.val().trim());
    if (regexPhone.test(input.val())) {
        showSuccess(input);
    }
    else {
        showError(input, 'Please input your correct number')
    }
    return isPhoneError;
}

/**
 * Check length each input
 * @param {*} input input
 * @param {*} min
 * @param {*} max
 * @returns if true length return false else true
 */
function checkLengthError(input, min, max) {
    if(input.val().trim().length < min) {
        showError(input, `Min ${min} character`);
        return true;
    }
    else if(input.val().trim().length > max) {
        showError(input, `Max ${max} character`);
        return true;
    }
    else {
        showSuccess(input)
    }
    return false;
}

//-----------------------

function checkFromDateToDate(fromDate, toDate, indexFromDate, indexToDate) {
    var isFromDateToDateError;
    if (new Date(fromDate.val()) < new Date(toDate.val())) {
        $(`${arrId[indexFromDate]}`).addClass('border_input')
        $(`${arrId[indexToDate]}`).addClass('border_input')
        showSuccess(fromDate);
        showSuccess(toDate);
        isFromDateToDateError = false
    }
    else {
        isFromDateToDateError = true
        $(`${arrId[indexFromDate]}`).removeClass('border_input')
        $(`${arrId[indexToDate]}`).removeClass('border_input')
        if (checkEmptyInvalid([$(arrId[indexFromDate])]) && checkEmptyInvalid([$(arrId[indexToDate])])) {
            showError(fromDate, 'The from date should not blank')
            showError(toDate, 'The to date should not blank')
        } else if (checkEmptyInvalid([$(arrId[indexFromDate])]) && !checkEmptyInvalid([$(arrId[indexToDate])])) {
            $(`${arrId[indexToDate]}`).addClass('border_input')
            showError(fromDate, 'The from date should not blank')
        } else if (!checkEmptyInvalid([$(arrId[indexFromDate])]) && checkEmptyInvalid([$(arrId[indexToDate])])) {
            $(`${arrId[indexFromDate]}`).addClass('border_input')
            showError(toDate, 'The to date should not blank')
        } else {
            showError(fromDate, 'Please to date must be greater than from date')
            showError(toDate, 'Please to date must be greater than from date')
        }

    }
    return isFromDateToDateError;
}


function checkPassError(input) {
    const regexPass =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,50}$/;

    let isPassError = !regexPass.test(input.val().trim());
    if (regexPass.test(input.val())) {
        showSuccess(input);
    }
    else {
        showError(input, 'Please input uppercase, lowercase character and number')
    }
    return isPassError;
}

function checkDateCurrent(input) {
    let isCheckDateCurrent;
    if(new Date(input.val()) <= new Date()) {
        showSuccess(input);
        isCheckDateCurrent = false
    } else {
        showError(input, 'Please input date lower than ' + new Date().toLocaleDateString())
        isCheckDateCurrent = true
    }
    return isCheckDateCurrent;
}


function checkBirthDate(input, age) {
    let isCheckBirthDate;
    if(getAge(input.val()) >= age) {
        showSuccess(input);
        isCheckBirthDate = false
    } else {
        showError(input, 'Please input birth date higher than ' + age + ' year old')
        isCheckBirthDate = true
    }
    return isCheckBirthDate;
}

function getAge(dateString) {
    var today = new Date();
    var birthDate = new Date(dateString);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    return age;
}