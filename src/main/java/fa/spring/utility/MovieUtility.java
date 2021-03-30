package fa.spring.utility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import fa.spring.model.Movie;

@Component
public class MovieUtility  implements Validator{
	
	private static final Logger log = LoggerFactory.getLogger(MovieUtility.class);
	
	@Autowired
	@Qualifier("regexValidator")
	RegexUtility regexUtility;
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Movie.class.equals(clazz);
	}

	@Override
	public void validate(Object o, Errors errors) {
		// TODO Auto-generated method stub
		Movie movie = (Movie) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movieNameEnglish", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movieNameVN", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fromDate", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "toDate", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "actor", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movieProductionCompany", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "director", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "duration", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "version", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cinemaRoomId", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "types", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "schedules", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "NotEmpty");
		
		if(movie.getFromDate()!=null && movie.getToDate()!=null) {
	        if (!movie.getFromDate().before(movie.getToDate())) {
	            errors.rejectValue("toDate", "Time.movieForm.toDate");
	        }
		}
	}

}
