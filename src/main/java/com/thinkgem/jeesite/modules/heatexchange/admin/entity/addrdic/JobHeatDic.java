/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.admin.entity.addrdic;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 地址对应表Entity
 * @author lizhi
 * @version 2017-12-01
 */
public class JobHeatDic extends DataEntity<JobHeatDic> {
	
	private static final long serialVersionUID = 1L;
	private String plcAddr;		// PLC地址
	private Integer modbusAddr;		// modbus地址
	private String name;		// 含义
	private String wR;		// 读写属性
	private String remark;		// 备注
	private Integer dataType;		// 数据类型，0未知，1整数，2浮点数
	
	public JobHeatDic() {
		super();
	}

	public JobHeatDic(String id){
		super(id);
	}

	@Length(min=0, max=255, message="PLC地址长度必须介于 0 和 255 之间")
	public String getPlcAddr() {
		return plcAddr;
	}

	public void setPlcAddr(String plcAddr) {
		this.plcAddr = plcAddr;
	}
	
	public Integer getModbusAddr() {
		return modbusAddr;
	}

	public void setModbusAddr(Integer modbusAddr) {
		this.modbusAddr = modbusAddr;
	}
	
	@Length(min=0, max=255, message="含义长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="读写属性长度必须介于 0 和 255 之间")
	public String getWR() {
		return wR;
	}

	public void setWR(String wR) {
		this.wR = wR;
	}
	
	@Length(min=0, max=255, message="备注长度必须介于 0 和 255 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Integer getDataType() {
		return dataType;
	}

	public void setDataType(Integer dataType) {
		this.dataType = dataType;
	}
	
}