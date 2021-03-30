package fa.spring.service;

import java.util.List;
import java.util.Optional;

import fa.spring.model.Account;


public interface RegisterService {

	
	
	
	public void save(Account account);
	Account findByUserName(String userName);
	Account findByEmail(String email);
	String finByAccountID(String accountID);
	List<Account> findAllByRole(int roleId);


	Optional<Account> finByAccount( String accountID);
	void delete(String accountID);
}
