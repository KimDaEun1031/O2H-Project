package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.LoginVO;
import com.company.mapper.YHAnnounceBoardMapper;

@Service
public class SigninServiceImp implements SigninService {
	@Autowired
	private YHAnnounceBoardMapper mapper;
	@Override
	public boolean regist(LoginVO loginVo) {
		boolean flag=false;
		return true;
	}

}
