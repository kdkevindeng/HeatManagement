/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.data.service.origin;

import com.thinkgem.jeesite.common.exception.AppException;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.heatexchange.data.dao.origin.JobStationDataOriginDao;
import com.thinkgem.jeesite.modules.heatexchange.data.entity.origin.JobStationDataOrigin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 热网计量Service
 * @author lizhi
 * @version 2017-11-17
 */
@Service
@Transactional(readOnly = true)
public class JobStationDataOriginService extends CrudService<JobStationDataOriginDao, JobStationDataOrigin> {

	public JobStationDataOrigin get(String id) {
		return super.get(id);
	}
	
	public List<JobStationDataOrigin> findList(JobStationDataOrigin jobStationDataOrigin) {
		return super.findList(jobStationDataOrigin);
	}
	
	public Page<JobStationDataOrigin> findPage(Page<JobStationDataOrigin> page, JobStationDataOrigin jobStationDataOrigin) {
		return super.findPage(page, jobStationDataOrigin);
	}
	
	@Transactional(readOnly = false)
	public void save(JobStationDataOrigin jobStationDataOrigin) {
		super.save(jobStationDataOrigin);
	}
	
	@Transactional(readOnly = false)
	public void delete(JobStationDataOrigin jobStationDataOrigin) {
		super.delete(jobStationDataOrigin);
	}
    /**
     * 获取站点最新数据
     * @param stationCode 站点CODE
     * */
	public JobStationDataOrigin getStationNewestData(String stationCode) throws AppException {
		if(StringUtils.isNotEmpty(stationCode)){
			return super.dao.getStationNewestData(stationCode);
		}else{
			throw new AppException("stationCode不可为空");
		}
	}
	
}