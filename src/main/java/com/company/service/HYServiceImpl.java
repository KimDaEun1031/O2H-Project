package com.company.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.HYChangeVO;
import com.company.domain.HYLoginVO;
import com.company.mapper.HYMapper;
  
@Service 
public class HYServiceImpl implements HYService {
	  
	@Autowired 
	private HYMapper mapper;
	
	//탈퇴
	public boolean leave(HYLoginVO hylogin) { 
		  return mapper.leaveMember(hylogin)>0?true:false; 
	}
	
	//비밀번호 수정
	@Override
	public boolean modifyPwd(HYChangeVO change) {				
		return mapper.updateMember(change)>0?true:false;
	}
	
	//이메일
//	@Override
//	public boolean modifyInfo(HYChangeVO change) {		
//		return mapper.updateInfo(change)>0?true:false;
//	}
	
	//이메일+첨부파일
	@Override
	public boolean modifyInfo(HYChangeVO change) {	
		//이거 체인지에 그냥 안 걸리던데.. controller에서 넣어줘야하냐?
		
		//첨부물 전체 삭제
		mapper.deleteAttach(change.getUserId());//로그인이니까 change가 아닌듯?//됐다
		//게시물 수정
		boolean result = mapper.updateInfo(change)>0?true:false;
		
		//첨부파일이 null 이거나 size() 가 0 이라면 68-70작업 미실시
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
 