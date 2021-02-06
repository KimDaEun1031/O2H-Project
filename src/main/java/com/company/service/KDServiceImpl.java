package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.mapper.KDmapper;

@Service
public class KDServiceImpl implements KDService {
	
	@Autowired
	private KDmapper mapper;
	

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
	public KDLoginInfoVO updateProfile(String userId) {
		return mapper.selectProfile(userId);
	}



}
