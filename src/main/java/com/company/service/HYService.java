package com.company.service;

import com.company.domain.HYChangeVO;
import com.company.domain.HYLoginVO;

public interface HYService {
	//탈퇴
	public boolean leave(HYLoginVO hylogin);
	//비밀번호 수정
	//public boolean update(ChangeVO change);
	public boolean modifyPwd(HYChangeVO change);
	//이메일 수정 + 첨부파일은 아직 아님
	public boolean modifyInfo(HYChangeVO change);
	
}
