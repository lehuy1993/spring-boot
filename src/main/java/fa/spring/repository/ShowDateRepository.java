package fa.spring.repository;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fa.spring.model.ShowDate;

public interface ShowDateRepository extends JpaRepository<ShowDate, Integer>{

	@Query( nativeQuery = true, value ="SELECT  * FROM show_dates WHERE show_date >= ?1 ORDER BY show_date ASC ")
	List<ShowDate> getAll(LocalDate dateCurrent);
	
	ShowDate findByShowDate(Date showDate);
}
