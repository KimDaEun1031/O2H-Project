package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.SHProfileVO;
import com.company.domain.SHVideoVO;

public interface SHTeacherMapper {
	public int registUser(SHProfileVO shProfileVO);

	public int registTeacher(SHProfileVO shProfileVO);
	
	public List<SHProfileVO> selectProfileList(@Param("page")int page, @Param("pageCount")int pageCount);
	public List<SHProfileVO> selectRecommendProfileList(@Param("page")int page, @Param("pageCount")int pageCount);
	
	public SHProfileVO selectProfileRow(String userId);

	public int updateProfile(SHProfileVO vo);

	public int countProfile();
	public int countRecommendProfile();
	public int countVideo(String userId);

	public List<SHVideoVO> selectVideoList(@Param("userId")String userId, @Param("page")int page, @Param("pageCount")int pageCount);

	public SHVideoVO selectVideoRow(SHVideoVO getVideo);

	public int insert(SHVideoVO vo);
	public int update(SHVideoVO vo);
	public int delete(SHVideoVO vo);
	
	public List<String> getUserId();
}
