/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.admin.service.addrdic;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.addrdic.JobHeatDic;
import com.thinkgem.jeesite.modules.heatexchange.admin.dao.addrdic.JobHeatDicDao;

/**
 * 地址对应表Service
 * @author lizhi
 * @version 2017-11-19
 */
@Service
@Transactional(readOnly = true)
public class JobHeatDicService extends CrudService<JobHeatDicDao, JobHeatDic> {

	public JobHeatDic get(String id) {
		return super.get(id);
	}
	
	public List<JobHeatDic> findList(JobHeatDic jobHeatDic) {
		return super.findList(jobHeatDic);
	}
	
	public Page<JobHeatDic> findPage(Page<JobHeatDic> page, JobHeatDic jobHeatDic) {
		return super.findPage(page, jobHeatDic);
	}
	public JobHeatDic getByPlcAddr(String plcAddr){
        JobHeatDic queryEntity=new JobHeatDic();
        queryEntity.setPlcAddr(plcAddr);
		List<JobHeatDic> dicList = this.findList(queryEntity);
		if(dicList!=null&&dicList.size()>0){
			return dicList.get(0);
		}else{
			return null;
		}
	}
	
	@Transactional(readOnly = false)
	public void save(JobHeatDic jobHeatDic) {
		super.save(jobHeatDic);
	}
	
	@Transactional(readOnly = false)
	public void delete(JobHeatDic jobHeatDic) {
		super.delete(jobHeatDic);
	}
	
}