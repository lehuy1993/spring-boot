package fa.spring.model;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Invoice {

	private String invoiceId;
	
	private Integer addScore;
	
	@Temporal(TemporalType.TIMESTAMP)
	private LocalDateTime  bookingDate;
	private String movieName;
	@Temporal(TemporalType.DATE)
	private Date scheduleShow;
	private String scheduleShowTime;
	private int status;
	private Integer totalMoney;
	private Integer useScore;
	private String seat;
	
	private Account account;
	
	@ManyToOne
	@JoinColumn(name = "ACCOUNT_ID")
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	@Id
	@Column(length = 10, name="INVOICE_ID")
	public String getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

	@Column(length = 10, name="ADD_SCORE")
	public Integer getAddScore() {
		return addScore;
	}
	public void setAddScore(Integer addScore) {
		this.addScore = addScore;
	}

	@Column(name="MOVIE_NAME")
	public String getMovieName() {
		return movieName;
	}
	@Column(name="BOOKING_DATE")
	@OrderBy("bookingDate ASC")
	public LocalDateTime getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(LocalDateTime localDateTime) {
		this.bookingDate = localDateTime;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	@Column(name="SCHEDULE_SHOW")
	public Date getScheduleShow() {
		return scheduleShow;
	}
	public void setScheduleShow(Date scheduleShow) {
		this.scheduleShow = scheduleShow;
	}
	@Column(name="SCHEDULE_SHOW_TIME")
	public String getScheduleShowTime() {
		return scheduleShowTime;
	}
	public void setScheduleShowTime(String scheduleShowTime) {
		this.scheduleShowTime = scheduleShowTime;
	}
	@Column(length = 1, name = "STATUS")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Column(length = 19, name = "TOTAL_MONEY")
	public Integer getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Integer totalMoney) {
		this.totalMoney = totalMoney;
	}
	@Column(length = 10, name="USE_SCORE")
	public Integer getUseScore() {
		return useScore;
	}
	public void setUseScore(Integer useScore) {
		this.useScore = useScore;
	}
	@Column(name="SEAT")
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	@Override
	public String toString() {
		return "Invoice [invoiceId=" + invoiceId + ", addScore=" + addScore + ", bookingDate=" + bookingDate
				+ ", movieName=" + movieName + ", scheduleShow=" + scheduleShow + ", scheduleShowTime="
				+ scheduleShowTime + ", status=" + status + ", totalMoney=" + totalMoney + ", useScore=" + useScore
				+ ", seat=" + seat + ", account=" + account + "]";
	}
	
}
