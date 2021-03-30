package fa.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.Account;
import fa.spring.repository.RegisterRepository;
import fa.spring.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private RegisterRepository registerRepository;
    @Override
    public Account getAccountByUsername(String userName) {
        return registerRepository.findByUserName(userName);
    }
    
}
