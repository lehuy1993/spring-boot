package fa.spring.service;

import java.util.List;

import fa.spring.model.ScheduleSeat;
import fa.spring.model.Seat;

public interface ScheduleSeatService {
	List<ScheduleSeat> findByScheduleIdAndShowDateId(int scheduleId, int showDateId);
	ScheduleSeat findBySeatId(Integer seatId);
	void save(ScheduleSeat seatUpdateId);
	void deleteByMovieId(String movieId);
}
