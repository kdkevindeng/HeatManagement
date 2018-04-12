package com.thinkgem.jeesite.modules.heatexchange.schedule;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by lizhi on 2017/12/3.
 * 任务中心
 * 定时任务在这里设置
 */
@Service("taskCenter")
public class TaskCenter {

    /**
     * 日志对象
     */
    protected Logger logger = LoggerFactory.getLogger(getClass());

    /*每一小时
    * 每个小时的0分1秒执行*/
    @Scheduled(cron = "1 0 * * * ?")
    public void hour(){
        logger.info("我每一小时执行一次："+new Date());
    }/*每一天
    * 每天的0点0分1秒执行*/
    @Scheduled(cron = "1 0 0 * * ?")
    public void day(){
        logger.info("我每一天执行一次："+new Date());
    }
}
