<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>报表打印</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/jqprint/jquery.jqprint-0.3.js"></script>
	<script src="${ctxStatic}/jquery/jquery.table2excel.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			/*$("#btnPrint").click(function () {
			 printTable();
            });*/
            /*$("#btnExport").click(function(){
                exportExcel();
            });*/
		});
		function exportExcel() {
            $("#contentTable").table2excel({
                name: new Date()+"报表.xls",
                filename: "报表",
                sheetName:"报表",
                fileext: ".xls",
                exclude_img: false,
                exclude_links: false,
                exclude_inputs: false
            });
        }
		function printTable() {
            $("#contentTable").jqprint();
        }
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>


</head>
<body>
	<%--<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/data/origin/jobStationDataOrigin/">热网计量列表</a></li>
		<shiro:hasPermission name="data:origin:jobStationDataOrigin:edit"><li><a href="${ctx}/data/origin/jobStationDataOrigin/form">热网计量添加</a></li></shiro:hasPermission>
	</ul>--%>
	<form:form id="searchForm" modelAttribute="jobStationDataOrigin" action="${ctx}/data/origin/jobStationDataOrigin/report" method="post" class="breadcrumb form-search">
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
			<li class="btns">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				<input id="btnPrint" class="btn btn-primary" type="button" value="打印" onclick="$('#contentTable').jqprint()"/>
				<input id="btnExport" class="btn btn-primary" type="button" value="导出Excel" onclick="exportExcel()"/>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th></th>
				<th></th>
				<th colspan="4" style="text-align: center">一次热源参数</th>
				<th colspan="4" style="text-align: center">二级管网参数</th>
				<%--<th></th>
				<th></th>
				<th></th>
				<th></th>--%>
				<%--<th></th>--%>
				<%--<th></th>
				<th></th>
				<th></th>--%>
			</tr>
			<tr>
				<th style="min-width: 150px">站号</th>
				<th style="min-width: 150px">时间</th>
				<th>一次供水温度</th>
				<th>一次回水温度</th>
				<th>一次供水压力</th>
				<th>一次回水压力</th>
                <th>二次出水温度</th>
                <th>二次回水温度</th>
                <th>二次供水压力</th>
                <th>二次回水压力</th>
                <<%--th>二次回水压力_滤前</th>
				<th>热表瞬时流量</th>
				<th>热表瞬时热量</th>
				<th>热表累计流量</th>--%>
				<%--<th>热表累计热量</th>--%>
				<%--<th>热表供水温度</th>
				<th>热表回水温度</th>
                <th>板换入口压力</th>--%>
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

				<td>
								${jobStationDataOrigin.d5210}

				</td>
				<td>
								${jobStationDataOrigin.d260}

				</td>
				<td>
								${jobStationDataOrigin.d262}

				</td>
				<td>
								${jobStationDataOrigin.d508}

				</td>
				<td>
								${jobStationDataOrigin.d510}

				</td>
				<td>
								${jobStationDataOrigin.d252}

				</td>
				<td>
								${jobStationDataOrigin.d254}

				</td>
				<td>
								${jobStationDataOrigin.d502}

				</td>
				<%--<td>
								${jobStationDataOrigin.d504}

				</td>
				<td>
								${jobStationDataOrigin.d506}

				</td>
				<td>
						${jobStationDataOrigin.d5200}

				</td>

				<td>
						${jobStationDataOrigin.d5202}

				</td>--%>

				<%--<td>
						${jobStationDataOrigin.d5204}

				</td>--%>
<%--
				<td>
						${jobStationDataOrigin.d5206}

				</td>

				<td>
						${jobStationDataOrigin.d5208}

				</td>

				<td>
								${jobStationDataOrigin.d542}

				</td>--%>
			<%--<td>
					${jobStationDataOrigin.d2008}
				</td>
				<td>
					${jobStationDataOrigin.d2009}
				</td>
				<td>
					${jobStationDataOrigin.d70}
				</td>
				<td>
					${jobStationDataOrigin.d71}
				</td>
				<td>
					${jobStationDataOrigin.d72}
				</td>
				<td>
					${jobStationDataOrigin.d73}
				</td>
				<td>
					${jobStationDataOrigin.d74}
				</td>
				<td>
					${jobStationDataOrigin.d75}
				</td>
				<td>
					${jobStationDataOrigin.d76}
				</td>
				<td>
					${jobStationDataOrigin.d222}
				</td>
				<td>
					${jobStationDataOrigin.d252}
				</td>
				<td>
					${jobStationDataOrigin.d254}
				</td>
				<td>
					${jobStationDataOrigin.d256}
				</td>
				<td>
					${jobStationDataOrigin.d258}
				</td>
				<td>
					${jobStationDataOrigin.d260}
				</td>
				<td>
					${jobStationDataOrigin.d262}
				</td>
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
				<td>
					${jobStationDataOrigin.d502}
				</td>
				<td>
					${jobStationDataOrigin.d542}
				</td>
				<td>
					${jobStationDataOrigin.d504}
				</td>
				<td>
					${jobStationDataOrigin.d506}
				</td>
				<td>
					${jobStationDataOrigin.d508}
				</td>
				<td>
					${jobStationDataOrigin.d510}
				</td>
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
				</td>
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
				</td>
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
				</td>
				<td>
					${jobStationDataOrigin.d5200}
				</td>
				<td>
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
				</td>
				<td>
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
				</td>
				<td>
					${jobStationDataOrigin.m293}
				</td>
				<td>
					${jobStationDataOrigin.m290}
				</td>
				<td>
					${jobStationDataOrigin.m291}
				</td>
				<td>
					${jobStationDataOrigin.m297}
				</td>
				<td>
					${jobStationDataOrigin.m720}
				</td>
				<td>
					${jobStationDataOrigin.m722}
				</td>
				<td>
					${jobStationDataOrigin.m2050}
				</td>
				<td>
					${jobStationDataOrigin.m2051}
				</td>
				<shiro:hasPermission name="data:origin:jobStationDataOrigin:edit"><td>
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