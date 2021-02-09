package com.company.service;

import java.util.List;

import com.company.domain.HYChangeVO;
import com.company.domain.HYFileAttach;
import com.company.domain.HYLoginVO;

public interface HYService {
	//탈퇴
	public boolean leave(HYLoginVO hylogin);
	//비밀번호 수정
	//public boolean update(ChangeVO change);
	public boolean modifyPwd(HYChangeVO change);
	//이메일 수정 + 첨부파일
	public boolean modifyInfo(HYChangeVO change);
	//전체 첨부물 조회
	public List<HYFileAttach> getAttachList(String userId);
	
	//teacher_profile_setting info + 첨부파일은 아직 아님
	public boolean modifyTeacherInfo(HYChangeVO change);
	
	
	
	
	
}
