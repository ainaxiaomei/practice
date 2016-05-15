package com.snail.audio.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snail.audio.admin.dao.IApplicationDao;
import com.snail.audio.admin.entity.App;
@Service
public class ApplicationService implements IApplicationService {
	@Autowired
	private IApplicationDao appDao;
	public List<App> getApplication(int start, int end) {
		return appDao.getApplicationt(start, end);
	}

}
