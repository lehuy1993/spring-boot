package fa.spring.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import fa.spring.model.Promotion;
import fa.spring.service.PromotionService;

@Controller
@RequestMapping("/admin")
public class PormotionController {

	
	private static final Logger log = LoggerFactory.getLogger(PormotionController.class);

	@Autowired
	private PromotionService promotionService;


	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	  	binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	
	/* Add promotion */
	@GetMapping("/promotion/add")
	public String showAdd(Model model) {
		if (!model.containsAttribute("promotion")) {
			model.addAttribute("promotion", new Promotion());
		}

		return "admin/promotion-form";
	}

	@PostMapping("/promotion/add")
	public String addPromotion(@ModelAttribute("promotion") @Valid Promotion promotion, BindingResult result,
			@RequestParam("fileImage") MultipartFile multipartFile,
			RedirectAttributes attributes
			) throws IOException {
		log.debug("message" + promotion);
		if (result.hasErrors()) {
			return "admin/promotion-form";
		}
		if (multipartFile.getSize() > 0) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			promotion.setImage(fileName);
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
			attributes.addFlashAttribute("msg", " Unsuccessfully add.");
		}
		

		promotionService.save(promotion);
		return "redirect:/admin/promotion";

	}
//	Show list
	
	@GetMapping("/promotion")
	public String showList(Model model) {
		List<Promotion> promotions = promotionService.getAll();
		model.addAttribute("promotions", promotions);
		
		return "admin/promotion-list";
	}
	
	// show update form
		@RequestMapping(value = "/promotion/update", method = RequestMethod.GET)
		public String showUpdateContentForm(@RequestParam("promotionId") int id, Model model) {


			Promotion promotion = promotionService.findBypromotionId(id).get();
			model.addAttribute("msg", "Update succsesfull");
			model.addAttribute("promotion", promotion);
			return "admin/promotion-form";

		}
	
	//Delete
	@GetMapping(value = "/promotion/delete")
	public String deleteContent(@RequestParam("promotionId") int id, final RedirectAttributes redirectAttributes) {


		promotionService.delete(id);

		redirectAttributes.addFlashAttribute("msg", "Promotion is deleted!");

		return "redirect:/admin/promotion";

	}
}
