package com.thinkgem.jeesite.modules.heatexchange.analysis.service.energy;

import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeDay;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeMonth;
import com.thinkgem.jeesite.modules.heatexchange.data.entity.origin.JobStationDataOrigin;
import com.thinkgem.jeesite.modules.heatexchange.data.service.origin.JobStationDataOriginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by lizhi on 2017/12/3.
 * 数据定时转换计算
 */
@Service("energyConsumeService")
public class EnergyConsumeService {
    @Autowired
    JobStationDataOriginService jobStationDataOriginService;
    @Autowired
    JobStationService jobStationService;
    @Autowired
    JobStationEnergyConsumeDayService jobStationEnergyConsumeDayService;
    @Autowired
    JobStationEnergyConsumeMonthService jobStationEnergyConsumeMonthService;
    /*按小时统计能耗*/
    public void calculateHour(){
        Calendar calendar=Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY,calendar.get(Calendar.HOUR_OF_DAY)-1);
        List<JobStation> stationList = this.jobStationService.findList(new JobStation());
        for(JobStation station:stationList){

            JobStationDataOrigin queryDTO=new JobStationDataOrigin();
            queryDTO.setStationCode(station.getCode());
            calendar.set(Calendar.MINUTE,0);
            calendar.set(Calendar.SECOND,0);
            queryDTO.setQueryBegintime((Date) calendar.getTime().clone());
            calendar.set(Calendar.MINUTE,59);
            calendar.set(Calendar.SECOND,59);
            queryDTO.setQueryEndtime((Date) calendar.getTime().clone());
            List<JobStationDataOrigin> dataList = jobStationDataOriginService.findList(queryDTO);
            Double max=null;
            Double min=null;
            for(JobStationDataOrigin dataOrigin:dataList){
                double energy = Double.parseDouble(dataOrigin.getD5206());
                if(max==null){
                    max=energy;
                }else{
                    if(energy>=max){
                        max=energy;
                    }
                }
                if(min==null){
                    min=energy;
                }else{
                    if(energy<=min){
                        min=energy;
                    }
                }
            }
            if(min!=null&&max!=null&&max>=min){
                JobStationEnergyConsumeDay dayDTO=new JobStationEnergyConsumeDay();
                dayDTO.setEnergy((max-min)+"");
                dayDTO.setStationId(station.getId());
                dayDTO.setTime(queryDTO.getQueryBegintime());
                this.jobStationEnergyConsumeDayService.save(dayDTO);
            }
        }
    }
    /*按天统计能耗*/
    public void calculateDay(){
        Calendar calendar=Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH,calendar.get(Calendar.DAY_OF_MONTH)-1);
        List<JobStation> stationList = this.jobStationService.findList(new JobStation());
        for(JobStation station:stationList){
            JobStationDataOrigin queryDTO=new JobStationDataOrigin();
            queryDTO.setStationCode(station.getCode());
            calendar.set(Calendar.HOUR_OF_DAY,0);
            calendar.set(Calendar.MINUTE,0);
            calendar.set(Calendar.SECOND,0);
            queryDTO.setQueryBegintime((Date) calendar.getTime().clone());
            calendar.set(Calendar.HOUR_OF_DAY,23);
            calendar.set(Calendar.MINUTE,59);
            calendar.set(Calendar.SECOND,59);
            queryDTO.setQueryEndtime((Date) calendar.getTime().clone());
            List<JobStationDataOrigin> dataList = jobStationDataOriginService.findList(queryDTO);
            Double max=null;
            Double min=null;
            for(JobStationDataOrigin dataOrigin:dataList){
                double energy = Double.parseDouble(dataOrigin.getD5206());
                if(max==null){
                    max=energy;
                }else{
                    if(energy>=max){
                        max=energy;
                    }
                }
                if(min==null){
                    min=energy;
                }else{
                    if(energy<=min){
                        min=energy;
                    }
                }
            }
            if(min!=null&&max!=null&&max>=min){
                JobStationEnergyConsumeMonth monthDTO=new JobStationEnergyConsumeMonth();
                monthDTO.setEnergy((max-min)+"");
                monthDTO.setStationId(station.getId());
                monthDTO.setTime(queryDTO.getQueryBegintime());
                this.jobStationEnergyConsumeMonthService.save(monthDTO);
            }
        }
    }
}
