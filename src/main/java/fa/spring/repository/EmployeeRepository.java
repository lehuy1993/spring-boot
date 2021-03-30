package fa.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fa.spring.model.Account;
import fa.spring.model.Employee;

public interface EmployeeRepository  extends JpaRepository<Employee, String>{
	

	void save(Account account);
	@Query( nativeQuery = true, value ="SELECT * FROM Employee WHERE account_id = ?1 ")
	Employee getByAccountId(String accountId);
}
