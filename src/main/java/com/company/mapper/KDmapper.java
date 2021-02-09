package com.company.mapper;

import java.util.List;

import com.company.domain.HYFileAttach;
import com.company.domain.KDAdminTotalVO;
import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.KDTeacherInfoVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHQandABoardVO;

public interface KDmapper {
	public int insertRegister(KDLoginVO kdlogin);
	public int updateUser(KDLoginInfoVO loginInfo);
	public KDLoginInfoVO selectByUser(KDLoginVO kdlogin);
	public KDLoginInfoVO selectProfile(KDLoginInfoVO loginInfo);
	
	public List<KDLoginInfoVO> selectByAdmin();
	public List<YHQandABoardVO> QnAUser();
	public List<KDLoginInfoVO> selectByNew();
	public List<KDLoginInfoVO> memberControl(YHCriteria cri);
	public List<KDTeacherInfoVO> selectByRecommendTeacher();
	
	List<HYFileAttach> selectByEx();
	
	public int selectByAlluser(KDAdminTotalVO admint); 
	public int selectByAllboard(KDAdminTotalVO admint); 
}
