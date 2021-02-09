package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.domain.SHProfileListVO;
import com.company.domain.SHProfileVO;
import com.company.service.SHTeacherService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SHTeacherListController {
	
	@Autowired
	private SHTeacherService service;
	
	@RequestMapping(value = "/PT/teacher_list", method = RequestMethod.GET)
	public void teacher_list() {
		log.info("Go to : /PT/teacher_list.jsp");
	}
	
	@GetMapping(path = "/PT/profile/{page}/{pageCount}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<SHProfileListVO> getProfile(@PathVariable(name = "page")int page, @PathVariable(name = "pageCount")int pageCount) {
		log.info("profile" + page + pageCount);
		
		SHProfileListVO lvo = service.getProfileList(page, pageCount);
		
		log.info(String.valueOf(lvo.getList().size()));
		
		if (!lvo.getList().isEmpty()) {
			return new ResponseEntity<SHProfileListVO>(lvo, HttpStatus.OK);
		} else {
			return new ResponseEntity<SHProfileListVO>(lvo, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(path = "/PT/recommendProfile/{page}/{pageCount}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<SHProfileListVO> getRecommendProfile(@PathVariable(name = "page")int page, @PathVariable(name = "pageCount")int pageCount) {
		log.info("recommendProfile" + page + pageCount);
		
		SHProfileListVO lvo = service.getRecommendProfileList(page, pageCount);
		
		log.info(String.valueOf(lvo.getList().size()));
		
		if (!lvo.getList().isEmpty()) {
			return new ResponseEntity<SHProfileListVO>(lvo, HttpStatus.OK);
		} else {
			return new ResponseEntity<SHProfileListVO>(lvo, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/PT/teacher_detail", method = RequestMethod.GET)
	public void detail(@RequestParam(name = "usrid")String userId, Model model) {
		log.info("detail" + userId);
		
		SHProfileVO vo = service.getProfileRow(userId);
		
		log.info("ProfileVO" + vo);
		
		model.addAttribute("profile", vo);
		
		log.info("Go to : /live/detail.jsp");
	}
}
