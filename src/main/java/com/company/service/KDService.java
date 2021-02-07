package com.company.service;

import java.util.List;

import com.company.domain.KDAdminTotalVO;
import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHQandABoardVO;

public interface KDService {
	public KDLoginInfoVO isLogin(KDLoginVO kdlogin);
	public boolean registerInsert(KDLoginVO kdlogin);
	public boolean userUpdate(KDLoginInfoVO loginInfo);
	public KDLoginInfoVO ProfileInfo(KDLoginInfoVO loginInfo);
	
	public List<KDLoginInfoVO> AdminInfo();
	public List<YHQandABoardVO> QnAUsers();
	public List<KDLoginInfoVO> selectByNewUser();
	public List<KDLoginInfoVO> memberControls(YHCriteria cri);
	
	public int getTotalUser(KDAdminTotalVO admint);
	public int getTotalBoard(KDAdminTotalVO admint);
}
