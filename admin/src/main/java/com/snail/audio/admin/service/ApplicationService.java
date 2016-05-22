package com.snail.audio.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snail.audio.admin.dao.IAppResourceDao;
import com.snail.audio.admin.dao.IApplicationDao;
import com.snail.audio.admin.dao.IAudioDao;
import com.snail.audio.admin.dao.ICompanyDao;
import com.snail.audio.admin.dao.IFtpServerDao;
import com.snail.audio.admin.dao.IMCUDao;
import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.McuServer;
@Service
public class ApplicationService implements IApplicationService {
	@Autowired
	private IApplicationDao appDao;
	@Autowired
	private ICompanyDao companyDao;
	@Autowired
	private IMCUDao mcuDao;
	@Autowired
	private IAudioDao audioDao;
	@Autowired
	private IAppResourceDao appResourceDao;
	@Autowired
	private IFtpServerDao ftpDao;
	public List<App> getApplication(int start, int end) {
		return appDao.getApplicationt(start, end);
	}
	@Override
	public int ModifyApplication(App app) {
		appDao.ModityApplication(app);
		return companyDao.ModityCompany(app.getCompany());
	}
	@Override
	public int deleteApplication(App app) {
		
		if(app.getAppid()<0||app.getCompany().getCompanyId()<0){
			throw new RuntimeException("Primapry Key Can Not Be Null!");
		}
		return appDao.deleteApplication(app.getAppid());
	}
	@Override
	public int addApplication(App app) {
		//保存company表
		companyDao.saveCompany(app.getCompany());
		//保存app表
		return appDao.addApplication(app);
	}
	@Override
	public List<McuServer> getMCUServer(McuServer mcu,int start,int end) {
		return mcuDao.getMCU(mcu,start,end);
	}
	@Override
	public List<AudioServer> getAudioServer(AudioServer audio, int start, int end) {
		return audioDao.getAudioServer(audio, start, end);
	}
	@Override
	public List<AppResource> getAppResource(AppResource appResource, int start, int end) {
		return appResourceDao.getAppResource(appResource, start, end);
	}
	@Override
	public List<FTPServer> getFtpServer(FTPServer ftp, int start, int end) {
		return ftpDao.getFtp(ftp, start, end);
	}

}
