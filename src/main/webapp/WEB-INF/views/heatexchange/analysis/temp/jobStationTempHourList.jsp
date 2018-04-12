<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>温度曲线-小时</title>
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
		<li class="active"><a href="${ctx}/analysis/energy/jobStationEnergyConsumeDay/">能耗分析列表</a></li>
		<li><a href="${ctx}/analysis/energy/jobStationEnergyConsumeDay/chart">能耗分析图</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="jobStationEnergyConsumeDay" action="${ctx}/analysis/energy/jobStationEnergyConsumeDay/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>站点：</label>
		<form:select id="stationId" path="stationId" class="input-medium">
			<form:option value="" label=""/>
			<form:options items="${stationList}" itemValue="id" itemLabel="name" htmlEscape="false"/>
		</form:select>
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>

	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>站点</th>
				<th>时间</th>
				<th>能耗</th>
				<shiro:hasPermission name="analysis:energy:jobStationEnergyConsumeDay:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jobStationEnergyConsumeDay">
			<tr>

				<td>
						${jobStationEnergyConsumeDay.stationName}
				</td>
				<td>
					<fmt:formatDate value="${jobStationEnergyConsumeDay.time}" pattern="yyyy-MM-dd"/>
					<%--<a href="${ctx}/analysis/energy/jobStationEnergyConsumeDay/form?id=${jobStationEnergyConsumeDay.id}">
						<fmt:formatDate value="${jobStationEnergyConsumeDay.time}" pattern="yyyy-MM-dd"/>
					</a>--%>
				</td>

				<td>
						${jobStationEnergyConsumeDay.energy}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>