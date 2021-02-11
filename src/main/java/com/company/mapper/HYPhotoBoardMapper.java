package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.HYPhotoBoardCriteria;
import com.company.domain.HYPhotoBoardFileAttach;
import com.company.domain.HYPhotoBoardVO;

public interface HYPhotoBoardMapper {
	//보드
	public int insert(HYPhotoBoardVO board);
	public int delete(int bno);
	public int update(HYPhotoBoardVO board);
	public List<HYPhotoBoardVO> list(HYPhotoBoardCriteria cri);
	public HYPhotoBoardVO read(int bno);
	public int totalCnt(HYPhotoBoardCriteria cri);
	public int updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);//댓글 없는 상태임.
	public List<HYPhotoBoardFileAttach> attachList(int bno);
	
	//첨부물 부분 mapper 합침
	public int insertAttach(HYPhotoBoardFileAttach attach);
	public int deleteAttach(int bno);
}
