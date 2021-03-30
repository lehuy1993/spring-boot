package fa.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fa.spring.model.Account;

public interface RegisterRepository extends JpaRepository<Account, String>{

	Account findByUserName(String userName);
	
	@Query( nativeQuery = true, value ="SELECT TOP 1  account_id FROM Account WHERE account_id "
			+ "LIKE %?1% ORDER BY account_id DESC")
	String finByAccountID( String accountID);
	Account findByEmail(String email);
	@Query(nativeQuery = true, value = "SELECT * FROM Account WHERE role_id = ?1")
	List<Account> findAllByRole(int roleId);
	

}
