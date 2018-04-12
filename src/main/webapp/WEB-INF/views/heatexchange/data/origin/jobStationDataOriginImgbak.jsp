<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工艺流程</title>
	<meta name="decorator" content="default"/>
    <script src="${ctxStatic}/jquery-validation/1.11.1/lib/jquery.form.js"></script>
	<style>
		html,body,.imgcontainer{
			width: 100%;
			height: 100%;
		}
		.imgcontainer{
			/*background:url(${ctxStatic}/images/bg.png);
			filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
			-moz-background-size:100% 100%;
			background-size:100% 100%;
			background-attachment: fixed;*/
		}
        .param-container{
            display: none;
        }
        @media screen and (height: 768px){

            .elements{
                margin-top: 10%;
            }
        }
	</style>
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

			/*$("#wdycsd").click(function () {
//                $('#modal-wdycsd').modal();
                showMyModal("modal-wdycsd");
            });

			$("#area_d512").click(function () {
//                $('#modal-d512').modal();
                showMyModal("modal-d512");
            });
			$("#d512").click(function () {
//                $('#modal-d512').modal();
                showMyModal("modal-d512");
            });
			$("#area_d746").click(function () {
//                $('#modal-d746').modal();
                showMyModal("modal-d746");
            });
			$("#area_xhb1").click(function () {
//                $('#modal-xhb').modal();
                showMyModal("modal-xhb");
            });
			$("#area_xhb2").click(function () {
//                $('#modal-xhb').modal();
                showMyModal("modal-xhb");
            });
			$("#area_xhb3").click(function () {
//                $('#modal-xhb').modal();
                showMyModal("modal-xhb");
            });*/
            /*$('#modal-fskw').modal();*/

            /*$("form").each(function () {
                debugger;
                $("this").ajaxForm(ajaxFormOption);
            });*/
            initInput();
            window.onresize = function () {
                resetArea();
            }
            resetArea();

		});
		function initInput() {
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
            <%--$("select").change(function () {--%>
                <%--debugger;--%>
                <%--$.post("${ctx}/data/control/cmd/param/save/single",{--%>
                    <%--stationCode:${param.stationCode},--%>
                    <%--plcAddr:$(this).attr("name"),--%>
                    <%--paramValue:$(this).val()--%>
                <%--},function (data) {--%>
                    <%--alert(data);--%>
                <%--});--%>
            <%--});--%>
        }
		function showMyModal(id) {
		    debugger;
		    $(".modal-content").html($("#"+id).html());
            $('#modal').modal();
            initInput();
        }
		function submitForm(formid) {
		    debugger;
            $("#"+formid).ajaxSubmit(ajaxFormOption);

        }
        function resetArea() {

            $("area").each(function () {
                debugger;
                var oldXY=$(this).attr("coords").split(",");
                var imgWidth=$("#bgimg").width();
                var imgHeight=$("#bgimg").height();
                var x1=parseInt(imgWidth*(oldXY[0]/1366));
                var y1=parseInt(imgHeight*(oldXY[1]/768));
                var x2=parseInt(imgWidth*(oldXY[2]/1366));
                var y2=parseInt(imgHeight*(oldXY[3]/768));
               $(this).attr("coords",'"'+x1+','+y1+','+x2+','+y2+'"')
            });
        }
	</script>
</head>
<body>
	<div class="imgcontainer">
        <img id="bgimg" src="${ctxStatic}/images/bg.png" style="width: 1366px" usemap="imgmap" ismap="ismap"/>
        <map name="imgmap" id="imgmap">
            <area id="area_d746" shape="rect" coords="217,82,284,145" href="#电动阀" title="电动阀"/>
            <area id="area_d512" shape="rect" coords="231,520,424,733" href="#水箱" title="水箱"/>
            <area id="area_xhb1" shape="rect" coords="829,199,923,292" href="#循环泵" title="循环泵" />
            <area id="area_xhb2" shape="rect" coords="830,339,921,437" href="#循环泵" title="循环泵"/>
            <area id="area_xhb3" shape="rect" coords="829,456,921,542" href="#循环泵" title="循环泵"/>
        </map>
        <div class="elements">
            <div style="
    position: absolute;
    top: 50%;
    left: 20%;
">
                <div>	${jobStationDataOrigin.m293==1?"进水阀开":"进水阀关"}        </div>
                <div>	${jobStationDataOrigin.m2051==1?"进水阀手动":"进水阀自动"}        </div>
            </div>
            <div style="
    position: absolute;
    top: 79%;
    left: 40%;
