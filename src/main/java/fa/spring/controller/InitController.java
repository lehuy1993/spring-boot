package fa.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fa.spring.model.Movie;
import fa.spring.model.Promotion;
import fa.spring.service.MovieService;
import fa.spring.service.PromotionService;

@Controller
public class InitController {

	
	private static final Logger log = LoggerFactory.getLogger(InitController.class);

	@Autowired
	private MovieService movieService;
	
	@Autowired
	private PromotionService promotionService;

	@GetMapping("/")
	public String defaultAfterLogin(HttpServletRequest request, Model model) {
		
		if (request.isUserInRole("ROLE_ADMIN")) {
            return "redirect:/admin/";
        }
		if (request.isUserInRole("ROLE_EMPLOYEE")) {
            return "redirect:/employee/showtime";
        }
		List<Movie> movies = movieService.findByOrderByFromDateAsc();
		model.addAttribute("movies", movies);
		List<Promotion> promotions = promotionService.getAll();
		model.addAttribute("promotions", promotions);
		log.debug("message" + movies);
        return "/index/index";


	}
	@GetMapping("/index")
	public String viewIndex(Model model) {
		
		

        return "/index/index";


	}
}
