package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;


public interface YHAnnounceBoardService {

	List<YHAnnounceBoardVO> searchAll(YHCriteria cir);
	int regist(YHAnnounceBoardVO vo);
	YHAnnounceBoardVO read(int bno);
	boolean announceDelete(int bno);
	boolean announceUpdate(YHAnnounceBoardVO vo);
}
