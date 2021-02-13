package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.SHProfileListVO;
import com.company.domain.SHProfileVO;
import com.company.domain.SHVideoListVO;
import com.company.domain.SHVideoVO;
import com.company.mapper.SHTeacherMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SHTeacherServiceImpl implements SHTeacherService {

	@Autowired
	SHTeacherMapper mapper;
	
	@Transactional
	@Override
	public boolean registTeacher(SHProfileVO shProfileVO) {
		int result1 = 0;
		int result2 = 0;
		
		result1 = mapper.registUser(shProfileVO);

		if(result1 > 0) {
			result2 = mapper.registTeacher(shProfileVO);
			
			if (result2 > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public SHProfileVO getProfileRow(String userId) {
		SHProfileVO vo = mapper.selectProfileRow(userId);
		log.info("profile vo mapper"+vo);
		return vo;
	}

	@Override
	public SHProfileListVO getProfileList(int page, int pageCount) {
		List<SHProfileVO> vol = mapper.selectProfileList(page, pageCount);
		int cnt = mapper.countProfile();
		
		return new SHProfileListVO(cnt, vol);
	}
	
	@Override
	public SHProfileListVO getRecommendProfileList(int page, int pageCount) {
		List<SHProfileVO> vol = mapper.selectRecommendProfileList(page, pageCount);
		int cnt = mapper.countRecommendProfile();
		
		return new SHProfileListVO(cnt, vol);
	}
	
	@Override
	public boolean updateTeacher(SHProfileVO vo) {
		int result = mapper.updateProfile(vo);
		
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public SHVideoListVO getVideoList(String userId, int page, int pageCount) {
		log.info(userId + page + pageCount);
		
		List<SHVideoVO> vol = mapper.selectVideoList(userId, page, pageCount);
		int cnt = mapper.countVideo(userId);
		
		return new SHVideoListVO(cnt, vol);
	}

	@Override
	public SHVideoVO getVideoRow(String userId, String videoId) {
		SHVideoVO getVideo = new SHVideoVO();
		getVideo.setUserId(userId);
		getVideo.setVideoId(videoId);

		SHVideoVO vo = mapper.selectVideoRow(getVideo);

		return vo;
	}

	@Override
	public boolean insertVideo(SHVideoVO vo) {
		int result = mapper.insert(vo);
		
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean updateVideo(SHVideoVO vo) {
		int result = mapper.update(vo);
		
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteVideo(String userId, String videoId) {
		SHVideoVO vo = new SHVideoVO();
		vo.setUserId(userId);
		vo.setVideoId(videoId);
		
		int result = mapper.delete(vo);
		
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public List<String> getValidUserId() {
		List<String> list = mapper.getUserId();
		
		return list;
	}

}
