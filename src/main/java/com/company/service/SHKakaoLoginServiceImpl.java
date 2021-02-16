package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.HYLoginVO;
import com.company.domain.KDLoginInfoVO;
import com.company.mapper.SHKakaoLoginMapper;

@Service
public class SHKakaoLoginServiceImpl implements SHKakaoLoginService {

	@Autowired
	private SHKakaoLoginMapper mapper;
	
	@Override
	public KDLoginInfoVO isRegistered(String userId) {
		KDLoginInfoVO vo = mapper.select(userId);
		
		return vo;
	}
	
	@Override
	public boolean register(KDLoginInfoVO vo) {
		int result = mapper.insert(vo);
		
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean leave(String userId) { 
		int result = mapper.delete(userId);
		
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
}
