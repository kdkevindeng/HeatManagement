package com.thinkgem.jeesite.modules.heatexchange.analysis.web.energy.vo;

import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeDay;

/**
 * Created by lizhi on 2017/11/17.
 */
public class StationEnergyConsumeDayVo extends JobStationEnergyConsumeDay {
    private String stationName;

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }
}
