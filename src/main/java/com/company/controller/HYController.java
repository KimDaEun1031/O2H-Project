package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.HYChangeVO;
import com.company.domain.HYFileAttach;
import com.company.domain.HYLoginVO;
import com.company.domain.KDLoginInfoVO;
import com.company.service.HYService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HYController {
	
	@Autowired
	private HYService service;

	
	@GetMapping("/register/deleteID")
	public void leaveGet() {
		log.info("회원탈퇴 폼 보여주기"); 		
	}
	
	
	//회원탈퇴 - 회원삭제하고 세션해제 후 index 이동
	@PostMapping("/register/deleteID")
	public String leavePost(HYLoginVO hylogin, HttpSession session) {
		log.info("회원탈퇴 요청 "+hylogin); 
		
		if(service.leave(hylogin)) {			
			session.invalidate();
			return "redirect:/";	
		}else { //비밀번호가 틀린경우		
			return "redirect:deleteID";	
		}
	}
	
	
	//칼로리사전 AJAX
	@GetMapping("/program/calorDict")
	public void calor5() {
		log.info("칼로리 사전");
	}
		

	//프로필 수정 폼 보여주기
	@GetMapping("/user/profile_setting")
	public void getProfileSetting() {
		log.info("프로필 수정 폼 보여주기");
	}
	
		
	//첨부파일 + user 정보 전반 수정
	@PostMapping("/user/infoUpdateForm")
	public String profileUpdateInfo(HYChangeVO change, @SessionAttribute KDLoginInfoVO loginInfo, HttpSession session,RedirectAttributes rttr) {
		log.info("회원정보 이메일+첨부 ++ 기타 정보 모두 수정"+change);
		change.setUserId(loginInfo.getUserId());
		service.modifyInfo(change);
		session.invalidate();
		
		return "redirect:/register/login";
	}
		
		
	//비밀번호 수정
	@PostMapping("/user/passwordForm")
	public String profileChangePwd(HYChangeVO change, @SessionAttribute KDLoginInfoVO loginInfo, HttpSession session,RedirectAttributes rttr) {
		log.info("회원정보 비밀번호 수정"+change);
		change.setUserId(loginInfo.getUserId());
		if(service.modifyPwd(change)) {
			session.invalidate();
			return "redirect:/register/login";			
		}else {
			//실패 -> 비밀번호 변경 폼 보여주기
			rttr.addFlashAttribute("error", "현재 비밀번호를 확인해 주세요");
			return "redirect:/user/profile_setting";
		}
	}

	
	//program/test
	@GetMapping("/program/test")
	public void myAttachTest() {

	}
		
	
	//첨부물 가져오기
	@GetMapping(value = "/user/getAttachList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<HYFileAttach>> getAttachList(String userId) {
		log.info("첨부물 가져오기 : "+userId);
		return new ResponseEntity<List<HYFileAttach>>(service.getAttachList(userId),HttpStatus.OK);	
	}

	
	//프로필
	@GetMapping("/user/profile")
	public void getProfile() {
		log.info("프로필 페이지 요청");
	}

	@GetMapping("/board/board_view")
	public void boardView() {

	}

	
	//teacher_profile_setting 정보+첨부파일
	@PostMapping("/teacher/teacher_my_stream")
	public String teacherProfileSetting(HYChangeVO change, @SessionAttribute KDLoginInfoVO loginInfo, HttpSession session,RedirectAttributes rttr) {
		log.info("teacher_profile_setting Info + 첨부 수정"+change);
		change.setUserId(loginInfo.getUserId());
		service.modifyTeacherInfo(change);
		session.invalidate();
		
		return "redirect:/register/login";
	}		
}
