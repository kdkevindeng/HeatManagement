/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.heatexchange.socket.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.exception.AppException;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.station.JobStation;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.station.JobStationService;
import com.thinkgem.jeesite.modules.heatexchange.data.entity.origin.JobStationDataOrigin;
import com.thinkgem.jeesite.modules.heatexchange.data.service.origin.JobStationDataOriginService;
import com.thinkgem.jeesite.modules.heatexchange.data.web.origin.vo.JobStationDataOriginViewService;
import com.thinkgem.jeesite.modules.heatexchange.data.web.origin.vo.JobStationDataOriginVo;
import com.thinkgem.jeesite.modules.heatexchange.socket.SendCmdService;
import org.apache.commons.lang3.math.NumberUtils;
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
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import static java.lang.System.out;

/**
 * 指令发送Controller
 * @author lizhi
 * @version 2017-11-17
 */
@Controller
@RequestMapping(value = "${adminPath}/data/control/cmd")
public class JobStationControlController extends BaseController {
	@Autowired
	private SendCmdService sendCmdService;
	@ResponseBody
	@RequestMapping("/param/save")
	public String sendCmd(int stationCode, HttpServletRequest request,HttpServletResponse response){
		String res="发送指令失败";
		Enumeration paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			if(!paramName.equals(stationCode)){
                String paramValue = request.getParameterValues(paramName)!=null?request.getParameterValues(paramName)[0]:"";
                try {
                    if(org.apache.commons.lang3.StringUtils.isNotEmpty(paramValue)&&NumberUtils.isNumber(paramValue)){
                        this.sendCmdService.send(stationCode,paramName, paramValue);
                        res="发送指令成功";
                    }else {
                        res="参数错误";
                    }
                } catch (IOException e) {
                    res="发送指令失败";
                } catch (AppException e) {
                    res=e.getMessage();
                }
            }
		}
		return res;
	}

    @ResponseBody
    @RequestMapping("/param/save/single")
	public String sendCmdSingle(int stationCode,String plcAddr,String paramValue){
        String res="发送指令失败";
        try {
            if(org.apache.commons.lang3.StringUtils.isNotEmpty(paramValue)&&NumberUtils.isNumber(paramValue)){
                this.sendCmdService.send(stationCode,plcAddr,paramValue);
                res="发送指令成功";
            }
        }catch (IOException e) {
            res="发送指令失败";
        } catch (AppException e) {
            res=e.getMessage();
        }
        return res;
    }
}