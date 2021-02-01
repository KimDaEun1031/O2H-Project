package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.LoginVO;
import com.company.service.SigninService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class YHController {
	@Autowired
	SigninService service;
	
	@GetMapping("/gotoSignin")
	public String gotoSignin() {
		log.info("회원가입 페이지로 이동 요청");
		
		
		return "/register/signup";
	}
	
	@GetMapping("/gotoLogin")
	public String gotoLogin() {
		log.info("로그인 페이지로 이동 요청");
		
		return "/register/login";
	}
	
	@PostMapping("/gotoLogin")
	public String gotoLoginFromSignin(LoginVO vo) {
		log.info("로그인 페이지로 이동 form 회원가입");
		
		log.info("서비스를 통해서 회원 가입을 하는 매서드를 부름");
		service.regist(vo);
		return "/register/login";
		
	}
	
	
	
	
}
