/*
 * package fa.spring.controller;
 * 
 * import java.security.Principal; import java.text.SimpleDateFormat; import
 * java.time.LocalDate; import java.util.Date; import java.util.List;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.beans.propertyeditors.CustomDateEditor; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.WebDataBinder; import
 * org.springframework.web.bind.annotation.CookieValue; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.InitBinder; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestBody; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody;
 * 
 * import com.fasterxml.jackson.core.JsonProcessingException; import
 * com.fasterxml.jackson.databind.ObjectMapper;
 * 
 * import fa.spring.model.Account; import fa.spring.model.CinemaRoom; import
 * fa.spring.model.Invoice; import fa.spring.model.Member; import
 * fa.spring.model.Movie; import fa.spring.model.Schedule; import
 * fa.spring.model.ScheduleSeat; import fa.spring.model.ShowDate; import
 * fa.spring.service.CinemaRoomService; import fa.spring.service.InvoiceService;
 * import fa.spring.service.MemberServiceImpl; import
 * fa.spring.service.MovieService; import fa.spring.service.RegisterService;
 * import fa.spring.service.ScheduleSeatService; import
 * fa.spring.service.ScheduleService; import fa.spring.service.ShowDateService;
 * 
 * @Controller
 * 
 * @RequestMapping("/employee") public class TicketManagement {
 * 
 * 
 * private static final Logger log =
 * LoggerFactory.getLogger(TicketManagement.class);
 * 
 * 
 * @Autowired private RegisterService registerService;
 * 
 * @Autowired private MemberServiceImpl memberService;
 * 
 * @Autowired private ShowDateService showDateService;
 * 
 * @Autowired private ScheduleService scheduleService;
 * 
 * @Autowired private InvoiceService invoiceServiceImpl;
 * 
 * @Autowired private MovieService movieService;
 * 
 * @Autowired private ScheduleSeatService seatService;
 * 
 * @Autowired private CinemaRoomService cinemaRoomService;
 * 
 * @InitBinder public void initBinder(WebDataBinder binder) { // Date -
 * dd/MM/yyyy SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
 * binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,
 * false)); }
 * 
 * @GetMapping("/showtime") public String showTimeMovie(Model model) { LocalDate
 * dateCurrent = LocalDate.now(); List<ShowDate> showDates =
 * showDateService.getAll(dateCurrent);
 * 
 * 
 * model.addAttribute("showDates", showDates); return "admin/movie-time"; }
 * 
 * @GetMapping("/booking/tickets/{movie}") public String showBooking(Model
 * model, Principal principal, @PathVariable("movie") String movieId,
 * 
 * @RequestParam("time") int time, @RequestParam("date") int date,
 * HttpServletResponse response){
 * 
 * 
 * // Show member String userName = principal.getName(); Account account =
 * registerService.findByUserName(userName); model.addAttribute("member",
 * account);
 * 
 * // Show movie
 * 
 * Movie movie = movieService.findByMovieId(movieId);
 * model.addAttribute("movie", movie); // Show cinemarRoom int roomId =
 * movie.getCinemaRoomId(); CinemaRoom cinemaRoom =
 * cinemaRoomService.findByCinemaRoomId(roomId); String cinemaRoomName =
 * cinemaRoom.getCinemaRoomName(); model.addAttribute("cinemaRoomName",
 * cinemaRoomName);
 * 
 * // Show time and date Schedule schedule =
 * scheduleService.findByScheduleId(time); String showTime =
 * schedule.getScheduleTime(); model.addAttribute("time",showTime); ShowDate
 * showdate = showDateService.findByShowDateId(date); SimpleDateFormat formatter
 * = new SimpleDateFormat("dd/MM/yyyy"); String showDate =
 * formatter.format(showdate.getShowDate());
 * model.addAttribute("date",showDate);
 * 
 * // Show seat List<ScheduleSeat> seats = seatService.findByScheduleId(time);
 * model.addAttribute("seats",seats);
 * 
 * return "admin/movie-book"; }
 * 
 * 
 * 
 * @GetMapping("/booking/tickets/info") public String
 * searchPerson(@RequestParam("member") String memberId, @RequestParam("check")
 * int check, Model model, HttpServletResponse response,Invoice
 * invoice, @CookieValue(value = "tickets") String test) {
 * 
 * Member member = memberService.findByMemberId(memberId);
 * 
 * Account account = member.getAccount(); int scource = 0; if (check == 1) {
 * 
 * scource = member.getScore(); member.setScore(0); memberService.save(member);
 * } model.addAttribute("member", member); model.addAttribute("scource",
 * scource); if (test.isEmpty()) { return "admin/movie-time"; } try {
 * 
 * model.addAttribute("member",account); invoice.setAccount(account);
 * invoiceServiceImpl.save(invoice, test); return "admin/booking-information" ;
 * }catch (NullPointerException e) { // TODO: handle exception
 * e.printStackTrace(); } return "" ;
 * 
 * }
 * 
 * 
 * 
 * }
 */