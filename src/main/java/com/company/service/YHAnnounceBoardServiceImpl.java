package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;
import com.company.mapper.YHAnnounceBoardMapper;


import lombok.extern.slf4j.Slf4j;

@Service
public class YHAnnounceBoardServiceImpl implements YHAnnounceBoardService{
	
	@Autowired
	private YHAnnounceBoardMapper mapper;

	@Override
	public List<YHAnnounceBoardVO> searchAll(YHCriteria cir) {
		
		return mapper.searchAll(cir);
	}
		
	
	
}
