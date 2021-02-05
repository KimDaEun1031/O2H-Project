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
	
	  
	public boolean leave(HYLoginVO hylogin) { 
		  return mapper.leaveMember(hylogin)>0?true:false; 
	}
	

	@Override
	public boolean modifyPwd(HYChangeVO change) {
		//첨부물 전체 삭제
		//mapper.deleteAttach(change.getUserId());
				
		return mapper.updateMember(change)>0?true:false;
	}

	@Override
	public boolean modifyInfo(HYChangeVO change) {		
		return mapper.updateInfo(change)>0?true:false;
	}
			  
  
  
  
  
  }
 