package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.SHMapLocationVO;

public interface SHMapLocationMapper {
	public int countMapLocation();
	
	public List<SHMapLocationVO> selectMapLocationList(@Param("page")int page, @Param("pageCount")int pageCount);
}
