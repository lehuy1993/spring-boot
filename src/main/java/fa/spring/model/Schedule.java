package fa.spring.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Schedule  implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@Column(length = 10, name = "SCHEDULE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int scheduleId;
	private String scheduleTime;
	
	@JsonBackReference
	@ManyToMany(mappedBy = "schedules", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Movie> movies = new HashSet<Movie>();
	
	private int cinemaroomId;
	
	
	public int getCinemaroomId() {
		return cinemaroomId;
	}
	public void setCinemaroomId(int cinemaroomId) {
		this.cinemaroomId = cinemaroomId;
	}
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public String getScheduleTime() {
		return scheduleTime;
	}
	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}
	
	
	public Set<Movie> getMovies() {
		return movies;
	}
	public void setMovies(Set<Movie> movies) {
		this.movies = movies;
	}

	public int status;


	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Schedule [scheduleId=" + scheduleId + ", scheduleTime=" + scheduleTime + ", cinemaroomId="
				+ cinemaroomId + ", status=" + status + "]";
	}
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
	
	
	
}
