package fa.spring.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fa.spring.model.Account;
import fa.spring.model.Invoice;
import fa.spring.model.Member;
import fa.spring.model.Roles;
import fa.spring.repository.RegisterRepository;
import fa.spring.repository.RoleRepository;
import fa.spring.service.AccountService;
import fa.spring.service.InvoiceService;
import fa.spring.service.MemberService;
import fa.spring.service.MovieService;
import fa.spring.service.RegisterService;
import fa.spring.utility.DateUtils;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private RegisterService registerService;

	@Autowired
	private InvoiceService invoiceService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MovieService movieService;

	@Autowired
	private RegisterRepository registerRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// Date - dd/MM/yyyy
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@GetMapping("/info")
	public String showGetInfo(Model model, Principal principal) {
		String userName = principal.getName();
		Account account = registerService.findByUserName(userName);
		model.addAttribute("member", account);
		return "member-info";
	}

	@PostMapping("/info")
	public String updateMember(@ModelAttribute("member") Account member,
			@RequestParam("fileImage") MultipartFile multipartFile) throws IOException {
		Roles roles = roleRepository.findByRoleName("ROLE_MEMBER");
        member.setRoles(roles);
		if (multipartFile.getSize() > 0) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			fileName = member.getAccountID().concat("_" + fileName);
			member.setImage(fileName);
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

		registerRepository.save(member);

		return "member-info";
	}

	@RequestMapping(value = "/booked-ticket")
	public String requestMethodName(Model model, Principal principal,
			@RequestParam(defaultValue = "1", required = false) int page,
			@RequestParam(defaultValue = "10", required = false) int size) {

		Account account = accountService.getAccountByUsername(principal.getName());
		Member member = memberService.getMemberByAccountID(account.getAccountID()).get();

		Pageable pageRequest = PageRequest.of(page - 1, size);

		Page<Invoice> invoicePage = invoiceService.getAllInvoiceByAccountId(account.getAccountID(), pageRequest);

		model.addAttribute("image", account.getImage());
		model.addAttribute("fullName", account.getFullName());
		model.addAttribute("score", member.getScore());
		model.addAttribute("list", invoicePage.getContent());
		model.addAttribute("totalPage", invoicePage.getTotalPages());
		model.addAttribute("currentPage", page);

		return "booked-ticket";
	}

	@RequestMapping(value = "/history")
	public String historyOfMember(Model model, Principal principal,
			@RequestParam(defaultValue = "1", required = false) int page,
			@RequestParam(defaultValue = "", required = false) String fromDate,
			@RequestParam(defaultValue = "", required = false) String toDate,
			@RequestParam(defaultValue = "1", required = false) int scoreType) throws ParseException {

		Account account = accountService.getAccountByUsername(principal.getName());

		Member member = memberService.getMemberByAccountID(account.getAccountID()).get();

		Pageable pageRequest = PageRequest.of(page - 1, 10);

		Timestamp timestampToDate = null;
		Timestamp timestampFromDate = null;
		try {
			timestampToDate = DateUtils.convertStringToTimestamp(toDate);
			timestampFromDate = DateUtils.convertStringToTimestamp(fromDate);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		Page<Invoice> invoicePage = invoiceService.getScoreByUser(timestampFromDate, timestampToDate, scoreType,
				pageRequest);
		log.debug(invoicePage.toString());

		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", toDate);
		model.addAttribute("scoreType", scoreType);
		model.addAttribute("image", account.getImage());
		model.addAttribute("fullName", account.getFullName());
		model.addAttribute("score", member.getScore());
		model.addAttribute("list", invoicePage.getContent());
		model.addAttribute("totalPage", invoicePage.getTotalPages());
		model.addAttribute("currentPage", page);

		return "history";
	}

	@RequestMapping(value = "/search")
	public String historyOfMember(Model model, Principal principal, @RequestParam(defaultValue = "") String key) {
		log.debug("message " + key);

		Account account = accountService.getAccountByUsername(principal.getName());

		Member member = memberService.getMemberByAccountID(account.getAccountID()).get();

		model.addAttribute("list", movieService.getMovieBySearchKey(key));
		model.addAttribute("image", account.getImage());
		model.addAttribute("fullName", account.getFullName());
		model.addAttribute("score", member.getScore());
		return "member-search";
	}
}
