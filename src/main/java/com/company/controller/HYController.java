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

@Controller
@Slf4j
//@RequestMapping("/register/*")
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

	}
	
//	@GetMapping("/register/user")
//	public String user() {
//		return "/user/user";
//	}
	

	@GetMapping("/user/profile")
	public void profile() {

	}
	
	//////////
	
//	@GetMapping("/gotoLogin")
//	public String gotoLogin() {
//		log.info("로그인 페이지로 이동 요청");
//		
//		return "/register/login";
//	}
//	
	
	//로그인 정보(아이디,비밀번호)를 가져오는 컨트롤러를 작성
//		@PostMapping("/gotoLogin") //액션이 없을 때 get들어온 주소 그대로 post로 한건 action 없을 때 보내기 쓰는 단계 아닌가.
//		public String loninPost(LoginVO login, HttpSession session) {
//			log.info("로그인 페이지 요청..."+login); 
//			AuthVO auth = service.isLogin(login);
//			//log.info(""+auth);
//			if(auth!=null) {
//				session.setAttribute("auth", auth);
//				return "redirect:/";
//			}else {//userid, password 가 틀려서 로그인을 못한 경우
//				return "redirect:signin";
//			}
//			
//		}
		
		
//////////////////////////////////////////////////////////////////
	
	//파일 첨부
	

	
	/*
	 * 1. 회원정보 수정 - 세션 필요하고  - 성공 후 .invalidate() 해야하고
	 * 2. 첨부파일 수정 - 첨부파일 수정할 때 다 지우고 수정 내용으로 다시 등록했었지.
	 * -> 다 지우고 다시 등록할 때 세션에서 받아온 ID-PWD도 유지되면서 등록 되는걸까?
	 * 
	 * 
	 */	
	
	
//	@PostMapping("/changePwd") // http://localhost:8080/member/changePwd + post
//	public String changePost(ChangeVO change, @SessionAttribute HYLoginVO auth, HttpSession session,RedirectAttributes rttr) {
//		//회원정보 수정 - change(password,new_password,confirm_password)
//		log.info("회원정보 수정"+change);
//		//userid 세션에서 가져와서 change 에 담기
//		//AuthVO auth = (AuthVO) session.getAttribute("auth"); //아까 로그인때 set으로 담은거 get으로 가져오는것임, get할 땐 오브젝트 타입이라서 형변환 필수, set은 괜찮
//		change.setUserid(auth.getUserid());
//		
//		//service에 비밀번호 변경 요청
//		if(service.update(change)) {			
//			//성공 => 세션해제 후 로그인 페이지로 이동
//			session.invalidate();
//			return "redirect:/";
//		}else {			
//			//실패 -> 비밀번호 변경 폼 보여주기 이동-현재 비밀번호가 틀리면 나오는구나
//			rttr.addFlashAttribute("error", "비밀번호를 확인해 주세요");
//			return "redirect:changePwd";// 다 써도 되고 뒤에만 이렇게 써 줘도 되고
//		}	
//	}
//	
	
	
	/* 
	 * 
	 *  	//특정 게시물 수정
	@PostMapping("/modify")
	@PreAuthorize("#board.writer == principal.username")	//작성자와 로그인한 정보가 같은지 다시 한번 확인
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info("게시물 수정 "+board);	// 이게 수정내용
		log.info("Criteria 주소 확인 - "+cri);	 //로그인 정보
		
		//파일첨부 확인
		if(board.getAttachList()!=null) { // 열어둬도 상관없음
			board.getAttachList().forEach(attach -> log.info(""+attach));
		}
		
		service.modify(board);	

		
		return "redirect:/";
	}
	 *   
	 *  
	 *  */
	
	//프로필-수정폼 보여주기
	@GetMapping("/user/profile_setting")
	public void getProfileSetting() {

	}
	
	//이거 안씀 - form 두개로 나눴음.
	@PostMapping("/user/profile_setting")
	public String PostProfileSetting(HYChangeVO change, @SessionAttribute KDLoginInfoVO auth, HttpSession session,RedirectAttributes rttr) {
		log.info("회원정보 수정"+change);
		change.setUserId(auth.getUserId());
		
//		if() {//service.update(change) 이렇게 가져왔는데 이게 맞냐는 거지.
//			session.invalidate();
//			return "redirect:/register/login";
//		}else {
//			rttr.addFlashAttribute("error", "비밀번호를 확인해 주세요");
//			return "redirect:/user/profile_setting";
//		}
		
		//service.modify(board);	보드에서는 이거 하나만 하네?
		
		return "/";
	}
	
