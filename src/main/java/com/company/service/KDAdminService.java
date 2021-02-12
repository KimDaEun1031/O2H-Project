package com.company.service;

import java.util.List;

import com.company.domain.HYFileAttach;
import com.company.domain.KDAdminTotalVO;
import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.KDTeacherInfoVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHQandABoardVO;

public interface KDAdminService {
	//회원관리 - 관리자 리스트
	public List<KDLoginInfoVO> AdminInfo();
	//회원관리 - 강사 리스트
	public List<KDLoginInfoVO> TeacherInfo();
	//회원관리 - 회원 관리
	public List<KDLoginInfoVO> memberControls(YHCriteria cri);
	//월별현황 - 신규가입자 리스트
	public List<KDLoginInfoVO> selectByNewUser();
	//월별 현황 - 가입자 수 / 게시물 수
	public int getTotalUser(KDAdminTotalVO admint);
	public int getTotalBoard(KDAdminTotalVO admint);
}
