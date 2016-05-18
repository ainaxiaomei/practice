package com.snail.audio.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snail.audio.admin.dao.IApplicationDao;
import com.snail.audio.admin.dao.ICompanyDao;
import com.snail.audio.admin.entity.App;
@Service
public class ApplicationService implements IApplicationService {
	@Autowired
	private IApplicationDao appDao;
	@Autowired
	private ICompanyDao companyDao;
	public List<App> getApplication(int start, int end) {
		return appDao.getApplicationt(start, end);
	}
	@Override
	public int ModifyApplication(App app) {
		appDao.ModityApplication(app);
		return companyDao.ModityCompany(app.getCompany().get(0));
	}
	@Override
	public int deleteApplication(App app) {
		
		if(app.getAppid()<0||app.getCompany().get(0).getCompanyId()<0){
			throw new RuntimeException("Primapry Key Can Not Be Null!");
		}
		return appDao.deleteApplication(app.getAppid());
	}
	@Override
	public int addApplication(App app) {
		//保存company表
		companyDao.saveCompany(app.getCompany().get(0));
		//保存app表
		return appDao.addApplication(app);
	}

}
