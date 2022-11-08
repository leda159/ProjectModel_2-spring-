package org.bigdata.mapper;

import org.bigdata.domain.MemberVO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberVO member);
	
	//아이디 중복검사
	public int idCheck(String memberId);

	public int mbidCheck(String memberId);
}
