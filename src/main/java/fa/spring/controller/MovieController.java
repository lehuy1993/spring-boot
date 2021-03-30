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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import fa.spring.model.Movie;
import fa.spring.model.Schedule;
import fa.spring.model.Type;
import fa.spring.service.AccountService;
import fa.spring.service.CinemaRoomService;
import fa.spring.service.MovieService;
import fa.spring.service.ScheduleService;
import fa.spring.service.TypeService;
import fa.spring.utility.MovieUtility;

@Controller
@RequestMapping("/admin")
public class MovieController {

	private static final Logger log = LoggerFactory.getLogger(MovieController.class);

	@Autowired
	private AccountService accountService;
	@Autowired
	private CinemaRoomService cinemaRoomService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private MovieUtility movieUtility;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	  	binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping("/movie")
	public String viewMovieList(Model model, Principal principal,
            @RequestParam(defaultValue = "1", required = false) int page,
            @RequestParam(required = false) String searchKey) {
		
		//Set pageable
		Pageable pageRequest = PageRequest.of(page - 1, 10);
		Page<Movie> moviePage = movieService.getAllMovieBySearchKey(searchKey, pageRequest);
		
		model.addAttribute("searchKey", searchKey);
        model.addAttribute("list", moviePage.getContent());
        model.addAttribute("totalPage", moviePage.getTotalPages());
        model.addAttribute("currentPage", page);
		return "admin/movie-list";
	}
	
	@GetMapping("/add-movie")
	public String addMovie(Model model) {
		model.addAttribute("movieForm", new Movie());
		model.addAttribute("types", typeService.getAllType());
		model.addAttribute("schedules", scheduleService.getAllSchedule());
		model.addAttribute("cinemaRoomList", cinemaRoomService.getAll());
		List<Type> types = typeService.getAllType();
		for (Type type : types) {
			log.debug("message" + type);

		}
		

		return "admin/movie-add";
	}
	
	@PostMapping("/add-movie")
	public String saveMoive(Model model, @ModelAttribute("movieForm") Movie movieForm, 
								BindingResult bindingResult, 
								@RequestParam("fileImage") MultipartFile multipartFile) throws IOException {

		movieUtility.validate(movieForm, bindingResult);

		if(multipartFile.getSize() == 0) {
			ObjectError error = new ObjectError("fileImage","Not empty");
			bindingResult.addError(error);
		}
		if (bindingResult.hasErrors()) {
			model.addAttribute("types", typeService.getAllType());
			model.addAttribute("schedules", scheduleService.getAllSchedule());
			model.addAttribute("cinemaRoomList", cinemaRoomService.getAll());
			return "admin/movie-add";
		}
		if (multipartFile.getSize() > 0) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			
			fileName = timestamp.getTime()+ "".concat("_" + fileName);
			movieForm.setLargeImage(fileName);
			movieForm.setSmallImage(fileName);
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
				throw new IOException("not save " + fileName);
			}

		}
		boolean result = movieService.saveMovie(movieForm);
		if(result)
			return "redirect:/admin/movie";
		else {
			model.addAttribute("failureMsg", "Unsuccessfully add");
			return "admin/movie-add";
		}
	}
	
	@GetMapping("/edit-movie/{id}")
	public String editMovie(@PathVariable String id, Model model) {

		// Using service to get a moive by id
		Optional<Movie> movieOptional = movieService.getMovieByMovieID(id);
		
		Set<Schedule> schedules = movieOptional.get().getSchedules();
		schedules.forEach((item)->{
			item.setStatus(0);
			
		});

		if(!movieOptional.isPresent()) {
			return "redirect:/admin/movie";
		}
		model.addAttribute("movieForm", movieOptional.get());
		model.addAttribute("types", typeService.getAllType());
		model.addAttribute("schedules", scheduleService.getAllSchedule());
		model.addAttribute("cinemaRoomList", cinemaRoomService.getAll());

		return "admin/movie-edit";
	}
	
	@SuppressWarnings("unused")
	@PostMapping("/edit-movie/{id}")
	public String updateMovie(@PathVariable String id,Model model, 
									@ModelAttribute("movieForm") Movie movieForm, 
									BindingResult bindingResult, 
									@RequestParam("fileImage") MultipartFile multipartFile,
									RedirectAttributes redirectAttributes) throws IOException {

		// Using service to get a moive by id
		Optional<Movie> movieOptional = movieService.getMovieByMovieID(id);
		if(!movieOptional.isPresent()) {
			return "redirect:/admin/movie";
		}
		
		movieUtility.validate(movieForm, bindingResult);
		model.addAttribute("types", typeService.getAllType());
		model.addAttribute("schedules", scheduleService.getAllSchedule());
		model.addAttribute("cinemaRoomList", cinemaRoomService.getAll());
		if (bindingResult.hasErrors()) {
			
			return "admin/movie-edit";
		}
		if (multipartFile.getSize() > 0) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			
			fileName = timestamp.getTime()+ "".concat("_" + fileName);
			movieForm.setLargeImage(fileName);
			movieForm.setSmallImage(fileName);
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
				throw new IOException("not save " + fileName);
			}

		}
		
		Set<Schedule> schedules = movieForm.getSchedules();
		ArrayList<String> list = new ArrayList<String>();
		schedules.forEach((item)->{
			Object editSchedule = movieService.findByScheduleId(item.getScheduleId(), id);
			ObjectMapper objectMapper = new ObjectMapper();
			 try {
				 String checkSchedule = objectMapper.writeValueAsString(editSchedule);
				 if (checkSchedule.length() > 4) {
					 log.debug("message"+ list);

					 list.add("1");
					 
				 }
				
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		
		});
		if (list.size() > 0 ) {

			model.addAttribute("msg", "Error Schedules");
			return "admin/movie-edit";
		}else {
			movieService.updateMovie(movieForm);
			redirectAttributes.addFlashAttribute("msg", "Edit Success");
			return "redirect:/admin/movie";
		}
	}

	@RequestMapping("/delete-movie/{id}")
	public String deleteMovie(@PathVariable String id, Model model) {
		movieService.deleteMovie(id);
		return "redirect:/admin/movie";
	}
	
	//Show Schedule With Cinemaroom ID use ajax
	@GetMapping("/showSchedule")
	public @ResponseBody String showSchedule(HttpServletRequest request) {
		String cinemaRoomId = request.getParameter("cinemaRoomId");
		
		int idCinemaRoom = Integer.parseInt(cinemaRoomId);
		List<Schedule> schedules = scheduleService.findByCinemaroomId(idCinemaRoom);
		ObjectMapper mapper = new ObjectMapper();
        String ajaxResponse = "";
        try {
			ajaxResponse = mapper.writeValueAsString(schedules);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse ;

	}
	
	//Show Schedule With Cinemaroom ID use ajax FORM EDIT
		@GetMapping("/editSchedule")
		public @ResponseBody String editSchedule(HttpServletRequest request) {
			String cinemaRoomId = request.getParameter("cinemaRoomId");
			int idCinemaRoom = Integer.parseInt(cinemaRoomId);
			List<Object[]> schedules = scheduleService.editMovie(idCinemaRoom);
			ObjectMapper mapper = new ObjectMapper();
	        String ajaxResponse = "";
	        try {
				ajaxResponse = mapper.writeValueAsString(schedules);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return ajaxResponse ;

		}
}