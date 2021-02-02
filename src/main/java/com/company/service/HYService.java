package com.company.service;


  import org.springframework.beans.factory.annotation.Autowired; 
  import org.springframework.stereotype.Service;

import com.company.domain.HYLoginVO;
import com.company.domain.KDLoginVO;
import com.company.domain.LoginVO; 
  import com.company.mapper.HYMapper;
  
  @Service 
  public class HYService {
  
  @Autowired 
  private HYMapper mapper;
  
  public boolean leave(HYLoginVO hylogin) { 
	  return mapper.leaveMember(hylogin)>0?true:false; 
   }
  
  
  
  
  
  }
 