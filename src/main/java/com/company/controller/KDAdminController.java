package com.company.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.KDAdminTotalVO;
import com.company.domain.KDLoginInfoVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHPageVO;
import com.company.service.KDService;
import com.company.service.YHQandABoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/*")
public class KDAdminController {
	
	@Autowired
	private KDService service;
	
	@Autowired
	YHQandABoardService yhservice;
	
	@GetMapping("/admin/admin_index")
	public void admin_index() {
		log.info("관리자 페이지");
	}	
	
	@GetMapping("/admin_status")
	public String admin_status(Model model, KDLoginInfoVO loginInfo, KDAdminTotalVO admint) {
		log.info("관리자 월별현황페이지");
		List<KDLoginInfoVO> newlist= service.selectByNewUser();
		model.addAttribute("newlist",newlist);
		log.info("관리자 월별현황페이지"+newlist);
		int totalUser = service.getTotalUser(admint);
		int totalBoard = service.getTotalBoard(admint);
		model.addAttribute("totalUser", totalUser);
		model.addAttribute("totalBoard", totalBoard);
		log.info("관리자 월별현황페이지"+totalUser);
		log.info("관리자 월별현황페이지"+totalBoard);
		return "/admin/admin_status";
	}
	
	@GetMapping("/admin_member")
	public void admin_member(Model model) {
		log.info("관리자 회원관리페이지 - 관리자 리스트");
		List<KDLoginInfoVO> adminlist= service.AdminInfo();
		model.addAttribute("adminlist",adminlist);
	}
	@GetMapping("/member_control")
	public String member_control(Model model,YHCriteria cri) {
		log.info("관리자 회원관리페이지 - 회원 관리");
		List<KDLoginInfoVO> memlist = service.memberControls(cri);
		int total = yhservice.getTotalCnt(cri);
		model.addAttribute("memlist", memlist);
		
		model.addAttribute("pageVO", new YHPageVO(cri, total));
		return "/admin/member_control";
	}
	
	@GetMapping("/delete")
	public void memberDelete() {
		log.info("회원 탈퇴");
	}
	
	
}
