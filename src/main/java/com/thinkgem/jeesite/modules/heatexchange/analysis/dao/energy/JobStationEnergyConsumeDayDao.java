/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.analysis.dao.energy;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeDay;

/**
 * 能耗分析-天DAO接口
 * @author lizhi
 * @version 2017-11-17
 */
@MyBatisDao
public interface JobStationEnergyConsumeDayDao extends CrudDao<JobStationEnergyConsumeDay> {
	
}