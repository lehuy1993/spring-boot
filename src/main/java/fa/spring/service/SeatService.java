package fa.spring.service;

import java.util.List;

import fa.spring.model.Seat;

public interface SeatService {
	List<Seat> findByCinemaRoom(int roomId);
	Seat findBySeatId(int seatId);
	void save(Seat seatUpdateId);
	List<Seat> findAll();
}
