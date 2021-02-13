package com.company.mapper;

import java.util.List;

import com.company.domain.HYChangeVO;
import com.company.domain.HYFileAttach;
import com.company.domain.HYLoginVO;
import com.company.domain.KDLoginVO;
import com.company.domain.LoginVO;

public interface HYMapper {
	//회원탈퇴
	public int leaveMember(HYLoginVO hylogin);
	//profile-setting
	public int updateMember(HYChangeVO change);
	public int updateInfo(HYChangeVO change);
	//user_my 첨부물 리스트 가져오기
	public List<HYFileAttach> attachList(String userId);

	//profile 첨부파일-attachMapper
	public int insertAttach(HYFileAttach attach);
	public int deleteAttach(String userId);
	
	//teacher_profile_setting
	public int updateTeacherInfo(HYChangeVO change);	
}
