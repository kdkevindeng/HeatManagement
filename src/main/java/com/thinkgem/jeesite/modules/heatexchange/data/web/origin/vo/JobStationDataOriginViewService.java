package com.thinkgem.jeesite.modules.heatexchange.data.web.origin.vo;

import com.thinkgem.jeesite.common.utils.JavaBeanUtil;
import com.thinkgem.jeesite.common.vo.ViewService;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
import com.thinkgem.jeesite.modules.heatexchange.data.entity.origin.JobStationDataOrigin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lizhi on 2017/11/19.
 */
@Service("JobStationDataOriginViewService")
public class JobStationDataOriginViewService implements ViewService<JobStationDataOriginVo,JobStationDataOrigin> {
    @Autowired
    private JobStationService jobStationService;
    @Override
    public JobStationDataOriginVo dto2vo(JobStationDataOrigin jobStationDataOrigin) {
        if(jobStationDataOrigin!=null){
            JobStationDataOriginVo vo=new JobStationDataOriginVo();
            JavaBeanUtil.javaBean2JavaBean(jobStationDataOrigin,vo);
            if(StringUtils.isNotEmpty(jobStationDataOrigin.getStationCode())){
                JobStation station = jobStationService.getByCode(jobStationDataOrigin.getStationCode());
                if(station!=null){
                    vo.setStationName(station.getName());
                }
            }
            return vo;
        }
        return null;
    }

    @Override
    public List<JobStationDataOriginVo> dtoList2voList(List<JobStationDataOrigin> jobStationDataOrigins) {
        List<JobStationDataOriginVo> voList=new ArrayList<JobStationDataOriginVo>();
        for(JobStationDataOrigin dto:jobStationDataOrigins){
            voList.add(this.dto2vo(dto));
        }
        return voList;
    }
}
