package com.company.mapper;

import java.util.List;

import com.company.domain.KDAuthVO;
import com.company.domain.LoginVO;
import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;

public interface YHAnnounceMapper {
	List<YHAnnounceBoardVO> searchAll(YHCriteria cri);
}
