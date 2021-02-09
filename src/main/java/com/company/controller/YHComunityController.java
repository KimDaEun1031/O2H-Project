package com.company.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.YHComunityBoardVO;
import com.company.service.YHComunityBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/comunity/*")
public class YHComunityController {
	
	@Autowired
	YHComunityBoardService service;
	
	@GetMapping("/gotoList")
	public String gotoComunity(Model model) {
		log.info("운동자랑 게시판으로 이동");
		List<YHComunityBoardVO> list=service.boardList();
		model.addAttribute("list",list);
		return "/YHComunity/comunity_list";
	}
	
	
	
	@GetMapping("/gotoWriter")
	public String gotoWriter() {
		log.info("운동자랑 글 작성으로 이동");
		
		return "/YHComunity/comunity_write";
	}
	
	
	@PostMapping("/write")
	public String write( HttpServletRequest request,MultipartFile filename) {
		log.info("업로드 요청");
		YHComunityBoardVO board=new YHComunityBoardVO();
		board.setTitle(request.getParameter("title"));
		board.setWriter_id(request.getParameter("writer_id"));
		board.setContent(request.getParameter("content"));
		board.setFilename(filename.getOriginalFilename());
		
		log.info(board.toString());
		service.insert(board);
		String uploadPath=request.getServletContext().getRealPath("/resources/comunityImg");
		
		log.info("upload file name:"+filename.getOriginalFilename());
		String fileName=filename.getOriginalFilename();
		log.info("upload file size:"+filename.getSize());
		
		File saveDirectory=new File(uploadPath);
		if(!saveDirectory.exists()) {
			saveDirectory.mkdirs();
			log.info("디렉토리 생성"+uploadPath);
		}else {
			log.info("디렉토리 있는것 확인" +uploadPath);
		}
		log.info("여기인가?");
		File saveFile=new File(uploadPath+File.separator+fileName);
		log.info("여기인가?2");
		log.info("파일 만들기");
			try {
				filename.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		return "redirect:/comunity/gotoList";
	}
	
	@GetMapping("/read")
	public String readread(Model model,int bno) {
		log.info("comunity 읽으러 왔어요 뿌우"+bno);
		YHComunityBoardVO vo=service.read(bno);
		model.addAttribute("vo",vo);
		log.info("파일의 이름"+vo.getFilename());
		return "/YHComunity/comunity_read";
	}
}
