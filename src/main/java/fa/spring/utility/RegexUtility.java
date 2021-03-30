package fa.spring.utility;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
@Component("regexValidator")
public class RegexUtility {
	private Pattern pattern;
	private Matcher matcher;

	public final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	public static final String VALID_PHONE_REGEX = "^\\d{10}";
	public static final String VALID_FULLNAME_REGEX = "^[\\p{L} .'-]+$";


	public boolean valid( String regx_pattern, String regx) {
		pattern = Pattern.compile(regx);
		if (regx_pattern == null) {
			return false;
		}
		matcher = pattern.matcher(regx_pattern);
		return matcher.matches();

	}
}
