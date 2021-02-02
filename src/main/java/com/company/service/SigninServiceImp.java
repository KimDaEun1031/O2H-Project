package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.LoginVO;
import com.company.mapper.YHmapper;
@Service
public class SigninServiceImp implements SigninService {
	@Autowired
	private YHmapper mapper;
	@Override
	public boolean regist(LoginVO loginVo) {
		boolean flag=false;
		return true;
	}

}
