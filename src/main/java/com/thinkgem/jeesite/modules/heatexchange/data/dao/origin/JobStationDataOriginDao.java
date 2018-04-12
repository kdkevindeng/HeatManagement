/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.data.dao.origin;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.heatexchange.data.entity.origin.JobStationDataOrigin;

/**
 * 热网计量DAO接口
 * @author lizhi
 * @version 2017-11-17
 */
@MyBatisDao
public interface JobStationDataOriginDao extends CrudDao<JobStationDataOrigin> {
    JobStationDataOrigin getStationNewestData(String stationCode);
}