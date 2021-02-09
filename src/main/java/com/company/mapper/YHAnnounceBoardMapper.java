package com.company.mapper;

import java.util.List;

import com.company.domain.LoginVO;
import com.company.domain.YHAnnouceReplyVO;
import com.company.domain.YHAnnounceBoardVO;
import com.company.domain.YHCriteria;

public interface YHAnnounceBoardMapper {
	List<YHAnnounceBoardVO> searchAll(YHCriteria cri);
	int regist(YHAnnounceBoardVO vo);
	YHAnnounceBoardVO read(int bno);
	int announceDelete(int bno);
	int announceUpdate(YHAnnounceBoardVO vo);
	int replyInsert(YHAnnouceReplyVO vo);
	List<YHAnnouceReplyVO> getReplyAll();
	int deleteReply(int rno);
	int replyDeletes(int bno);
}
