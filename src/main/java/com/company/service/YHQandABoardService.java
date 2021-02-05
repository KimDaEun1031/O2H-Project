package com.company.service;

import java.util.List;

import com.company.domain.YHCriteria;
import com.company.domain.YHQandABoardVO;

public interface YHQandABoardService {

	public boolean regist(YHQandABoardVO board);

	public List<YHQandABoardVO> QandABoardList(YHCriteria cri);
	public YHQandABoardVO QandASelect(int bno);
	public int getTotalCnt(YHCriteria cri);
}
