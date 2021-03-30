package fa.spring.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ScheduleSeat {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer scheduleSeatId;
	private String movieId;
	@Column(length = 10)
	private int scheduleId;
	@Column(length = 10)
	private int seatId;
	private String seatColumn;
	@Column(length = 10)
	private  int seatRow;
	@Column(length = 1)
	private int seatStatus;
	@Column(length = 1)
	private int seatType;
	
	private int showDateId;

	public int getShowDateId() {
		return showDateId;
	}
	public void setShowDateId(int showDateId) {
		this.showDateId = showDateId;
	}
	public Integer getScheduleSeatId() {
		return scheduleSeatId;
	}
	public void setScheduleSeatId(Integer scheduleSeatId) {
		this.scheduleSeatId = scheduleSeatId;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public String getSeatColumn() {
		return seatColumn;
	}
	public void setSeatColumn(String seatColumn) {
		this.seatColumn = seatColumn;
	}
	public int getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(int seatRow) {
		this.seatRow = seatRow;
	}
	public int getSeatStatus() {
		return seatStatus;
	}
	public void setSeatStatus(int seatStatus) {
		this.seatStatus = seatStatus;
	}
	public int getSeatType() {
		return seatType;
	}
	public void setSeatType(int seatType) {
		this.seatType = seatType;
	}
	@Override
	public String toString() {
		return "ScheduleSeat [scheduleSeatId=" + scheduleSeatId + ", movieId=" + movieId + ", scheduleId=" + scheduleId
				+ ", seatId=" + seatId + ", seatColumn=" + seatColumn + ", seatRow=" + seatRow + ", seatStatus="
				+ seatStatus + ", seatType=" + seatType + ", showDateId=" + showDateId + "]";
	}
	
	
}
