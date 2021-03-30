package fa.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CinemaRoom {

	private int cinemaRoomId;
	private String cinemaRoomName;
	private int seatQuantity;
	
	@Id
	@Column(length = 10)
	public int getCinemaRoomId() {
		return cinemaRoomId;
	}
	public void setCinemaRoomId(int cinemaRoomId) {
		this.cinemaRoomId = cinemaRoomId;
	}
	public String getCinemaRoomName() {
		return cinemaRoomName;
	}
	public void setCinemaRoomName(String cinemaRoomName) {
		this.cinemaRoomName = cinemaRoomName;
	}
	@Column(length = 10)
	public int getSeatQuantity() {
		return seatQuantity;
	}
	public void setSeatQuantity(int seatQuantity) {
		this.seatQuantity = seatQuantity;
	}
	@Override
	public String toString() {
		return "CinemaRoom [cinemaRoomId=" + cinemaRoomId + ", cinemaRoomName=" + cinemaRoomName + ", seatQuantity="
				+ seatQuantity + "]";
	}
	public CinemaRoom(int cinemaRoomId, String cinemaRoomName, int seatQuantity) {
		super();
		this.cinemaRoomId = cinemaRoomId;
		this.cinemaRoomName = cinemaRoomName;
		this.seatQuantity = seatQuantity;
	}
	public CinemaRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
