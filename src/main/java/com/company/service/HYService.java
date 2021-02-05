package com.company.service;

import com.company.domain.HYChangeVO;
import com.company.domain.HYLoginVO;

public interface HYService {
	public boolean leave(HYLoginVO hylogin);
	//public boolean update(ChangeVO change);
	public boolean modifyPwd(HYChangeVO change);
	public boolean modifyInfo(HYChangeVO change);
	
}
