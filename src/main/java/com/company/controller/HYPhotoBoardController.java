package com.company.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.HYPhotoBoardCriteria;
import com.company.domain.HYPhotoBoardFileAttach;
import com.company.domain.HYPhotoBoardPageVO;
import com.company.domain.HYPhotoBoardVO;
import com.company.service.HYPhotoBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class HYPhotoBoardController {
	
	@Autowired
	private HYPhotoBoardService service;
	
	
	//게시글 작성 폼 보여주기
	@GetMapping("/board_photo_write")
	public void photoBoardWrite() {
		log.info("포토보드 글작성 폼 보여주기");
	}
	
	
	//게시글 작성
	@PostMapping("/board_photo_write")
	public String photoBoardWritePost(HYPhotoBoardVO board) {
		log.info("포토보드 게시글 등록"+board);	
		
		if(service.regist(board)) {
			log.info("게시글 번호 "+board.getBno());
			return "redirect:/board/board_photo_list";
		}
			return "board_photo_write";	
	}

	
	//게시글 목록 보기-쌤.
	@GetMapping("/board_photo_list")
	public void photoBoardList(Model model, HYPhotoBoardCriteria cri) {
		log.info("포토보드 전체 리스트 요청 "+cri);
		//전체목록 요청
		List<HYPhotoBoardVO> list = service.getList(cri);	

		//경로 때문에 수정
		for(HYPhotoBoardVO vo : list) {
			HYPhotoBoardFileAttach attach= vo.getAttach();
			
			String path = attach.getUploadPath();		
			if(path!=null)
				attach.setUploadPath(path.replaceAll("\\\\", "/"));			
		}		

		int total = service.getTotalCnt(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", new HYPhotoBoardPageVO(cri, total));
	}

	
	//특정 게시물 보기
	@GetMapping({"/board_photo_read", "/board_photo_update"})
	public void GetphotoBoardReadUpdate(int bno,@ModelAttribute("cri") HYPhotoBoardCriteria cri, Model model) {
		log.info("포토보드 특정 게시물 보기 "+bno);
		log.info("Criteria "+cri);	
		HYPhotoBoardVO board = service.getRow(bno);
		model.addAttribute("board", board);	
		log.info("보드에 담긴 정보 확인 "+board);	
		
	}

	
	//특정 게시물 삭제
	@PostMapping("/remove")
	public String remove(int bno, String writer, HYPhotoBoardCriteria cri, RedirectAttributes rttr) {
		log.info("게시물 삭제 "+bno);	
		
		List<HYPhotoBoardFileAttach> attachList = service.getAttachList(bno);
		if(service.remove(bno)) { // 2. 데이터베이스 삭제(게시물, 첨부물)
			//3. 파일 삭제
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success"); 
		}
		rttr.addAttribute("pageNum", cri.getPageNum()); // 주소줄에 따라가는 형태
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:board_photo_list";
	}
	
	private void deleteFiles(List<HYPhotoBoardFileAttach> attachList) {
		log.info("첨부물 삭제 "+attachList);
		
		if(attachList == null || attachList.size() <= 0) {
			return;
		}
		
		for(HYPhotoBoardFileAttach attach:attachList) {
			Path path = Paths.get("/photoBoard/",attach.getUploadPath()+"\\"+
					attach.getUuid()+"_"+attach.getFileName());
			
			//일반파일, 이미지 원본 파일 삭제			
			try {
				Files.deleteIfExists(path);
				
				if(Files.probeContentType(path).startsWith("image")) {
					Path thumb = Paths.get("/photoBoard/",attach.getUploadPath()+"\\s_"+
							attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumb);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	}

	
	@PostMapping("/board_photo_update")
	public String photoBoardUpdate(HYPhotoBoardVO board, HYPhotoBoardCriteria cri, RedirectAttributes rttr) {
		log.info("포토보드 수정 요청");
		log.info("게시물 수정 "+board);	
		log.info("Criteria 주소 확인 - "+cri);			
		
		service.modify(board);	
		
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:board_photo_list";
	}	
	
	
	//첨부물 가져오기
	@GetMapping(value = "/getAttachList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<HYPhotoBoardFileAttach>> getAttachList(int bno) {
		log.info("첨부물 가져오기 : "+bno);
		return new ResponseEntity<List<HYPhotoBoardFileAttach>>(service.getAttachList(bno),HttpStatus.OK);	
	}	
}
