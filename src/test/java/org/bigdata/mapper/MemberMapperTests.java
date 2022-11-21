package org.bigdata.mapper;

import org.bigdata.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

	@Autowired
	private MemberMapper membermapper; // MemberMapper.java 인터페이스 의존성 주입

	// 회원가입 쿼리 테스트 메서드
	
	  @Test public void memberJoin() throws Exception{ MemberVO member = new
	  MemberVO();
	 
	  	member.setMemberId("tttest"); 
	  	member.setMemberPassword("test"); 
	  	member.setMemberName("test"); 
	  	member.setMemberEmail1("test");
	  	member.setMemberEmail2("test");
	  	member.setMemberAddr("test"); 
	  	member.setMemberAddr1("test"); 
	  	member.setMemberAddr2("test"); 
	  	member.setMemberAddr3("test");
	  	member.setMemberAddr4("test");
	 
	 membermapper.memberJoin(member); }
	 

	 //중복 아이디 확인 메서드
	@Test
	public void memberIdChk() throws Exception {
		String id = "admin1111"; // 존재하는 아이디
		String id2 = "test123"; // 존재하지 않는 아이디
		membermapper.idCheck(id);
		membermapper.idCheck(id2);
	}
	
	//로그인 쿼리 mapper 메서드 테스트
	@Test
	public void memberLogin() throws Exception{
		MemberVO member = new MemberVO();
		
		//올바른 아이디 비밀번호 입력 경우
		//member.setMemberId("test");
		//member.setMemberPassword("test");
		
		//올바르지 않은 아이디 비밀번호 입력 경우
		member.setMemberId("test1111");
		member.setMemberPassword("test1111");
		
		membermapper.memberLogin(member);
		System.out.println("결과 값:" + membermapper.memberLogin(member));
	}
}

















