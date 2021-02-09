package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.YHComunityBoardVO;
import com.company.mapper.YHComunityBoardMapper;

@Service
public class YHComunityBoardServiceImpl implements YHComunityBoardService {
	@Autowired
	YHComunityBoardMapper mapper;
	
	@Override
	public int insert(YHComunityBoardVO board) {
		
		return mapper.insert(board);
	}

	@Override
	public List<YHComunityBoardVO> boardList() {
	
		return mapper.boardList();
	}

	@Override
	public YHComunityBoardVO read(int rno) {
		
		return mapper.read(rno);
	}

	

}
