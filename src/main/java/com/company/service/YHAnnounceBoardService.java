package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;


public interface YHAnnounceBoardService {

	List<YHAnnounceBoardVO> searchAll(YHCriteria cir);
}
