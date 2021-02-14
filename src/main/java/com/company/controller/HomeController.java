package com.company.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.HYPhotoBoardCriteria;
import com.company.domain.HYPhotoBoardFileAttach;
import com.company.domain.HYPhotoBoardPageVO;
import com.company.domain.HYPhotoBoardVO;
import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;
import com.company.service.HYPhotoBoardService;
import com.company.service.YHAnnounceBoardService;

import lombok.extern.slf4j.Slf4j;



/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 */
	
	@Autowired
	private YHAnnounceBoardService service;
	
	@Autowired
	private HYPhotoBoardService hyservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,YHCriteria cri, HYPhotoBoardCriteria hycri) {
		logger.info("메인 페이지");
		
		List<YHAnnounceBoardVO> list=service.searchAll(cri);
		model.addAttribute("list",list);
		log.info(list.toString());
		
		
		log.info("포토보드 전체 리스트 요청 "+cri);
		//전체목록 요청
		List<HYPhotoBoardVO> hylist = hyservice.getList(hycri);	

		//경로 때문에 수정
		for(HYPhotoBoardVO hyvo : hylist) {
			HYPhotoBoardFileAttach attach= hyvo.getAttach();
			
			String path = attach.getUploadPath();		
			if(path!=null)
				attach.setUploadPath(path.replaceAll("\\\\", "/"));			
		}		

		int total = hyservice.getTotalCnt(hycri);
		model.addAttribute("hylist", hylist);
		model.addAttribute("pageVO", new HYPhotoBoardPageVO(hycri, total));
		return "index";
		
		
		
	}
	
}
