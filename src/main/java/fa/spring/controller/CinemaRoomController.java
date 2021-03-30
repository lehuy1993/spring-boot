package fa.spring.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import fa.spring.model.CinemaRoom;
import fa.spring.model.ScheduleSeat;
import fa.spring.model.Seat;
import fa.spring.service.CinemaRoomService;
import fa.spring.service.SeatService;

@Controller
@RequestMapping("/admin")
public class CinemaRoomController {

	
	private static final Logger log = LoggerFactory.getLogger(CinemaRoomController.class);

	@Autowired
	private CinemaRoomService cinemaRoomService;
	
	@Autowired
	private SeatService seatService;
	
	/*Display list of cinema rooms*/
	@GetMapping("/cinemaroom")
	public String showList(Model model) {
		
	List<CinemaRoom> cinemaRooms = cinemaRoomService.getAll();
	model.addAttribute("cinemarooms", cinemaRooms);
	// get list seat
	List<Seat> seats = seatService.findAll();
	model.addAttribute("seats", seats);

	return "admin/cinemaroom-list";
	}
	
	/*Display list of cinema rooms Cinema room detail*/
	@GetMapping("/cinemaroom/info/{cienmaroomId}")
	public String showRoomDetail(@PathVariable("cienmaroomId") int cienmaroomId,Model model){
		List<Seat> seats = seatService.findByCinemaRoom(cienmaroomId);
		model.addAttribute("seats", seats);
		model.addAttribute("cinemaroomId", cienmaroomId);
		return "admin/cinemaroom-detail";

	}
	
	@GetMapping("/cinemaroom/updateType")
	public String afterUpdate(HttpServletRequest request) {
		
		String seatId = request.getParameter("seatID");
		log.debug("message" + seatId );

		if (seatId != null) {
			JsonObject jsonSeatId = new JsonParser().parse(seatId).getAsJsonObject();
			String id = jsonSeatId.get("seatId").getAsString();
			
			String[] list = id.split(", ");
			 
			 for (String i : list) {
				 int idseat=Integer.parseInt(i); 
				Seat seat = seatService.findBySeatId(idseat);
				if (seat.getSeatType() == 0) {
					seat.setSeatType(1);
				}else {
					seat.setSeatType(0);
				}
				seatService.save(seat);
		      }		
			 return "redirect:/admin/cinemaroom";
		}
		return "redirect:/admin/cinemaroom";
	}
	
}
