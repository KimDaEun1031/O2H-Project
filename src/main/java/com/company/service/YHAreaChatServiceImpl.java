package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.YHAreaChatGetVO;
import com.company.domain.YHAreaChatVO;
import com.company.mapper.YHAreaChatMapper;

@Service
public class YHAreaChatServiceImpl implements YHAreaChatService {
	@Autowired
	private YHAreaChatMapper mapper;
	
	@Override
	public List<YHAreaChatVO> ChatList() {
		
		return mapper.ChatList();
	}

	@Override
	public List<YHAreaChatGetVO> seoulGetChat20() {
		
		return mapper.seoulGetChat20();
	}

	@Override
	public int seoulChatInsert(YHAreaChatGetVO vo) {
		// TODO Auto-generated method stub
		return mapper.seoulChatInsert(vo);
	}

	@Override
	public List<YHAreaChatGetVO> seoulGetChat5() {
		// TODO Auto-generated method stub
		return mapper.seoulGetChat5();
	}

	@Override
	public int seoulUserNumPlus() {
		// TODO Auto-generated method stub
		return mapper.seoulUserNumPlus();
	}

	@Override
	public int seoulUserNumMinus() {
		// TODO Auto-generated method stub
		return mapper.seoulUserNumMinus();
	}

}
