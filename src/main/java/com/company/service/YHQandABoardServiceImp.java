package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.YHQandABoardVO;
import com.company.mapper.YHQandABoardMapper;

@Service
public class YHQandABoardServiceImp implements YHQandABoardService {
	
	@Autowired
	private YHQandABoardMapper mapper;
	
	@Override
	public boolean regist(YHQandABoardVO board) {
		
		boolean result=mapper.insert(board)>0?true:false;
		return result;
	}
	
	

}
