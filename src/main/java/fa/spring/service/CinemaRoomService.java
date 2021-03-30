package fa.spring.service;

import java.util.List;

import fa.spring.model.CinemaRoom;

public interface CinemaRoomService {
	CinemaRoom findByCinemaRoomId(int roomId);
	List<CinemaRoom> getAll();
}
