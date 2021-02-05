package com.company.mapper;

import java.util.List;

import com.company.domain.HYChangeVO;
import com.company.domain.HYFileAttach;
import com.company.domain.HYLoginVO;
import com.company.domain.KDLoginVO;
import com.company.domain.LoginVO;

public interface HYMapper {
	//탈퇴
	public int leaveMember(HYLoginVO hylogin);
	//profile 부분-보드mapper
	public int updateMember(HYChangeVO change);
	public List<HYFileAttach> attachList(String userId);
	//profile 첨부파일-attachMapper
	public int insertAttach(HYFileAttach attach);
	public int deleteAttach(String userId);
	
	
	
}
