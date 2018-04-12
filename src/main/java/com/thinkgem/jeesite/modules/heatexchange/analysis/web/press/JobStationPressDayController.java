/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.analysis.web.press;

import com.thinkgem.jeesite.common.vo.SimpleChart;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
import com.thinkgem.jeesite.modules.heatexchange.data.entity.origin.JobStationDataOrigin;
import com.thinkgem.jeesite.modules.heatexchange.data.service.origin.JobStationDataOriginService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * 压力曲线-天Controller
 * @author lizhi
 * @version 2017-11-17
 */
@Controller
@RequestMapping(value = "${adminPath}/analysis/press/jobStationPressDay")
public class JobStationPressDayController extends BaseController {

	@Autowired
	private JobStationService jobStationService;
   @Autowired
    private JobStationDataOriginService jobStationDataOriginService;


	@RequestMapping("chart")
	public String chart(Model model) {
        model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/analysis/press/jobStationPressDayCharts";
	}
	@ResponseBody
	@RequestMapping("/chart/data")
	public SimpleChart chart(String stationCode){
		SimpleChart chartData=new SimpleChart();
		JobStationDataOrigin queryDTO=new JobStationDataOrigin();
		queryDTO.setStationCode(stationCode);
		List<JobStationDataOrigin> dataList = this.jobStationDataOriginService.findList(queryDTO);
		List<String> xAxis=new ArrayList<String>();
		List<String> yAxis=new ArrayList<String>();
		List<String> yAxis2=new ArrayList<String>();
		List<String> yAxis3=new ArrayList<String>();
		List<String> yAxis4=new ArrayList<String>();
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for(JobStationDataOrigin data:dataList){
			xAxis.add(sf.format(data.getTime()));
			yAxis.add(data.getD508());
			yAxis2.add(data.getD510());
			yAxis3.add(data.getD502()+"");
			yAxis4.add(data.getD504()+"");
		}
		chartData.setxAxis(xAxis);
		chartData.setyAxis(yAxis);
		chartData.setyAxis2(yAxis2);
		chartData.setyAxis3(yAxis3);
		chartData.setyAxis4(yAxis4);
		return chartData;
	}


}