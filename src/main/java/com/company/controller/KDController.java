package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.company.domain.YHQandABoardVO;
import com.company.service.KDAdminService;
import com.company.service.YHQandABoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KDController {
	
	@Autowired
	private KDAdminService service;
	
	
	
	@GetMapping("/admin/admin_all")
	public void adminAllBoard() {
		log.info("관리자 게시판 페이지");
	}
	
	@GetMapping("/shop/shop")
	public void shop() {
		log.info("쇼핑몰 페이지 요청");
	}
	
	@GetMapping("/board/board_announce_list")
	public String adminCustomerCenter() {
		log.info("고객 센터 페이지");
		return "/board/board_announce_list";
	}
	
	@GetMapping("/program/cal")
	public String calendarEx() {
		log.info("달력 페이지");
		return "/program/cal";
	}
	
	@GetMapping("/program/BMI")
	public void bmi() {
		log.info("bmi 계산기");
	}

	
	//etc END
	

}