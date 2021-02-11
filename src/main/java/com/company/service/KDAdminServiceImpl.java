package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.HYFileAttach;
import com.company.domain.KDAdminTotalVO;
import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.KDTeacherInfoVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHQandABoardVO;
import com.company.mapper.KDAdminMapper;

@Service
public class KDAdminServiceImpl implements KDAdminService {
	
	@Autowired
	private KDAdminMapper mapper;
	
	@Override
	public List<KDLoginInfoVO> selectByNewUser() {		
		return mapper.selectByNew();
	}

	@Override
	public int getTotalUser(KDAdminTotalVO admint) {		
		return mapper.selectByAlluser(admint);
	}

	@Override
	public int getTotalBoard(KDAdminTotalVO admint) {
		return mapper.selectByAllboard(admint);
	}

	@Override
	public List<KDLoginInfoVO> AdminInfo() {
		return mapper.selectByAdmin();
	}

	@Override
	public List<KDLoginInfoVO> memberControls(YHCriteria cri) {
		return mapper.memberControl(cri);
	}




}
