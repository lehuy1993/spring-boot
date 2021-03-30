 package fa.spring.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Promotion {

	@Id
	@Column(length = 10)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer promotionId;
	@NotNull(message = "Not null")
	@Size(min = 3, max = 35)
	private String detail;
	@Column(length = 10)
	@Min(1)
	@NotNull(message = "Not null")
	private int discountLevel;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@NotNull(message = "Not null")
	private LocalDate endTime;
	
	private String image;
	@NotNull(message = "Not null")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private LocalDate startTime;
	@NotNull(message = "Not null")
	@Size(min = 3, max = 35)
	private String title;


	
	
	public Integer getPromotionId() {
		return promotionId;
	}

	public void setPromotionId(Integer promotionId) {
		this.promotionId = promotionId;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getDiscountLevel() {
		return discountLevel;
	}

	public void setDiscountLevel(int discountLevel) {
		this.discountLevel = discountLevel;
	}

	public LocalDate getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalDate endTime) {
		this.endTime = endTime;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public LocalDate getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalDate startTime) {
		this.startTime = startTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isNew() {
		return (this.promotionId == null);
	}

	@Override
	public String toString() {
		return "Promotion [promotionId=" + promotionId + ", detail=" + detail + ", discountLevel=" + discountLevel
				+ ", endTime=" + endTime + ", image=" + image + ", startTime=" + startTime + ", title=" + title + "]";
	}
	
	
}
