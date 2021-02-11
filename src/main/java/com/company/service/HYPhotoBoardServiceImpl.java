package com.company.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.HYChangeVO;
import com.company.domain.HYFileAttach;
import com.company.domain.HYLoginVO;
import com.company.domain.HYPhotoBoardCriteria;
import com.company.domain.HYPhotoBoardFileAttach;
import com.company.domain.HYPhotoBoardVO;
import com.company.mapper.HYMapper;
import com.company.mapper.HYPhotoBoardMapper;

import lombok.extern.slf4j.Slf4j;
  
@Service
@Slf4j
public class HYPhotoBoardServiceImpl implements HYPhotoBoardService {
	  
	@Autowired 
	private HYPhotoBoardMapper mapper;

	@Override
	public boolean regist(HYPhotoBoardVO board) {

		boolean result = mapper.insert(board)>0?true:false;
		
		//첨부파일이 null 이거나 size() 가 0 이라면 30~33작업 미실시
		if(board.getAttach()==null) {
			return result;
		}		
		
		board.getAttach().setBno(board.getBno());
		mapper.insertAttach(board.getAttach());
		
		return result;
	}

	@Override
	public List<HYPhotoBoardVO> getList(HYPhotoBoardCriteria cri) {
		return mapper.list(cri);
	}

	@Override
	public HYPhotoBoardVO getRow(int bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean remove(int bno) {

		//첨부물 삭제
		mapper.deleteAttach(bno);
		return mapper.delete(bno)>0?true:false;
	}

	@Override
	public boolean modify(HYPhotoBoardVO board) {

		//첨부물 전체 삭제
		mapper.deleteAttach(board.getBno());
		//게시물 수정-여기에 걸려가지고 첨부파일은 삭제되고 에러 떴구나.
		log.info("업데이트 에러 확인 "+board);
		boolean result = mapper.update(board)>0?true:false;
		
		//첨부파일이 null 이거나 size() 가 0 이라면 68-70작업 미실시
		if(board.getAttach()==null) {
			return result;
		}
		//첨부물 삽입
		
		board.getAttach().setBno(board.getBno());
		mapper.insertAttach(board.getAttach());
		
		
		return result;
	}

	@Override
	public int getTotalCnt(HYPhotoBoardCriteria cri) {//댓글 없는 상태임.
		return mapper.totalCnt(cri);
	}

	@Override
	public List<HYPhotoBoardFileAttach> getAttachList(int bno) {
		return mapper.attachList(bno);
	}
	
	
  
  
  }
 