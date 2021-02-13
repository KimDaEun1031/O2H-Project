package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.HYLoginVO;
import com.company.domain.KDAdminTotalVO;
import com.company.domain.KDLoginInfoVO;
import com.company.domain.YHCriteria;
import com.company.domain.YHPageVO;
import com.company.service.HYService;
import com.company.service.KDAdminService;
import com.company.service.YHQandABoardService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("/admin/*")
public class KDAdminController {
	
	@Autowired
	private KDAdminService service;
	
	@Autowired
	private YHQandABoardService yhservice;
	
	@Autowired
	private HYService hyservice;
	
	@GetMapping("/admin_index")
	public String admin_index() {
		log.info("관리자 페이지");
		
		return "/admin/admin_index";
	}	
	
	@GetMapping("/admin_status")
	public String admin_status(Model model, KDLoginInfoVO loginInfo, KDAdminTotalVO admint) {
		log.info("관리자 월별현황페이지");
		List<KDLoginInfoVO> newlist= service.selectByNewUser();
		model.addAttribute("newlist",newlist);
		log.info("관리자 월별현황페이지"+newlist);
		int totalUser = service.getTotalUser(admint);
		int totalBoard = service.getTotalBoard(admint);
		model.addAttribute("totalUser", totalUser);
		model.addAttribute("totalBoard", totalBoard);
		log.info("관리자 월별현황페이지"+totalUser);
		log.info("관리자 월별현황페이지"+totalBoard);
		return "/admin/admin_status";
	}
	
	@GetMapping("/admin_member")
	public void admin_member(Model model) {
		log.info("관리자 회원관리페이지 - 관리자 리스트");
		List<KDLoginInfoVO> adminlist= service.AdminInfo();
		model.addAttribute("adminlist",adminlist);
	}
	
	@GetMapping("/admin_teacher_list")
	public void adminTeacherList(Model model) {
		log.info("관리자 회원관리페이지 - 강사 리스트");
		List<KDLoginInfoVO> teacherlist = service.TeacherInfo();
		model.addAttribute("teacherlist",teacherlist);
	}
	
	
	@GetMapping("/member_control")
	public String member_control(Model model,YHCriteria cri, String userId) {
		log.info("관리자 회원관리페이지 - 회원 관리");
		List<KDLoginInfoVO> memlist = service.memberControls(cri);
		int total = yhservice.getTotalCnt(cri);
		model.addAttribute("memlist", memlist);

		
		model.addAttribute("pageVO", new YHPageVO(cri, total));
		return "/admin/member_control";
	}
	
	@GetMapping("/read")
	public String memberRead(String userId, Model model) {
		log.info("회원 관리 - 단일");
		KDLoginInfoVO member = service.selectByOne(userId);
		model.addAttribute("member",member);
		log.info(member.getUserId(),member.getUser_level());
		
		return "/admin/member_control_modify";
		
	}
	
	@PostMapping("/update")
	public String memberModify(KDLoginInfoVO loginInfo, Model model, YHCriteria cri) {
		log.info("회원 관리 - 수정");
		if(service.memberModify(loginInfo)) {
			List<KDLoginInfoVO> memlist = service.memberControls(cri);
			int total = yhservice.getTotalCnt(cri);
			model.addAttribute("memlist", memlist);
			model.addAttribute("pageVO", new YHPageVO(cri, total));
			return "/admin/member_control";
		}else {
			return "/admin/member_control_modify";
		}
	}
		
	
	@GetMapping("/delete")
	public String memberDelete(String userId, Model model) {
		log.info("회원 강제 탈퇴 페이지");
		KDLoginInfoVO del = service.selectByOne(userId);
		model.addAttribute("del",del);
		return "/admin/member_deleteID";
	}
	
	@PostMapping("/member_deleteID")
	public String leavePost(HYLoginVO hylogin) {
		log.info("회원탈퇴 요청 "+hylogin); 
		
		if(hyservice.leave(hylogin)) {						
			return "/admin/member_control";	
		}else { //비밀번호가 틀린경우		
			return "/admin/member_deleteID";	
		}
	}
	
}
