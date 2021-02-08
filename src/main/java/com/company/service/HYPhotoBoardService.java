package com.company.service;

import java.util.List;

import com.company.domain.HYPhotoBoardCriteria;
import com.company.domain.HYPhotoBoardFileAttach;
import com.company.domain.HYPhotoBoardVO;

public interface HYPhotoBoardService {
	//게시글 등록
	public boolean regist(HYPhotoBoardVO board);
	//게시글 조회 - 전체
	public List<HYPhotoBoardVO> getList(HYPhotoBoardCriteria cri);
	//public List<BoardVO> getList();
	//게시글 조회 - 특정번호
	public HYPhotoBoardVO getRow(int bno);
	//게시글 삭제
	public boolean remove(int bno);
	//게시글 수정
	public boolean modify(HYPhotoBoardVO board);
	//전체 게시물 수
	public int getTotalCnt(HYPhotoBoardCriteria cri);
	//전체 첨부물 조회
	public List<HYPhotoBoardFileAttach> getAttachList(int bno);
}
