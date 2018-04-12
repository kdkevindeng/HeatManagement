package com.thinkgem.jeesite.common.vo;

import java.util.List;

/**
 * Created by lizhi on 2017/11/28.
 */
public class SimpleChart {
    private List<String> xAxis;//X轴数据
    private List<String> yAxis;//Y轴数据
    private List<String> yAxis2;//Y轴数据2
    private List<String> yAxis3;//Y轴数据3
    private List<String> yAxis4;//Y轴数据4

    public List<String> getxAxis() {
        return xAxis;
    }

    public void setxAxis(List<String> xAxis) {
        this.xAxis = xAxis;
    }

    public List<String> getyAxis() {
        return yAxis;
    }

    public void setyAxis(List<String> yAxis) {
        this.yAxis = yAxis;
    }

    public List<String> getyAxis2() {
        return yAxis2;
    }

    public void setyAxis2(List<String> yAxis2) {
        this.yAxis2 = yAxis2;
    }

    public List<String> getyAxis3() {
        return yAxis3;
    }

    public void setyAxis3(List<String> yAxis3) {
        this.yAxis3 = yAxis3;
    }

    public List<String> getyAxis4() {
        return yAxis4;
    }

    public void setyAxis4(List<String> yAxis4) {
        this.yAxis4 = yAxis4;
    }
}
