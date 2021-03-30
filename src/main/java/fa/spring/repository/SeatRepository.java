package fa.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fa.spring.model.Seat;

public interface SeatRepository  extends JpaRepository<Seat, Integer>{
	

	@Query( nativeQuery = true, value ="SELECT * FROM Seat WHERE cinema_room_id = ? ")
	List<Seat> findByCinemaRoom(int roomId);
	

}
