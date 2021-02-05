package com.company.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHPageVO;
import com.company.service.YHAnnounceBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/annouce/*")
public class YHAnnounceController {
	@Autowired
	private YHAnnounceBoardService service;
	
	@GetMapping("/getList")
	public String gotoAnnouceList(Model model,YHCriteria cri ) {
		log.info("annouce 리스트 요청"+cri);
		
		List<YHAnnounceBoardVO> list=service.searchAll(cri);
		model.addAttribute("list",list);
		
		return "/board/board_announce_list";
	}
	
	
}
