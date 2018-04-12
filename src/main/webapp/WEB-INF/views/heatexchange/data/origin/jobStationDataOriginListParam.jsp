<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>热网计量管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/data/origin/jobStationDataOrigin/">热网计量列表</a></li>
		<shiro:hasPermission name="data:origin:jobStationDataOrigin:edit"><li><a href="${ctx}/data/origin/jobStationDataOrigin/form">热网计量添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="jobStationDataOrigin" action="${ctx}/data/origin/jobStationDataOrigin/param/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>站点：</label>
				<form:select id="stationCode" path="stationCode" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${stationList}" itemValue="code" itemLabel="name" htmlEscape="false"/>
				</form:select>
				<label>日期范围：&nbsp;</label>
				<input id="queryBegintime" name="queryBegintime" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
					   value="<fmt:formatDate value="${reqParam.queryBegintime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					<%--<label></label>--%>--
				<input id="queryEndtime" name="queryEndtime" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
					   value="<fmt:formatDate value="${reqParam.queryEndtime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>

			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="min-width: 150px">站号</th>
				<th style="min-width: 150px">时间</th>
				<%--<th>PLC通讯模式</th>
				<th>PLC通讯地址</th>--%>
				<th>循环系统状态</th>
				<th>补水系统状态</th>
				<th>补水泵1状态</th>
				<th>补水泵2状态</th>
				<th>循环泵1状态</th>
				<th>循环泵2状态</th>
				<th>循环泵3状态</th>
				<th>当前设定温度</th>
				<%--<th>二次出水温度</th>
				<th>二次回水温度</th>--%>
				<th>机房温度</th>
				<th>室外温度</th>
				<<%--th>一次供水温度</th>
				<th>一次回水温度</th>--%>
				<th>循环电流</th>
				<th>循环功率</th>
				<th>循环频率</th>
				<th>循环频率上限</th>
				<th>循环频率下限</th>
				<th>循环泵功率</th>
				<th>补水电流</th>
				<th>补水功率</th>
				<th>补水频率</th>
				<th>补水频率上限</th>
				<th>补水频率下限</th>
				<th>补水泵功率</th>
				<%--<th>二次供水压力</th>
				<th>板换入口压力</th>--%>
				<%--<th>二次回水压力</th>
				<th>二次回水压力_滤前</th>--%>
				<%--<th>一次供水压力</th>
				<th>一次回水压力</th>--%>
				<th>水箱水位当前值</th>
				<th>当前压差</th>
				<th>电动阀开度</th>
				<th>电动阀开度反馈</th>
				<th>电动阀最大开度设定</th>
				<th>电动阀最小开度设定</th>
				<th>阀门手动设定开度</th>
				<th>补水累计流量</th>
				<th>补水瞬时流量</th>
				<th>压差设定</th>
				<th>补水设定压力</th>
				<th>休眠压力提升</th>
				<th>泄压开启压力</th>
				<th>泄压停止压力</th>
				<th>系统最低保护压力</th>
				<th>再次启动压力</th><%--
				<th>十度设定温度</th>
				<th>时段1温度</th>
				<th>时段2温度</th>
				<th>时段3温度</th>
				<th>时段4温度</th>
				<th>时段5温度</th>
				<th>时段6温度</th>
				<th>室外温度补偿</th>
				<th>出水最高温度</th>
				<th>循环停机温度</th>
				<th>定时段数</th>--%><%--
				<th>定时开机时间段1：时</th>
				<th>定时开机时间段1：分</th>
				<th>定时关机时间段1：时</th>
				<th>定时关机时间段1：分</th>
				<th>定时开机时间段2：时</th>
				<th>定时开机时间段2：分</th>
				<th>定时关机时间段2：时</th>
				<th>定时关机时间段2：分</th>
				<th>定时开机时间段3：时</th>
				<th>定时开机时间段3：分</th>
				<th>定时关机时间段3：时</th>
				<th>定时关机时间段3：分</th>
				<th>定时开机时间段4：时</th>
				<th>定时开机时间段4：分</th>
				<th>定时关机时间段4：时</th>
				<th>定时关机时间段4：分</th>
				<th>定时开机时间段5：时</th>
				<th>定时开机时间段5：分</th>
				<th>定时关机时间段5：时</th>
				<th>定时关机时间段5：分</th>
				<th>定时开机时间段6：时</th>
				<th>定时开机时间段6：分</th>
				<th>定时关机时间段6：时</th>
				<th>定时关机时间段6：分</th>--%>
				<%--<th>热表瞬时流量</th>--%>
				<%--<th>热表瞬时热量</th>
				<th>热表累计流量</th>
				<th>热表累计热量</th>
				<th>热表供水温度</th>
				<th>热表回水温度</th>--%>
				<%--<th>报警数据：D900</th>
				<th>报警数据D901</th>
				<th>报警数据D902</th>
				<th>报警数据D903</th>
				<th>定时/分时控温显示</th>--%>
				<th>进水阀指示</th>
				<th>进水阀手动开</th>
				<th>进水阀手动关</th>
				<th>泄压阀指示</th>
				<th>分时分温/定时开关机选择</th>
				<th>汽水/水水切换开关</th>
				<th>电动阀手自动选择</th>
				<th>进水阀手自动选择</th>
				<%--<shiro:hasPermission name="data:origin:jobStationDataOrigin:edit"><th>操作</th></shiro:hasPermission>--%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jobStationDataOrigin">
			<tr>
				<td>
                        ${jobStationDataOrigin.stationName}
                </td>
				<td>
					<fmt:formatDate value="${jobStationDataOrigin.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<%--<td>
					${jobStationDataOrigin.d2008}
				</td>
				<td>
					${jobStationDataOrigin.d2009}
				</td>--%>
				<td>
						<c:choose>
							<c:when test="${jobStationDataOrigin.d70==0}">停机</c:when>
							<c:when test="${jobStationDataOrigin.d70==1}">自动</c:when>
							<c:when test="${jobStationDataOrigin.d70==2}">手动</c:when>
						</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${jobStationDataOrigin.d71==0}">停机</c:when>
						<c:when test="${jobStationDataOrigin.d71==1}">自动</c:when>
						<c:when test="${jobStationDataOrigin.d71==2}">手动</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${jobStationDataOrigin.d72==0}"><div>	泵停机</div></c:when>
						<c:when test="${jobStationDataOrigin.d72==1}"><div >	变频运行</div></c:when>
						<c:when test="${jobStationDataOrigin.d72==2}"><div >	工频</div></c:when>
						<c:when test="${jobStationDataOrigin.d72==3}"><div >	水泵故障</div></c:when>
						<c:when test="${jobStationDataOrigin.d72==4}"><div >	切除</div></c:when>

					</c:choose>
				</td>
				<td>
					<c:choose>

						<c:when test="${jobStationDataOrigin.d73==0}"><div >	泵停机</div></c:when>
						<c:when test="${jobStationDataOrigin.d73==1}"><div >	变频运行</div></c:when>
						<c:when test="${jobStationDataOrigin.d73==2}"><div >	工频</div></c:when>
						<c:when test="${jobStationDataOrigin.d73==3}"><div >	水泵故障</div></c:when>
						<c:when test="${jobStationDataOrigin.d73==4}"><div >	切除</div></c:when>

					</c:choose>
				</td>
				<td>
					<c:choose>

						<c:when test="${jobStationDataOrigin.d74==0}"><div >	泵停机</div></c:when>
						<c:when test="${jobStationDataOrigin.d74==1}"><div >	变频运行</div></c:when>
						<c:when test="${jobStationDataOrigin.d74==2}"><div >	工频</div></c:when>
						<c:when test="${jobStationDataOrigin.d74==3}"><div >	水泵故障</div></c:when>
						<c:when test="${jobStationDataOrigin.d74==4}"><div >	切除</div></c:when>

					</c:choose>
				</td>
				<td>
					<c:choose>

						<c:when test="${jobStationDataOrigin.d75==0}"><div >	泵停机</div></c:when>
						<c:when test="${jobStationDataOrigin.d75==1}"><div >	变频运行</div></c:when>
						<c:when test="${jobStationDataOrigin.d75==2}"><div >	工频</div></c:when>
						<c:when test="${jobStationDataOrigin.d75==3}"><div >	水泵故障</div></c:when>
						<c:when test="${jobStationDataOrigin.d75==4}"><div >	切除</div></c:when>

					</c:choose>
				</td>
				<td>
					<c:choose>

						<c:when test="${jobStationDataOrigin.d76==0}"><div  >	泵停机</div></c:when>
						<c:when test="${jobStationDataOrigin.d76==1}"><div >	变频运行</div></c:when>
						<c:when test="${jobStationDataOrigin.d76==2}"><div >	工频</div></c:when>
						<c:when test="${jobStationDataOrigin.d76==3}"><div >	水泵故障</div></c:when>
						<c:when test="${jobStationDataOrigin.d76==4}"><div >	切除</div></c:when>

					</c:choose>
				</td>
				<td>
					${jobStationDataOrigin.d222}
				</td>
				<%--<td>
					${jobStationDataOrigin.d252}
				</td>
				<td>
					${jobStationDataOrigin.d254}
				</td>--%>
				<td>
					${jobStationDataOrigin.d256}
				</td>
				<td>
					${jobStationDataOrigin.d258}
				</td>
				<%--<td>
					${jobStationDataOrigin.d260}
				</td>--%>
				<%--<td>
					${jobStationDataOrigin.d262}
				</td>--%>
				<td>
					${jobStationDataOrigin.d394}
				</td>
				<td>
					${jobStationDataOrigin.d396}
				</td>
				<td>
					${jobStationDataOrigin.d422}
				</td>
				<td>
					${jobStationDataOrigin.d3402}
				</td>
				<td>
					${jobStationDataOrigin.d3404}
				</td>
				<td>
					${jobStationDataOrigin.d3252}
				</td>
				<td>
					${jobStationDataOrigin.d404}
				</td>
				<td>
					${jobStationDataOrigin.d406}
				</td>
				<td>
					${jobStationDataOrigin.d522}
				</td>
				<td>
					${jobStationDataOrigin.d3142}
				</td>
				<td>
					${jobStationDataOrigin.d3140}
				</td>
				<td>
					${jobStationDataOrigin.d3250}
				</td>
				<%--<td>
					${jobStationDataOrigin.d502}
				</td>
				<td>
					${jobStationDataOrigin.d542}
				</td>--%>
				<%--<td>
					${jobStationDataOrigin.d504}
				</td>
				<td>
					${jobStationDataOrigin.d506}
				</td>--%>
				<%--<td>
					${jobStationDataOrigin.d508}
				</td>
				<td>
					${jobStationDataOrigin.d510}
				</td>--%>
				<td>
					${jobStationDataOrigin.d512}
				</td>
				<td>
					${jobStationDataOrigin.d534}
				</td>
				<td>
					${jobStationDataOrigin.d746}
				</td>
				<td>
					${jobStationDataOrigin.d4120}
				</td>
				<td>
					${jobStationDataOrigin.d3500}
				</td>
				<td>
					${jobStationDataOrigin.d3502}
				</td>
				<td>
					${jobStationDataOrigin.d3504}
				</td>
				<td>
					${jobStationDataOrigin.d814}
				</td>
				<td>
					${jobStationDataOrigin.d816}
				</td>
				<td>
					${jobStationDataOrigin.d3100}
				</td>
				<td>
					${jobStationDataOrigin.d3102}
				</td>
				<td>
					${jobStationDataOrigin.d3115}
				</td>
				<td>
					${jobStationDataOrigin.d3104}
				</td>
				<td>
					${jobStationDataOrigin.d3106}
				</td>
				<td>
					${jobStationDataOrigin.d3108}
				</td>
				<td>
					${jobStationDataOrigin.d3070}
				</td><%--
				<td>
					${jobStationDataOrigin.d3200}
				</td>
				<td>
					${jobStationDataOrigin.d3202}
				</td>
				<td>
					${jobStationDataOrigin.d3204}
				</td>
				<td>
					${jobStationDataOrigin.d3206}
				</td>
				<td>
					${jobStationDataOrigin.d3208}
				</td>
				<td>
					${jobStationDataOrigin.d3210}
				</td>
				<td>
					${jobStationDataOrigin.d3212}
				</td>
				<td>
					${jobStationDataOrigin.d3214}
				</td>
				<td>
					${jobStationDataOrigin.d3216}
				</td>
				<td>
					${jobStationDataOrigin.d3220}
				</td>
				<td>
					${jobStationDataOrigin.d2370}
				</td>--%><%--
				<td>
					${jobStationDataOrigin.d3000}
				</td>
				<td>
					${jobStationDataOrigin.d3001}
				</td>
				<td>
					${jobStationDataOrigin.d3002}
				</td>
				<td>
					${jobStationDataOrigin.d3003}
				</td>
				<td>
					${jobStationDataOrigin.d3004}
				</td>
				<td>
					${jobStationDataOrigin.d3005}
				</td>
				<td>
					${jobStationDataOrigin.d3006}
				</td>
				<td>
					${jobStationDataOrigin.d3007}
				</td>
				<td>
					${jobStationDataOrigin.d3008}
				</td>
				<td>
					${jobStationDataOrigin.d3009}
				</td>
				<td>
					${jobStationDataOrigin.d3010}
				</td>
				<td>
					${jobStationDataOrigin.d3011}
				</td>
				<td>
					${jobStationDataOrigin.d3012}
				</td>
				<td>
					${jobStationDataOrigin.d3013}
				</td>
				<td>
					${jobStationDataOrigin.d3014}
				</td>
				<td>
					${jobStationDataOrigin.d3015}
				</td>
				<td>
					${jobStationDataOrigin.d3016}
				</td>
				<td>
					${jobStationDataOrigin.d3017}
				</td>
				<td>
					${jobStationDataOrigin.d3018}
				</td>
				<td>
					${jobStationDataOrigin.d3019}
				</td>
				<td>
					${jobStationDataOrigin.d3020}
				</td>
				<td>
					${jobStationDataOrigin.d3021}
				</td>
				<td>
					${jobStationDataOrigin.d3022}
				</td>
				<td>
					${jobStationDataOrigin.d3023}
				</td>--%>
				<%--<td>
					${jobStationDataOrigin.d5200}
				</td>--%>
				<%--<td>
					${jobStationDataOrigin.d5202}
				</td>
				<td>
					${jobStationDataOrigin.d5204}
				</td>
				<td>
					${jobStationDataOrigin.d5206}
				</td>
				<td>
					${jobStationDataOrigin.d5208}
				</td>
				<td>
					${jobStationDataOrigin.d5210}
				</td>--%>
				<%--<td>
					${jobStationDataOrigin.d900}
				</td>
				<td>
					${jobStationDataOrigin.d901}
				</td>
				<td>
					${jobStationDataOrigin.d902}
				</td>
				<td>
					${jobStationDataOrigin.d903}
				</td>
				<td>
					${jobStationDataOrigin.d904}
				</td>--%>
				<td>
					<c:choose>
						<c:when test="${jobStationDataOrigin.m293==1}">开</c:when>
						<c:when test="${jobStationDataOrigin.m293==0}">关</c:when>
					</c:choose>
				</td>
				<td>

						<c:choose>
							<c:when test="${jobStationDataOrigin.m290==1}">开</c:when>
						</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${jobStationDataOrigin.m291==1}">开</c:when>
					</c:choose>
				</td>
				<td>

						<c:choose>
							<c:when test="${jobStationDataOrigin.m297==1}">开</c:when>
							<c:when test="${jobStationDataOrigin.m297==0}">关</c:when>
						</c:choose>
				</td>
				<td>

						<c:choose>
							<c:when test="${jobStationDataOrigin.m720==1}">定时开关机</c:when>
							<c:when test="${jobStationDataOrigin.m720==0}">分时控温</c:when>
						</c:choose>
				</td>
				<td>

					<c:choose>
						<c:when test="${jobStationDataOrigin.m722==1}">水水系统</c:when>
						<c:when test="${jobStationDataOrigin.m722==0}">汽水系统</c:when>
					</c:choose>
				</td>
				<td>
						<c:choose>
							<c:when test="${jobStationDataOrigin.m2050==1}">手动状态</c:when>
							<c:when test="${jobStationDataOrigin.m2050==0}">自动状态</c:when>
						</c:choose>
				</td>
				<td>

					<c:choose>
						<c:when test="${jobStationDataOrigin.m2051==1}">手动状态</c:when>
						<c:when test="${jobStationDataOrigin.m2051==0}">自动状态</c:when>
					</c:choose>
				</td>
				<%--<shiro:hasPermission name="data:origin:jobStationDataOrigin:edit"><td>
    				<a href="${ctx}/data/origin/jobStationDataOrigin/form?id=${jobStationDataOrigin.id}">修改</a>
					<a href="${ctx}/data/origin/jobStationDataOrigin/delete?id=${jobStationDataOrigin.id}" onclick="return confirmx('确认要删除该热网计量吗？', this.href)">删除</a>
				</td></shiro:hasPermission>--%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>