package com.company.mapper;

import com.company.domain.HYLoginVO;
import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.KDupdateInfoVO;

public interface KDmapper {
	public int insertRegister(KDLoginVO kdlogin);
	public KDLoginInfoVO selectByUser(KDLoginVO kdlogin);
	public int updateUser(KDupdateInfoVO updateProfile);
	public KDLoginInfoVO selectProfile(String userId);
}
