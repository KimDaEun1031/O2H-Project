package com.company.controller;

import java.util.ArrayList;
import java.util.Date;
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
import com.company.service.KDRegisterService;
import com.company.service.YHCalService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KDUserController {
	
	@Autowired
	private KDRegisterService service;
	
	@Autowired
	private YHCalService yhservice;
	
	
	@GetMapping("/user/user_my")
	public void Mypage(HttpSession session, KDLoginInfoVO loginInfo, Model model,YHCalVO vo) {
		KDLoginInfoVO loginInfoTemp = (KDLoginInfoVO) session.getAttribute("loginInfo");
		log.info("유저 마이페이지" +loginInfoTemp);
		service.ProfileInfo(loginInfoTemp);	
		
		log.info("유저 페이지 차트");
		Date now=new Date();
		int day=now.getDate();
		int month=now.getMonth()+1;
		int year=now.getYear()+1900;
		System.out.println(day);
		System.out.println(month);
		System.out.println(year);
		int fullday=year*10000+month*100+day;
		
		vo.setDates(fullday);
		vo.setUser_id(loginInfoTemp.getUserId());
		log.info("vo확인"+vo);
		List<YHCalVO> list=yhservice.select(vo);
		System.out.println("여기가 1");
		System.out.println(list);
		int arr[]=new int[31];
		int brr[]=new int[31];
		for(int i=0;i<31;i++) {
			arr[i]=0;
			brr[i]=0;
		}
		
		for(int i=0;i<list.size();i++) {
			
			
			
			int temp= list.get(i).getDates();
			if(temp/100==month+100*year) {
			temp= temp%100;
			arr[temp]=list.get(i).getCal();
			brr[temp]=(list.get(i).getExtime())*100;
			}
			}
		

		
		List<Integer> list2=new ArrayList<Integer>();
		for(int i=0;i<arr.length;i++) {
			list2.add(arr[i]);
		}
		List<Integer> list3=new ArrayList<Integer>();
		for(int i=0;i<arr.length;i++) {
			list3.add(brr[i]);
		}
	    log.info(list3.toString());
		model.addAttribute("list",list2);
		model.addAttribute("list2",list3);
		
			
		
	}
		
	@GetMapping("/user/user_QnA")
	public String userQnA(YHQandABoardVO yhqnavo, Model model, HttpSession session, KDLoginInfoVO loginInfo, String userId) {
		log.info("문의내역 페이지"+yhqnavo);
		loginInfo = (KDLoginInfoVO) session.getAttribute("loginInfo");
		yhqnavo.setUserId(loginInfo.getUserId());
		log.info("유저 아이디"+yhqnavo.getUserId());
		List<YHQandABoardVO> userlist= service.QnAUsers(yhqnavo.getUserId());
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

