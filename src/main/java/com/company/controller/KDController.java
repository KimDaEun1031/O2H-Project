package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.company.domain.KDLoginInfoVO;
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
		KDLoginInfoVO loginInfo = service.isLogin(kdlogin);
		log.info("로그인 정보"+loginInfo.getUserInfo());
		
		if(loginInfo!=null) {
			session.setAttribute("loginInfo", loginInfo);
			session.removeAttribute("loginFail");	
			return "/register/loginSuccess";
		} else {
			session.setAttribute("loginFail", "fail");
			return "/register/login";
		}
	}
	
	@GetMapping("/logout") 
	public String logout(HttpSession session) {
		log.info("로그아웃 요청");
		session.invalidate();
		return "/";
		
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
	
	@GetMapping("/PT/teacher-all")
	public void teacher_all() {
		log.info("전체 강사 페이지 요청");
	}
	
	@GetMapping("/user/teacher_my")
	public void teacherMypage() {
		log.info("강사 마이페이지" );
	}
	
	@GetMapping("/user/teacher_profile_setting")
	public void profile_setting() {	
		log.info("프로필 설정 페이지");
		
	}
	
	@PostMapping("/user/teacher_profile_setting")
	public String updateUserProfileInfo(HttpSession session, KDLoginInfoVO loginInfo) {
		KDLoginInfoVO loginInfoTemp = (KDLoginInfoVO) session.getAttribute("loginInfo");
		loginInfo.setUserId(loginInfoTemp.getUserId());		
		if(service.userUpdate(loginInfo)) {
			session.setAttribute("loginInfo", loginInfo);
			return "/user/teacher_my";
		} else {
			return "/user/teache_profile_setting";			
		}
		
	}
	
	@GetMapping("/user/admin_index")
	public void admin_index() {
		log.info("관리자 페이지");
	}
	
	//user-teacher END
	
	@GetMapping("/admin/admin_all")
	public void adminAllBoard() {
		log.info("관리자 게시판 페이지");
	}
	
	@GetMapping("/shop/shop")
	public void shop() {
		log.info("쇼핑몰 페이지 요청");
	}
	

	
	//etc END
	

}