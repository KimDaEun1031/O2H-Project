package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHChatRoomVO;
import com.company.service.YHChatService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/chat/*")
@Controller
@Slf4j
public class YHChattingController {
	@Autowired
	private YHChatService service;
	
	//@GetMapping("/roomList")
	@GetMapping("/chat_list")
	public String gotoChatWithAdmin(Model model) {
		List<YHChatRoomVO> list=service.getList();
		log.info("문의 하기 페이지로 이동"+list);
		model.addAttribute("list",list);
		return "/chat/chat_list";
	}
	@GetMapping("/gotoRoom1")
	public String gotoChatRoom1() {
		log.info("1번 방으로 진입합니다.");
		service.goIntoRoom1();
		return "/chat/room1";
		
	}
	@GetMapping("/gotoRoom2")
	public String gotoChatRoom2() {
		log.info("1번 방으로 진입합니다.");
		service.goIntoRoom2();
		return "/chat/room2";
		
	}
	@GetMapping("/gotoRoom3")
	public String gotoChatRoom3() {
		log.info("1번 방으로 진입합니다.");
		service.goIntoRoom3();
		return "/chat/room3";
		
	}
	@GetMapping("/goOutRoom1")
	public String goOutRoom1() {
		log.info("1번 방에서 나옴");
		service.goInOutRoom1();
		service.goOutRoom1remove();
		return"redirect:/chat/roomList";
	}
	@GetMapping("/goOutRoom2")
	public String goOutRoom2() {
		log.info("2번 방에서 나옴");
		service.goInOutRoom2();
		return"redirect:/chat/roomList";
	}
	@GetMapping("/goOutRoom3")
	public String goOutRoom3() {
		log.info("3번 방에서 나옴");
		service.goInOutRoom3();
		
		return"redirect:/chat/roomList";
	}

}
