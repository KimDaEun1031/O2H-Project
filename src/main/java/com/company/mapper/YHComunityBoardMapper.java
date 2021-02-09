package com.company.mapper;

import java.util.List;

import com.company.domain.YHComunityBoardVO;

public interface YHComunityBoardMapper {

	public int insert(YHComunityBoardVO board) ;
	public List<YHComunityBoardVO> boardList();
	public YHComunityBoardVO read(int rno);

}
