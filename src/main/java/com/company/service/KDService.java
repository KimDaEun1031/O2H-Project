package com.company.service;

import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.KDupdateInfoVO;

public interface KDService {
	public boolean registerInsert(KDLoginVO kdlogin);
	public KDLoginInfoVO isLogin(KDLoginVO kdlogin);
	public boolean userUpdate(KDLoginInfoVO loginInfo);
	public KDLoginInfoVO updateProfile(String userId);
}
