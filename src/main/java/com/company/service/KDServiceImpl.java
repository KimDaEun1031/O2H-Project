package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.KDAuthVO;
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
	public KDAuthVO isLogin(KDLoginVO kdlogin) {
		return mapper.selectByUser(kdlogin);
	}

}
