package com.company.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHAreaChatGetVO;
import com.company.domain.YHAreaChatVO;
import com.company.service.YHAreaChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/areaChat/*")
public class YHAreaChatController {
	
	@Autowired
	YHAreaChatService service;
	
	@GetMapping("/chatRoomList")
	public String gotoChattingList(Model model) {
		log.info("지역별 채팅 방들 목록으로 이동");
		 List<YHAreaChatVO> roomInfoList=service.ChatList();
		 List<YHAreaChatVO> roomInfoListReverse=new ArrayList<YHAreaChatVO>();
		 for(int i=4;i>=0;i--) {
			 roomInfoListReverse.add(roomInfoList.get(i));
		 }
		 log.info("지역별 채팅 방 목록 가시전 확인 roomInfoList="+roomInfoList);
		 model.addAttribute("roomInfoList",roomInfoListReverse);
		 List<YHAreaChatGetVO> seoulList= service.seoulGetChat5();
	
		 
		 model.addAttribute("seoulChatList5",seoulList);
		return "/chat/areachatlist_view";
		
	}
	
	@GetMapping("/goSeoul")
	public String gotoSeoulChat() {
		log.info("서울 채팅 방으로 입장합니다.");
		service.seoulUserNumPlus();
		
		return "/chat/area_chat_seoul";
	}
	
	@GetMapping("/goOutSeoul")
	public String goOutSeoulChat() {
		log.info("서울 채팅 방에서 퇴장합니다");
		service.seoulUserNumMinus();
		return "redirect:/areaChat/chatRoomList";
	}
}
