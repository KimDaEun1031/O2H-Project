package com.company.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHPageVO;
import com.company.service.YHAnnounceBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/announce/*")
public class YHAnnounceController {
	@Autowired
	private YHAnnounceBoardService service;
	
	@GetMapping("/getList")
	public String gotoAnnouceList(Model model,YHCriteria cri ) {
		log.info("annouce 리스트 요청"+cri);
		
		List<YHAnnounceBoardVO> list=service.searchAll(cri);
		model.addAttribute("list",list);
		log.info(list.toString());
		return "/board/board_announce_list";
	}
	
	@GetMapping("/write")
	public String gotoAnnouceWrite(Model model,YHCriteria cri) {
		log.info("announce write 페이지로 이동 요청" +cri);
		model.addAttribute("pageInfo",cri);
		return "/board/board_announce_write";
	}
	
	
	@PostMapping("/register")
	public String AnnounceWrite(Model model,YHAnnounceBoardVO board) {
		log.info("announce write 작성"+board);
		service.regist(board);
		model.addAttribute(board);
		return "/board/board_announce_list";
	}
	@GetMapping("/read")
	public String AnnounceRead(Model model ,int bno) {
		log.info("announce read 요청"+bno);
		YHAnnounceBoardVO board=service.read(bno);
		model.addAttribute("vo",board);
		return "/board/board_announce_read";
	}
}
