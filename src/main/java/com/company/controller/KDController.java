package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.KDAuthVO;
import com.company.domain.KDLoginVO;
import com.company.service.KDService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/register/*")
public class KDController {
	
	@Autowired
	private KDService service;
	
	@PostMapping("/loginSuccess")
	public String loginSuccess(KDLoginVO kdlogin, HttpSession session) {
		log.info("로그인 성공");
		KDAuthVO auth = service.isLogin(kdlogin);
		
		log.info("auth 값"+auth);
		if(auth!=null) {
			session.setAttribute("auth", auth);
			return "/register/loginSuccess";
		} else {
			return "/register/login";
		}
	}
	
}
