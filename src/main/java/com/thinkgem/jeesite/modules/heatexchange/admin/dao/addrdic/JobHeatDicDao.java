/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.admin.dao.addrdic;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.addrdic.JobHeatDic;

/**
 * 地址对应表DAO接口
 * @author lizhi
 * @version 2017-11-19
 */
@MyBatisDao
public interface JobHeatDicDao extends CrudDao<JobHeatDic> {
//    JobHeatDic getByPlcAddr(JobHeatDic jobHeatDic);
}