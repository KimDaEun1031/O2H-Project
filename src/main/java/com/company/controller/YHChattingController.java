package com.company.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHChatRoomVO;
import com.company.domain.YHChatVO;
import com.company.service.YHChatService;
import com.company.service.YHTicketService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/chat/*")
@Controller
@Slf4j
public class YHChattingController {
	@Autowired
	private YHChatService service;
	
	@Autowired
	private YHTicketService tService;
	
	//@GetMapping("/roomList")
	@GetMapping("/chat_list")
	public String gotoChatWithAdmin(Model model) {
		List<YHChatRoomVO> list=service.getList();
		log.info("문의 하기 페이지로 이동"+list);
		int waitNum=tService.getWaitNum();
		model.addAttribute("list",list);
		model.addAttribute("waitNum",waitNum);
		return "/chat/chat_list";
	}
	@GetMapping("/gotoRoom1")
	public String gotoChatRoom1() {
		log.info("1번 방으로 진입합니다.");
		service.goIntoRoom1();
		return "/chat/room1";
		
	}
	@GetMapping("/gotoRoom1AsAdmin")
	public String gotoChatRoom1AsAdmin() {
		log.info("1번 방으로 진입합니다. 운영자로");
		service.goIntoRoom1AsAdmin();
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
	public String goOutRoom1(HttpServletRequest request) {
		log.info("1번 방에서 나옴");
		service.goInOutRoom1();
		List<YHChatVO> temp=service.getRoom1ChatList();
		String wantToSave=temp.toString();
		String ip=request.getRemoteAddr();
		ServletContext context= request.getServletContext();
		String path=context.getRealPath("/");
		File file=new File(path+File.separator+"chatHistory");
		if(!file.exists()) {
		file.mkdirs();
		}
		Date date=new Date();
		Long time=date.getTime();
		File saveFile=new File(path+"chatHistory"+File.separator+time+".txt");
		FileWriter fw=null;
		try {
			saveFile.createNewFile();
			fw=new FileWriter(saveFile);
			fw.write(ip+wantToSave);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*
		 * try { FileOutputStream fos=new FileOutputStream(saveFile);
		 * 
		 * 
		 * } catch (FileNotFoundException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		log.info("---------------------------------------------------------------------------------");
		log.info(path);
			service.goOutRoom1remove();
		return"redirect:/chat/chat_list";
	}
	@GetMapping("/goOutRoom2")
	public String goOutRoom2() {
		log.info("2번 방에서 나옴");
		service.goInOutRoom2();
		return"redirect:/chat/chat_list";
	}
	@GetMapping("/goOutRoom3")
	public String goOutRoom3() {
		log.info("3번 방에서 나옴");
		service.goInOutRoom3();
		
		return"redirect:/chat/chat_list";
	}
	@GetMapping("/gotoWaittingRoom1")
	public String gotoWaittingRoom1(Model model) {
		log.info("1번 웨이팅 룸으로 이동");
		tService.insertTicket();
		int wait_ticket=tService.getTicket();
		model.addAttribute("wait_ticket",wait_ticket);
		int wait_beforeme=tService.getWaitNumBeforeMe(wait_ticket);
		model.addAttribute("wait_beforeme",wait_beforeme);
		return "/chat/waittingRoom1";
	}
	@GetMapping("/goOutWaittingRoom1")
	public String goOutWaittingRoom1(int ticket) {
		log.info("1번 웨이팅 룸에서 나가기");
		tService.deleteTicket(ticket);
		
		return "redirect:/chat/chat_list";
	}
	@GetMapping("/goInFromWaittingRoom1")
	public String hoInFromWaittingRoom1(int ticket) {
		log.info("1번 대기 룸에서 들어가기");
		tService.deleteTicket(ticket);
		
		return "redirect:/chat/gotoRoom1";
	}

}