" ><div>	${jobStationDataOrigin.m297==1?"泄压阀开启":"泄压阀开关闭"}        </div></div>

            <div style="
                position: absolute;
                top: 67%;
                left: 41%;
                ">
            <c:choose>
                <c:when test="${jobStationDataOrigin.d72==0}"><div>	泵停机</div></c:when>
                <c:when test="${jobStationDataOrigin.d72==1}"><div >	变频运行</div></c:when>
                <c:when test="${jobStationDataOrigin.d72==2}"><div >	工频</div></c:when>
                <c:when test="${jobStationDataOrigin.d72==3}"><div >	水泵故障</div></c:when>
                <c:when test="${jobStationDataOrigin.d72==4}"><div >	切除</div></c:when>

            </c:choose>

                        </div>
            <div style="
                position: absolute;
                top: 97%;
                left: 41%;
                ">
            <c:choose>

                <c:when test="${jobStationDataOrigin.d73==0}"><div >	泵停机</div></c:when>
                <c:when test="${jobStationDataOrigin.d73==1}"><div >	变频运行</div></c:when>
                <c:when test="${jobStationDataOrigin.d73==2}"><div >	工频</div></c:when>
                <c:when test="${jobStationDataOrigin.d73==3}"><div >	水泵故障</div></c:when>
                <c:when test="${jobStationDataOrigin.d73==4}"><div >	切除</div></c:when>

            </c:choose>
                            </div>
            <div style="
    position: absolute;
    left: 20%;
    top: 7%;
"><div>	${jobStationDataOrigin.m2050==1?"手动状态":"自动状态"}        </div></div>
            <div ><div>	</div></div>
                <div class="param-container"><div>	时间	                :	</div>	<div>	<fmt:formatDate value="${jobStationDataOrigin.time}" pattern="yyyy-MM-dd HH:mm:ss"/>	</div></div>
                <div class="param-container"><div>	PLC通讯模式	        :	</div>	<div>	${jobStationDataOrigin.d2008}       </div></div>
                <div class="param-container"><div>	PLC通讯地址	        :	</div>	<div>	${jobStationDataOrigin.d2009}       </div></div>
                <div class="param-container"><div>	循环系统状态	        :	</div>	<div>	${jobStationDataOrigin.d70}         </div></div>
                <div class="param-container"><div>	补水系统状态	        :	</div>	<div>	${jobStationDataOrigin.d71}         </div></div>
                <div class="param-container"><div>	补水泵1状态	        :	</div>	<div>	${jobStationDataOrigin.d72}         </div></div>
                <div class="param-container"><div>	补水泵2状态	        :	</div>	<div>	${jobStationDataOrigin.d73}         </div></div>
                <div id="xhb1" class="param-container1" style="
    position: absolute;
    left: 62%;
    top: 38%;
">

                    <%--<div>	循环泵1状态	        :	</div>	<div>	${jobStationDataOrigin.d74}         </div>--%>
                    <c:choose>

                        <c:when test="${jobStationDataOrigin.d74==0}"><div >	泵停机</div></c:when>
                        <c:when test="${jobStationDataOrigin.d74==1}"><div >	变频运行</div></c:when>
                        <c:when test="${jobStationDataOrigin.d74==2}"><div >	工频</div></c:when>
                        <c:when test="${jobStationDataOrigin.d74==3}"><div >	水泵故障</div></c:when>
                        <c:when test="${jobStationDataOrigin.d74==4}"><div >	切除</div></c:when>

                    </c:choose>
                </div>
                <div id="xhb2" class="param-container1" style="
    position: absolute;
    left: 62%;
    top: 57%;
">
                    <%--<div>	循环泵2状态	        :	</div>	<div>	${jobStationDataOrigin.d75}         </div>--%>
                    <c:choose>

                        <c:when test="${jobStationDataOrigin.d75==0}"><div >	泵停机</div></c:when>
                        <c:when test="${jobStationDataOrigin.d75==1}"><div >	变频运行</div></c:when>
                        <c:when test="${jobStationDataOrigin.d75==2}"><div >	工频</div></c:when>
                        <c:when test="${jobStationDataOrigin.d75==3}"><div >	水泵故障</div></c:when>
                        <c:when test="${jobStationDataOrigin.d75==4}"><div >	切除</div></c:when>

                    </c:choose>
                </div>
                <div id="xhb3" class="param-container1" style="
    position: absolute;
    left: 62%;
    top: 72%;
