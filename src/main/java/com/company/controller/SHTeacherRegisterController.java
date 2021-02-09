package com.company.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.company.domain.SHProfileVO;
import com.company.service.SHTeacherService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SHTeacherRegisterController {

	@Autowired
	private SHTeacherService service;
	@GetMapping("/register/teacherSignup")
	public void teacherSignup() {
		log.info("강사 회원가입 페이지 요청");
	}
	
	@PostMapping("/register/teacherSignup")
	public String teacherSignup(SHProfileVO shProfileVO) {
		log.info("강사 회원가입 요청 : " + shProfileVO);
		
		
		String[] array = shProfileVO.getFavorite_activity().toArray(new String[shProfileVO.getFavorite_activity().size()]);
		String[] temp = new String[3];
		
		for(int i = 0; i < 3; ++ i) {
			temp[i] = "선택x";
		}
		
		for(int i = 0 ;i < array.length ; ++ i) {
			temp[i] = array[i];
		}
		
		shProfileVO.setFavorite_activity(new ArrayList<String>(Arrays.asList(temp)));
		
		boolean result = service.registTeacher(shProfileVO);
		
		if (result) {
			return "redirect:/gotoLogin";
		} else {
			return "redirect:/register/teacherSignup";
		}
	}
}