//	//이메일 수정-문제있네 수정 내용이 홈페이지에 바로 반영이 안되고 있음.
//	@PostMapping("/user/infoUpdateForm")
//	public String profileUpdateInfo(HYChangeVO change, @SessionAttribute KDLoginInfoVO loginInfo, HttpSession session,RedirectAttributes rttr) {
//		log.info("회원정보 이메일 수정"+change);
//		change.setUserId(loginInfo.getUserId()); //앞단에서 못받는 거는 이렇게 해주는 거구나
//		Service.modifyInfo(change);
//		
//		return "redirect:/user/user_my";
//	}
	
	//이메일 수정-문제있네 수정 내용이 홈페이지에 바로 반영이 안되고 있음.
	@PostMapping("/user/infoUpdateForm")
	public String profileUpdateInfo(HYChangeVO change, @SessionAttribute KDLoginInfoVO loginInfo, HttpSession session,RedirectAttributes rttr) {
		log.info("회원정보 이메일+첨부 수정"+change);
		change.setUserId(loginInfo.getUserId()); //앞단에서 못받는 거는 이렇게 해주는 거구나
		service.modifyInfo(change);
		session.invalidate();
		
		return "redirect:/register/login";
	}
//	//이메일+첨부파일 수정
//	@PostMapping("/user/infoUpdateForm")
//	public String profileUpdateInfo(HYChangeVO change, @SessionAttribute KDLoginInfoVO loginInfo, HttpSession session,RedirectAttributes rttr) {
//		log.info("회원정보 이메일+첨부파일 수정"+change);
//		change.setUserId(loginInfo.getUserId()); //앞단에서 못받는 거는 이렇게 해주는 거구나
//		Service.modifyInfo(change);
//		
//		return "redirect:/";
//	}
	
//	//비밀번호 수정-문제있네
//	@PostMapping("/user/passwordForm")
//	public String profileChangePwd(HYChangeVO change, @SessionAttribute KDLoginInfoVO loginInfo, HttpSession session,RedirectAttributes rttr) {
//		log.info("회원정보 비밀번호 수정"+change);
//		change.setUserId(loginInfo.getUserId()); //앞단에서 못받는 거는 이렇게 해주는 거구나++처음 세션에 담은 변수명 그대로 여기서도 변수명을 똑같이 써줘야하는구나
//		service.modifyPwd(change);
//		session.invalidate();
//		return "redirect:/register/login";
//	}
	//비밀번호 수정2-문제있네-new!=confirm 맞지 않는데 그냥 넘어가버림
	@PostMapping("/user/passwordForm")
	public String profileChangePwd(HYChangeVO change, @SessionAttribute KDLoginInfoVO loginInfo, HttpSession session,RedirectAttributes rttr) {
		log.info("회원정보 비밀번호 수정"+change);
		change.setUserId(loginInfo.getUserId()); //앞단에서 못받는 거는 이렇게 해주는 거구나++처음 세션에 담은 변수명 그대로 여기서도 변수명을 똑같이 써줘야하는구나
		if(service.modifyPwd(change)) {
			session.invalidate();
			return "redirect:/register/login";			
		}else {
			//실패 -> 비밀번호 변경 폼 보여주기 이동-현재 비밀번호가 틀리면 나오는구나
			rttr.addFlashAttribute("error", "현재 비밀번호를 확인해 주세요");
			return "redirect:/user/profile_setting";
		}
	}

	
	
	
	
	
	//첨부물 가져오기 - 안 되고 있음.
	@GetMapping(value = "/getAttachList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<HYFileAttach>> getAttachList(String userId) {
		log.info("첨부물 가져오기 : "+userId);
		return new ResponseEntity<List<HYFileAttach>>(service.getAttachList(userId),HttpStatus.OK);	
	}
	
	
	
	
	
	
	
	@GetMapping("/board/board_view")
	public void boardView() {

	}
	
	
	
	
	
	
	
}
