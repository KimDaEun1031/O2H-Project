package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.company.domain.HYFileAttach;
import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDTeacherInfoVO;
import com.company.service.HYService;
import com.company.service.KDAdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KDPTteacherController {
	
	@Autowired
	private KDAdminService service;
	
	@Autowired
	private HYService hyservice;
	
//	@GetMapping(value = "/user/getEX",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public ResponseEntity<List<HYFileAttach>> getEX() {
//		log.info("첨부물 가져오기 : ");
//		return new ResponseEntity<List<HYFileAttach>>(service.exampleTeacher(),HttpStatus.OK);	
//	}
	
	
	@GetMapping("/PT/teacher-all")
	public void teacherpt(Model model) {
		List<KDLoginInfoVO> list = service.selectByNewUser();
		model.addAttribute("list",list);
		log.info("강사"+list);
	}
	
}	
