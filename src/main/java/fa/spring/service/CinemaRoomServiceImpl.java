package fa.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.CinemaRoom;
import fa.spring.repository.CinemaRoomRepository;
@Service
public class CinemaRoomServiceImpl  implements CinemaRoomService{

	@Autowired
	private CinemaRoomRepository cinemaRoomRepository;

	@Override
	public CinemaRoom findByCinemaRoomId(int roomId) {
		// TODO Auto-generated method stub
		return cinemaRoomRepository.findByCinemaRoomId(roomId);
	}

	@Override
	public List<CinemaRoom> getAll() {
		// TODO Auto-generated method stub
		return cinemaRoomRepository.findAll();
	}
	

}
