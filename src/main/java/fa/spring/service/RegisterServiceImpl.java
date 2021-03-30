package fa.spring.service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import fa.spring.model.Account;
import fa.spring.model.Member;
import fa.spring.model.Roles;
import fa.spring.repository.RegisterRepository;
import fa.spring.repository.RoleRepository;
import fa.spring.utility.AccountIdUtility;

@Service
public class RegisterServiceImpl implements RegisterService{

	
	@Autowired
	private RegisterRepository registerRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void save(Account account) {

		String getFullName = account.getFullName();
		String s = AccountIdUtility.accCount(getFullName);
		String  accountId = registerRepository.finByAccountID(s);
		if (accountId != null) {
			char n = accountId.charAt(accountId.length() - 1);
			try {
				
				int num = Integer.parseInt(String.valueOf(n));
				accountId = accountId.substring(0, accountId.length() - 1);
				accountId = accountId + (num + 1);
				account.setAccountID(accountId);
			} catch (Exception e) {
				s = s + 1;
				account.setAccountID(s);
			}
		} else {
			account.setAccountID(s);
		}
		
		account.setPassword(bCryptPasswordEncoder.encode(account.getPassword()));
		Roles roles = roleRepository.findByRoleName("ROLE_MEMBER");
		account.setRoles(roles);
		registerRepository.save(account);
		//Save member

			Member member = new Member();
			String memberId = UUID.randomUUID().toString().replace("-", "").substring(0, 9);
			member.setMemberId(memberId);
			member.setAccount(account);
			memberService.save(member);
		
		
		
		
	}
	@Override
	public Account findByUserName(String userName) {
		// TODO Auto-generated method stub
		return registerRepository.findByUserName(userName);
	}
	@Override
	public Account findByEmail(String email) {
		// TODO Auto-generated method stub
		return registerRepository.findByEmail(email);
	}
	@Override
	public String finByAccountID(String accountID) {
		// TODO Auto-generated method stub
		return registerRepository.finByAccountID(accountID);
	}
	@Override
	public List<Account> findAllByRole(int roleId){
		// TODO Auto-generated method stub
		return registerRepository.findAllByRole(roleId);
	}
	@Override
	public Optional<Account> finByAccount(String accountID) {
		// TODO Auto-generated method stub
		return registerRepository.findById(accountID);
	}
	@Override
	public void delete(String accountID) {
		// TODO Auto-generated method stub
		registerRepository.deleteById(accountID);

	}

}
