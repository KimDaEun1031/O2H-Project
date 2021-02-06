package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.YHCriteria;
import com.company.domain.YHQandABoardVO;
import com.company.mapper.YHQandABoardMapper;



@Service
public class YHQandABoardServiceImp implements YHQandABoardService {
	
	@Autowired
	private YHQandABoardMapper mapper;
	
	@Override
	public boolean regist(YHQandABoardVO board) {
		
		boolean result=mapper.insert(board)>0?true:false;
		return result;
	}



	@Override
	public YHQandABoardVO QandASelect(int bno) {
		YHQandABoardVO vo=mapper.QandASelect(bno);
		return vo;
	}

	@Override
	public int getTotalCnt(YHCriteria cri) {
		
		return mapper.totalCnt(cri);
	}



	
	public List<YHQandABoardVO> QandABoardList(YHCriteria cri) {
	
		return mapper.QandASearchList(cri);
	}



	@Override
	public int update(YHQandABoardVO board) {
		
		return mapper.update(board);
	}



	@Override
	public int delete(int bno) {
	
		return mapper.delete(bno);
	}



	@Override
	public int updatereply(YHQandABoardVO board) {
		
		return mapper.replyupdate(board);
	}



	@Override
	public int updateReplyDate(int bno) {
		
		return mapper.updateReplyDate(bno);
	}
	
	

}
