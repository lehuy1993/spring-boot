package fa.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import fa.spring.model.Account;
import fa.spring.service.RegisterService;
import fa.spring.utility.RegisterUtility;

@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;
	@Autowired
	private RegisterUtility registerUtility;



	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@GetMapping("/register")
	public String registration(Model model) {
		model.addAttribute("registerForm", new Account());
		return "register";
	}

	@PostMapping("/register")
	public String registration(@ModelAttribute("registerForm") Account registerForm, BindingResult bindingResult) {

		registerUtility.validate(registerForm, bindingResult);
		if (bindingResult.hasErrors()) {
			return "register";
		}

		registerForm.setRegisterDate(new Date());
		registerService.save(registerForm);
		


		return "redirect:/login";
	}


	@GetMapping("/403")
	public String accessDenied() {
		return "403";
	}


}
