package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.KDLoginInfoVO;
import com.company.domain.KDLoginVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHPageVO;
import com.company.domain.YHQandABoardVO;
import com.company.service.KDService;
import com.company.service.YHQandABoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user/*")
public class KDUserController {
	
	@Autowired
	private KDService service;
	
	@Autowired
	YHQandABoardService yhservice;
	
	@GetMapping("/user_my")
	public void Mypage(HttpSession session, KDLoginInfoVO loginInfo) {
		KDLoginInfoVO loginInfoTemp = (KDLoginInfoVO) session.getAttribute("loginInfo");
		log.info("유저 마이페이지" +loginInfoTemp);
		service.ProfileInfo(loginInfoTemp);		
	}
	
	@GetMapping("/teacher_profile_setting")
	public void teacher_profile_setting() {	
		log.info("프로필 설정 페이지");
		
	}
	
	@GetMapping("/user_QnA")
	public String userQnA(YHQandABoardVO yhqnavo, Model model) {
		log.info("문의내역 페이지"+yhqnavo);
		List<YHQandABoardVO> userlist= service.QnAUsers();
		model.addAttribute("userlist",userlist);
		log.info("문의내역 페이지"+userlist);
		return "/user/user_QnA";
	}
	
	@PostMapping("/teacher_profile_setting")
	public String updateUserProfileInfo(HttpSession session, KDLoginInfoVO loginInfo) {
		KDLoginInfoVO loginInfoTemp = (KDLoginInfoVO) session.getAttribute("loginInfo");
		loginInfo.setUserId(loginInfoTemp.getUserId());		
		if(service.userUpdate(loginInfo)) {
			session.setAttribute("loginInfo", loginInfo);
			return "/teacher_my";
		} else {
			return "/teache_profile_setting";			
		}
		
	}
	
	@GetMapping("/user/admin_index")
	public void admin_index() {
		log.info("관리자 페이지");
	}
	
	@GetMapping("/teacher_my")
	public void teacherpage() {
		log.info("강사 시 마이페이지");
	}
	
	@GetMapping("/teacher_my_stream")
	public void teacherStreampage() {
		log.info("강사 스트림 마이페이지");
	}
	
	//user-teacher END

}
