package fa.spring.utility;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static final Timestamp convertStringToTimestamp(String dateString) throws ParseException {
        if(dateString.trim().length()==0)
            return null;
        SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
        try {
            Date date = formatter.parse(dateString);
            return new  Timestamp(date.getTime());
        } catch (Exception e) {
            return null;
        }
    }
}
