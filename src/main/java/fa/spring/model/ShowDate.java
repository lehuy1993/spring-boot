package fa.spring.model;

import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "SHOW_DATES")
public class ShowDate {

	private Integer showDateId;
	private Date showDate;
	private String dateName;
	private Set<Movie> movies = new HashSet<Movie>();
	
	
	@ManyToMany(mappedBy = "showDates", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Set<Movie> getMovies() {
		return movies;
	}
	public void setMovies(Set<Movie> movies) {
		this.movies = movies;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10, name = "SHOW_DATE_ID")
	public Integer getShowDateId() {
		return showDateId;
	}
	public void setShowDateId(Integer showDateId) {
		this.showDateId = showDateId;
	}
	@Column(name = "SHOW_DATE")
	@Temporal(TemporalType.DATE)
	public Date getShowDate() {
		return showDate;
	}
	
	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}
	
	@Column(name = "DATE_NAME")
	public String getDateName() {
		return dateName;
	}
	public void setDateName(String dateName) {
		this.dateName = dateName;
	}
	@Override
	public String toString() {
		return "ShowDate [showDateId=" + showDateId + ", showDate=" + showDate + ", dateName=" + dateName + ", movies="
				+ movies + "]";
	}
	
	
}
