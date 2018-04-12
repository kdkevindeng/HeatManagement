/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.admin.service.station;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.dao.station.JobStationDao;

/**
 * 换热站Service
 * @author lizhi
 * @version 2017-11-17
 */
@Service
@Transactional(readOnly = true)
public class JobStationService extends CrudService<JobStationDao, JobStation> {

	public JobStation get(String id) {
		return super.get(id);
	}
	public JobStation getByCode(String code) {
		JobStation station=new JobStation();
		station.setCode(code);
		List<JobStation> list = this.findList(station);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else {
			return null;
		}
	}

	public List<JobStation> findList(JobStation jobStation) {
		return super.findList(jobStation);
	}
	
	public Page<JobStation> findPage(Page<JobStation> page, JobStation jobStation) {
		return super.findPage(page, jobStation);
	}
	
	@Transactional(readOnly = false)
	public void save(JobStation jobStation) {
		super.save(jobStation);
	}
	
	@Transactional(readOnly = false)
	public void delete(JobStation jobStation) {
		super.delete(jobStation);
	}
	
}