/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 能耗分析-周Entity
 * @author lizhi
 * @version 2017-11-27
 */
public class JobStationEnergyConsumeWeek extends DataEntity<JobStationEnergyConsumeWeek> {
	
	private static final long serialVersionUID = 1L;
	private String stationId;		// 站点
	private String energy;		// 能耗
	private Date time;		// 时间
	
	public JobStationEnergyConsumeWeek() {
		super();
	}

	public JobStationEnergyConsumeWeek(String id){
		super(id);
	}

	@Length(min=0, max=255, message="站点长度必须介于 0 和 255 之间")
	public String getStationId() {
		return stationId;
	}

	public void setStationId(String stationId) {
		this.stationId = stationId;
	}
	
	public String getEnergy() {
		return energy;
	}

	public void setEnergy(String energy) {
		this.energy = energy;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
}