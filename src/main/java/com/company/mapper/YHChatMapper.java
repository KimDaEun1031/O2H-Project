package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.YHChatRoomVO;
import com.company.domain.YHChatVO;

public interface YHChatMapper {
	public List<YHChatRoomVO> getList();
	public int goIntoRoom1();
	public int goIntoRoom1AsAdmin();
	public int goIntoRoom2();
	public int goIntoRoom3();
	public int goOutRoom1();
	public int goOutRoom2();
	public int goOutRoom3();
	public int chatInsertRoom1(@Param("fromid")int fromid,@Param("content")String content);
	public int chatInsertRoom2(@Param("fromid")int fromid,@Param("content")String content);
	public int chatInsertRoom3(@Param("fromid")int fromid,@Param("content")String content);
	public List<YHChatVO> getRoom1ChatList();
	public List<YHChatVO> getRoom2ChatList();
	public List<YHChatVO> getRoom3ChatList();
	public int goOutRoom1remove();
	public int goOutRoom2remove();
	public int goOutRoom3remove();
}
