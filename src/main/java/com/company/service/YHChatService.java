package com.company.service;

import java.util.List;

import com.company.domain.YHChatRoomVO;
import com.company.domain.YHChatVO;

public interface YHChatService {
	public List<YHChatRoomVO> getList();
	public int goIntoRoom1();
	public int goIntoRoom2();
	public int goIntoRoom3();
	public int goInOutRoom1();
	public int goInOutRoom2();
	public int goInOutRoom3();
	public int chatInsertRoom1(int fromId,String content);
	public List<YHChatVO> getRoom1ChatList();
	public int goOutRoom1remove();
}
