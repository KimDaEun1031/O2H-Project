package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/map/*")
public class YHMapController {

	@GetMapping("/practice")
	public String practice() {
		log.info("맵 사용 프랙티스");
		
		return "/map/mapPractice";
	}
}
