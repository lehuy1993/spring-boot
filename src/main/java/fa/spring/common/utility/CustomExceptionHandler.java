package fa.spring.common.utility;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import fa.spring.model.ErrorResponse;

@SuppressWarnings({"unchecked","rawtypes"})
@ControllerAdvice
public class CustomExceptionHandler  extends ResponseEntityExceptionHandler{

	@ExceptionHandler(Exception.class)
    public final ResponseEntity<Object> handleAllExceptions(Exception ex, WebRequest request) {
        List<String> details = new ArrayList<>();
        details.add(ex.getLocalizedMessage());
        ErrorResponse error = new ErrorResponse("Server Error", details);
        return new ResponseEntity(error, HttpStatus.INTERNAL_SERVER_ERROR);
    }
	
	 @ExceptionHandler(ClassNotFoundException.class)
	    public final ResponseEntity<Object> handleUserNotFoundException(ClassNotFoundException ex, WebRequest request) {
	        List<String> details = new ArrayList<>();
	        details.add(ex.getLocalizedMessage());
	        ErrorResponse error = new ErrorResponse("Record Not Found", details);
	        return new ResponseEntity(error, HttpStatus.NOT_FOUND);
	    }
	@ExceptionHandler(NullPointerException.class)
	 
	 public final ResponseEntity<Object> handleUserNotFoundException(NullPointerException ex, WebRequest request) {
	        List<String> details = new ArrayList<>();
	        details.add(ex.getLocalizedMessage());
	        ErrorResponse error = new ErrorResponse("Record Not Found", details);
	        return new ResponseEntity(error, HttpStatus.NOT_FOUND);
	    }
	    @Override
	    protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex, HttpHeaders headers, HttpStatus status, WebRequest request) {
	        List<String> details = new ArrayList<>();
	        for(ObjectError error : ex.getBindingResult().getAllErrors()) {
	            details.add(error.getDefaultMessage());
	        }
	        ErrorResponse error = new ErrorResponse("Validation Failed", details);
	        return new ResponseEntity(error, HttpStatus.BAD_REQUEST);
	    }
}
