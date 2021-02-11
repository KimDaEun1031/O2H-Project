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
import com.company.domain.YHCalVO;
import com.company.domain.YHQandABoardVO;
import com.company.service.KDAdminService;
import com.company.service.KDRegisterService;
import com.company.service.YHCalService;
import com.company.service.YHQandABoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KDUserController {
	
	@Autowired
	private KDRegisterService service;
	
	@Autowired
	private YHQandABoardService yhservice;
	
	@Autowired
	private YHCalService yhCalservice;
	
	
	@GetMapping("/user/user_my")
	public void Mypage(HttpSession session, KDLoginInfoVO loginInfo) {
		KDLoginInfoVO loginInfoTemp = (KDLoginInfoVO) session.getAttribute("loginInfo");
		log.info("유저 마이페이지" +loginInfoTemp);
		service.ProfileInfo(loginInfoTemp);		
	}
		
	@GetMapping("/user/user_QnA")
	public String userQnA(YHQandABoardVO yhqnavo, Model model) {
		log.info("문의내역 페이지"+yhqnavo);
		List<YHQandABoardVO> userlist= service.QnAUsers();
		model.addAttribute("userlist",userlist);
		log.info("문의내역 페이지"+userlist);
		return "/user/user_QnA";
	}
	
	@PostMapping("/teacher/teacher_profile_setting")
	public String updateUserProfileInfo(HttpSession session, KDLoginInfoVO loginInfo) {
		KDLoginInfoVO loginInfoTemp = (KDLoginInfoVO) session.getAttribute("loginInfo");
		loginInfo.setUserId(loginInfoTemp.getUserId());		
		if(service.userUpdate(loginInfo)) {
			session.setAttribute("loginInfo", loginInfo);
			log.info("수정 완료");
			return "/teacher/teacher_my_stream";
		} else {
			return "/teacher/teacher_profile_setting";			
		}
		
	}
	
	@GetMapping("/teacher/teacher_profile_setting")
	public void teacher_profile_setting() {	
		log.info("프로필 설정 페이지");
		
	}
		
	@GetMapping("/teacher/teacher_my_stream")
	public void teacherStreampage() {
		log.info("강사 스트림 마이페이지");
	}
	
	@GetMapping("/user/user_calendar")
	public void userCalendar() {
		log.info("일정 관리");
	}

}
	
	
	
	//user-teacher END

