package fa.spring.service;

import java.util.Optional;

import fa.spring.model.Member;

public interface MemberService {
	public void save(Member member);
	Member findByAccount(String  accountId);
	Optional<Member> getMemberByAccountID(String accountID);
	Member findByMemberId(String idMember);
}
