package fa.spring.service;

import java.util.List;
import java.util.Optional;

import fa.spring.model.Account;
import fa.spring.model.Employee;

public interface EmployeeService {

	void save(Account account);
	List<Employee> getAll();
	Optional<Employee> getById(String employeeId);
	void delete(String employeeId);
	Employee getByAccountId(String accountId);
}
