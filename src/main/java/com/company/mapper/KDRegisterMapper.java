package com.company.mapper;

import java.util.List;

import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.YHQandABoardVO;

public interface KDRegisterMapper {
	//회원가입
	public int insertRegister(KDLoginVO kdlogin);
	//강사 프로필 정보란 수정
	public int updateUser(KDLoginInfoVO loginInfo);	
	//강사 프로필
	public KDLoginInfoVO selectProfile(KDLoginInfoVO loginInfo);
	//유저 정보 문의 내역
	public List<YHQandABoardVO> QnAUser(String userId); 
	// 로그인 후 로그인 유저 정보
	public KDLoginInfoVO selectByUser(KDLoginVO kdlogin);
	// 유저 아이디 동일 한 사람 있는지 확인
	public int findUserId(String userId);
}
