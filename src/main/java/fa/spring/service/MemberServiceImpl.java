package fa.spring.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.Member;
import fa.spring.repository.MemberRepository;
@Service
public class MemberServiceImpl  implements MemberService{

	@Autowired
	private MemberRepository memberRepository;
	@Override
	public void save(Member member) {
		// TODO Auto-generated method stub
		memberRepository.save(member);
		
	}
	
	@Override
    public Optional<Member> getMemberByAccountID(String accountID) {
        return memberRepository.findAllByAccount_AccountID(accountID);
    }

	@Override
	public Member findByAccount(String accountId) {
		// TODO Auto-generated method stub
		return memberRepository.finByAccountID(accountId);
	}


	@Override
	public Member findByMemberId(String idMember) {
		// TODO Auto-generated method stub
		return memberRepository.findByMemberId(idMember);
	}


}
