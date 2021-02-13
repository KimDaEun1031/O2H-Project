package com.company.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.HYChangeVO;
import com.company.domain.HYFileAttach;
import com.company.domain.HYLoginVO;
import com.company.mapper.HYMapper;
  
@Service 
public class HYServiceImpl implements HYService {
	  
	@Autowired 
	private HYMapper mapper;
	
	
	//회원탈퇴
	public boolean leave(HYLoginVO hylogin) { 
		  return mapper.leaveMember(hylogin)>0?true:false; 
	}
	
	//비밀번호 수정
	@Override
	public boolean modifyPwd(HYChangeVO change) {				
		return mapper.updateMember(change)>0?true:false;
	}

	//profile_setting 정보+첨부파일
	@Override
	public boolean modifyInfo(HYChangeVO change) {	
		
		//첨부물 전체 삭제
		mapper.deleteAttach(change.getUserId());
		
		//게시물 수정
		boolean result = mapper.updateInfo(change)>0?true:false;
		
		//첨부파일이 null 이거나 size() 가 0 이라면 48~51작업 미실시
		if(change.getAttachList()==null || change.getAttachList().size()<=0) {
			return result;
		}
		
		//첨부물 삽입
		change.getAttachList().forEach(attach -> {
			attach.setUserId(change.getUserId());
			mapper.insertAttach(attach);
		});		
		
		return result;
	}

	@Override
	public List<HYFileAttach> getAttachList(String userId) {		
		return mapper.attachList(userId);
	}

	//teacher_profile_setting info+첨부파일
	@Override
	public boolean modifyTeacherInfo(HYChangeVO change) {
		
		//첨부물 전체 삭제
		mapper.deleteAttach(change.getUserId());
		//게시물 수정
		boolean result = mapper.updateTeacherInfo(change)>0?true:false;
		
		//첨부파일이 null 이거나 size() 가 0 이라면 75~78작업 미실시
		if(change.getAttachList()==null || change.getAttachList().size()<=0) {
			return result;
		}
		//첨부물 삽입
		change.getAttachList().forEach(attach -> {
			attach.setUserId(change.getUserId());
			mapper.insertAttach(attach);
		});		
		
		return result;
	}  
  }
 