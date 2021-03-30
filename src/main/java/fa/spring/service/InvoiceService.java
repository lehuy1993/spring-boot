package fa.spring.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.spring.model.Invoice;
import fa.spring.model.Member;

public interface InvoiceService {
    
	public void save(Invoice invoice, String test);
	Page<Invoice> getAllInvoiceByAccountId(String accountId, Pageable pageable);

    Page<Invoice> getScoreByUser(Timestamp fromDate, Timestamp toDate, int sroceType, Pageable pageable);
    // Get  invoices by booking id and accoutid
    List<Invoice> findAllBySearchKey(String searchKey);
    // Get iinvoice by id
    Optional<Invoice> findbyInvoiceId(String invoiceId);
    
    void save(Invoice invoice);
    
    List<Invoice> findByOrderByBookingDateAsc();
}
