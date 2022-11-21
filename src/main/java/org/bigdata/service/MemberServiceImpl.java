package org.bigdata.service;

import org.bigdata.domain.MemberVO;
import org.bigdata.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
	
	//자동 주입 처리
	@Autowired
	MemberMapper membermapper;

	//회원가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);		
	}
	
	//아이디 중복 체크
	@Override
	public int idCheck(String memberId) {
	
		return membermapper.idCheck(memberId);
	}

	//로그인
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return membermapper.memberLogin(member);
	}

}
