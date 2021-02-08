package com.company.service;

import java.util.List;

import com.company.domain.YHAreaChatGetVO;
import com.company.domain.YHAreaChatVO;

public interface YHAreaChatService {
	public List<YHAreaChatVO> ChatList();
	public List<YHAreaChatGetVO> seoulGetChat20();
	public List<YHAreaChatGetVO> seoulGetChat5();
	public int seoulChatInsert(YHAreaChatGetVO vo);
	public int seoulUserNumPlus();
	public int seoulUserNumMinus();
}
