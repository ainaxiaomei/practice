package com.snail.audio.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snail.audio.admin.dao.IAppResourceDao;
import com.snail.audio.admin.dao.IApplicationDao;
import com.snail.audio.admin.dao.IAudioDao;
import com.snail.audio.admin.dao.ICompanyDao;
import com.snail.audio.admin.dao.IFtpServerDao;
import com.snail.audio.admin.dao.IGateDao;
import com.snail.audio.admin.dao.IMCUDao;
import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.IndexGate;
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
	@Autowired
	private IGateDao gateDao;
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
	@Override
	public int addMcu(McuServer mcu) {
		return mcuDao.addMCU(mcu);
	}
	@Override
	public int modifyMcu(McuServer mcu) {
		return mcuDao.modifyMCU(mcu);
	}
	@Override
	public int saveFtp(FTPServer ftp) {
		return ftpDao.saveFtp(ftp);
	}
	@Override
	public int modifyFtp(FTPServer ftp) {
		return ftpDao.modifyFtp(ftp);
	}
	@Override
	public int saveAudioServer(AudioServer audio) {
		return audioDao.saveAudioServer(audio);
	}
	@Override
	public int modifyAudioServer(AudioServer audio) {
		return audioDao.modifyAudioServer(audio);
	}
	@Override
	public int saveAppRes(AppResource appRes) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int modifyAppRes(AppResource appRes) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteMcu(int id) {
		return mcuDao.deleteMCU(id);
	}
	@Override
	public int deleteAudioServer(int serverId) {
		return audioDao.deleteAudio(serverId);
	}
	@Override
	public int deleteGateServer(int serverId) {
		return gateDao.deleteGate(serverId);
	}
	@Override
	public int addGateServer(IndexGate gate) {
		return gateDao.addGate(gate);
	}
	@Override
	public int modifyGate(IndexGate gate) {
		return gateDao.modifyGate(gate);
	}
	@Override
	public List<IndexGate> getGateServer(IndexGate gate, int start, int end) {
		return gateDao.getGateServer(gate, start, end);
	}

}
