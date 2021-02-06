package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.YHChatVO;
import com.company.service.YHChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/chatAjax/*")
public class YHChattingRestContrroller {
	@Autowired
	YHChatService service;
	
	
	@GetMapping("/room1")
	public ResponseEntity<List<YHChatVO>> room1(String content,int fromid){
		log.info("room1 문자 입력 content:" +content +" admin여부 :" +fromid);
		service.chatInsertRoom1(fromid, content);
		List<YHChatVO> list=service.getRoom1ChatList();
		ResponseEntity<List<YHChatVO>> entity=new ResponseEntity<List<YHChatVO>>(list,HttpStatus.OK);
		return entity;
	}

}
