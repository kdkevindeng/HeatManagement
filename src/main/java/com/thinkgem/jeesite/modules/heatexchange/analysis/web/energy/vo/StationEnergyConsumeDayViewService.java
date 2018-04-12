package com.thinkgem.jeesite.modules.heatexchange.analysis.web.energy.vo;

import com.thinkgem.jeesite.common.utils.JavaBeanUtil;
import com.thinkgem.jeesite.common.vo.ViewService;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeDay;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lizhi on 2017/11/17.
 */
@Service("StationEnergyConsumeDayViewService")
public class StationEnergyConsumeDayViewService implements ViewService<StationEnergyConsumeDayVo,JobStationEnergyConsumeDay>{
    @Autowired
    JobStationService jobStationService;
    @Override
    public StationEnergyConsumeDayVo dto2vo(JobStationEnergyConsumeDay jobStationEnergyConsumeDay) {
        if(jobStationEnergyConsumeDay!=null){
            StationEnergyConsumeDayVo vo=new StationEnergyConsumeDayVo();
            JavaBeanUtil.javaBean2JavaBean(jobStationEnergyConsumeDay,vo);
//            vo.setStationId(jobStationEnergyConsumeDay.getStationId());
//            vo.setEnergy(jobStationEnergyConsumeDay.getEnergy());
//            vo.setTime(jobStationEnergyConsumeDay.getTime());
            if(StringUtils.isNotEmpty(vo.getStationId())){
                JobStation station = jobStationService.get(vo.getStationId());
                vo.setStationName(station.getName());
            }
            return vo;
        }
        return null;
    }

    @Override
    public List<StationEnergyConsumeDayVo> dtoList2voList(List<JobStationEnergyConsumeDay> dtoList) {
        List<StationEnergyConsumeDayVo> voList=new ArrayList<StationEnergyConsumeDayVo>();
        for (JobStationEnergyConsumeDay dto:dtoList){
            voList.add(this.dto2vo(dto));
        }
        return voList;
    }
}
