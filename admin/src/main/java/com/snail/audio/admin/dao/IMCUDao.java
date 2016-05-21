package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IMCUDao {
	public int addMCU(McuServer mcu);
	public int deleteMCU(int serverId);
	public int modifyMCU(McuServer mcu);
	public List<McuServer> getMCU(McuServer mcu);
}
