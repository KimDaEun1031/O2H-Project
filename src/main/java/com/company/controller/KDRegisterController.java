package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.service.KDService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/register/*")
public class KDRegisterController {
	
	@Autowired
	private KDService service;
	
	@PostMapping("/register/loginSuccess")
	public String loginSuccess(KDLoginVO kdlogin, HttpSession session) {
	
		log.info("로그인 요청" );
		KDLoginInfoVO loginInfo = service.isLogin(kdlogin);
		
		if(loginInfo!=null) {
			session.setAttribute("loginInfo", loginInfo);
			session.removeAttribute("loginFail");	
			return "/register/loginSuccess";
		} else {
			session.setAttribute("loginFail", "fail");
			return "/register/login";
		}
	}
	
	@GetMapping("/register/logout") 
	public String logout(HttpSession session) {
		log.info("로그아웃 요청");
		session.removeAttribute("loginInfo");
		log.info("로그아웃 완료");
		return "redirect:/";
		
	}
	
	@GetMapping("/register/login")
	public void login() {
		log.info("로그인 페이지 요청");	
	}
	
	@GetMapping("/register/signup")
	public void register() {
		log.info("회원가입 페이지 요청");
	}
 	
	//register END

}
