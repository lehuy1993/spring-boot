package fa.spring.service;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fa.spring.model.Account;
import fa.spring.model.Roles;
import fa.spring.repository.RegisterRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private RegisterRepository registerRepository;
	
	private final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);


	@Override
	 @Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = registerRepository.findByUserName(username);
		 if (account == null) {
	            throw new UsernameNotFoundException("User not found");
	        }
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		
		Roles role = account.getRoles();
		
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getRoleName()));
	
			logger.debug("message"+grantedAuthorities);

			
		return new org.springframework.security.core.userdetails.User
				(account.getUserName(), account.getPassword(),
				grantedAuthorities);

	}

}
