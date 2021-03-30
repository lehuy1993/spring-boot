package fa.spring.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import fa.spring.model.Account;
import fa.spring.model.Employee;
import fa.spring.model.Roles;
import fa.spring.repository.EmployeeRepository;
import fa.spring.repository.RegisterRepository;
import fa.spring.repository.RoleRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	private static final Logger log = LoggerFactory.getLogger(EmployeeServiceImpl.class);

   @Autowired
   private EmployeeRepository employeeRepository;
   
   @Autowired
   private BCryptPasswordEncoder bCryptPasswordEncoder;
   
   @Autowired
   private RegisterRepository registerRepository;
   
   
   @Autowired
   private RoleRepository roleRepository;

@Override
public void save(Account account) {
	// TODO Auto-generated method stub
	if (account.getAccountID() == null) {
		account.setRegisterDate(new Date());
		account.setPassword(bCryptPasswordEncoder.encode(account.getPassword()));
		
	}
	account.setAccountID(account.getUserName());
	Roles roles = roleRepository.findByRoleName("ROLE_EMPLOYEE");
	account.setRoles(roles);
log.debug("message"+ account);

	registerRepository.save(account);
	if(employeeRepository.getByAccountId(account.getAccountID()) == null) {
		Employee employee = new Employee();
		String employeeId = UUID.randomUUID().toString().replace("-", "").substring(0, 9);
		employee.setEmployeeId(employeeId);
		employee.setAccount(account);
		employeeRepository.save(employee);
	}
	
		
}

@Override
public List<Employee> getAll() {
	// TODO Auto-generated method stub
	return employeeRepository.findAll();
}

@Override
public Optional<Employee> getById(String employeeId) {
	// TODO Auto-generated method stub
	return employeeRepository.findById(employeeId);
}

@Override
public void delete(String employeeId) {
	// TODO Auto-generated method stub
	employeeRepository.deleteById(employeeId);
	
}

@Override
public Employee getByAccountId(String accountId) {
	// TODO Auto-generated method stub
	return employeeRepository.getByAccountId(accountId);
}
   
   
    
}
