package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.FTPServerMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class FtpServerDao implements IFtpServerDao{
	@Autowired
	private FTPServerMapperExt ftpServerMapperExt;

	@Override
	public List<FTPServer> getFtp(FTPServer ftp, int start, int end) {
		return ftpServerMapperExt.selectByCondition(ftp, start, end);
	}

	
	
	
}
