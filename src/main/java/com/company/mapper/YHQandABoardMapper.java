package com.company.mapper;


import java.util.List;

import com.company.domain.YHCriteria;
import com.company.domain.YHQandABoardVO;

public interface YHQandABoardMapper {

	public int insert(YHQandABoardVO board);
	
	public List<YHQandABoardVO> QandASearchList(YHCriteria cri);

	public YHQandABoardVO QandASelect(int bno) ;
	
	public int totalCnt(YHCriteria cri);

	public int update(YHQandABoardVO board);
	
	public int delete(int bno);
	public int replyupdate(YHQandABoardVO board);
	public int updateReplyDate(int bno);
}
