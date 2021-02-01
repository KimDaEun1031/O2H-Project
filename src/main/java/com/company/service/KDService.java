package com.company.service;

import com.company.domain.KDAuthVO;
import com.company.domain.KDLoginVO;

public interface KDService {
	public boolean registerInsert(KDLoginVO kdlogin);
	public KDAuthVO isLogin(KDLoginVO kdlogin);
}
