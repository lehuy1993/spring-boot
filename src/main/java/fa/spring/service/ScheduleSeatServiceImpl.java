package fa.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.CinemaRoom;
import fa.spring.model.ScheduleSeat;
import fa.spring.repository.CinemaRoomRepository;
import fa.spring.repository.ScheduleRepository;
import fa.spring.repository.ScheduleSeatRepository;
@Service
public class ScheduleSeatServiceImpl  implements ScheduleSeatService{

	@Autowired
	private ScheduleSeatRepository scheduleSeatRepository;



	@Override
	public List<ScheduleSeat> findByScheduleIdAndShowDateId(int scheduleId, int showDateId) {
		// TODO Auto-generated method stub
		return scheduleSeatRepository.findByScheduleIdAndShowDateId(scheduleId, showDateId);
	}



	@Override
	public ScheduleSeat findBySeatId(Integer seatId) {
		// TODO Auto-generated method stub
		return scheduleSeatRepository.getOne(seatId);
	}



	@Override
	public void save(ScheduleSeat seatUpdateId) {
		// TODO Auto-generated method stub
		scheduleSeatRepository.save(seatUpdateId);
	}



	@Override
	public void deleteByMovieId(String movieId) {
		// TODO Auto-generated method stub
		scheduleSeatRepository.deleteByMovieId(movieId);
	}
	

}
