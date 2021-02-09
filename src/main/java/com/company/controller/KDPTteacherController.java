package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.company.domain.KDTeacherInfoVO;
import com.company.service.KDService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KDPTteacherController {
	
	@Autowired
	private KDService service;
	
	@GetMapping("/PT/teacher-all")
	public void teacherAll(Model model, KDTeacherInfoVO teacherInfo) {
		log.info("전체 강사 페이지 요청"+teacherInfo);
		List<KDTeacherInfoVO> teacherlist = service.teacherInfo();
		model.addAttribute("teacherlist", teacherlist);
		log.info("전체 강사 페이지 요청"+teacherlist);
	}
	
}	
