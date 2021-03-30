package fa.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import fa.spring.model.Member;
import fa.spring.service.MemberService;

@RestController
public class TestContorller {

	@Autowired
	private MemberService memberService;
	
	private static final Logger log = LoggerFactory.getLogger(TestContorller.class);

	 @GetMapping("/api/search")
	    public @ResponseBody String searchPerson(HttpServletRequest request) {
	        String searchName = request.getParameter("search");

	      Member users = memberService.findByMemberId(searchName);
	        ObjectMapper mapper = new ObjectMapper();
	        String ajaxResponse = "";
	        try {
				ajaxResponse = mapper.writeValueAsString(users);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return ajaxResponse ;
	        

	    }
	   

}
