package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.Company;
@Repository
public interface ICompanyDao {
    public int ModityCompany(Company company);
    public int deleteCompany(int comapnyId);
    public int saveCompany(Company comapny);
    public List<Company>getCpmpany(Company company,int start,int pageSize);
}
