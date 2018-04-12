/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.analysis.web.energy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.vo.SimpleChart;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeMonth;
import com.thinkgem.jeesite.modules.heatexchange.analysis.service.energy.JobStationEnergyConsumeMonthService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * 能耗分析-月Controller
 * @author lizhi
 * @version 2017-11-27
 */
@Controller
@RequestMapping(value = "${adminPath}/analysis/energy/jobStationEnergyConsumeMonth")
public class JobStationEnergyConsumeMonthController extends BaseController {

	@Autowired
	private JobStationEnergyConsumeMonthService jobStationEnergyConsumeMonthService;
	@Autowired
	private JobStationService jobStationService;
	@Autowired
	private JobStationDataOriginService jobStationDataOriginService;

	@ModelAttribute
	public JobStationEnergyConsumeMonth get(@RequestParam(required=false) String id) {
		JobStationEnergyConsumeMonth entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jobStationEnergyConsumeMonthService.get(id);
		}
		if (entity == null){
			entity = new JobStationEnergyConsumeMonth();
		}
		return entity;
	}
	
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeMonth:view")
	@RequestMapping(value = {"list", ""})
	public String list(JobStationEnergyConsumeMonth jobStationEnergyConsumeMonth, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JobStationEnergyConsumeMonth> page = jobStationEnergyConsumeMonthService.findPage(new Page<JobStationEnergyConsumeMonth>(request, response), jobStationEnergyConsumeMonth); 
		model.addAttribute("page", page);
        model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/analysis/energy/jobStationEnergyConsumeMonthList";
	}

    @RequiresPermissions("analysis:energy:jobStationEnergyConsumeMonth:view")
    @RequestMapping("chart")
    public String chart(Model model) {
        model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
        return "heatexchange/analysis/energy/jobStationEnergyConsumeMonthCharts";
    }
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeMonth:view")
	@ResponseBody
	@RequestMapping("/chart/data")
	public SimpleChart chart(String stationCode){
		SimpleChart chartData=new SimpleChart();
		JobStationEnergyConsumeMonth queryDTO=new JobStationEnergyConsumeMonth();
		queryDTO.setStationId(stationCode);
		List<JobStationEnergyConsumeMonth> dataList = this.jobStationEnergyConsumeMonthService.findList(queryDTO);
		List<String> xAxis=new ArrayList<String>();
		List<String> yAxis=new ArrayList<String>();
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
		for(JobStationEnergyConsumeMonth data:dataList){
			xAxis.add(sf.format(data.getTime()));
			yAxis.add(data.getEnergy());
		}
		chartData.setxAxis(xAxis);
		chartData.setyAxis(yAxis);
		return chartData;
	}
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeMonth:view")
	@RequestMapping(value = "form")
	public String form(JobStationEnergyConsumeMonth jobStationEnergyConsumeMonth, Model model) {
		model.addAttribute("jobStationEnergyConsumeMonth", jobStationEnergyConsumeMonth);
		return "heatexchange/analysis/energy/jobStationEnergyConsumeMonthForm";
	}

	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeMonth:edit")
	@RequestMapping(value = "save")
	public String save(JobStationEnergyConsumeMonth jobStationEnergyConsumeMonth, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, jobStationEnergyConsumeMonth)){
			return form(jobStationEnergyConsumeMonth, model);
		}
		jobStationEnergyConsumeMonthService.save(jobStationEnergyConsumeMonth);
		addMessage(redirectAttributes, "保存能耗分析-月成功");
		return "redirect:"+Global.getAdminPath()+"/analysis/energy/jobStationEnergyConsumeMonth/?repage";
	}
	
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeMonth:edit")
	@RequestMapping(value = "delete")
	public String delete(JobStationEnergyConsumeMonth jobStationEnergyConsumeMonth, RedirectAttributes redirectAttributes) {
		jobStationEnergyConsumeMonthService.delete(jobStationEnergyConsumeMonth);
		addMessage(redirectAttributes, "删除能耗分析-月成功");
		return "redirect:"+Global.getAdminPath()+"/analysis/energy/jobStationEnergyConsumeMonth/?repage";
	}

}