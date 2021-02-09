package com.company.service;

import java.util.List;

import com.company.domain.YHComunityBoardVO;

public interface YHComunityBoardService {

	public int insert(YHComunityBoardVO board);
	public List<YHComunityBoardVO> boardList();
	public YHComunityBoardVO read(int rno);
}
