package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.KDLoginInfoVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHPageVO;
import com.company.domain.YHQandABoardVO;
import com.company.service.YHQandABoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qandaboard/*")
public class YHQandABoardControllerDontTouch {
	@Autowired
	YHQandABoardService service;
	
	@GetMapping("/gotoQandAList")
	public String goToQandABoardList(Model model,YHCriteria cri) {
		log.info("Q&A 게시판으로 이동"+cri.getPageNum());
		List<YHQandABoardVO> list=service.QandABoardList(cri);
		int total=service.getTotalCnt(cri);
		model.addAttribute("list",list);
	
		
		
		model.addAttribute("pageVO",new YHPageVO(cri,total));
		return "/board/board_QandA_list";
	}
	
	@GetMapping("/read")
	public String get(int bno,Model model,HttpSession session) {
		log.info("Q&A 단일 게시물 이동");
		YHQandABoardVO vo=service.QandASelect(bno);
		
		model.addAttribute("vo", vo);
		
		return "/board/board_QandA_read";
		
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
	
	@GetMapping("/update")
	public String gotoupdateBoard(Model model,int bno) {
		YHQandABoardVO vo=service.QandASelect(bno);
		model.addAttribute("vo",vo);
		
		return "/board/board_QandA_update";
	}	
	
	@PostMapping("/update")
	public String updateBoard(Model model,YHQandABoardVO board) {
		log.info("Q&A 보드 업데이트 요청");
		
		if(service.update(board)>0) {
			model.addAttribute("vo",service.QandASelect(board.getBno()));
			return "redirect:gotoQandAList";
		}else {
			model.addAttribute("vo",service.QandASelect(board.getBno()));
			
			return "/board/board_QandA_update";
		}
	}
	
	@GetMapping("/delete")
	public String delete(int bno) {
		log.info("Q&A delete 요청");
		service.delete(bno);
		return "redirect:gotoQandAList";
	}
	
	@PostMapping("/replyupdate")
	public String updateReply(YHQandABoardVO board) {
		log.info("댓글 update 요청"+board.getBno()+board.getReply());
		
		service.updatereply(board);
		return "redirect:gotoQandAList";
	}
}
