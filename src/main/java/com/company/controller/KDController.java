package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import com.company.domain.KDAuthVO;
import com.company.domain.KDLoginVO;
import com.company.service.KDService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KDController {
	
	@Autowired
	private KDService service;
	
	@PostMapping("/register/loginSuccess")
	public String loginSuccess(KDLoginVO kdlogin, HttpSession session) {
	
		log.info("로그인 요청" );
		KDAuthVO auth = service.isLogin(kdlogin);
		log.info("로그인 정보"+auth.getAuth());
		
		if(auth!=null) {
			session.setAttribute("auth", auth);
			session.removeAttribute("loginFail");			
			return "/register/loginSuccess";
		} else {
			session.setAttribute("loginFail", "fail");
			return "/register/login";
		}
	}
	
	@GetMapping("/register/login")
	public void login(KDLoginVO kdlogin) {
//		log.info("로그인 페이지 요청"+kdlogin.getAuth());
		
		
	}
	
	@GetMapping("/register/signup")
	public void register() {
		log.info("회원가입 페이지 요청");
	}
 	
	@GetMapping("/PT/teacher-all")
	public void teacher_all() {
		log.info("전체 강사 페이지 요청");
	}
	
	@GetMapping("/shop/shop")
	public void shop() {
		log.info("쇼핑몰 페이지 요청");
	}
	
	@GetMapping("/user/teacher_my")
	public void teacherMypage() {
		log.info("강사 마이페이지");
	}
	
	@GetMapping("/user/profile_setting")
	public void profile_setting() {
		log.info("프로필 설정 페이지");
	}
}