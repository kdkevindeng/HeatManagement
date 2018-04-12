/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.admin.web.station;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.vo.SpinnerVo;
import com.thinkgem.jeesite.common.vo.ZTreeNode;
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
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;

import java.util.ArrayList;
import java.util.List;

/**
 * 换热站Controller
 * @author lizhi
 * @version 2017-11-17
 */
@Controller
@RequestMapping(value = "${adminPath}/admin/station/jobStation")
public class JobStationController extends BaseController {

	@Autowired
	private JobStationService jobStationService;
	
	@ModelAttribute
	public JobStation get(@RequestParam(required=false) String id) {
		JobStation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jobStationService.get(id);
		}
		if (entity == null){
			entity = new JobStation();
		}
		return entity;
	}
	
	@RequiresPermissions("admin:station:jobStation:view")
	@RequestMapping(value = {"list", ""})
	public String list(JobStation jobStation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JobStation> page = jobStationService.findPage(new Page<JobStation>(request, response), jobStation); 
		model.addAttribute("page", page);
		return "heatexchange/admin/station/jobStationList";
	}

	@RequiresPermissions("admin:station:jobStation:view")
	@RequestMapping("spinner")
	@ResponseBody
	public List<SpinnerVo> spinner(){
		List<SpinnerVo> result=new ArrayList<SpinnerVo>();
		List<JobStation> list = this.jobStationService.findList(new JobStation());
		for(JobStation jobStation:list){
			SpinnerVo spinner=new SpinnerVo();
			spinner.setCode(jobStation.getId());
			spinner.setName(jobStation.getName());
			result.add(spinner);
		}
		return result;
	}
	@RequiresPermissions("admin:station:jobStation:view")
	@RequestMapping("ztree")
	@ResponseBody
	public List<ZTreeNode> ztree(){
		List<ZTreeNode> result=new ArrayList<ZTreeNode>();
		ZTreeNode root=new ZTreeNode();
		root.setId("0");
		root.setName("站点");
		root.setParent(true);
		result.add(root);
		List<JobStation> list = this.jobStationService.findList(new JobStation());
		for(JobStation jobStation:list){
			ZTreeNode zTreeNode=new ZTreeNode();
			zTreeNode.setId(jobStation.getCode());
			zTreeNode.setName(jobStation.getName());
			zTreeNode.setParent(false);
			zTreeNode.setpId("0");
			result.add(zTreeNode);
		}
		return result;
	}

	@RequiresPermissions("admin:station:jobStation:view")
	@RequestMapping(value = "form")
	public String form(JobStation jobStation, Model model) {
		model.addAttribute("jobStation", jobStation);
		return "heatexchange/admin/station/jobStationForm";
	}

	@RequiresPermissions("admin:station:jobStation:edit")
	@RequestMapping(value = "save")
	public String save(JobStation jobStation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, jobStation)){
			return form(jobStation, model);
		}
		jobStationService.save(jobStation);
		addMessage(redirectAttributes, "保存换热站成功");
		return "redirect:"+Global.getAdminPath()+"/admin/station/jobStation/?repage";
	}
	
	@RequiresPermissions("admin:station:jobStation:edit")
	@RequestMapping(value = "delete")
	public String delete(JobStation jobStation, RedirectAttributes redirectAttributes) {
		jobStationService.delete(jobStation);
		addMessage(redirectAttributes, "删除换热站成功");
		return "redirect:"+Global.getAdminPath()+"/admin/station/jobStation/?repage";
	}

}