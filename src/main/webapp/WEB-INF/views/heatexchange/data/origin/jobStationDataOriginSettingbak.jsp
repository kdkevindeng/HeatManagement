<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工艺流程</title>
	<meta name="decorator" content="default"/>
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
<form id="form-fskw" class="form-inline" action="${ctx}/data/control/cmd/param/save">
    <fieldset>

        <!-- Text input-->
        <label  >当前设定温度</label>
        <div class="col-sm-10">
            <input name="d222" type="number"  class="form-control" value="${jobStationDataOrigin.d222}" readonly>
            <p class="help-block"></p>
        </div>
        <label  >当前设定压差</label>
        <div class="col-sm-10">
            <input name="d3100" type="number"  class="form-control" value="${jobStationDataOrigin.d3100}">
            <p class="help-block"></p>
        </div>
        <label  >补水设定压力</label>
        <div class="col-sm-10">
            <input name="d3102" type="number"  class="form-control" value="${jobStationDataOrigin.d3102}">
            <p class="help-block"></p>
        </div>
        <!-- Text input-->
        <label  >电动阀最小开度设定</label>
        <div class="col-sm-10">
            <input name="d3502" type="number"  class="form-control" value="${jobStationDataOrigin.d3502}">
            <p class="help-block"></p>
        </div>
        <label  >电动阀最大开度设定</label>
        <div class="col-sm-10">
            <input name="d3500" type="number"  class="form-control" value="${jobStationDataOrigin.d3500}">
            <p class="help-block"></p>
        </div>
        <label  >循环停机温度</label>
        <div class="col-sm-10">
            <input name="d3220" type="number"  class="form-control" value="${jobStationDataOrigin.d3220}">
            <p class="help-block"></p>
        </div>
        <label>室外温度补偿</label>
        <div class="col-sm-10">
            <input name="d3214" type="number"  class="form-control" value="${jobStationDataOrigin.d3214}">
            <p class="help-block"></p>
        </div>
            <!-- Select Basic -->
            <label class="control-label"></label>
            <div class="controls">
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
                <span style="margin-left: 50px">10设定温度</span>
                <input name="d3200" type="number"  class="form-control" value="${jobStationDataOrigin.d3200}">

            </div>
            <!-- Text input-->
           <%-- <label class="control-label" for="input01">+10设定温度</label>
            <div class="controls">
                <input name="d3200" type="number"  class="form-control" value="${jobStationDataOrigin.d3200}">
                <p class="help-block"></p>
            </div>--%>
            <!-- Text input-->
            <label class="control-label" for="input01">控制时段设定</label>
            <div class="controls">
                <input name="d2370" type="number"  class="form-control" value="${jobStationDataOrigin.d2370}">
                <p class="help-block">请先设定控制的时段，否则机组不运行</p>
            </div>
            <!-- Text input-->
            <label class="control-label" for="input01">定时时段一：</label>
            <div class="controls">
                <span style="margin-left: 50px">开</span>
                <input type="number" style="width: 50px" name="d3000" value="${jobStationDataOrigin.d3000}">
                ：<input type="number" style="width: 50px" name="d3001" value="${jobStationDataOrigin.d3001}">

                <span style="margin-left: 50px">关 </span>
                <input type="number" style="width: 50px" name="d3002" value="${jobStationDataOrigin.d3002}">
                ：<input type="number" style="width: 50px" name="d3003" value="${jobStationDataOrigin.d3003}">
                <span style="margin-left: 50px">时段一温度</span>
                <input type="number" style="width: 50px" name="d3202" value="${jobStationDataOrigin.d3202}">
            </div>

            <%--<!-- Text input-->
            <label class="control-label" for="input01">时段一温度</label>
            <div class="controls">
                <input type="number" name="d3202" value="${jobStationDataOrigin.d3202}">
            </div>--%>
            <!-- Text input-->
            <label class="control-label" for="input01">定时时段二：</label>
            <div class="controls">
                <span style="margin-left: 50px">开</span>
                <input name="d3004" style="width: 50px" type="number" value="${jobStationDataOrigin.d3004}">
                ：<input name="d3005" style="width: 50px" type="number" value="${jobStationDataOrigin.d3005}">
                <span style="margin-left: 50px">关</span>
                <input type="number" style="width: 50px" name="d3006" value="${jobStationDataOrigin.d3006}">
                ：<input type="number" style="width: 50px" name="d3007" value="${jobStationDataOrigin.d3007}">
                <span style="margin-left: 50px">时段二温度</span>
                <input type="number" style="width: 50px" name="d3204" value="${jobStationDataOrigin.d3204}">
            </div>

            <!-- Text input-->
            <%--<label class="control-label" for="input01">时段二温度</label>
            <div class="controls">
                <input type="number" name="d3204" value="${jobStationDataOrigin.d3204}">
            </div>--%>
            <!-- Text input-->
            <label class="control-label" for="input01">定时时段三：</label>
            <div class="controls">
                <span style="margin-left: 50px">开</span>
                <input type="number" style="width: 50px" name="d3008" value="${jobStationDataOrigin.d3008}">
                ：<input type="number" style="width: 50px" name="d3009" value="${jobStationDataOrigin.d3009}">
                <span style="margin-left: 50px">关</span>
                <input type="number" style="width: 50px" name="d3010" value="${jobStationDataOrigin.d3010}">
                ：<input type="number" style="width: 50px" name="d3011" value="${jobStationDataOrigin.d3011}">
                <span style="margin-left: 50px">时段三温度</span>
                <input type="number" style="width: 50px" name="d3206" value="${jobStationDataOrigin.d3206}">
            </div>

            <!-- Text input-->
          <%--  <label class="control-label" for="input01">时段三温度</label>
            <div class="controls">
                <input type="number" name="d3206" value="${jobStationDataOrigin.d3206}">
            </div>--%>
            <!-- Text input-->
            <label class="control-label" for="input01">定时时段四：</label>
            <div class="controls">
                <span style="margin-left: 50px">开</span>
                <input type="number" style="width: 50px"  name="d3012" value="${jobStationDataOrigin.d3012}">
                ：<input type="number" style="width: 50px"  name="d3013" value="${jobStationDataOrigin.d3013}">
                <span style="margin-left: 50px">关</span>
                <input type="number" style="width: 50px"  name="d3014" value="${jobStationDataOrigin.d3014}">
                ：<input type="number" style="width: 50px"  name="d3015" value="${jobStationDataOrigin.d3015}">
                <span style="margin-left: 50px">时段四温度</span>
                <input type="number" style="width: 50px"  name="d3208" value="${jobStationDataOrigin.d3208}">
            </div>

            <!-- Text input-->
            <%--<label class="control-label" for="input01">时段四温度</label>
            <div class="controls">
                <input type="number" name="d3208" value="${jobStationDataOrigin.d3208}">
            </div>--%>
            <!-- Text input-->
            <label class="control-label" for="input01">定时时段五：</label>
            <div class="controls">
                <span style="margin-left: 50px">开</span>
                <input type="number" style="width: 50px"  name="d3016" value="${jobStationDataOrigin.d3016}">
                ：<input type="number" style="width: 50px"  name="d3017" value="${jobStationDataOrigin.d3017}">
                <span style="margin-left: 50px">关</span>
                <input type="number" style="width: 50px"  name="d3018" value="${jobStationDataOrigin.d3018}">
                ：<input type="number" style="width: 50px"  name="d3019" value="${jobStationDataOrigin.d3019}">
                <span style="margin-left: 50px">时段五温度</span>
                <input type="number" style="width: 50px"  name="d3210" value="${jobStationDataOrigin.d3210}">

            </div>

            <!-- Text input-->
           <%-- <label class="control-label" for="input01">时段五温度</label>
            <div class="controls">
                <input type="number" name="d3210" value="${jobStationDataOrigin.d3210}">
            </div>--%>
            <!-- Text input-->
            <label class="control-label" for="input01">定时时段六：</label>
            <div class="controls">
                <span style="margin-left: 50px">开</span>
                <input type="number" style="width: 50px"  name="d3020" value="${jobStationDataOrigin.d3020}">
                ：<input type="number" style="width: 50px" name="d3021" value="${jobStationDataOrigin.d3021}">
                <span style="margin-left: 50px">关</span>
                <input type="number" style="width: 50px"  name="d3022" value="${jobStationDataOrigin.d3022}">
                ：<input type="number" style="width: 50px"  name="d3023" value="${jobStationDataOrigin.d3023}">

                <span style="margin-left: 50px">时段六温度</span>
                <input type="number" style="width: 50px"  name="d3212" value="${jobStationDataOrigin.d3212}">
            </div>

        <%--<label class="control-label" for="input01">时段六温度</label>
        <div class="controls">
            <input type="number" name="d3212" value="${jobStationDataOrigin.d3212}">
        </div>--%>

    </fieldset>
    <%--<button type="submit" onclick="submitForm('form-fskw')" class="btn btn-primary" data-dismiss="modal">保存</button>--%>
</form>
</body>
</html>