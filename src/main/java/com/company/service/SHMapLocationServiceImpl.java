package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.SHMapLocationListVO;
import com.company.domain.SHMapLocationVO;
import com.company.mapper.SHMapLocationMapper;

@Service
public class SHMapLocationServiceImpl implements SHMapLocationService {

	@Autowired
	private SHMapLocationMapper mapper;
	
	@Override
	public SHMapLocationListVO getMapLocationList(int page, int pageCount) {
		List<SHMapLocationVO> vol = mapper.selectMapLocationList(page, pageCount);
		int cnt = mapper.countMapLocation();
		
		return new SHMapLocationListVO(cnt, vol);
	}

}
