package fa.spring.model;

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

@Entity
public class Type {

	@Id
	@Column(name = "TYPE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int typeId;
	private String typeName;
	
	@ManyToMany(mappedBy = "types", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Movie> movie = new HashSet<Movie>();
	
	public Set<Movie> getMovie() {
		return movie;
	}
	public void setMovie(Set<Movie> movie) {
		this.movie = movie;
	}
	
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Type( String typeName) {
		super();
		this.typeName = typeName;
	}
	public Type() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Type [typeId=" + typeId + ", typeName=" + typeName + ", movie=" + movie + "]";
	}

	
	
	
	
}
