<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>温度曲线-周</title>
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
		<li class="active"><a href="${ctx}/analysis/energy/jobStationEnergyConsumeWeek/">能耗分析列表</a></li>
		<li ><a href="${ctx}/analysis/energy/jobStationEnergyConsumeWeek/chart">能耗分析图</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="jobStationEnergyConsumeWeek" action="${ctx}/analysis/energy/jobStationEnergyConsumeWeek/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>站点：</label>

				<form:select id="stationId" path="stationId" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${stationList}" itemValue="id" itemLabel="name" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>站点</th>
				<th>能耗</th>
				<th>时间</th>
				<shiro:hasPermission name="analysis:energy:jobStationEnergyConsumeWeek:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jobStationEnergyConsumeWeek">
			<tr>
				<td><a href="${ctx}/analysis/energy/jobStationEnergyConsumeWeek/form?id=${jobStationEnergyConsumeWeek.id}">
					${jobStationEnergyConsumeWeek.stationId}
				</a></td>
				<td>
					${jobStationEnergyConsumeWeek.energy}
				</td>
				<td>
					<fmt:formatDate value="${jobStationEnergyConsumeWeek.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="analysis:energy:jobStationEnergyConsumeWeek:edit"><td>
    				<a href="${ctx}/analysis/energy/jobStationEnergyConsumeWeek/form?id=${jobStationEnergyConsumeWeek.id}">修改</a>
					<a href="${ctx}/analysis/energy/jobStationEnergyConsumeWeek/delete?id=${jobStationEnergyConsumeWeek.id}" onclick="return confirmx('确认要删除该能耗分析-周吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>