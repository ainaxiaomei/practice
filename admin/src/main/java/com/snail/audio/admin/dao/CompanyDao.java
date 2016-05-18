package com.snail.audio.admin.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.Company;
import com.snail.audio.admin.mapper.CompanyMapperExt;
@Repository
public class CompanyDao implements ICompanyDao {
    @Autowired
    private CompanyMapperExt companyMapperExt;
	@Override
	public int ModityCompany(Company company) {
		return companyMapperExt.updateByPrimaryKeySelective(company);
	}
	@Override
	public int deleteCompany(int companyId) {
		return companyMapperExt.deleteByPrimaryKey(companyId);
	}
	@Override
	public int saveCompany(Company comapny) {
		return companyMapperExt.insert(comapny);
	}

}
