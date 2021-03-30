package fa.spring.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.spring.model.Invoice;
import fa.spring.model.Movie;

@Repository
public interface InvoiceRepository extends JpaRepository< Invoice, String > {
    
    Page<Invoice> findAllByAccount_AccountID(String accountId,  Pageable pageable);
    @Query( nativeQuery = true, value ="SELECT * FROM Invoice WHERE account_id "
            + "LIKE ?1 OR invoice_id LIKE ?1   ORDER BY   booking_date ASC")
    List<Invoice> findAllBySearchKey(String searchKey);
    
    // list invoice
    List<Invoice> findByOrderByBookingDateAsc();
}
