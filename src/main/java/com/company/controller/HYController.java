package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.HYLoginVO;
import com.company.service.HYService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/register/*")
public class HYController {
	
	@Autowired
	private HYService hyService;

	
	@GetMapping("/deleteID")
	public void leaveGet() {
		log.info("회원탈퇴 폼 보여주기"); 		
	}
	
	//회원탈퇴 - 회원삭제하고 세션해제 후 index 이동
	@PostMapping("/deleteID")
	public String leavePost(HYLoginVO hylogin, HttpSession session) {
		log.info("회원탈퇴 요청 "+hylogin); 
		
		if(hyService.leave(hylogin)) {			
			session.invalidate();
			return "redirect:/";	
		}else { //비밀번호가 틀린경우		
			return "redirect:deleteID";	
		}
	}
	
	
	
}
