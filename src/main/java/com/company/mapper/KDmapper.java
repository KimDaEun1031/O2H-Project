package com.company.mapper;

import com.company.domain.HYLoginVO;
import com.company.domain.KDAuthVO;
import com.company.domain.KDLoginVO;

public interface KDmapper {
	public int insertRegister(KDLoginVO kdlogin);
	public KDAuthVO selectByUser(KDLoginVO kdlogin);
}
