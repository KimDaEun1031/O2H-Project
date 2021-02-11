package com.company.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;
import com.company.service.YHAnnounceBoardService;

import lombok.extern.log4j.Log4j;
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,YHCriteria cri) {
		logger.info("메인 페이지");
		
		List<YHAnnounceBoardVO> list=service.searchAll(cri);
		model.addAttribute("list",list);
		log.info(list.toString());
		return "index";
	}
	
}
