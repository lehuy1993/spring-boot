package fa.spring.service;

import java.util.List;

import fa.spring.model.Schedule;

public interface ScheduleService {
	Schedule findByScheduleId(int scheduleId);
	List<Schedule> getAllSchedule();
	
	List<Schedule> findByCinemaroomId(int cinemaRoomId);
	void save(Schedule schedule);
	
	List<Object[]> editMovie(int cinemaRoomId);
}
