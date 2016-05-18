package com.snail.audio.admin.dao;

import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.Company;
@Repository
public interface ICompanyDao {
    public int ModityCompany(Company company);
    public int deleteCompany(int comapnyId);
}
