<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>能耗分析-月管理</title>
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
		<li class="active"><a href="${ctx}/analysis/energy/jobStationEnergyConsumeMonth/">能耗分析列表</a></li>
		<li><a href="${ctx}/analysis/energy/jobStationEnergyConsumeMonth/chart">能耗分析图</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="jobStationEnergyConsumeMonth" action="${ctx}/analysis/energy/jobStationEnergyConsumeMonth/" method="post" class="breadcrumb form-search">
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
				</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jobStationEnergyConsumeMonth">
			<tr>
				<td><a href="${ctx}/analysis/energy/jobStationEnergyConsumeMonth/form?id=${jobStationEnergyConsumeMonth.id}">
					${jobStationEnergyConsumeMonth.stationId}
				</a></td>
				<td>
					${jobStationEnergyConsumeMonth.energy}
				</td>
				<td>
					<fmt:formatDate value="${jobStationEnergyConsumeMonth.time}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>