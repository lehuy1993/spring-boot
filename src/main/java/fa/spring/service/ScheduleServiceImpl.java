package fa.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.Schedule;
import fa.spring.repository.ScheduleRepository;
@Service
public class ScheduleServiceImpl  implements ScheduleService{

	@Autowired
	private ScheduleRepository scheduleRepository;


	@Override
	public Schedule findByScheduleId(int scheduleId) {
		// TODO Auto-generated method stub
		return scheduleRepository.getOne(scheduleId);
	}


	@Override
	public List<Schedule> getAllSchedule() {
		return scheduleRepository.findAll();
	}


	@Override
	public List<Schedule> findByCinemaroomId(int cinemaRoomId) {
		// TODO Auto-generated method stub
		return scheduleRepository.findByCinemaroomId(cinemaRoomId);
	}


	@Override
	public void save(Schedule schedule) {
		// TODO Auto-generated method stub
		scheduleRepository.save(schedule);
		
	}


	@Override
	public List<Object[]> editMovie(int cinemaRoomId) {
		// TODO Auto-generated method stub
		return scheduleRepository.editMovie(cinemaRoomId);
	}

}
