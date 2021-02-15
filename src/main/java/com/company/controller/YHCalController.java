package com.company.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHCalVO;
import com.company.service.YHCalService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cal2/*")
public class YHCalController {
	
	@Autowired
	YHCalService service;
	
	
	@PostMapping("/insert")
	public String insert(YHCalVO vo,String rdate) {
		if(rdate.length()==9) {
			char temp=rdate.charAt(8);
			String newDate=rdate.substring(0, 8);
			newDate+="0"+temp;
			rdate=newDate;
		}
		vo.setDates(Integer.parseInt(rdate.replaceAll("-", "")));
		
		log.info("칼로리 입력 시도"+vo);
		if(service.update(vo)!=1) {
			service.insert(vo);
			}
		return "redirect:/user/user_my";
	}
}
