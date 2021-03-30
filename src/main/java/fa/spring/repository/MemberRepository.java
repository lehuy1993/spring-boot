package fa.spring.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fa.spring.model.Member;

public interface MemberRepository  extends JpaRepository<Member, String>{
	
	@Query( nativeQuery = true, value ="SELECT * FROM Member WHERE account_id = ?1 ")
	Member finByAccountID( String accountID);
	Optional<Member> findAllByAccount_AccountID(String accountID);
	@Query( nativeQuery = true, value ="SELECT * FROM Member WHERE member_id = ?1 ")
	Member findByMemberId( String memberId);

}
