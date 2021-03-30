package fa.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fa.spring.model.Schedule;

public interface ScheduleRepository  extends JpaRepository<Schedule, Integer>{
	

	List<Schedule> findByCinemaroomId(int cinemaRoomId);
	
	//Movie edit
	@Query(nativeQuery = true, value = "SELECT sc.cinemaroom_id,sc.schedule_id,sc.status,sc.schedule_time,msc.movie_id FROM schedule sc LEFT JOIN movie_schedule msc ON msc.schedule_id = sc.schedule_id WHERE sc.cinemaroom_id = ?")
	List<Object[]> editMovie(int cinemaRoomId);

}
