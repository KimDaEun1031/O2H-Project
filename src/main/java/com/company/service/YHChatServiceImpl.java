package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.YHChatRoomVO;
import com.company.domain.YHChatVO;
import com.company.mapper.YHChatMapper;

@Service
public class YHChatServiceImpl implements YHChatService {
	
	@Autowired
	private YHChatMapper mapper;
	@Override
	public List<YHChatRoomVO> getList() {
		
		return mapper.getList();
	}
	@Override
	public int goIntoRoom1() {
		
		return mapper.goIntoRoom1();
	}
	@Override
	public int goIntoRoom2() {
		// TODO Auto-generated method stub
		return mapper.goIntoRoom2();
	}
	@Override
	public int goIntoRoom3() {
		// TODO Auto-generated method stub
		return mapper.goIntoRoom3();
	}
	@Override
	public int goInOutRoom1() {
		// TODO Auto-generated method stub
		return mapper.goOutRoom1();
	}
	@Override
	public int goInOutRoom2() {
		// TODO Auto-generated method stub
		return mapper.goOutRoom2();
	}
	@Override
	public int goInOutRoom3() {
		// TODO Auto-generated method stub
		return mapper.goOutRoom3();
	}
	@Override
	public int chatInsertRoom1(int fromid, String content) {
		// TODO Auto-generated method stub
		return mapper.chatInsertRoom1(fromid, content);
	}
	@Override
	public int chatInsertRoom2(int fromid, String content) {
		// TODO Auto-generated method stub
		return mapper.chatInsertRoom2(fromid, content);
	}
	@Override
	public int chatInsertRoom3(int fromid, String content) {
		// TODO Auto-generated method stub
		return mapper.chatInsertRoom3(fromid, content);
	}
	@Override
	public List<YHChatVO> getRoom1ChatList() {
		
		return mapper.getRoom1ChatList();
	}
	@Override
	public List<YHChatVO> getRoom2ChatList() {
		
		return mapper.getRoom2ChatList();
	}
	@Override
	public List<YHChatVO> getRoom3ChatList() {
		
		return mapper.getRoom3ChatList();
	}
	@Override
	public int goOutRoom1remove() {
		
		return mapper.goOutRoom1remove();
	}
	@Override
	public int goOutRoom2remove() {
		
		return mapper.goOutRoom2remove();
	}
	@Override
	public int goOutRoom3remove() {
		
		return mapper.goOutRoom3remove();
	}
	@Override
	public int goIntoRoom1AsAdmin() {
		// TODO Auto-generated method stub
		return mapper.goIntoRoom1AsAdmin();
	}

}
