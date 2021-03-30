package fa.spring.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.imageio.spi.RegisterableService;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fa.spring.model.Account;
import fa.spring.model.Employee;
import fa.spring.model.Promotion;
import fa.spring.service.EmployeeService;
import fa.spring.service.RegisterService;
import fa.spring.utility.RegisterUtility;

@Controller
@RequestMapping("/admin")
public class EmployeeController {

	
	private static final Logger log = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private RegisterUtility registerUtility;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	// get add
	@GetMapping("/employee/add")
	public String getAdd(Model model) {
		if (!model.containsAttribute("employee")) {
			model.addAttribute("employee", new Account());
		}

		return "admin/employee-form";
	}
	
	// post add
	@PostMapping("/employee/add")
	public String postAdd(@ModelAttribute("employee") @Valid  Account account,
			BindingResult result,RedirectAttributes attributes,
			@RequestParam("fileImage") MultipartFile multipartFile
			) throws IOException {
		log.debug("message" + account);
	
		registerUtility.validate(account, result);
		
		if (result.hasErrors()) {
			return "admin/employee-form";
		}
		if (multipartFile.getSize() > 0) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			account.setImage(fileName);
			String uploadDir = "./src/main/webapp/resources/img";
			Path uploadPath = Paths.get(uploadDir);
			if (!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}
			try (InputStream inputStream = multipartFile.getInputStream()) {
				Path filePath = uploadPath.resolve(fileName);
				System.out.println(filePath.toFile().getAbsolutePath());
				Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				// TODO: handle exception
				throw new IOException("not save " + fileName);
			}
		}
		attributes.addFlashAttribute("msg", " Successfully add.");
		employeeService.save(account);
		return "redirect:/admin/employee";
	}
	
	//Get ALL
	@GetMapping("/employee")
	public String getAll(Model model) {
		List<Account> employees = registerService.findAllByRole(2);
		
		model.addAttribute("employees", employees);
		return "admin/employee-list";
	}
	
	// show update form
		@GetMapping(value = "/employee/update")
		public String showUpdateContentForm(@RequestParam("employeeId") String id, Model model) {
			Account employee = registerService.finByAccount(id).get();
			model.addAttribute("msg", "Update succsesfull");
			model.addAttribute("employee", employee);
			return "admin/employee-form";
	
		}
		
		//Delete
		@GetMapping(value = "/employee/delete")
		public String deleteContent(@RequestParam("employeeId") String id, final RedirectAttributes redirectAttributes) {
			
			Employee employee = employeeService.getByAccountId(id);
			String employeeId = employee.getEmployeeId();
			employeeService.delete(employeeId);
			registerService.delete(id);
			redirectAttributes.addFlashAttribute("msg", "Employee is deleted!");

			return "redirect:/admin/employee";

		}
	
	
}
