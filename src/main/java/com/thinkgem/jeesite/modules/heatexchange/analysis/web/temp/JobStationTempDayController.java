/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.analysis.web.temp;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.vo.SimpleChart;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeDay;
import com.thinkgem.jeesite.modules.heatexchange.analysis.service.energy.JobStationEnergyConsumeDayService;
import com.thinkgem.jeesite.modules.heatexchange.analysis.web.energy.vo.StationEnergyConsumeDayViewService;
import com.thinkgem.jeesite.modules.heatexchange.analysis.web.energy.vo.StationEnergyConsumeDayVo;
import com.thinkgem.jeesite.modules.heatexchange.data.entity.origin.JobStationDataOrigin;
import com.thinkgem.jeesite.modules.heatexchange.data.service.origin.JobStationDataOriginService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * 温度曲线-天Controller
 * @author lizhi
 * @version 2017-11-17
 */
@Controller
@RequestMapping(value = "${adminPath}/analysis/temp/jobStationTempDay")
public class JobStationTempDayController extends BaseController {

	@Autowired
	private JobStationService jobStationService;
   @Autowired
    private JobStationDataOriginService jobStationDataOriginService;


	@RequiresPermissions("analysis:energy:jobStationTempDay:view")
	@RequestMapping("chart")
	public String chart(Model model) {
        model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/analysis/temp/jobStationTempDayCharts";
	}
	@RequiresPermissions("analysis:energy:jobStationTempDay:view")
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
			yAxis.add(data.getD252());
			yAxis2.add(data.getD254());
			yAxis3.add(data.getD260());
			yAxis4.add(data.getD262());
		}
		chartData.setxAxis(xAxis);
		chartData.setyAxis(yAxis);
		chartData.setyAxis2(yAxis2);
		chartData.setyAxis3(yAxis3);
		chartData.setyAxis4(yAxis4);
		return chartData;
	}


}