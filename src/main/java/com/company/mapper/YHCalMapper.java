package com.company.mapper;

import java.util.List;

import com.company.domain.YHCalVO;

public interface YHCalMapper {
	public int insert(YHCalVO vo);
	public int update(YHCalVO vo);
	public List<YHCalVO> select(YHCalVO vo);
}
