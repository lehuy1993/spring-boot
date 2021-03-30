package fa.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Seat {

	private int seatId;
	
	private CinemaRoom cinemaRoom;
	
	private String seatColumn;
	private int seatRow;
	private int seatStatus;
	private int seatType;
	
	@Id
	@Column(length = 10)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	@ManyToOne
	@JoinColumn(name = "CINEMA_ROOM_ID")
	public CinemaRoom getCinemaRoom() {
		return cinemaRoom;
	}
	public void setCinemaRoom(CinemaRoom cinemaRoom) {
		this.cinemaRoom = cinemaRoom;
	}
	
	public String getSeatColumn() {
		return seatColumn;
	}
	public void setSeatColumn(String seatColumn) {
		this.seatColumn = seatColumn;
	}
	@Column(length = 10)
	public int getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(int seatRow) {
		this.seatRow = seatRow;
	}
	@Column(length = 1)
	public int getSeatStatus() {
		return seatStatus;
	}
	public void setSeatStatus(int seatStatus) {
		this.seatStatus = seatStatus;
	}
	@Column(length = 1)
	public int getSeatType() {
		return seatType;
	}
	public void setSeatType(int seatType) {
		this.seatType = seatType;
	}
	@Override
	public String toString() {
		return "Seat [seatId=" + seatId + ", cinemaRoom=" + cinemaRoom + ", seatColumn=" + seatColumn + ", seatRow="
				+ seatRow + ", seatStatus=" + seatStatus + ", seatType=" + seatType + "]";
	}
	
	
}
