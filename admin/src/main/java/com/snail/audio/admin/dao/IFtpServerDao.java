package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IFtpServerDao {
	public List<FTPServer> getFtp(FTPServer ftp,int start,int end);
	public int saveFtp(FTPServer ftp);
	public int modifyFtp(FTPServer ftp);
}
