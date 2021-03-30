package fa.spring.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import fa.spring.model.ShowDate;

public interface ShowDateService {
	
	List<ShowDate> getAll(LocalDate dateCurrent);
	ShowDate findByShowDateId(int id);
	void save(ShowDate showDate);
	ShowDate findByShowDate(Date showDate);
}
