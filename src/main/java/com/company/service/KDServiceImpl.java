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
import com.company.mapper.KDmapper;

@Service
public class KDServiceImpl implements KDService {
	
	@Autowired
	private KDmapper mapper;
	

	@Override
	public boolean registerInsert(KDLoginVO kdlogin) {
		return mapper.insertRegister(kdlogin)>0?true:false;
	}

	@Override
	public KDLoginInfoVO isLogin(KDLoginVO kdlogin) {
		return mapper.selectByUser(kdlogin);
	}

	@Override
	public boolean userUpdate( KDLoginInfoVO loginInfo) {
		return mapper.updateUser(loginInfo)>0?true:false;
	}

	@Override
	public KDLoginInfoVO ProfileInfo(KDLoginInfoVO loginInfo) {
		return mapper.selectProfile(loginInfo);
	}

	@Override
	public List<YHQandABoardVO> QnAUsers() {		
		return mapper.QnAUser();
	}

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

	@Override
	public List<KDTeacherInfoVO> teacherInfo() {
		return mapper.selectByRecommendTeacher();
	}

	@Override
	public List<HYFileAttach> exampleTeacher() {		
		return mapper.selectByEx();
	}




}
