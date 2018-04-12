/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.admin.web.addrdic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.addrdic.JobHeatDic;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.addrdic.JobHeatDicService;

/**
 * 地址对应表Controller
 * @author lizhi
 * @version 2017-11-19
 */
@Controller
@RequestMapping(value = "${adminPath}/admin/addrdic/jobHeatDic")
public class JobHeatDicController extends BaseController {

	@Autowired
	private JobHeatDicService jobHeatDicService;
	
	@ModelAttribute
	public JobHeatDic get(@RequestParam(required=false) String id) {
		JobHeatDic entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jobHeatDicService.get(id);
		}
		if (entity == null){
			entity = new JobHeatDic();
		}
		return entity;
	}
	
	@RequiresPermissions("admin:addrdic:jobHeatDic:view")
	@RequestMapping(value = {"list", ""})
	public String list(JobHeatDic jobHeatDic, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JobHeatDic> page = jobHeatDicService.findPage(new Page<JobHeatDic>(request, response), jobHeatDic); 
		model.addAttribute("page", page);
		return "heatexchange/admin/addrdic/jobHeatDicList";
	}

	@RequiresPermissions("admin:addrdic:jobHeatDic:view")
	@RequestMapping(value = "form")
	public String form(JobHeatDic jobHeatDic, Model model) {
		model.addAttribute("jobHeatDic", jobHeatDic);
		return "heatexchange/admin/addrdic/jobHeatDicForm";
	}

	@RequiresPermissions("admin:addrdic:jobHeatDic:edit")
	@RequestMapping(value = "save")
	public String save(JobHeatDic jobHeatDic, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, jobHeatDic)){
			return form(jobHeatDic, model);
		}
		jobHeatDicService.save(jobHeatDic);
		addMessage(redirectAttributes, "保存地址对应成功");
		return "redirect:"+Global.getAdminPath()+"/admin/addrdic/jobHeatDic/?repage";
	}
	
	@RequiresPermissions("admin:addrdic:jobHeatDic:edit")
	@RequestMapping(value = "delete")
	public String delete(JobHeatDic jobHeatDic, RedirectAttributes redirectAttributes) {
		jobHeatDicService.delete(jobHeatDic);
		addMessage(redirectAttributes, "删除地址对应成功");
		return "redirect:"+Global.getAdminPath()+"/admin/addrdic/jobHeatDic/?repage";
	}

}