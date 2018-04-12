<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>热网计量管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/data/origin/jobStationDataOrigin/">热网计量列表</a></li>
		<li class="active"><a href="${ctx}/data/origin/jobStationDataOrigin/form?id=${jobStationDataOrigin.id}">热网计量<shiro:hasPermission name="data:origin:jobStationDataOrigin:edit">${not empty jobStationDataOrigin.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="data:origin:jobStationDataOrigin:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="jobStationDataOrigin" action="${ctx}/data/origin/jobStationDataOrigin/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">站号：</label>
			<div class="controls">
				<form:select path="stationCode" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="time" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${jobStationDataOrigin.time}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">PLC通讯模式：</label>
			<div class="controls">
				<form:input path="d2008" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">PLC通讯地址：</label>
			<div class="controls">
				<form:input path="d2009" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环系统状态：</label>
			<div class="controls">
				<form:input path="d70" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水系统状态：</label>
			<div class="controls">
				<form:input path="d71" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水泵1状态：</label>
			<div class="controls">
				<form:input path="d72" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水泵2状态：</label>
			<div class="controls">
				<form:input path="d73" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环泵1状态：</label>
			<div class="controls">
				<form:input path="d74" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环泵2状态：</label>
			<div class="controls">
				<form:input path="d75" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环泵3状态：</label>
			<div class="controls">
				<form:input path="d76" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">当前设定温度：</label>
			<div class="controls">
				<form:input path="d222" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">二次出水温度：</label>
			<div class="controls">
				<form:input path="d252" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">二次回水温度：</label>
			<div class="controls">
				<form:input path="d254" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机房温度：</label>
			<div class="controls">
				<form:input path="d256" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">室外温度：</label>
			<div class="controls">
				<form:input path="d258" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">一次供水温度：</label>
			<div class="controls">
				<form:input path="d260" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">一次回水温度：</label>
			<div class="controls">
				<form:input path="d262" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环电流：</label>
			<div class="controls">
				<form:input path="d394" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环功率：</label>
			<div class="controls">
				<form:input path="d396" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环频率：</label>
			<div class="controls">
				<form:input path="d422" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环频率上限：</label>
			<div class="controls">
				<form:input path="d3402" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环频率下限：</label>
			<div class="controls">
				<form:input path="d3404" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环泵功率：</label>
			<div class="controls">
				<form:input path="d3252" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水电流：</label>
			<div class="controls">
				<form:input path="d404" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水功率：</label>
			<div class="controls">
				<form:input path="d406" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水频率：</label>
			<div class="controls">
				<form:input path="d522" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水频率上限：</label>
			<div class="controls">
				<form:input path="d3142" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水频率下限：</label>
			<div class="controls">
				<form:input path="d3140" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水泵功率：</label>
			<div class="controls">
				<form:input path="d3250" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">二次供水压力：</label>
			<div class="controls">
				<form:input path="d502" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">板换入口压力：</label>
			<div class="controls">
				<form:input path="d542" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">二次回水压力：</label>
			<div class="controls">
				<form:input path="d504" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">二次回水压力_滤前：</label>
			<div class="controls">
				<form:input path="d506" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">一次供水压力：</label>
			<div class="controls">
				<form:input path="d508" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">一次回水压力：</label>
			<div class="controls">
				<form:input path="d510" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">水箱水位当前值：</label>
			<div class="controls">
				<form:input path="d512" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">当前压差：</label>
			<div class="controls">
				<form:input path="d534" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电动阀开度：</label>
			<div class="controls">
				<form:input path="d746" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电动阀开度反馈：</label>
			<div class="controls">
				<form:input path="d4120" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电动阀最大开度设定：</label>
			<div class="controls">
				<form:input path="d3500" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电动阀最小开度设定：</label>
			<div class="controls">
				<form:input path="d3502" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">阀门手动设定开度：</label>
			<div class="controls">
				<form:input path="d3504" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水累计流量：</label>
			<div class="controls">
				<form:input path="d814" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水瞬时流量：</label>
			<div class="controls">
				<form:input path="d816" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">压差设定：</label>
			<div class="controls">
				<form:input path="d3100" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补水设定压力：</label>
			<div class="controls">
				<form:input path="d3102" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">休眠压力提升：</label>
			<div class="controls">
				<form:input path="d3115" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">泄压开启压力：</label>
			<div class="controls">
				<form:input path="d3104" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">泄压停止压力：</label>
			<div class="controls">
				<form:input path="d3106" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">系统最低保护压力：</label>
			<div class="controls">
				<form:input path="d3108" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">再次启动压力：</label>
			<div class="controls">
				<form:input path="d3070" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">十度设定温度：</label>
			<div class="controls">
				<form:input path="d3200" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时段1温度：</label>
			<div class="controls">
				<form:input path="d3202" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时段2温度：</label>
			<div class="controls">
				<form:input path="d3204" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时段3温度：</label>
			<div class="controls">
				<form:input path="d3206" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时段4温度：</label>
			<div class="controls">
				<form:input path="d3208" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时段5温度：</label>
			<div class="controls">
				<form:input path="d3210" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时段6温度：</label>
			<div class="controls">
				<form:input path="d3212" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">室外温度补偿：</label>
			<div class="controls">
				<form:input path="d3214" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">出水最高温度：</label>
			<div class="controls">
				<form:input path="d3216" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">循环停机温度：</label>
			<div class="controls">
				<form:input path="d3220" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时段数：</label>
			<div class="controls">
				<form:input path="d2370" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段1：时：</label>
			<div class="controls">
				<form:input path="d3000" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段1：分：</label>
			<div class="controls">
				<form:input path="d3001" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段1：时：</label>
			<div class="controls">
				<form:input path="d3002" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段1：分：</label>
			<div class="controls">
				<form:input path="d3003" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段2：时：</label>
			<div class="controls">
				<form:input path="d3004" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段2：分：</label>
			<div class="controls">
				<form:input path="d3005" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段2：时：</label>
			<div class="controls">
				<form:input path="d3006" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段2：分：</label>
			<div class="controls">
				<form:input path="d3007" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段3：时：</label>
			<div class="controls">
				<form:input path="d3008" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段3：分：</label>
			<div class="controls">
				<form:input path="d3009" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段3：时：</label>
			<div class="controls">
				<form:input path="d3010" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段3：分：</label>
			<div class="controls">
				<form:input path="d3011" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段4：时：</label>
			<div class="controls">
				<form:input path="d3012" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段4：分：</label>
			<div class="controls">
				<form:input path="d3013" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段4：时：</label>
			<div class="controls">
				<form:input path="d3014" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段4：分：</label>
			<div class="controls">
				<form:input path="d3015" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段5：时：</label>
			<div class="controls">
				<form:input path="d3016" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段5：分：</label>
			<div class="controls">
				<form:input path="d3017" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段5：时：</label>
			<div class="controls">
				<form:input path="d3018" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段5：分：</label>
			<div class="controls">
				<form:input path="d3019" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段6：时：</label>
			<div class="controls">
				<form:input path="d3020" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时开机时间段6：分：</label>
			<div class="controls">
				<form:input path="d3021" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段6：时：</label>
			<div class="controls">
				<form:input path="d3022" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时关机时间段6：分：</label>
			<div class="controls">
				<form:input path="d3023" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">热表瞬时流量：</label>
			<div class="controls">
				<form:input path="d5200" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">热表瞬时热量：</label>
			<div class="controls">
				<form:input path="d5202" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">热表累计流量：</label>
			<div class="controls">
				<form:input path="d5204" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">热表累计热量：</label>
			<div class="controls">
				<form:input path="d5206" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">热表供水温度：</label>
			<div class="controls">
				<form:input path="d5208" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">热表回水温度：</label>
			<div class="controls">
				<form:input path="d5210" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报警数据：D900：</label>
			<div class="controls">
				<form:input path="d900" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报警数据D901：</label>
			<div class="controls">
				<form:input path="d901" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报警数据D902：</label>
			<div class="controls">
				<form:input path="d902" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报警数据D903：</label>
			<div class="controls">
				<form:input path="d903" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定时/分时控温显示：</label>
			<div class="controls">
				<form:input path="d904" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">进水阀指示：</label>
			<div class="controls">
				<form:input path="m293" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">进水阀手动开：</label>
			<div class="controls">
				<form:input path="m290" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">进水阀手动关：</label>
			<div class="controls">
				<form:input path="m291" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">泄压阀指示：</label>
			<div class="controls">
				<form:input path="m297" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分时分温/定时开关机选择：</label>
			<div class="controls">
				<form:input path="m720" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">汽水/水水切换开关：</label>
			<div class="controls">
				<form:input path="m722" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电动阀手自动选择：</label>
			<div class="controls">
				<form:input path="m2050" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">进水阀手自动选择：</label>
			<div class="controls">
				<form:input path="m2051" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="data:origin:jobStationDataOrigin:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>