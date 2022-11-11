package org.bigdata.domain;

import lombok.Data;

@Data
public class MemberVO {

	//회원 id
	private String memberId;
	//회원 비밀번호
	private String memberPassword;
	//회원 이름
	private String memberName;
	//회원메일 1
	private String memberEmail1;
	//회원메일 2
	private String memberEmail2;
	//회원 우편번호
	private String memberAddr;
	//회원 도로명주소
	private String memberAddr1;
	//회원 지번주소
	private String memberAddr2;
	//회원 상세주소
	private String memberAddr3;
	//참고 항목
	private String memberAddr4;
	//관리자 구분(0:일반사용자, 1:관리자)
	private int adminCk;
	//회원 돈
	private int money;
	//회원 포인트
	private int point;
	//등록일자
	private int regDate;
	//수정일자
	private int updateDate;

}
