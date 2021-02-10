package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.YHCalVO;
import com.company.mapper.YHCalMapper;
@Service
public class YHCalServiceImpl implements YHCalService {
	@Autowired
	YHCalMapper mapper;
	@Override
	public int insert(YHCalVO vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

	@Override
	public int update(YHCalVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public List<YHCalVO> select(YHCalVO vo) {
		// TODO Auto-generated method stub
		return mapper.select(vo);
	}

}
