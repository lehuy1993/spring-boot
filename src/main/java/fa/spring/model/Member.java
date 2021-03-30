package fa.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Member {

	private String memberId;
	private int score;
	private Account account;
	
	@Id
	@Column(name = "MEMBER_ID", length = 10)
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Column(name = "SCORE", length = 10)
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@OneToOne
	@JoinColumn(name = "ACCOUNT_ID")
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", score=" + score + ", account=" + account + "]";
	}
	
	
}
