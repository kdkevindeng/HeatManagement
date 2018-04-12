/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.data.entity.origin;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 热网计量Entity
 * @author lizhi
 * @version 2017-11-18
 */
public class JobStationDataOrigin extends DataEntity<JobStationDataOrigin> {
	
	private static final long serialVersionUID = 1L;
	private String stationCode;		// 站号
	private Date time;		// 时间
	private Date queryBegintime;		// 查询开始时间
	private Date queryEndtime;		// 查询结束时间
	private String d2008;		// PLC通讯模式
	private String d2009;		// PLC通讯地址
	private int d70;		// 循环系统状态
	private int d71;		// 补水系统状态
	private int d72;		// 补水泵1状态
	private int d73;		// 补水泵2状态
	private int d74;		// 循环泵1状态
	private int d75;		// 循环泵2状态
	private int d76;		// 循环泵3状态
	private String d222;		// 当前设定温度
	private String d252;		// 二次出水温度
	private String d254;		// 二次回水温度
	private String d256;		// 机房温度
	private String d258;		// 室外温度
	private String d260;		// 一次供水温度
	private String d262;		// 一次回水温度
	private String d394;		// 循环电流
	private String d396;		// 循环功率
	private String d422;		// 循环频率
	private String d3402;		// 循环频率上限
	private String d3404;		// 循环频率下限
	private String d3252;		// 循环泵功率
	private String d404;		// 补水电流
	private String d406;		// 补水功率
	private String d522;		// 补水频率
	private String d3142;		// 补水频率上限
	private String d3140;		// 补水频率下限
	private String d3250;		// 补水泵功率
	private double d502;		// 二次供水压力
	private String d542;		// 板换入口压力
	private double d504;		// 二次回水压力
	private String d506;		// 二次回水压力_滤前
	private String d508;		// 一次供水压力
	private String d510;		// 一次回水压力
	private String d512;		// 水箱水位当前值
	private String d534;		// 当前压差
	private String d746;		// 电动阀开度
	private String d4120;		// 电动阀开度反馈
	private String d3500;		// 电动阀最大开度设定
	private String d3502;		// 电动阀最小开度设定
	private String d3504;		// 阀门手动设定开度
	private String d814;		// 补水累计流量
	private String d816;		// 补水瞬时流量
	private String d3100;		// 压差设定
	private String d3102;		// 补水设定压力
	private String d3115;		// 休眠压力提升
	private String d3104;		// 泄压开启压力
	private String d3106;		// 泄压停止压力
	private String d3108;		// 系统最低保护压力
	private String d3070;		// 再次启动压力
	private String d3200;		// 十度设定温度
	private String d3202;		// 时段1温度
	private String d3204;		// 时段2温度
	private String d3206;		// 时段3温度
	private String d3208;		// 时段4温度
	private String d3210;		// 时段5温度
	private String d3212;		// 时段6温度
	private String d3214;		// 室外温度补偿
	private String d3216;		// 出水最高温度
	private String d3220;		// 循环停机温度
	private String d2370;		// 定时段数
	private String d3000;		// 定时开机时间段1：时
	private String d3001;		// 定时开机时间段1：分
	private String d3002;		// 定时关机时间段1：时
	private String d3003;		// 定时关机时间段1：分
	private String d3004;		// 定时开机时间段2：时
	private String d3005;		// 定时开机时间段2：分
	private String d3006;		// 定时关机时间段2：时
	private String d3007;		// 定时关机时间段2：分
	private String d3008;		// 定时开机时间段3：时
	private String d3009;		// 定时开机时间段3：分
	private String d3010;		// 定时关机时间段3：时
	private String d3011;		// 定时关机时间段3：分
	private String d3012;		// 定时开机时间段4：时
	private String d3013;		// 定时开机时间段4：分
	private String d3014;		// 定时关机时间段4：时
	private String d3015;		// 定时关机时间段4：分
	private String d3016;		// 定时开机时间段5：时
	private String d3017;		// 定时开机时间段5：分
	private String d3018;		// 定时关机时间段5：时
	private String d3019;		// 定时关机时间段5：分
	private String d3020;		// 定时开机时间段6：时
	private String d3021;		// 定时开机时间段6：分
	private String d3022;		// 定时关机时间段6：时
	private String d3023;		// 定时关机时间段6：分
	private String d5200;		// 热表瞬时流量
	private String d5202;		// 热表瞬时热量
	private String d5204;		// 热表累计流量
	private String d5206;		// 热表累计热量
	private String d5208;		// 热表供水温度
	private String d5210;		// 热表回水温度
	private int d900;		// 报警数据：D900
	private int d901;		// 报警数据D901
	private int d902;		// 报警数据D902
	private int d903;		// 报警数据D903
	private int d904;		// 定时/分时控温显示
	private int m293;		// 进水阀指示
	private String m290;		// 进水阀手动开
	private String m291;		// 进水阀手动关
	private int m297;		// 泄压阀指示
	private String m720;		// 分时分温/定时开关机选择
	private String m722;		// 汽水/水水切换开关
	private int m2050;		// 电动阀手自动选择
	private String m2051;		// 进水阀手自动选择
	
