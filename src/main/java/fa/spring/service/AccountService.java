package fa.spring.service;

import fa.spring.model.Account;

public interface AccountService {

    Account getAccountByUsername(String userName);
}
