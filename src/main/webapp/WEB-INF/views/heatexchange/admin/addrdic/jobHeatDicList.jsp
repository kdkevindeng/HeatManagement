<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>地址对应管理</title>
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
		<li class="active"><a href="${ctx}/admin/addrdic/jobHeatDic/">地址对应列表</a></li>
		<shiro:hasPermission name="admin:addrdic:jobHeatDic:edit"><li><a href="${ctx}/admin/addrdic/jobHeatDic/form">地址对应添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="jobHeatDic" action="${ctx}/admin/addrdic/jobHeatDic/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>PLC地址：</label>
				<form:input path="plcAddr" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>modbus：</label>
				<form:input path="modbusAddr" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>含义：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>读写：</label>
				<form:select path="wR" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('WR')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>PLC地址</th>
				<th>modbus地址</th>
				<th>含义</th>
				<th>读写属性</th>
				<th>备注</th>
				<shiro:hasPermission name="admin:addrdic:jobHeatDic:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jobHeatDic">
			<tr>
				<td><a href="${ctx}/admin/addrdic/jobHeatDic/form?id=${jobHeatDic.id}">
					${jobHeatDic.plcAddr}
				</a></td>
				<td>
					${jobHeatDic.modbusAddr}
				</td>
				<td>
					${jobHeatDic.name}
				</td>
				<td>
						<%--${jobHeatDic.wR}--%>
					<%--${fns:getDictLabel(jobHeatDic.wR, 'WR', '')}--%>
				</td>
				<td>
					${jobHeatDic.remark}
				</td>
				<shiro:hasPermission name="admin:addrdic:jobHeatDic:edit"><td>
    				<a href="${ctx}/admin/addrdic/jobHeatDic/form?id=${jobHeatDic.id}">修改</a>
					<%--<a href="${ctx}/admin/addrdic/jobHeatDic/delete?id=${jobHeatDic.id}" onclick="return confirmx('确认要删除该地址对应吗？', this.href)">删除</a>--%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>