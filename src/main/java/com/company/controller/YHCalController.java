package com.company.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.YHCalVO;
import com.company.service.YHCalService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/restCal/*")
public class YHCalController {
	@Autowired
	YHCalService service;
	@GetMapping("/insert")
	public String insert(YHCalVO vo,String date){
		log.info("rest" +vo.toString()+" ㅇㅅㅇ :"+date);
		vo.setDates(Integer.parseInt(date.replaceAll("-", "")));
		log.info("rest" +vo.toString()+" ㅇㅅㅇ :"+date);
		if(service.update(vo)!=1) {
		service.insert(vo);
		}
		return "success";
	}
}
