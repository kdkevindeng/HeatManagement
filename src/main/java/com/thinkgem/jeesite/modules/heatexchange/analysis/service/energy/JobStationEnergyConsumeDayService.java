/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.analysis.service.energy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeDay;
import com.thinkgem.jeesite.modules.heatexchange.analysis.dao.energy.JobStationEnergyConsumeDayDao;

/**
 * 能耗分析-天Service
 * @author lizhi
 * @version 2017-11-17
 */
@Service
@Transactional(readOnly = true)
public class JobStationEnergyConsumeDayService extends CrudService<JobStationEnergyConsumeDayDao, JobStationEnergyConsumeDay> {

	
	public JobStationEnergyConsumeDay get(String id) {
		JobStationEnergyConsumeDay jobStationEnergyConsumeDay = super.get(id);
		return jobStationEnergyConsumeDay;
	}
	
	public List<JobStationEnergyConsumeDay> findList(JobStationEnergyConsumeDay jobStationEnergyConsumeDay) {
		return super.findList(jobStationEnergyConsumeDay);
	}
	
	public Page<JobStationEnergyConsumeDay> findPage(Page<JobStationEnergyConsumeDay> page, JobStationEnergyConsumeDay jobStationEnergyConsumeDay) {
		return super.findPage(page, jobStationEnergyConsumeDay);
	}
	
	@Transactional(readOnly = false)
	public void save(JobStationEnergyConsumeDay jobStationEnergyConsumeDay) {
		super.save(jobStationEnergyConsumeDay);
	}
	
	@Transactional(readOnly = false)
	public void delete(JobStationEnergyConsumeDay jobStationEnergyConsumeDay) {
		super.delete(jobStationEnergyConsumeDay);
	}
	
}