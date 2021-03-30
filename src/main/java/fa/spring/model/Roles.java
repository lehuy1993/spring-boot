package fa.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Roles {

	@Id		
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10, name ="ROLE_ID")
	private Integer roleId;
	@Column(name ="ROLE_NAME")
	private String roleName;
	
//	@ManyToMany(mappedBy = "roles")
//	private Set<Account>  accounts;
//	
//	
//	
//	public Set<Account> getAccounts() {
//		return accounts;
//	}
//	public void setAccounts(Set<Account> accounts) {
//		this.accounts = accounts;
//	}
	public Roles(String roleName) {
		super();
		this.roleName = roleName;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Roles() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Roles [roleId=" + roleId + ", roleName=" + roleName + "]";
	}
	public Roles(int roleId, String roleName) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
	}

	

	
	
	

    
}
