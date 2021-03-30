package fa.spring.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Movie {
 
	private String movieId;
	private String actor;
	private int cinemaRoomId;
	private String content;
	private String director;
	private int duration;
	private Date fromDate;
	private String movieProductionCompany;
	private Date toDate;
	private String version;
	private String movieNameEnglish;
	private String movieNameVN;
	private String smallImage;
	private String largeImage;
	 

	private Set<Schedule> schedules = new HashSet<Schedule>();
	private Set<ShowDate> showDates = new HashSet<ShowDate>();
	private Set<Type> types = new HashSet<Type>();

	 public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Movie(String movieId, String actor, String director, int duration, Date fromDate,
			String movieProductionCompany, String version, String movieNameEnglish, String movieNameVN) {
		super();
		this.movieId = movieId;
		this.actor = actor;
		this.director = director;
		this.duration = duration;
		this.fromDate = fromDate;
		this.movieProductionCompany = movieProductionCompany;
		this.version = version;
		this.movieNameEnglish = movieNameEnglish;
		this.movieNameVN = movieNameVN;
	}


	@ManyToMany(fetch = FetchType.LAZY)
	 @JoinTable(name = "MOVIE_DATE", joinColumns =  @JoinColumn(name = "MOVIE_ID"),
	 inverseJoinColumns = @JoinColumn(name="SHOW_DATE_ID"))
		public Set<ShowDate> getShowDates() {
			return showDates;
		}


	public void setShowDates(Set<ShowDate> showDates) {
		this.showDates = showDates;
	}


	@Id
	@Column(length = 10, name = "MOVIE_ID")
	public String getMovieId() {
		return movieId;
	}
	
	
	 @ManyToMany(fetch = FetchType.LAZY)
	 @JoinTable(name = "MOVIE_TYPE", joinColumns =  @JoinColumn(name = "MOVIE_ID"),
	 inverseJoinColumns = @JoinColumn(name="TYPE_ID"))
	 public Set<Type> getTypes() {
		return types;
	}

	public void setTypes(Set<Type> types) {
		this.types = types;
	}
	
	@JsonManagedReference
	@ManyToMany(fetch = FetchType.LAZY)
	 @JoinTable(name = "MOVIE_SCHEDULE", joinColumns =  @JoinColumn(name = "MOVIE_ID"),
	 inverseJoinColumns = @JoinColumn(name="SCHEDULE_ID"))
	@OrderBy("scheduleTime  ASC")
	public Set<Schedule> getSchedules() {
		return schedules;
	}
	public void setSchedules(Set<Schedule> schedules) {
		this.schedules = schedules;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	@Column( name = "ACTOR")
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	@Column(length = 10, name = "CINEMA_ROOM_ID")
	public int getCinemaRoomId() {
		return cinemaRoomId;
	}
	public void setCinemaRoomId(int cinemaRoomId) {
		this.cinemaRoomId = cinemaRoomId;
	}
	@Column(length = 1000, name = "CONTENT")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(length = 255, name = "DIRECTOR")
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	@Column(length = 10, name = "DURATION")
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	@Column(name = "FROM_DATE")
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	@Column(name = "MOVIE_PRODUCTION_COMPANY")
	public String getMovieProductionCompany() {
		return movieProductionCompany;
	}
	public void setMovieProductionCompany(String movieProductionCompany) {
		this.movieProductionCompany = movieProductionCompany;
	}
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "TO_DATE")
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	@Column(name = "VERSION")
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	@Column(name = "MOVIE_NAME_ENGLISH")
	public String getMovieNameEnglish() {
		return movieNameEnglish;
	}
	public void setMovieNameEnglish(String movieNameEnglish) {
		this.movieNameEnglish = movieNameEnglish;
	}
	@Column(name = "MOVIE_NAME_VN")
	public String getMovieNameVN() {
		return movieNameVN;
	}
	public void setMovieNameVN(String movieNameVN) {
		this.movieNameVN = movieNameVN;
	}
	@Column(name = "SMALL_IMAGE")
	public String getSmallImage() {
		return smallImage;
	}
	public void setSmallImage(String smallImage) {
		this.smallImage = smallImage;
	}
	@Column(name = "LARGE_IMAGE")
	public String getLargeImage() {
		return largeImage;
	}
	public void setLargeImage(String largeImage) {
		this.largeImage = largeImage;
	}

	@Override
	public String toString() {
		return "Movie [movieId=" + movieId + ", actor=" + actor + ", cinemaRoomId=" + cinemaRoomId + ", content="
				+ content + ", director=" + director + ", duration=" + duration + ", fromDate=" + fromDate
				+ ", movieProductionCompany=" + movieProductionCompany + ", toDate=" + toDate + ", schedules="
				+ schedules + "]";
	}

}