	public JobStationDataOrigin() {
		super();
	}

	public JobStationDataOrigin(String id){
		super(id);
	}

	@Length(min=0, max=36, message="站号长度必须介于 0 和 36 之间")
	public String getStationCode() {
		return stationCode;
	}

	public void setStationCode(String stationCode) {
		this.stationCode = stationCode;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	public String getD2008() {
		return d2008;
	}

	public void setD2008(String d2008) {
		this.d2008 = d2008;
	}
	
	public String getD2009() {
		return d2009;
	}

	public void setD2009(String d2009) {
		this.d2009 = d2009;
	}
	
	public int getD70() {
		return d70;
	}

	public void setD70(int d70) {
		this.d70 = d70;
	}
	
	public int getD71() {
		return d71;
	}

	public void setD71(int d71) {
		this.d71 = d71;
	}
	
	public int getD72() {
		return d72;
	}

	public void setD72(int d72) {
		this.d72 = d72;
	}
	
	public int getD73() {
		return d73;
	}

	public void setD73(int d73) {
		this.d73 = d73;
	}
	
	public int getD74() {
		return d74;
	}

	public void setD74(int d74) {
		this.d74 = d74;
	}
	
	public int getD75() {
		return d75;
	}

	public void setD75(int d75) {
		this.d75 = d75;
	}
	
	public int getD76() {
		return d76;
	}

	public void setD76(int d76) {
		this.d76 = d76;
	}
	
	public String getD222() {
		return d222;
	}

	public void setD222(String d222) {
		this.d222 = d222;
	}
	
	public String getD252() {
		return d252;
	}

	public void setD252(String d252) {
		this.d252 = d252;
	}
	
	public String getD254() {
		return d254;
	}

	public void setD254(String d254) {
		this.d254 = d254;
	}
	
	public String getD256() {
		return d256;
	}

	public void setD256(String d256) {
		this.d256 = d256;
	}
	
	public String getD258() {
		return d258;
	}

	public void setD258(String d258) {
		this.d258 = d258;
	}
	
	public String getD260() {
		return d260;
	}

	public void setD260(String d260) {
		this.d260 = d260;
	}
	
	public String getD262() {
		return d262;
	}

	public void setD262(String d262) {
		this.d262 = d262;
	}
	
	public String getD394() {
		return d394;
	}

	public void setD394(String d394) {
		this.d394 = d394;
	}
	
	public String getD396() {
		return d396;
	}

	public void setD396(String d396) {
		this.d396 = d396;
	}
	
	public String getD422() {
		return d422;
	}

	public void setD422(String d422) {
		this.d422 = d422;
	}
	
	public String getD3402() {
		return d3402;
	}

	public void setD3402(String d3402) {
		this.d3402 = d3402;
	}
	
	public String getD3404() {
		return d3404;
	}

	public void setD3404(String d3404) {
		this.d3404 = d3404;
	}
	
	public String getD3252() {
		return d3252;
	}

	public void setD3252(String d3252) {
		this.d3252 = d3252;
	}
	
	public String getD404() {
		return d404;
	}

	public void setD404(String d404) {
		this.d404 = d404;
	}
	
	public String getD406() {
		return d406;
	}

	public void setD406(String d406) {
		this.d406 = d406;
	}
	
	public String getD522() {
		return d522;
	}

	public void setD522(String d522) {
		this.d522 = d522;
	}
	
	public String getD3142() {
		return d3142;
	}

	public void setD3142(String d3142) {
		this.d3142 = d3142;
	}
	
	public String getD3140() {
		return d3140;
	}

	public void setD3140(String d3140) {
		this.d3140 = d3140;
	}
	
	public String getD3250() {
		return d3250;
	}

	public void setD3250(String d3250) {
		this.d3250 = d3250;
	}
	
	public double getD502() {
		return d502;
	}

	public void setD502(double d502) {
		this.d502 = d502;
	}
	
	public String getD542() {
		return d542;
	}

	public void setD542(String d542) {
		this.d542 = d542;
	}
	
	public double getD504() {
		return d504;
	}

	public void setD504(double d504) {
		this.d504 = d504;
	}
	
	public String getD506() {
		return d506;
	}

	public void setD506(String d506) {
		this.d506 = d506;
	}
	
	public String getD508() {
		return d508;
	}

	public void setD508(String d508) {
		this.d508 = d508;
	}
	
	public String getD510() {
		return d510;
	}

	public void setD510(String d510) {
		this.d510 = d510;
	}
	
	public String getD512() {
		return d512;
	}

	public void setD512(String d512) {
		this.d512 = d512;
	}
	
	public String getD534() {
		return d534;
	}

	public void setD534(String d534) {
		this.d534 = d534;
	}
	
	public String getD746() {
		return d746;
	}

	public void setD746(String d746) {
		this.d746 = d746;
	}
	
	public String getD4120() {
		return d4120;
	}

	public void setD4120(String d4120) {
		this.d4120 = d4120;
	}
	
	public String getD3500() {
		return d3500;
	}

	public void setD3500(String d3500) {
		this.d3500 = d3500;
	}
	
	public String getD3502() {
		return d3502;
	}

	public void setD3502(String d3502) {
		this.d3502 = d3502;
	}
	
	public String getD3504() {
		return d3504;
	}

	public void setD3504(String d3504) {
		this.d3504 = d3504;
	}
	
	public String getD814() {
		return d814;
	}

	public void setD814(String d814) {
		this.d814 = d814;
	}
	
	public String getD816() {
		return d816;
	}

	public void setD816(String d816) {
		this.d816 = d816;
	}
	
	public String getD3100() {
		return d3100;
	}

	public void setD3100(String d3100) {
		this.d3100 = d3100;
	}
	
	public String getD3102() {
		return d3102;
	}

	public void setD3102(String d3102) {
		this.d3102 = d3102;
	}
	
	public String getD3115() {
		return d3115;
	}

	public void setD3115(String d3115) {
		this.d3115 = d3115;
	}
	
	public String getD3104() {
		return d3104;
	}

	public void setD3104(String d3104) {
		this.d3104 = d3104;
	}
	
	public String getD3106() {
		return d3106;
	}

	public void setD3106(String d3106) {
		this.d3106 = d3106;
	}
	
	public String getD3108() {
		return d3108;
	}

	public void setD3108(String d3108) {
		this.d3108 = d3108;
	}
	
	public String getD3070() {
		return d3070;
	}

	public void setD3070(String d3070) {
		this.d3070 = d3070;
	}
	
	public String getD3200() {
		return d3200;
	}

	public void setD3200(String d3200) {
		this.d3200 = d3200;
	}
	
	public String getD3202() {
		return d3202;
	}

	public void setD3202(String d3202) {
		this.d3202 = d3202;
	}
	
	public String getD3204() {
		return d3204;
	}

	public void setD3204(String d3204) {
		this.d3204 = d3204;
	}
	
	public String getD3206() {
		return d3206;
	}

	public void setD3206(String d3206) {
		this.d3206 = d3206;
	}
	
	public String getD3208() {
		return d3208;
	}

	public void setD3208(String d3208) {
		this.d3208 = d3208;
	}
	
	public String getD3210() {
		return d3210;
	}

	public void setD3210(String d3210) {
		this.d3210 = d3210;
	}
	
	public String getD3212() {
		return d3212;
	}

	public void setD3212(String d3212) {
		this.d3212 = d3212;
	}
	
	public String getD3214() {
		return d3214;
	}

	public void setD3214(String d3214) {
		this.d3214 = d3214;
	}
	
	public String getD3216() {
		return d3216;
	}

	public void setD3216(String d3216) {
		this.d3216 = d3216;
	}
	
	public String getD3220() {
		return d3220;
	}

	public void setD3220(String d3220) {
		this.d3220 = d3220;
	}
	
	public String getD2370() {
		return d2370;
	}

	public void setD2370(String d2370) {
		this.d2370 = d2370;
	}
	
	public String getD3000() {
		return d3000;
	}

	public void setD3000(String d3000) {
		this.d3000 = d3000;
	}
	
	public String getD3001() {
		return d3001;
	}

	public void setD3001(String d3001) {
		this.d3001 = d3001;
	}
	
	public String getD3002() {
		return d3002;
	}

	public void setD3002(String d3002) {
		this.d3002 = d3002;
	}
	
	public String getD3003() {
		return d3003;
	}

	public void setD3003(String d3003) {
		this.d3003 = d3003;
	}
	
	public String getD3004() {
		return d3004;
	}

	public void setD3004(String d3004) {
		this.d3004 = d3004;
	}
	
	public String getD3005() {
		return d3005;
	}

	public void setD3005(String d3005) {
		this.d3005 = d3005;
	}
	
	public String getD3006() {
		return d3006;
	}

	public void setD3006(String d3006) {
		this.d3006 = d3006;
	}
	
	public String getD3007() {
		return d3007;
	}

	public void setD3007(String d3007) {
		this.d3007 = d3007;
	}
	
	public String getD3008() {
		return d3008;
	}

	public void setD3008(String d3008) {
		this.d3008 = d3008;
	}
	
	public String getD3009() {
		return d3009;
	}

	public void setD3009(String d3009) {
		this.d3009 = d3009;
	}
	
	public String getD3010() {
		return d3010;
	}

	public void setD3010(String d3010) {
		this.d3010 = d3010;
	}
	
	public String getD3011() {
		return d3011;
	}

	public void setD3011(String d3011) {
		this.d3011 = d3011;
	}
	
	public String getD3012() {
		return d3012;
	}

	public void setD3012(String d3012) {
		this.d3012 = d3012;
	}
	
	public String getD3013() {
		return d3013;
	}

	public void setD3013(String d3013) {
		this.d3013 = d3013;
	}
	
	public String getD3014() {
		return d3014;
	}

	public void setD3014(String d3014) {
		this.d3014 = d3014;
	}
	
	public String getD3015() {
		return d3015;
	}

	public void setD3015(String d3015) {
		this.d3015 = d3015;
	}
	
	public String getD3016() {
		return d3016;
	}

	public void setD3016(String d3016) {
		this.d3016 = d3016;
	}
	
	public String getD3017() {
		return d3017;
	}

	public void setD3017(String d3017) {
		this.d3017 = d3017;
	}
	
	public String getD3018() {
		return d3018;
	}

	public void setD3018(String d3018) {
		this.d3018 = d3018;
	}
	
	public String getD3019() {
		return d3019;
	}

	public void setD3019(String d3019) {
		this.d3019 = d3019;
	}
	
	public String getD3020() {
		return d3020;
	}

	public void setD3020(String d3020) {
		this.d3020 = d3020;
	}
	
	public String getD3021() {
		return d3021;
	}

	public void setD3021(String d3021) {
		this.d3021 = d3021;
	}
	
	public String getD3022() {
		return d3022;
	}

	public void setD3022(String d3022) {
		this.d3022 = d3022;
	}
	
	public String getD3023() {
		return d3023;
	}

	public void setD3023(String d3023) {
		this.d3023 = d3023;
	}
	
	public String getD5200() {
		return d5200;
	}

	public void setD5200(String d5200) {
		this.d5200 = d5200;
	}
	
	public String getD5202() {
		return d5202;
	}

	public void setD5202(String d5202) {
		this.d5202 = d5202;
	}
	
	public String getD5204() {
		return d5204;
	}

	public void setD5204(String d5204) {
		this.d5204 = d5204;
	}
	
	public String getD5206() {
		return d5206;
	}

	public void setD5206(String d5206) {
		this.d5206 = d5206;
	}
	
	public String getD5208() {
		return d5208;
	}

	public void setD5208(String d5208) {
		this.d5208 = d5208;
	}
	
	public String getD5210() {
		return d5210;
	}

	public void setD5210(String d5210) {
		this.d5210 = d5210;
	}
	
	public int getD900() {
		return d900;
	}

	public void setD900(int d900) {
		this.d900 = d900;
	}
	
	public int getD901() {
		return d901;
	}

	public void setD901(int d901) {
		this.d901 = d901;
	}
	
	public int getD902() {
		return d902;
	}

	public void setD902(int d902) {
		this.d902 = d902;
	}
	
	public int getD903() {
		return d903;
	}

	public void setD903(int d903) {
		this.d903 = d903;
	}
	
	public int getD904() {
		return d904;
	}

	public void setD904(int d904) {
		this.d904 = d904;
	}
	
	@Length(min=0, max=11, message="进水阀指示长度必须介于 0 和 11 之间")
	public int getM293() {
		return m293;
	}

	public void setM293(int m293) {
		this.m293 = m293;
	}
	
	@Length(min=0, max=11, message="进水阀手动开长度必须介于 0 和 11 之间")
	public String getM290() {
		return m290;
	}

	public void setM290(String m290) {
		this.m290 = m290;
	}
	
	@Length(min=0, max=11, message="进水阀手动关长度必须介于 0 和 11 之间")
	public String getM291() {
		return m291;
	}

	public void setM291(String m291) {
		this.m291 = m291;
	}
	
	@Length(min=0, max=11, message="泄压阀指示长度必须介于 0 和 11 之间")
	public int getM297() {
		return m297;
	}

	public void setM297(int m297) {
		this.m297 = m297;
	}
	
	@Length(min=0, max=11, message="分时分温/定时开关机选择长度必须介于 0 和 11 之间")
	public String getM720() {
		return m720;
	}

	public void setM720(String m720) {
		this.m720 = m720;
	}
	
	@Length(min=0, max=11, message="汽水/水水切换开关长度必须介于 0 和 11 之间")
	public String getM722() {
		return m722;
	}

	public void setM722(String m722) {
		this.m722 = m722;
	}
	
	@Length(min=0, max=11, message="电动阀手自动选择长度必须介于 0 和 11 之间")
	public int getM2050() {
		return m2050;
	}

	public void setM2050(int m2050) {
		this.m2050 = m2050;
	}
	
	@Length(min=0, max=11, message="进水阀手自动选择长度必须介于 0 和 11 之间")
	public String getM2051() {
		return m2051;
	}

	public void setM2051(String m2051) {
		this.m2051 = m2051;
	}

	public Date getQueryBegintime() {
		return queryBegintime;
	}

	public void setQueryBegintime(Date queryBegintime) {
		this.queryBegintime = queryBegintime;
	}

	public Date getQueryEndtime() {
		return queryEndtime;
	}

	public void setQueryEndtime(Date queryEndtime) {
		this.queryEndtime = queryEndtime;
	}
}