/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.admin.dao.station;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;

/**
 * 换热站DAO接口
 * @author lizhi
 * @version 2017-11-17
 */
@MyBatisDao
public interface JobStationDao extends CrudDao<JobStation> {
	
}