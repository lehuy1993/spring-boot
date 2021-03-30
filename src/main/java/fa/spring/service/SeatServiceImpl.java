package fa.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.Seat;
import fa.spring.repository.SeatRepository;
@Service
public class SeatServiceImpl  implements SeatService{

	@Autowired
	private SeatRepository seatRepository;

	@Override
	public List<Seat> findByCinemaRoom(int roomId) {
		// TODO Auto-generated method stub
		return seatRepository.findByCinemaRoom(roomId);
	}

	@Override
	public Seat findBySeatId(int seatId) {
		// TODO Auto-generated method stub
		return seatRepository.getOne(seatId);
	}

	@Override
	public void save(Seat seatUpdateId) {
		// TODO Auto-generated method stub
		 seatRepository.save(seatUpdateId);
	}

	@Override
	public List<Seat> findAll() {
		// TODO Auto-generated method stub
		return seatRepository.findAll();
	}


	
	

}
