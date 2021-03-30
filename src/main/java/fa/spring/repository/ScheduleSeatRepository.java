package fa.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.spring.model.ScheduleSeat;

public interface ScheduleSeatRepository  extends JpaRepository<ScheduleSeat, Integer>{
	

	List<ScheduleSeat> findByScheduleIdAndShowDateId(int scheduleId, int showDateId);
	void deleteByMovieId(String movieId);

}
