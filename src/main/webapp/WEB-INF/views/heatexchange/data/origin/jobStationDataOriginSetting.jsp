<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工艺流程</title>
	<%--<meta name="decorator" content="default"/>--%>
    <!-- Bootstrap -->
    <link href="${ctxStatic}/bootstrap/3/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/bootstrap/3/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="${ctxStatic}/bootstrap/3/plugins/bootstrap-switch/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctxStatic}/jquery/jquery-1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctxStatic}/bootstrap/3/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/jquery-validation/1.11.1/lib/jquery.form.js"></script>
	<script type="text/javascript">
        var ajaxFormOption = {
            type: "post",  //提交方式
//                dataType: "json", //数据类型
            data: {stationCode:${param.stationCode}},//自定义数据参数，视情况添加
            url: "${ctx}/data/control/cmd/param/save", //请求url
            success: function (data) { //提交成功的回调函数document.write("success");
                alert(data);
            }
        };
		$(document).ready(function() {
            $("input").change(function () {
                debugger;
                $.post("${ctx}/data/control/cmd/param/save/single",{
                    stationCode:${param.stationCode},
                    plcAddr:$(this).attr("name"),
                    paramValue:$(this).val()
                },function (data) {
                    alert(data);
                });
            });
            
		});
		function submitForm(formid) {
		    debugger;
            $("#"+formid).ajaxSubmit(ajaxFormOption);

        }
	</script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title"></h4></div>
                <div class="panel-body">
                    <form class="form-horizontal">

                        <div class="form-group">
                            <label class="col-sm-4 control-label">当前设定温度</label>
                            <div class="col-sm-8">
                                <input name="d222" type="number" class="form-control" value="${jobStationDataOrigin.d222}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">阀门最小开度</label>
                            <div class="col-sm-8">
                                <input name="d3502" type="number" class="form-control" value="${jobStationDataOrigin.d3502}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">阀门最大开度</label>
                            <div class="col-sm-8">
                                <input name="d3500" type="number" class="form-control" value="${jobStationDataOrigin.d3500}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">10℃设定温度</label>
                            <div class="col-sm-8">
                                <input name="d3200" type="number" class="form-control" value="${jobStationDataOrigin.d3200}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">分段控温</label>
                            <div class="col-sm-8">
                                <select name="m720" class="form-control">
                                    <c:choose>
                                        <c:when test="${jobStationDataOrigin.m720==1}">
                                            <option value="1" selected>定时开关机</option>
                                            <option value="0">分时控温</option>
                                        </c:when>
                                        <c:when test="${jobStationDataOrigin.m720==0}">
                                            <option value="1">定时开关机</option>
                                            <option value="0" selected>分时控温</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1">定时开关机</option>
                                            <option value="0">分时控温</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">定时分段数</label>
                            <div class="col-sm-8">
                                <input name="d2370" type="number" class="form-control" value="${jobStationDataOrigin.d2370}">
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title"></h4></div>
                <div class="panel-body">
                    <form class="form-horizontal">

                        <div class="form-group">
                            <label class="col-sm-4 control-label">供回水压力差设定</label>
                            <div class="col-sm-8">
                                <input name="d3100" type="number" class="form-control" value="${jobStationDataOrigin.d3100}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">补水压力设定</label>
                            <div class="col-sm-8">
                                <input name="d3102" type="number" class="form-control" value="${jobStationDataOrigin.d3102}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">室外温度补偿</label>
                            <div class="col-sm-8">
                                <input name="d3214" type="number" class="form-control" value="${jobStationDataOrigin.d3214}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">一次供水温度下限</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">二次供水最高温度</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">循环停机温度</label>
                            <div class="col-sm-8">
                                <input name="d3220" type="number" class="form-control" value="${jobStationDataOrigin.d3220}">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">时间段1：</h4></div>
                <div class="panel-body">
                    <form class="form-group">
                        <div class="form-inline">

                            <input type="number" class="form-control" name="d3000" value="${jobStationDataOrigin.d3000}">时
                            <input type="number" class="form-control" name="d3001" value="${jobStationDataOrigin.d3001}">分——
                            <input type="number" class="form-control" name="d3002" value="${jobStationDataOrigin.d3002}">时
                            <input type="number" class="form-control" name="d3003" value="${jobStationDataOrigin.d3003}">分
                        </div>
                        <p></p>
                        <div class="form-group">
                            温度设定：
                            <input type="number" class="form-control" name="d3202" value="${jobStationDataOrigin.d3202}">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">时间段2：</h4></div>
                <div class="panel-body">
                    <form class="form-group">
                        <div class="form-inline">
                            <input name="d3004" class="form-control" type="number" value="${jobStationDataOrigin.d3004}">时
                            <input name="d3005" class="form-control" type="number" value="${jobStationDataOrigin.d3005}">分——
                            <input type="number" class="form-control" name="d3006" value="${jobStationDataOrigin.d3006}">时
                            <input type="number" class="form-control" name="d3007" value="${jobStationDataOrigin.d3007}">分
                        </div>
                        <p></p>
                        <div class="form-group">
                            温度设定：<input type="number" class="form-control" name="d3204" value="${jobStationDataOrigin.d3204}">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">时间段3：</h4></div>
                <div class="panel-body">
                    <form class="form-group">
                        <div class="form-inline">
                            <input type="number" class="form-control" name="d3008" value="${jobStationDataOrigin.d3008}">时
                            <input type="number" class="form-control" name="d3009" value="${jobStationDataOrigin.d3009}">分——
                            <input type="number" class="form-control" name="d3010" value="${jobStationDataOrigin.d3010}">时
                            <input type="number" class="form-control" name="d3011" value="${jobStationDataOrigin.d3011}">分
                        </div>
                        <p></p>
                        <div class="form-group">
                            温度设定： <input type="number" class="form-control" name="d3206" value="${jobStationDataOrigin.d3206}">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">时间段4：</h4></div>
                <div class="panel-body">
                    <form class="form-group">
                        <div class="form-inline">
                            <input type="number" class="form-control" name="d3012" value="${jobStationDataOrigin.d3012}">时
                            <input type="number" class="form-control" name="d3013" value="${jobStationDataOrigin.d3013}">分——
                            <input type="number" class="form-control" name="d3014" value="${jobStationDataOrigin.d3014}">时
                            <input type="number" class="form-control" name="d3015" value="${jobStationDataOrigin.d3015}">分
                        </div>
                        <p></p>
                        <div class="form-group">
                            温度设定：<input type="number" class="form-control" name="d3208" value="${jobStationDataOrigin.d3208}">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">时间段5：</h4></div>
                <div class="panel-body">
                    <form class="form-group">
                        <div class="form-inline">
                            <input type="number" class="form-control" name="d3016" value="${jobStationDataOrigin.d3016}">时
                            <input type="number" class="form-control" name="d3017" value="${jobStationDataOrigin.d3017}">分——
                            <input type="number" class="form-control" name="d3018" value="${jobStationDataOrigin.d3018}">时
                            <input type="number" class="form-control" name="d3019" value="${jobStationDataOrigin.d3019}">分
                        </div>
                        <p></p>
                        <div class="form-group">
                            温度设定：<input type="number" class="form-control" name="d3210" value="${jobStationDataOrigin.d3210}">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">时间段6：</h4></div>
                <div class="panel-body">
                    <form class="form-group">
                        <div class="form-inline">
                            <input type="number" class="form-control" name="d3020" value="${jobStationDataOrigin.d3020}">时
                            <input type="number" class="form-control" name="d3021" value="${jobStationDataOrigin.d3021}">分——
                            <input type="number" class="form-control" name="d3022" value="${jobStationDataOrigin.d3022}">时
                            <input type="number" class="form-control" name="d3023" value="${jobStationDataOrigin.d3023}">分
                        </div>
                        <p></p>
                        <div class="form-group">
                            温度设定：<input type="number" class="form-control" name="d3212" value="${jobStationDataOrigin.d3212}">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>