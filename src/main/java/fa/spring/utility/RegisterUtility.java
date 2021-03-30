package fa.spring.utility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import fa.spring.model.Account;
import fa.spring.service.RegisterService;

@Component
public class RegisterUtility  implements Validator{
	
	private static final Logger log = LoggerFactory.getLogger(RegisterUtility.class);


	@Autowired
	@Qualifier("regexValidator")
	RegexUtility regexUtility;
	
	@Autowired
	private RegisterService registerService;
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Account.class.equals(clazz);
	}

	@Override
	public void validate(Object o, Errors errors) {
		// TODO Auto-generated method stub
		Account account = (Account) o;
		log.debug("message"+ account.getAccountID());

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullName", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dateOfBirth", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "identityCard", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNumber", "NotEmpty");
		
		if (!regexUtility.valid(account.getEmail(), regexUtility.EMAIL_PATTERN)) {

			errors.rejectValue("email", "Pattern.email");
		}
		if (account.getUserName().length() < 6 || account.getUserName().length() > 32) {
            errors.rejectValue("userName", "Size.userName");
        }
		
        if (registerService.findByUserName(account.getUserName()) != null && account.getAccountID() == null) {
            errors.rejectValue("userName", "Duplicate.userName");
        }
        if (  account.getAccountID() == null && registerService.findByEmail(account.getEmail()) != null ) {
        	System.out.println(22);
            errors.rejectValue("email", "Duplicate.email");
        }

       
        if (account.getPassword().length() < 7 ) {
            errors.rejectValue("password", "Size.password");
        }

        if (!account.getConfirmPassword().equals(account.getPassword())) {
            errors.rejectValue("confirmPassword", "Diff.confirmPassword");
        }
        if (!regexUtility.valid(account.getPhoneNumber(), regexUtility.VALID_PHONE_REGEX)) {

			errors.rejectValue("phoneNumber", "Pattern.phone");
		}
        if (!regexUtility.valid(account.getFullName(), regexUtility.VALID_FULLNAME_REGEX)) {

			errors.rejectValue("fullName", "Pattern.fullName");
		}

	}

}
