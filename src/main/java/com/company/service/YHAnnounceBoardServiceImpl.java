package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHAnnouceReplyVO;
import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;
import com.company.mapper.YHAnnounceBoardMapper;


import lombok.extern.slf4j.Slf4j;

@Service
public class YHAnnounceBoardServiceImpl implements YHAnnounceBoardService{
	
	@Autowired
	private YHAnnounceBoardMapper mapper;

	@Override
	public List<YHAnnounceBoardVO> searchAll(YHCriteria cir) {
		
		return mapper.searchAll(cir);
	}

	@Override
	public int regist(YHAnnounceBoardVO vo) {
		
		return mapper.regist(vo);
	}

	@Override
	public YHAnnounceBoardVO read(int bno) {
		
		return mapper.read(bno);
	}

	@Override
	public boolean announceDelete(int bno) {
		mapper.replyDeletes(bno);
		return mapper.announceDelete(bno)==1?true:false;
	}

	@Override
	public boolean announceUpdate(YHAnnounceBoardVO vo) {
		
		return mapper.announceUpdate(vo)==1;
	}

	@Override
	public int replyInsert(YHAnnouceReplyVO vo) {
		
		return mapper.replyInsert(vo);
	}

	@Override
	public List<YHAnnouceReplyVO> getReplyAll() {
		
		return mapper.getReplyAll();
	}

	@Override
	public int deleteReply(int rno) {
		
		return mapper.deleteReply(rno);
	}
		
	
	
}
