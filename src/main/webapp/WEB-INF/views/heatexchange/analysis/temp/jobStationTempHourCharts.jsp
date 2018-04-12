<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>温度曲线-小时</title>
	<%--<meta name="decorator" content="default"/>--%>
    <link href="${ctxStatic}/bootstrap/2.3.1/css_cerulean/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.js"></script>
    <script src="${ctxStatic}/echarts/echarts.js"></script>
    <script>
        $(document).ready(function(){
            $("#btnSubmit").click(function () {
                query();
            });
            query();

        });

        function initchart(axisData) {
            /*var base = +new Date(1968, 9, 3);
            var oneDay = 24 * 3600 * 1000;
            var date = [];

            var data = [Math.random() * 300];

            for (var i = 1; i < 20000; i++) {
                var now = new Date(base += oneDay);
                date.push([now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'));
                data.push(Math.round((Math.random() - 0.5) * 20 + data[i - 1]));
            }*/

            option = {
                tooltip: {
                    trigger: 'axis',
                    position: function (pt) {
                        return [pt[0], '10%'];
                    }
                },
                title: {
                    left: 'center',
                    text: '温度大数据曲线',
                },
                toolbox: {
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: axisData.xAxis
                },
                yAxis: {
                    type: 'value',
                    boundaryGap: [0, '100%']
                },
                dataZoom: [{
                    type: 'inside',
                    start: 0,
                    end: 100
                }, {
                    start: 0,
                    end: 10,
                    handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                    handleSize: '80%',
                    handleStyle: {
                        color: '#fff',
                        shadowBlur: 3,
                        shadowColor: 'rgba(0, 0, 0, 0.6)',
                        shadowOffsetX: 2,
                        shadowOffsetY: 2
                    }
                }],
                series: [
                    {
                        name:'	二次出水温度',
                        type:'line',
                        smooth:true,
                        symbol: 'none',
                        sampling: 'average',
                        itemStyle: {
                            normal: {
                                color: 'rgb(255, 70, 131)'
                            }
                        },
                        areaStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: 'rgb(255, 158, 68)'
                                }, {
                                    offset: 1,
                                    color: 'rgb(255, 70, 131)'
                                }])
                            }
                        },
                        data: axisData.yAxis
                    },
                    {
                        name:'	二次回水温度',
                        type:'line',
                        smooth:true,
                        symbol: 'none',
                        sampling: 'average',
                        itemStyle: {
                            normal: {
                                color: 'rgb(255, 70, 131)'
                            }
                        },
                        areaStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: 'rgb(255, 158, 68)'
                                }, {
                                    offset: 1,
                                    color: 'rgb(255, 70, 131)'
                                }])
                            }
                        },
                        data: axisData.yAxis2
                    }
                ]
            };

            var myChart = echarts.init(document.getElementById("echarts"));
            myChart.setOption(option);
        }
        function query() {
//            $("#stationCode")
            $.post("${ctx}/analysis/temp/jobStationTempDay/chart/data",
                {stationCode:$("#stationCode").val()},
                function (data) {
                    initchart(data);
            });
        }
    </script>
</head>
<body>
	<div class="container-fluid">

        <ul class="nav nav-tabs">
            <li ><a href="${ctx}/analysis/energy/jobStationEnergyConsumeDay/">能耗分析列表</a></li>
            <li class="active"><a href="${ctx}/analysis/energy/jobStationEnergyConsumeDay/chart">能耗分析图</a></li>
        </ul>
        <form id="searchForm" class="breadcrumb form-search" >
            <label>站点：</label>

            <select id="stationCode" name="stationCode" class="input-medium select2-offscreen" tabindex="-1">
                <c:forEach var="station" items="${stationList}">
                    <option value="${station.code}">${station.name}</option>
                </c:forEach>
            </select>
            <input id="btnSubmit" class="btn btn-primary" type="button" value="查询">

        </form>
        <%--<sys:message content="${message}"/>--%>
        <div class="row">
            <div  class="col-md-12">
                <div id="echarts" style="height: 400px;width: 100%"></div>
            </div>
        </div>
    </div>
</body>
</html>