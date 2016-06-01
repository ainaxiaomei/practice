package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.Company;
@Resource
public interface CompanyMapperExt extends CompanyMapper {
	public List<Company> selectByCondition(@Param("company")Company company,@Param("start")int start,@Param("end")int pagSize);
}