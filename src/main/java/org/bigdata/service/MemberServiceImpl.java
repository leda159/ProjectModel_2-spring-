package org.bigdata.service;

import org.bigdata.domain.MemberVO;
import org.bigdata.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper;

	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}

	@Override
	public int idCheck(String memberId) {
	
		return membermapper.idCheck(memberId);
	}

}
