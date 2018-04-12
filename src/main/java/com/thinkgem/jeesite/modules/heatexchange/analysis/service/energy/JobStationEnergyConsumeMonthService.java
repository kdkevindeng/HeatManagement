/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.analysis.service.energy;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeMonth;
import com.thinkgem.jeesite.modules.heatexchange.analysis.dao.energy.JobStationEnergyConsumeMonthDao;

/**
 * 能耗分析-月Service
 * @author lizhi
 * @version 2017-11-27
 */
@Service
@Transactional(readOnly = true)
public class JobStationEnergyConsumeMonthService extends CrudService<JobStationEnergyConsumeMonthDao, JobStationEnergyConsumeMonth> {

	public JobStationEnergyConsumeMonth get(String id) {
		return super.get(id);
	}
	
	public List<JobStationEnergyConsumeMonth> findList(JobStationEnergyConsumeMonth jobStationEnergyConsumeMonth) {
		return super.findList(jobStationEnergyConsumeMonth);
	}
	
	public Page<JobStationEnergyConsumeMonth> findPage(Page<JobStationEnergyConsumeMonth> page, JobStationEnergyConsumeMonth jobStationEnergyConsumeMonth) {
		return super.findPage(page, jobStationEnergyConsumeMonth);
	}
	
	@Transactional(readOnly = false)
	public void save(JobStationEnergyConsumeMonth jobStationEnergyConsumeMonth) {
		super.save(jobStationEnergyConsumeMonth);
	}
	
	@Transactional(readOnly = false)
	public void delete(JobStationEnergyConsumeMonth jobStationEnergyConsumeMonth) {
		super.delete(jobStationEnergyConsumeMonth);
	}
	
}