">
                    <%--<div>	循环泵3状态	        :	</div>	<div>	${jobStationDataOrigin.d76}         </div>--%>
                    <c:choose>

                        <c:when test="${jobStationDataOrigin.d76==0}"><div  >	泵停机</div></c:when>
                        <c:when test="${jobStationDataOrigin.d76==1}"><div >	变频运行</div></c:when>
                        <c:when test="${jobStationDataOrigin.d76==2}"><div >	工频</div></c:when>
                        <c:when test="${jobStationDataOrigin.d76==3}"><div >	水泵故障</div></c:when>
                        <c:when test="${jobStationDataOrigin.d76==4}"><div >	切除</div></c:when>

                    </c:choose>
                </div>
                <div class="param-container"><div>	当前设定温度	        :	</div>	<div>	${jobStationDataOrigin.d222}        </div></div>
                <div class="param-container1" style="
    position: absolute;
    left: 60%;
    top: 7%;
"><div>	二次供水温度	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d252}        </div></div>
                <div class="param-container1" style="
    position: absolute;
    left: 75%;
    top: 8%;
"><div>	二次供水压力	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d502}        </div></div>
            <div class="param-container1" style="
    position: absolute;
    left: 60%;
    top: 20%;
"><div>	二次回水温度	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d254}        </div></div>
                <div class="param-container"><div>	机房温度	        :	</div>	<div>	${jobStationDataOrigin.d256}        </div></div>
                <div class="param-container"><div>	室外温度	        :	</div>	<div>	${jobStationDataOrigin.d258}        </div></div>
                <div class="param-container1" style="
    position: absolute;
    left: 36%;
    top: 7%;
">
                    <div>	<%--一次--%>供水温度	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d260}        </div>
                    <div>	<%--一次--%>回水温度	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d262}        </div>
                </div>
                <div class="param-container1" style="
    position: absolute;
    left: 75%;
    top: 20%;
"><div>	供回水压差	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d502-jobStationDataOrigin.d504}        </div></div>
                <div class="param-container"><div>	循环电流	        :	</div>	<div>	${jobStationDataOrigin.d394}        </div></div>
                <div class="param-container"><div>	循环功率	        :	</div>	<div>	${jobStationDataOrigin.d396}        </div></div>
                <div class="param-container"><div>	循环频率	        :	</div>	<div>	${jobStationDataOrigin.d422}        </div></div>
                <div class="param-container"><div>	循环频率上限	        :	</div>	<div>	${jobStationDataOrigin.d3402}       </div></div>
                <div class="param-container"><div>	循环频率下限	        :	</div>	<div>	${jobStationDataOrigin.d3404}       </div></div>
                <div class="param-container"><div>	循环泵功率	        :	</div>	<div>	${jobStationDataOrigin.d3252}       </div></div>
                <div class="param-container"><div>	补水电流	        :	</div>	<div>	${jobStationDataOrigin.d404}        </div></div>
                <div class="param-container"><div>	补水功率	        :	</div>	<div>	${jobStationDataOrigin.d406}        </div></div>
                <div class="param-container"><div>	补水频率	        :	</div>	<div>	${jobStationDataOrigin.d522}        </div></div>
                <div class="param-container"><div>	补水频率上限	        :	</div>	<div>	${jobStationDataOrigin.d3142}       </div></div>
                <div class="param-container"><div>	补水频率下限	        :	</div>	<div>	${jobStationDataOrigin.d3140}       </div></div>
                <div class="param-container"><div>	补水泵功率	        :	</div>	<div>	${jobStationDataOrigin.d3250}       </div></div>
                <div class="param-container"><div>	板换入口压力	        :	</div>	<div>	${jobStationDataOrigin.d542}        </div></div>
                <div class="param-container"><div>	二次回水压力	        :	</div>	<div>	${jobStationDataOrigin.d504}        </div></div>
                <div class="param-container"><div>	二次回水压力_滤前	:	</div>	<div>	${jobStationDataOrigin.d506}        </div></div>
                <div class="param-container"><div>	一次供水压力	        :	</div>	<div>	${jobStationDataOrigin.d508}        </div></div>
                <div class="param-container"><div>	一次回水压力	        :	</div>	<div>	${jobStationDataOrigin.d510}        </div></div>
                <div id="d512" class="param-container1" style="
    position: absolute;
    top: 75%;
    left: 14%;
    text-align: center;
    width: 200px;
    height: 200px;
"><div>	水箱水位当前值	        :	</div>	<div>	${jobStationDataOrigin.d512}       M </div></div>
                <div class="param-container"><div>	当前压差	        :	</div>	<div>	${jobStationDataOrigin.d534}        </div></div>
                <div id="d746" class="param-container1" style="
    position: absolute;
    top: 19%;
    left: 20%;
