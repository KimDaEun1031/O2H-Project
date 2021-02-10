package com.company.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHCalVO;
import com.company.service.YHCalService;

import lombok.extern.slf4j.Slf4j;
import oracle.sql.DATE;

@Controller
@Slf4j
@RequestMapping("/helloworld/*")
public class YHChartController {
	@Autowired
	private YHCalService service;
	
	@RequestMapping("/see")
	public String hellochart(Model model,YHCalVO vo) {
		
		Date now=new Date();
		
		vo.setDates(20210201);
		vo.setUser_id("temp");
		List<YHCalVO> list=service.select(vo);
		model.addAttribute("list",list);
		log.info(list.toString());
		
		
		return "graph/graph";
	}
}
