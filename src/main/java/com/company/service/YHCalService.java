package com.company.service;

import java.util.List;

import com.company.domain.YHCalVO;

public interface YHCalService {
	public int insert(YHCalVO vo);
	public int update(YHCalVO vo);
	public List<YHCalVO> select(YHCalVO vo);
}
