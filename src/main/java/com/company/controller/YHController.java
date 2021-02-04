package com.company.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.KDAuthVO;
import com.company.domain.KDLoginVO;
import com.company.domain.LoginVO;
import com.company.service.KDService;
import com.company.service.SigninService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class YHController {
	@Autowired
	private KDService service;
	
	@GetMapping("/gotoSignin")
	public String gotoSignin() {
		log.info("회원가입 페이지로 이동 요청");
		
		
		return "/register/signup";
	}
	@PostMapping("/signnup")
	public String signup(KDLoginVO user) {
		log.info("회원 가입 요청"+user);
		String[] array=user.getFavorite_activity();
		String[] temp=new String[3];
		for(int i=0;i<3;i++) {
			temp[i]="선택x";
		}
		for(int i=0;i<array.length;i++) {
			temp[i]=array[i];
			
		}
		user.setFavorite_activity(temp);
		service.registerInsert(user);
			return "redirect:/gotoLogin";
		
		
		
	}
	
	
	
	@GetMapping("/gotoLogin")
	public String gotoLogin() {
		log.info("로그인 페이지로 이동 요청");
		
		return "/register/login";
	}
	
	
	
	
	
	
	
}
