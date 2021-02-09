package com.company.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHAnnouceReplyVO;
import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHPageVO;
import com.company.service.YHAnnounceBoardService;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

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
		return "redirect:/announce/getList";
	}
	@GetMapping("/read")
	public String AnnounceRead(Model model ,int bno) {
		log.info("announce read 요청"+bno);
		YHAnnounceBoardVO board=service.read(bno);
		List<YHAnnouceReplyVO> list=service.getReplyAll();
		model.addAttribute("list",list);
		model.addAttribute("vo",board);
		return "/board/board_announce_read";
	}
	@PostMapping("/update")
	public String AnnouceUpdate(YHAnnounceBoardVO board) {
		log.info("update 요청"+ board);
		service.announceUpdate(board);
		return "redirect:/announce/getList";
	}
	@GetMapping("/delete")
	public String AnnounceDelete(int bno) {
		log.info("announce 삭제 요청 bno=" +bno);
		
		service.announceDelete(bno);
		return "redirect:/announce/getList";
		
	}
	
	@PostMapping("/replyWrite")
	public String AnnounceReplyWrite(YHAnnouceReplyVO replyVo) {
		log.info("announce 댓글 추가 요청" +replyVo);
		log.info("replyVo는?");
		service.replyInsert(replyVo);
		return "redirect:/announce/read?bno="+replyVo.getBno();
		
	}
	@GetMapping("/deleteReply")
	public String AnnounceReplyRemove(int rno,int bno) {
		log.info("announce 댓글 제거 요청");
		service.deleteReply(rno);
		return "redirect:/announce/read?bno="+bno;
	}
}
