/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.data.web.origin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.exception.AppException;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
import com.thinkgem.jeesite.modules.heatexchange.data.entity.origin.JobStationDataOrigin;
import com.thinkgem.jeesite.modules.heatexchange.data.web.origin.vo.JobStationDataOriginViewService;
import com.thinkgem.jeesite.modules.heatexchange.data.web.origin.vo.JobStationDataOriginVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.heatexchange.data.service.origin.JobStationDataOriginService;

import java.util.List;

/**
 * 热网计量Controller
 * @author lizhi
 * @version 2017-11-17
 */
@Controller
@RequestMapping(value = "${adminPath}/data/origin/jobStationDataOrigin")
public class JobStationDataOriginController extends BaseController {

	@Autowired
	private JobStationDataOriginService jobStationDataOriginService;
	@Autowired
	private JobStationService jobStationService;
    @Autowired
	private JobStationDataOriginViewService jobStationDataOriginViewService;
	@ModelAttribute
	public JobStationDataOrigin get(@RequestParam(required=false) String id) {
		JobStationDataOrigin entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jobStationDataOriginService.get(id);
		}
		if (entity == null){
			entity = new JobStationDataOrigin();
		}
		return entity;
	}
	
	@RequiresPermissions("data:origin:jobStationDataOrigin:view")
	@RequestMapping(value = {"list", ""})
	public String list(JobStationDataOrigin jobStationDataOrigin, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JobStationDataOrigin> page = jobStationDataOriginService.findPage(new Page<JobStationDataOrigin>(request, response), jobStationDataOrigin); 
		Page<JobStationDataOriginVo> voPage=new Page<JobStationDataOriginVo>(request,response);
        List<JobStationDataOriginVo> voList = jobStationDataOriginViewService.dtoList2voList(page.getList());
        voPage.setList(voList);
		model.addAttribute("reqParam", jobStationDataOrigin);
		model.addAttribute("page", voPage);
		model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/data/origin/jobStationDataOriginList";
	}
	@RequiresPermissions("data:origin:jobStationDataOrigin:view")
	@RequestMapping("report")
	public String report(JobStationDataOrigin jobStationDataOrigin, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JobStationDataOrigin> page = jobStationDataOriginService.findPage(new Page<JobStationDataOrigin>(request, response), jobStationDataOrigin);
		Page<JobStationDataOriginVo> voPage=new Page<JobStationDataOriginVo>(request,response);
        List<JobStationDataOriginVo> voList = jobStationDataOriginViewService.dtoList2voList(page.getList());
        voPage.setList(voList);
		model.addAttribute("reqParam", jobStationDataOrigin);
		model.addAttribute("page", voPage);
		model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/data/origin/jobStationDataOriginReport";
	}
	@RequiresPermissions("data:origin:jobStationDataOrigin:view")
	@RequestMapping("/param/list")
	public String list2(JobStationDataOrigin jobStationDataOrigin, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JobStationDataOrigin> page = jobStationDataOriginService.findPage(new Page<JobStationDataOrigin>(request, response), jobStationDataOrigin);
		Page<JobStationDataOriginVo> voPage=new Page<JobStationDataOriginVo>(request,response);
        List<JobStationDataOriginVo> voList = jobStationDataOriginViewService.dtoList2voList(page.getList());
        voPage.setList(voList);
		model.addAttribute("reqParam", jobStationDataOrigin);
		model.addAttribute("page", voPage);
		model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/data/origin/jobStationDataOriginListParam";
	}
	@RequiresPermissions("data:origin:jobStationDataOrigin:view")
	@RequestMapping("/alram/list")
	public String listAlram(JobStationDataOrigin jobStationDataOrigin, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JobStationDataOrigin> page = jobStationDataOriginService.findPage(new Page<JobStationDataOrigin>(request, response), jobStationDataOrigin);
		Page<JobStationDataOriginVo> voPage=new Page<JobStationDataOriginVo>(request,response);
        List<JobStationDataOriginVo> voList = jobStationDataOriginViewService.dtoList2voList(page.getList());
        voPage.setList(voList);
		model.addAttribute("reqParam", jobStationDataOrigin);
		model.addAttribute("page", voPage);
		model.addAttribute("stationList", this.jobStationService.findList(new JobStation()));
		return "heatexchange/data/origin/jobStationDataOriginListAlarm";
	}
	/*有图模式展示*/
	@RequiresPermissions("data:origin:jobStationDataOrigin:view")
	@RequestMapping("img")
	public String img(String stationCode, HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			JobStationDataOrigin data = jobStationDataOriginService.getStationNewestData(stationCode);
			model.addAttribute("jobStationDataOrigin",data);
			return "heatexchange/data/origin/jobStationDataOriginImg";
		} catch (AppException e) {
			return e.getMessage();
		}
	}
	/*有图模式展示*/
	@RequiresPermissions("data:origin:jobStationDataOrigin:view")
    @RequestMapping("setting")
    public String setting(String stationCode, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            JobStationDataOrigin data = jobStationDataOriginService.getStationNewestData(stationCode);
            model.addAttribute("jobStationDataOrigin",data);
            return "heatexchange/data/origin/jobStationDataOriginSetting";
        } catch (AppException e) {
            return e.getMessage();
        }
    }
    @RequiresPermissions("data:origin:jobStationDataOrigin:view")
    @RequestMapping("/setting/index")
    public String settingIndex() {
        return "heatexchange/data/origin/jobStationDataOriginSettingIndex";
    }
	/*有图模式展示*/
	@RequestMapping("index")
	public String index() {
		return "heatexchange/data/origin/jobStationDataOriginIndex";
	}

	@RequiresPermissions("data:origin:jobStationDataOrigin:view")
	@RequestMapping(value = "form")
	public String form(JobStationDataOrigin jobStationDataOrigin, Model model) {
		model.addAttribute("jobStationDataOrigin", jobStationDataOrigin);
		return "heatexchange/data/origin/jobStationDataOriginForm";
	}

	@RequiresPermissions("data:origin:jobStationDataOrigin:edit")
	@RequestMapping(value = "save")
	public String save(JobStationDataOrigin jobStationDataOrigin, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, jobStationDataOrigin)){
			return form(jobStationDataOrigin, model);
		}
		jobStationDataOriginService.save(jobStationDataOrigin);
		addMessage(redirectAttributes, "保存热网计量成功");
		return "redirect:"+Global.getAdminPath()+"/data/origin/jobStationDataOrigin/?repage";
	}
	
	@RequiresPermissions("data:origin:jobStationDataOrigin:edit")
	@RequestMapping(value = "delete")
	public String delete(JobStationDataOrigin jobStationDataOrigin, RedirectAttributes redirectAttributes) {
		jobStationDataOriginService.delete(jobStationDataOrigin);
		addMessage(redirectAttributes, "删除热网计量成功");
		return "redirect:"+Global.getAdminPath()+"/data/origin/jobStationDataOrigin/?repage";
	}

}