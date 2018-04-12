/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.analysis.web.energy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.vo.SimpleChart;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.heatexchange.analysis.entity.energy.JobStationEnergyConsumeDay;
import com.thinkgem.jeesite.modules.heatexchange.analysis.service.energy.JobStationEnergyConsumeDayService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * 能耗分析-天Controller
 * @author lizhi
 * @version 2017-11-17
 */
@Controller
@RequestMapping(value = "${adminPath}/analysis/energy/jobStationEnergyConsumeDay")
public class JobStationEnergyConsumeDayController extends BaseController {

	@Autowired
	private JobStationEnergyConsumeDayService jobStationEnergyConsumeDayService;
	@Autowired
	private JobStationService jobStationService;
    @Autowired
	private StationEnergyConsumeDayViewService stationEnergyConsumeDayViewService;
	@Autowired
    private JobStationDataOriginService jobStationDataOriginService;

	@ModelAttribute
	public JobStationEnergyConsumeDay get(@RequestParam(required=false) String id) {
		JobStationEnergyConsumeDay entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jobStationEnergyConsumeDayService.get(id);
		}
		if (entity == null){
			entity = new JobStationEnergyConsumeDay();
		}
		return entity;
	}
	
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeDay:view")
	@RequestMapping(value = {"list", ""})
	public String list(JobStationEnergyConsumeDay jobStationEnergyConsumeDay, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JobStationEnergyConsumeDay> page = jobStationEnergyConsumeDayService.findPage(new Page<JobStationEnergyConsumeDay>(request, response), jobStationEnergyConsumeDay); 
		Page<StationEnergyConsumeDayVo> vopage = new Page<StationEnergyConsumeDayVo>(request,response);
		List<StationEnergyConsumeDayVo> voList=stationEnergyConsumeDayViewService.dtoList2voList(page.getList());
		vopage.setList(voList);
		model.addAttribute("page", vopage);
        model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/analysis/energy/jobStationEnergyConsumeDayList";
	}
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeDay:view")
	@RequestMapping("chart")
	public String chart(Model model) {
        model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/analysis/energy/jobStationEnergyConsumeDayCharts";
	}
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeDay:view")
	@ResponseBody
	@RequestMapping("/chart/data")
	public SimpleChart chart(String stationCode){
		SimpleChart chartData=new SimpleChart();
		JobStationEnergyConsumeDay queryDTO=new JobStationEnergyConsumeDay();
		queryDTO.setStationId(stationCode);
//		List<JobStationDataOrigin> dataList = this.jobStationDataOriginService.findList(queryDTO);
		List<JobStationEnergyConsumeDay> dataList = this.jobStationEnergyConsumeDayService.findList(queryDTO);
		List<String> xAxis=new ArrayList<String>();
		List<String> yAxis=new ArrayList<String>();
		SimpleDateFormat sf=new SimpleDateFormat("HH");
		for(JobStationEnergyConsumeDay data:dataList){
			xAxis.add(sf.format(data.getTime())+"时");
			yAxis.add(data.getEnergy());
		}
		chartData.setxAxis(xAxis);
		chartData.setyAxis(yAxis);
		return chartData;
	}
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeDay:view")
	@RequestMapping(value = "form")
	public String form(JobStationEnergyConsumeDay jobStationEnergyConsumeDay, Model model) {
		model.addAttribute("jobStationEnergyConsumeDay", jobStationEnergyConsumeDay);
		return "heatexchange/analysis/energy/jobStationEnergyConsumeDayForm";
	}

	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeDay:edit")
	@RequestMapping(value = "save")
	public String save(JobStationEnergyConsumeDay jobStationEnergyConsumeDay, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, jobStationEnergyConsumeDay)){
			return form(jobStationEnergyConsumeDay, model);
		}
		jobStationEnergyConsumeDayService.save(jobStationEnergyConsumeDay);
		addMessage(redirectAttributes, "保存能耗分析成功");
		return "redirect:"+Global.getAdminPath()+"/analysis/energy/jobStationEnergyConsumeDay/?repage";
	}
	
	@RequiresPermissions("analysis:energy:jobStationEnergyConsumeDay:edit")
	@RequestMapping(value = "delete")
	public String delete(JobStationEnergyConsumeDay jobStationEnergyConsumeDay, RedirectAttributes redirectAttributes) {
		jobStationEnergyConsumeDayService.delete(jobStationEnergyConsumeDay);
		addMessage(redirectAttributes, "删除能耗分析成功");
		return "redirect:"+Global.getAdminPath()+"/analysis/energy/jobStationEnergyConsumeDay/?repage";
	}

}