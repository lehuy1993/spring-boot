package fa.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.spring.model.CinemaRoom;

public interface CinemaRoomRepository  extends JpaRepository<CinemaRoom, Integer>{
	

	CinemaRoom findByCinemaRoomId(int roomId);

}
