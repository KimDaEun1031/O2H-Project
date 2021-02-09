package com.company.service;

import java.util.List;

import com.company.domain.SHProfileListVO;
import com.company.domain.SHProfileVO;
import com.company.domain.SHVideoListVO;
import com.company.domain.SHVideoVO;

public interface SHTeacherService {
	public boolean registTeacher(SHProfileVO shLoginVO);

	SHProfileListVO getProfileList(int page, int pageCount);
	
	public SHProfileListVO getRecommendProfileList(int page, int pageCount);
	
	public SHProfileVO getProfileRow(String userId);

	public boolean updateTeacher(SHProfileVO vo);

	public SHVideoListVO getVideoList(String userId, int page, int pageCount);

	public SHVideoVO getVideoRow(String userId, String videoId);

	public boolean insertVideo(SHVideoVO vo);

	public boolean updateVideo(SHVideoVO vo);

	public boolean deleteVideo(String userId, String videoId);

	public List<String> getValidUserId();
}
