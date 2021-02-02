package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHQandABoardVO;
import com.company.service.YHQandABoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qandaboard/*")
public class YHQandABoardController {
	@Autowired
	YHQandABoardService service;
	
	@GetMapping("/gotoQandAList")
	public String goToQandABoard() {
		log.info("큐엔에이 게시판으로 이동");
		
		return "/board/board_QandA_list";
	}
	
	
	@GetMapping("/register")
	public String register() {
		log.info("register 페이지 요청");
		return "/board/board_QandA_writer";
	}
	
	@GetMapping("/gotoWriterQuestion")
	public String gotoWriterQ() {
		log.info("Q&A 작성 이동 요청");
		
		return "/board/board_QandA_write";
	}
	
	@PostMapping("/register")
	public String registerPost(YHQandABoardVO board) {
		log.info("Q&A 보드에 글 작성");
		boolean result=service.regist(board);
		
		if(result) {
			return "redirect:/qandaboard/gotoQandAList";
		}
		return "/board/board_QandA_write";
	}
	
}
