package com.company.mapper;

import com.company.domain.KDLoginInfoVO;

public interface SHKakaoLoginMapper {
	public KDLoginInfoVO select(String userId);
	public int insert(KDLoginInfoVO kdLoginInfo);
	public int delete(String userId);
}
