package com.company.service;

import java.util.List;

import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.YHQandABoardVO;

public interface KDRegisterService {
	//로그인 후 로그인 유저 정보
	public KDLoginInfoVO isLogin(KDLoginVO kdlogin);
	//유저 정보 문의 내역
	public List<YHQandABoardVO> QnAUsers(String userId);
	//회원가입
	public boolean registerInsert(KDLoginVO kdlogin);
	//강사 프로필 정보란 수정
	public boolean userUpdate(KDLoginInfoVO loginInfo);
	//강사 프로필
	public KDLoginInfoVO ProfileInfo(KDLoginInfoVO loginInfo);
	
}
