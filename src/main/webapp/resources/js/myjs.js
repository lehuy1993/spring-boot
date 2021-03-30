const valueNull = 'Please enter value';
const emailError = 'Please input correct email.(email@example.com)';
const emailLength = 'Email max length 50 min lenght 5';
const passwordLength = 'Password max length 30 min 8';
const userLength = 'Username  max length 30 min 3';
const ok = "OK";
const lookGood = "Look good!";

function validateEmail(email) {
    const emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!email.value) {
        return valueNull;
    }
    if (email.value.length <= 5 || email.value.length >= 50) {
        return emailLength;
    }

    if (!emailPattern.test(email.value)) {
        return emailError;
    }
    return ok;
}

function validatePassword(password) {
    if (!password.value) {
        return valueNull
    }
    if (password.value.length <= 1 || password.value.length >= 30) {
        return passwordLength;
    }
    return ok;
}

function validateUserName(username) {
    if (!username.value) {
        return valueNull
    }
    if (username.value.length <= 3 || username.value.length >= 30) {
        return userLength;
    }
    return ok;
}

function isValidate(id, value, userValidateResult) {
    id.classList.add('is-valid');
    id.classList.replace('is-valid', 'is-invalid');
    document.querySelector(value).innerHTML = userValidateResult;
    document.querySelector(value).classList.remove('valid-feedback');
    document.querySelector(value).classList.add('invalid-feedback');
}

function notValidate(id, value) {

    id.classList.add('is-invalid');
    id.classList.replace('is-invalid', 'is-valid');
    document.querySelector(value).innerHTML = "";
    document.querySelector(value).classList.remove('invalid-feedback');
    document.querySelector(value).classList.add('valid-feedback');
}

// validate login form

function validateLogin() {
    let inputUserName = document.querySelector('#inputUserName');
    let inputPassword = document.querySelector('#inputPassword');

    let userValidateResult = validateUserName(inputUserName);
    let validateP = validatePassword(inputPassword);
    if (ok !== userValidateResult) {
        isValidate(inputUserName, '#inputUserName + div', userValidateResult);

    } else {
        notValidate(inputUserName, '#inputUserName + div');

    }
    if (ok !== validateP) {
        isValidate(inputPassword, '#inputPassword + div', validateP);
    } else {
        notValidate(inputPassword, '#inputPassword + div');

    }
}