">
                    <div>	电动阀开度	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d746}        </div>
                    <div>	电动阀开度反馈	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d4120}       </div>
                </div>
                <div class="param-container"><div>	电动阀最大开度设定	:	</div>	<div>	${jobStationDataOrigin.d3500}	    </div></div>
                <div class="param-container"><div>	电动阀最小开度设定	:	</div>	<div>	${jobStationDataOrigin.d3502}	    </div></div>
                <div class="param-container"><div>	阀门手动设定开度	:	</div>	<div>	${jobStationDataOrigin.d3504}       </div></div>
                <div class="param-container1" style="
    position: absolute;
    left: 55%;
    top: 85%;
">
                    <div>	补水累计流量	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d814}     M   </div>
                    <div>	补水瞬时流量	        :	<%--</div>	<div>--%>	${jobStationDataOrigin.d816}    L/S    </div>
                </div>
                <div class="param-container"><div>	压差设定	        :	</div>	<div>	${jobStationDataOrigin.d3100}       </div></div>
                <div class="param-container"><div>	补水设定压力	        :	</div>	<div>	${jobStationDataOrigin.d3102}       </div></div>
                <div class="param-container"><div>	休眠压力提升	        :	</div>	<div>	${jobStationDataOrigin.d3115}       </div></div>
                <div class="param-container"><div>	泄压开启压力	        :	</div>	<div>	${jobStationDataOrigin.d3104}       </div></div>
                <div class="param-container"><div>	泄压停止压力	        :	</div>	<div>	${jobStationDataOrigin.d3106}       </div></div>
                <div class="param-container"><div>	系统最低保护压力	:	</div>	<div>	${jobStationDataOrigin.d3108}       </div></div>
                <div class="param-container"><div>	再次启动压力	        :	</div>	<div>	${jobStationDataOrigin.d3070}       </div></div>
                <div class="param-container"><div>	十度设定温度	        :	</div>	<div>	${jobStationDataOrigin.d3200}       </div></div>
                <div class="param-container"><div>	时段1温度	        :	</div>	<div>	${jobStationDataOrigin.d3202}       </div></div>
                <div class="param-container"><div>	时段2温度	        :	</div>	<div>	${jobStationDataOrigin.d3204}       </div></div>
                <div class="param-container"><div>	时段3温度	        :	</div>	<div>	${jobStationDataOrigin.d3206}       </div></div>
                <div class="param-container"><div>	时段4温度	        :	</div>	<div>	${jobStationDataOrigin.d3208}       </div></div>
                <div class="param-container"><div>	时段5温度	        :	</div>	<div>	${jobStationDataOrigin.d3210}       </div></div>
                <div class="param-container"><div>	时段6温度	        :	</div>	<div>	${jobStationDataOrigin.d3212}       </div></div>
                <div class="param-container"><div>	室外温度补偿	        :	</div>	<div>	${jobStationDataOrigin.d3214}       </div></div>
                <div class="param-container"><div>	出水最高温度	        :	</div>	<div>	${jobStationDataOrigin.d3216}       </div></div>
                <div class="param-container"><div>	循环停机温度	        :	</div>	<div>	${jobStationDataOrigin.d3220}       </div></div>
                <div class="param-container"><div>	定时段数	        :	</div>	<div>	${jobStationDataOrigin.d2370}       </div></div>
                <div class="param-container"><div>	定时开机时间段1：时	:	</div>	<div>	${jobStationDataOrigin.d3000}	    </div></div>
                <div class="param-container"><div>	定时开机时间段1：分	:	</div>	<div>	${jobStationDataOrigin.d3001}	    </div></div>
                <div class="param-container"><div>	定时关机时间段1：时	:	</div>	<div>	${jobStationDataOrigin.d3002}	    </div></div>
                <div class="param-container"><div>	定时关机时间段1：分	:	</div>	<div>	${jobStationDataOrigin.d3003}	    </div></div>
                <div class="param-container"><div>	定时开机时间段2：时	:	</div>	<div>	${jobStationDataOrigin.d3004}	    </div></div>
                <div class="param-container"><div>	定时开机时间段2：分	:	</div>	<div>	${jobStationDataOrigin.d3005}	    </div></div>
                <div class="param-container"><div>	定时关机时间段2：时	:	</div>	<div>	${jobStationDataOrigin.d3006}	    </div></div>
                <div class="param-container"><div>	定时关机时间段2：分	:	</div>	<div>	${jobStationDataOrigin.d3007}	    </div></div>
                <div class="param-container"><div>	定时开机时间段3：时	:	</div>	<div>	${jobStationDataOrigin.d3008}	    </div></div>
                <div class="param-container"><div>	定时开机时间段3：分	:	</div>	<div>	${jobStationDataOrigin.d3009}	    </div></div>
                <div class="param-container"><div>	定时关机时间段3：时	:	</div>	<div>	${jobStationDataOrigin.d3010}	    </div></div>
                <div class="param-container"><div>	定时关机时间段3：分	:	</div>	<div>	${jobStationDataOrigin.d3011}	    </div></div>
                <div class="param-container"><div>	定时开机时间段4：时	:	</div>	<div>	${jobStationDataOrigin.d3012}	    </div></div>
                <div class="param-container"><div>	定时开机时间段4：分	:	</div>	<div>	${jobStationDataOrigin.d3013}	    </div></div>
                <div class="param-container"><div>	定时关机时间段4：时	:	</div>	<div>	${jobStationDataOrigin.d3014}	    </div></div>
                <div class="param-container"><div>	定时关机时间段4：分	:	</div>	<div>	${jobStationDataOrigin.d3015}	    </div></div>
                <div class="param-container"><div>	定时开机时间段5：时	:	</div>	<div>	${jobStationDataOrigin.d3016}	    </div></div>
                <div class="param-container"><div>	定时开机时间段5：分	:	</div>	<div>	${jobStationDataOrigin.d3017}	    </div></div>
                <div class="param-container"><div>	定时关机时间段5：时	:	</div>	<div>	${jobStationDataOrigin.d3018}	    </div></div>
                <div class="param-container"><div>	定时关机时间段5：分	:	</div>	<div>	${jobStationDataOrigin.d3019}	    </div></div>
                <div class="param-container"><div>	定时开机时间段6：时	:	</div>	<div>	${jobStationDataOrigin.d3020}	    </div></div>
                <div class="param-container"><div>	定时开机时间段6：分	:	</div>	<div>	${jobStationDataOrigin.d3021}	    </div></div>
                <div class="param-container"><div>	定时关机时间段6：时	:	</div>	<div>	${jobStationDataOrigin.d3022}	    </div></div>
                <div class="param-container"><div>	定时关机时间段6：分	:	</div>	<div>	${jobStationDataOrigin.d3023}	    </div></div>
                <div class="param-container"><div>	热表瞬时流量	        :	</div>	<div>	${jobStationDataOrigin.d5200}       </div></div>
                <div class="param-container"><div>	热表瞬时热量	        :	</div>	<div>	${jobStationDataOrigin.d5202}       </div></div>
                <div class="param-container"><div>	热表累计流量	        :	</div>	<div>	${jobStationDataOrigin.d5204}       </div></div>
                <div class="param-container"><div>	热表累计热量	        :	</div>	<div>	${jobStationDataOrigin.d5206}       </div></div>
                <div class="param-container"><div>	热表供水温度	        :	</div>	<div>	${jobStationDataOrigin.d5208}       </div></div>
                <div class="param-container"><div>	热表回水温度	        :	</div>	<div>	${jobStationDataOrigin.d5210}       </div></div>
                <div class="param-container"><div>	报警数据：D900	        :	</div>	<div>	${jobStationDataOrigin.d900}        </div></div>
                <div class="param-container"><div>	报警数据D901	        :	</div>	<div>	${jobStationDataOrigin.d901}        </div></div>
                <div class="param-container"><div>	报警数据D902	        :	</div>	<div>	${jobStationDataOrigin.d902}        </div></div>
                <div class="param-container"><div>	报警数据D903	        :	</div>	<div>	${jobStationDataOrigin.d903}        </div></div>
                <div class="param-container"><div>	定时/分时控温显示	:	</div>	<div>	${jobStationDataOrigin.d904}        </div></div>
                <table class="right-buttom-table" style="
    position: absolute;
    left: 75%;
    top: 45%;
