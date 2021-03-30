package fa.spring.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import fa.spring.model.Invoice;
import fa.spring.model.Member;
import fa.spring.model.ScheduleSeat;
import fa.spring.repository.InvoiceRepository;

@Service
public class InvoiceServiceImpl implements InvoiceService {

    // Declare InvoiceRepository
    @Autowired
    InvoiceRepository invoiceRepository;

	@Autowired
	private ScheduleSeatService seatService;
	@Autowired
	private MemberService memberService;
    
    @Autowired  
    EntityManager em;

    private final Logger logger = LoggerFactory.getLogger(InvoiceServiceImpl.class);
    /**
     * function display all booked member
     * 
     * @param accountId
     * @return list of invoice
     */
    @Override
    public Page<Invoice> getAllInvoiceByAccountId(String accountId, Pageable pageable) {
        return invoiceRepository.findAllByAccount_AccountID(accountId, pageable);
    }

    @Override
    public Page<Invoice> getScoreByUser(Timestamp fromDate, Timestamp toDate, int sroceType, Pageable pageable) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Invoice> cq = cb.createQuery(Invoice.class);
        Root<Invoice> iRoot = cq.from(Invoice.class);
        Predicate predicateForBlueColor = cb.notEqual(sroceType==1?iRoot.get("addScore"):iRoot.get("useScore"), 0);
        Predicate predicate = cb.or(iRoot.get("addScore"), iRoot.get("addScore"));
        if(fromDate != null && toDate !=null){
            Predicate predicateFromDatet = cb.between(iRoot.get("bookingDate"), fromDate, toDate);
            cq.where(predicateForBlueColor, predicateFromDatet);
        }else{
            cq.where(predicateForBlueColor);
        }
        List<Invoice> list = em.createQuery(cq).getResultList();
        return new PageImpl<Invoice>(list, pageable,  list.size());
    }
	@Override
	public void save(Invoice invoice, String test) {
		// JSON

		JsonObject jsonObject = new JsonParser().parse(test).getAsJsonObject();
		int totalMoney = Integer.parseInt(jsonObject.get("price").toString());
		invoice.setTotalMoney(totalMoney);
		int addScore = totalMoney / 100;
		invoice.setAddScore(addScore);
		invoice.setBookingDate(LocalDateTime.now());
		String movieName = jsonObject.get("movieName").getAsString();
		String time = jsonObject.get("time").getAsString();
		String date = time.split(",")[1];
		date = date.substring(0, date.length() - 1);

		try {
			Date scheduleShow = new SimpleDateFormat("dd/MM/yyyy").parse(date);
			invoice.setScheduleShow(scheduleShow);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String showTime = time.split(",")[0];
		showTime = showTime.substring(1, showTime.length());
		invoice.setScheduleShowTime(showTime);
		invoice.setMovieName(movieName);
		/* Getseat */
		String label = jsonObject.get("label").toString();

		JsonObject jsonObject2 = new JsonParser().parse(label).getAsJsonObject();
		String seat = "";
		try {

			seat = seat.concat(jsonObject2.get("VIP").getAsString() + " , ");

		} catch (Exception e) {
			seat = "";
		}
		try {

			seat = seat.concat( jsonObject2.get("Thường").getAsString());

		} catch (Exception e) {
			seat = "";
		}
		// Get id seat
		String seatId = jsonObject.get("seatId").toString();
		JsonObject jsonSeatId = new JsonParser().parse(seatId).getAsJsonObject();
		String id = jsonSeatId.get("seatId").getAsString();
		//12, 20
		 
		String[] list = id.split(", ");
		 for (String i : list) {
			 int idseat=Integer.parseInt(i); 
			 
			 ScheduleSeat seatUpdateId = seatService.findBySeatId(idseat);
			 seatUpdateId.setSeatStatus(0);
			
	      }		
			

		String invoiceId = UUID.randomUUID().toString().replace("-", "").substring(0, 9);
		invoice.setInvoiceId(invoiceId);
		invoice.setSeat(seat);
		String accountId = invoice.getAccount().getAccountID();
		Member member = memberService.findByAccount(accountId);
		member.setScore(addScore);
		memberService.save(member);

		invoiceRepository.save(invoice);

	}

	@Override
	public List<Invoice> findAllBySearchKey(String searchKey) {
		// TODO Auto-generated method stub
		return invoiceRepository.findAllBySearchKey(searchKey);
	}

	@Override
	public Optional<Invoice> findbyInvoiceId(String invoiceId) {
		// TODO Auto-generated method stub
		return invoiceRepository.findById(invoiceId);
	}

	// Update status 
	@Override
	public void save(Invoice invoice) {
		// TODO Auto-generated method stub
		invoiceRepository.save(invoice);
	}

	@Override
	public List<Invoice> findByOrderByBookingDateAsc() {
		// TODO Auto-generated method stub
		return invoiceRepository.findByOrderByBookingDateAsc();
	}

	
}
