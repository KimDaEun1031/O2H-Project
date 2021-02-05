package com.company.service;

import java.util.List;

import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;

public interface YHAnnounceBoardService {

	List<YHAnnounceBoardVO> ListAll(YHCriteria cir);
}