">
                    <%--<tr><td class="lable">虑前</td><td>${jobStationDataOrigin.d506}bar</td></tr>
                    <tr><td class="lable">虑后</td><td>${jobStationDataOrigin.d504}bar</td></tr>
                    <tr><td class="lable">压降</td><td>${jobStationDataOrigin.d506-jobStationDataOrigin.d504}bar</td></tr>
                    <tr><td class="lable">循环频率</td><td>${jobStationDataOrigin.d422}Hz</td></tr>--%>
                    <tr><td class="lable">输出电流</td><td>${jobStationDataOrigin.d394}A</td></tr>
                    <%--<tr><td class="lable">输出电压</td><td>V</td></tr>--%>
                    <tr><td class="lable">输出功率</td><td>${jobStationDataOrigin.d396}KW</td></tr>
                    <tr><td class="lable">补水频率</td><td>${jobStationDataOrigin.d522}Hz</td></tr>
                    <tr><td class="lable">输出电流</td><td>A</td></tr>
                    <%--<tr><td class="lable">输出电压</td><td>V</td></tr>--%>
                    <tr><td class="lable">输出功率</td><td>${jobStationDataOrigin.d3250}KW</td></tr>
                    <tr><td class="lable">当前设定温度</td><td>${jobStationDataOrigin.d222}℃</td></tr>
                    <tr><td class="lable">当前压差</td><td>${jobStationDataOrigin.d534}bar</td></tr>
                    <tr><td class="lable">循环系统状态</td><td>
                        <c:choose>
                            <c:when test="${jobStationDataOrigin.d70==0}">停机</c:when>
                            <c:when test="${jobStationDataOrigin.d70==1}">自动</c:when>
                            <c:when test="${jobStationDataOrigin.d70==2}">手动</c:when>
                        </c:choose>
                        </td></tr>
                    <tr><td class="lable">补水系统状态</td><td>
                        <c:choose>
                            <c:when test="${jobStationDataOrigin.d71==0}">停机</c:when>
                            <c:when test="${jobStationDataOrigin.d71==1}">自动</c:when>
                            <c:when test="${jobStationDataOrigin.d71==2}">手动</c:when>
                        </c:choose>
                    </td></tr>
                    <tr><td class="lable"><%--</td><td>--%>
                        <%--<button id="wdycsd" type="button" class="btn btn-primary" data-dismiss="modal">温度压差设定</button></td></tr>--%>
                </table>

            </div>

	</div>

    <div  id="modal" class="modal fade" tabindex="-2" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div  id="modal-wdycsd"  style="display: none" >
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-number="true">&times;</span></button>
            <h4 class="modal-title">温度压差设定</h4>
        </div>
        <div class="modal-body">

            <form id="form-wdycsd" class="form-horizontal" >
                <fieldset>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >当前设定温度</label>
                        <div class="col-sm-10">
                            <input name="d222" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d222}" readonly>
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >当前设定压差</label>
                        <div class="col-sm-10">
                            <input name="d3100" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d3100}">
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >补水设定压力</label>
                        <div class="col-sm-10">
                            <input name="d3102" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d3102}">
                            <p class="help-block"></p>
                        </div>
                    </div>

                </fieldset>

                <%--<button type="submit" onclick="submitForm('form-wdycsd')" class="btn btn-primary" data-dismiss="modal">保存</button>--%>
            </form>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div><!-- /.modal -->
    <div  id="modal-xhb"  style="display: none" >
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-number="true">&times;</span></button>
            <h4 class="modal-title">循环泵频率设定</h4>
        </div>
        <div class="modal-body">

            <form id="form-xhb" class="form-horizontal" >
                <fieldset>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >循环泵频率上限</label>
                        <div class="col-sm-10">
                            <input name="d3402" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d3402}">
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >循环泵频率下限</label>
                        <div class="col-sm-10">
                            <input name="d3404" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d3404}">
                            <p class="help-block"></p>
                        </div>
                    </div>

                </fieldset>
                <%--<button type="submit" onclick="submitForm('form-xhb')" class="btn btn-primary" data-dismiss="modal">保存</button>--%>
            </form>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div><!-- /.modal -->
    <div  id="modal-fskw"  style="display: none">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-number="true">&times;</span></button>
            <h4 class="modal-title">分时控温</h4>
        </div>
        <div class="modal-body">

            <form id="form-fskw" class="form-inline" >
                <fieldset>
                    <div class="form-group">

                        <!-- Select Basic -->
                        <label >选择</label>
                        <div class="col-sm-10">
                            <c:choose>
                                <c:when test="${jobStationDataOrigin.m720==1}">
                                    <label class="radio-inline"><input type="radio" name="m720" value="1" checked/>定时开关机</label>
                                    <label class="radio-inline"><input type="radio" name="m720" value="0"/>分时控温</label>
                                </c:when>
                                <c:when test="${jobStationDataOrigin.m720==0}">
                                    <label class="radio-inline"><input type="radio" name="m720" value="1"/>定时开关机</label>
                                    <label class="radio-inline"><input type="radio" name="m720" value="0" checked/>分时控温</label>
                                </c:when>
                                <c:otherwise>
                                    <label class="radio-inline"><input type="radio" name="m720" value="1"/>定时开关机</label>
                                    <label class="radio-inline"><input type="radio" name="m720" value="0"/>分时控温</label>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >+10设定温度</label>
                        <div class="col-sm-10">
                            <input name="d3200" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d3200}">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >控制时段设定</label>
                        <div class="col-sm-10">
                            <input name="d2370" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d2370}">
                            <p class="help-block">请先设定控制的时段，否则机组不运行</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段一：开</label>
                        <div class="col-sm-10">
                            <input type="number" name="d3000" value="${jobStationDataOrigin.d3000}">
                            ：<input type="number" name="d3001" value="${jobStationDataOrigin.d3001}">

                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段一：关</label>
                        <div class="col-sm-10">
                            <input type="number" name="d3002" value="${jobStationDataOrigin.d3002}">
                            ：<input type="number" name="d3003" value="${jobStationDataOrigin.d3003}">

                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >时段一温度</label>
                        <div class="col-sm-10">
                            <input type="number" name="d3202" value="${jobStationDataOrigin.d3202}">
                        </div>


                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段二：开</label>
                        <div class="col-sm-10">

                            <input name="d3004" type="number" value="${jobStationDataOrigin.d3004}">
                            ：<input name="d3005"type="number" value="${jobStationDataOrigin.d3005}">

                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段二：关</label>

                        <div class="col-sm-10">

                            <input type="number" name="d3006" value="${jobStationDataOrigin.d3006}">
                            ：<input type="number" name="d3007" value="${jobStationDataOrigin.d3007}">

                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >时段二温度</label>
                        <div class="col-sm-10">
                            <input type="number" name="d3204" value="${jobStationDataOrigin.d3204}">
                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段三：开</label>
                        <div class="col-sm-10">

                            <input type="number" name="d3008" value="${jobStationDataOrigin.d3008}">
                            ：<input type="number" name="d3009" value="${jobStationDataOrigin.d3009}">

                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段三：关</label>
                        <div class="col-sm-10">

                            <input type="number" name="d3010" value="${jobStationDataOrigin.d3010}">
                            ：<input type="number" name="d3011" value="${jobStationDataOrigin.d3011}">

                        </div>
                    </div>
                    <div class="form-group">

                        <!-- Text input-->
                        <label  >时段三温度</label>
                        <div class="col-sm-10">
                            <input type="number" name="d3206" value="${jobStationDataOrigin.d3206}">
                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段四：开</label>
                        <div class="col-sm-10">

                            <input type="number" name="d3012" value="${jobStationDataOrigin.d3012}">
                            ：<input type="number" name="d3013" value="${jobStationDataOrigin.d3013}">

                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段四：关</label>
                        <div class="col-sm-10">

                            <input type="number" name="d3014" value="${jobStationDataOrigin.d3014}">
                            ：<input type="number" name="d3015" value="${jobStationDataOrigin.d3015}">

                        </div>

                    </div>
                    <div class="form-group">

                        <!-- Text input-->
                        <label  >时段四温度</label>
                        <div class="col-sm-10">
                            <input type="number" name="d3208" value="${jobStationDataOrigin.d3208}">
                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段五：开</label>
                        <div class="col-sm-10">

                            <input type="number" name="d3016" value="${jobStationDataOrigin.d3016}">
                            ：<input type="number" name="d3017" value="${jobStationDataOrigin.d3017}">

                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段五：关</label>
                        <div class="col-sm-10">

                            <input type="number" name="d3018" value="${jobStationDataOrigin.d3018}">
                            ：<input type="number" name="d3019" value="${jobStationDataOrigin.d3019}">

                        </div>

                    </div>
                    <div class="form-group">

                        <!-- Text input-->
                        <label  >时段五温度</label>
                        <div class="col-sm-10">
                            <input type="number" name="d3210" value="${jobStationDataOrigin.d3210}">
                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段六：开</label>
                        <div class="col-sm-10">

                            <input type="number" name="d3020" value="${jobStationDataOrigin.d3020}">
                            ：<input type="number" name="d3021" value="${jobStationDataOrigin.d3021}">

                        </div>

                    </div>
                    <div class="form-group">
                        <!-- Text input-->
                        <label  >定时时段六：关</label>
                        <div class="col-sm-10">

                            <input type="number" name="d3022" value="${jobStationDataOrigin.d3022}">
                            ：<input type="number" name="d3023" value="${jobStationDataOrigin.d3023}">

                        </div>
                    </div>
                    <div class="form-group">
                        <label  >时段六温度</label>
                        <div class="col-sm-10">
                            <input type="number" name="d3212" value="${jobStationDataOrigin.d3212}">
                        </div>
                    </div>
                </fieldset>
                <%--<button type="submit" onclick="submitForm('form-fskw')" class="btn btn-primary" data-dismiss="modal">保存</button>--%>
            </form>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div><!-- /.modal -->
    <div id="modal-d512" style="display: none">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-number="true">&times;</span></button>
            <h4 class="modal-title">水箱水位设定</h4>
        </div>
        <div class="modal-body">

            <form id="form-d512" class="form-horizontal" >
                <fieldset>

                    <div class="form-group">

                        <!-- Select Basic -->
                        <label >进水阀手动</label>
                        <div class="col-sm-10">
                            <c:choose>
                                <c:when test="${jobStationDataOrigin.m293==1}">
                                    <label class="radio-inline"><input type="radio" name="m293" value="1" checked/>开</label>
                                    <label class="radio-inline"><input type="radio" name="m293" value="0"/>关</label>
                                </c:when>
                                <c:when test="${jobStationDataOrigin.m293==0}">
                                    <label class="radio-inline"><input type="radio" name="m293" value="1"/>开</label>
                                    <label class="radio-inline"><input type="radio" name="m293" value="0" checked/>关</label>
                                </c:when>
                            </c:choose>
                        </div>

                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >补水频率上限</label>
                        <div class="col-sm-10">
                            <input name="d3142" type="number" placeholder="毫米" class="input-xlarge" value="${jobStationDataOrigin.d3142}">
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >补水频率下限（毫米）</label>
                        <div class="col-sm-10">
                            <input name="d3140" type="number" placeholder="毫米" class="input-xlarge" value="${jobStationDataOrigin.d3140}">
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >水箱水满水位（毫米）</label>
                        <div class="col-sm-10">
                            <input name="" type="number" placeholder="毫米" class="input-xlarge" value="">
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >水箱进水水位（毫米）</label>
                        <div class="col-sm-10">
                            <input type="number" placeholder="毫米" class="input-xlarge" value="">
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >停机保护水位（毫米）</label>
                        <div class="col-sm-10">
                            <input type="number" placeholder="毫米" class="input-xlarge" value="">
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >低水位延时（秒）</label>
                        <div class="col-sm-10">
                            <input type="number" placeholder="秒" class="input-xlarge">
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">

                        <!-- Text input-->
                        <label  >水箱水位当前值（米）</label>
                        <div class="col-sm-10">
                            <input name="d512" type="number"  value="${jobStationDataOrigin.d512}" class="input-xlarge" readonly>
                            <p class="help-block"></p>
                        </div>
                    </div>

                </fieldset>
                <%--<button type="submit" onclick="submitForm('form-d512')" class="btn btn-primary" data-dismiss="modal">保存</button>--%>
            </form>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div><!-- /.modal-content -->
    <div id="modal-d746" style="display: none">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-number="true">&times;</span></button>
            <h4 class="modal-title">电动阀设定</h4>
        </div>
        <div class="modal-body">

            <form id="form-d746" class="form-horizontal" >
                <fieldset>
                    <div class="form-group">
                        <label >电动阀手动</label>
                        <div class="col-sm-10">
                            <c:choose>
                                <c:when test="${jobStationDataOrigin.m2050==1}">
                                    <label class="radio-inline"><input type="radio" name="m2050" value="1" checked/>开</label>
                                    <label class="radio-inline"><input type="radio" name="m2050" value="0"/>关</label>
                                </c:when>
                                <c:when test="${jobStationDataOrigin.m2050==0}">
                                    <label class="radio-inline"><input type="radio" name="m2050" value="1"/>开</label>
                                    <label class="radio-inline"><input type="radio" name="m2050" value="0" checked/>关</label>
                                </c:when>
                                <c:otherwise>
                                    <label class="radio-inline"><input type="radio" name="m2050" value="1"/>开</label>
                                    <label class="radio-inline"><input type="radio" name="m2050" value="0"/>关</label>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="form-group">

                        <!-- Text input-->
                        <label  >电动阀最大开度设定</label>
                        <div class="col-sm-10">
                            <input name="d3500" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d3500}">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="form-group">

                        <!-- Text input-->
                        <label  >电动阀最小开度设定</label>
                        <div class="col-sm-10">
                            <input name="d3502" type="number" placeholder="" class="input-xlarge" value="${jobStationDataOrigin.d3502}">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="form-group">

                        <!-- Text input-->
                        <label  >阀门手动设定开度</label>
                        <div class="col-sm-10">
                            <input name="d3504" type="number" placeholder="毫米" class="input-xlarge" value="${jobStationDataOrigin.d3504}">
                            <p class="help-block"></p>
                        </div>
                    </div>
                </fieldset>

                <%--<button type="submit" onclick="submitForm('form-d746')" class="btn btn-primary" data-dismiss="modal">保存</button>--%>
            </form>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div><!-- /.modal-content -->
</body>
</html>