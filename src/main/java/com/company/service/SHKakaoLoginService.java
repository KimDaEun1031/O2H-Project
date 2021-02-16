package com.company.service;

import com.company.domain.KDLoginInfoVO;

public interface SHKakaoLoginService {
	public KDLoginInfoVO isRegistered(String userId);

	public boolean register(KDLoginInfoVO vo);

	public boolean leave(String userId);
}
