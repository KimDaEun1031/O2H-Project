package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.YHQandABoardVO;
import com.company.mapper.KDRegisterMapper;

@Service
public class KDRegisterServiceImpl implements KDRegisterService {
	
	@Autowired
	private KDRegisterMapper mapper;
	
	@Override
	public boolean registerInsert(KDLoginVO kdlogin) {
		return mapper.insertRegister(kdlogin)>0?true:false;
	}

	@Override
	public KDLoginInfoVO isLogin(KDLoginVO kdlogin) {
		return mapper.selectByUser(kdlogin);
	}

	@Override
	public boolean userUpdate( KDLoginInfoVO loginInfo) {
		return mapper.updateUser(loginInfo)>0?true:false;
	}

	@Override
	public KDLoginInfoVO ProfileInfo(KDLoginInfoVO loginInfo) {
		return mapper.selectProfile(loginInfo);
	}
	
	@Override
	public List<YHQandABoardVO> QnAUsers() {		
		return mapper.QnAUser();
	}

}
