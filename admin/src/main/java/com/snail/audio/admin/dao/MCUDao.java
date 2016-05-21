package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class MCUDao implements IMCUDao{
	@Autowired
	private McuServerMapperExt mcuServerMapperExt;

	@Override
	public int addMCU(McuServer mcu) {
		return mcuServerMapperExt.insertSelective(mcu);
	}

	@Override
	public int deleteMCU(int serverId) {
		return mcuServerMapperExt.deleteByPrimaryKey(serverId);
	}

	@Override
	public int modifyMCU(McuServer mcu) {
		return mcuServerMapperExt.updateByPrimaryKeySelective(mcu);
	}

	@Override
	public List<McuServer> getMCU(McuServer mcu) {
		return mcuServerMapperExt.selectByCondition(mcu);
	}
	
	
	
}
