package fa.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import fa.spring.model.Account;
import fa.spring.model.Invoice;
import fa.spring.service.InvoiceService;
import fa.spring.service.RegisterService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);


	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private InvoiceService invoiceService;

	
	//View List member
		@GetMapping("/")
		public String showMember(Model model ) {
			List<Account> members = registerService.findAllByRole(3);
			if (members != null) {
				model.addAttribute("members", members);
			}

			return "admin/member-list";
		}
		// Ticket booking management - Booking list
		@GetMapping("/bookinglist")
		public String showBookingList(Model model) {
			List<Invoice> invoices = invoiceService.findByOrderByBookingDateAsc();
			model.addAttribute("invoices", invoices);
			return "admin/booking-list";
		}
		
		// Get data list search ajax
		@GetMapping("/bookinglist/search")
	    public @ResponseBody String searchPerson(HttpServletRequest request) {
	        String searchName = request.getParameter("search");
	       

	      List<Invoice> invoices = invoiceService.findAllBySearchKey(searchName);
	        ObjectMapper mapper = new ObjectMapper();
	        String ajaxResponse = "";
	        try {
				ajaxResponse = mapper.writeValueAsString(invoices);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return ajaxResponse ;
	        

	    }
			// Get booking by id
			@GetMapping("/bookinglist/{id}")
			public String showInfoBookingList(Model model, @PathVariable("id") String invoiceId) {
				Invoice invoice = invoiceService.findbyInvoiceId(invoiceId).get();
				model.addAttribute("invoice", invoice);
				return "admin/booking-list-info";
			}
			// Update satus invoice
			@GetMapping("/bookinglist/{id}/{true}")
			public String updateStatus( RedirectAttributes attributes ,Model model,@PathVariable("true") String status,  @PathVariable("id") String invoiceId) {
				Invoice invoice = invoiceService.findbyInvoiceId(invoiceId).get();
				invoice.setStatus(1);
				invoiceService.save(invoice);
				attributes.addFlashAttribute("msg", "You have been confirm successfully.");
				return "redirect:/admin/bookinglist";
			}
	
			
}
