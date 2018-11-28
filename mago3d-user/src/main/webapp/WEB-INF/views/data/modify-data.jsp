<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<%@ include file="/WEB-INF/views/common/config.jsp" %>

<!DOCTYPE html>
<html lang="${accessibility}">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>Data 수정 | mago3D User</title>
	<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="/css/cloud.css?cache_version=${cache_version}">
	<link rel="stylesheet" href="/css/fontawesome-free-5.2.0-web/css/all.min.css">
	<link rel="stylesheet" href="/externlib/jquery-ui/jquery-ui.css" />
	<link rel="stylesheet" href="/css/${lang}/font/font.css" />
	<link rel="stylesheet" href="/images/${lang}/icon/glyph/glyphicon.css" />
	<script type="text/javascript" src="/externlib/jquery/jquery.js"></script>
	<script type="text/javascript" src="/externlib/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript" src="/js/cloud.js?cache_version=${cache_version}"></script>
</head>
<body>

<div class="site-body">
	<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
	<div id="site-content" class="on">
		<%@ include file="/WEB-INF/views/layouts/menu.jsp" %>
		<div id="content-wrap">
			<div id="gnb-content" class="clfix">
				<h1 style="padding-left: 20px;">
					<span style="font-size:26px;">Data 수정</span>
				</h1>
				<div class="location">
					<span style="padding-top:10px; font-size:12px; color: Mediumslateblue;">
						<i class="fas fa-cubes" title="Visualization"></i>
					</span>
					<span style="font-size:12px;">Data 목록 > Data 수정</span>
				</div>
			</div>

			<!-- Start content by page -->
			<div class="page-content">
				<div class="content-desc u-pull-right" style="padding-right: 10px;">
					<span class="icon-glyph glyph-emark-dot color-warning" style="display: inline-block; padding-bottom: 2px;"></span>
					<span style="display: inline-block; padding-bottom: 2px;"><spring:message code='check'/></span>
				</div>
				<div style="margin-top: 20px; border: 1px solid #dddddd;">
					<ul style="list-style: none; font-size: 14px; border-bottom: 3px solid #573592">
						<li style="padding-left: 10px; padding-top: 5px; width: 115px; height: 30px; color: white; background: #573690;">
							Data 정보 수정
						</li>
					</ul>
					<div id="data_info_tab">
						<form:form id="dataInfo" modelAttribute="dataInfo" method="post" onsubmit="return false;">
							<form:hidden path="project_id"/>
							<form:hidden path="data_id"/>
							<form:hidden path="depth"/>
						<table class="input-table scope-row">
							<col class="col-label" />
							<col class="col-input" />
							<tr>
								<th class="col-label m" scope="row" style="width: 250px;">
									<form:label path="sharing_type">공유 타입</form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<select id="sharing_type" name="sharing_type" class="select" style="height: 30px;">
										<option value="1" selected="selected"> 공개 프로젝트 </option>
										<option value="2" disabled="disabled"> 개인 프로젝트 </option>
						          		<option value="3" disabled="disabled"> 공유 프로젝트 </option>
						          		<option value="0" disabled="disabled"> 공통 프로젝트 </option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="project_id"><spring:message code='data.project.name'/></form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<%-- <select id="project_id" name="project_id" class="select" style="height: 30px;">
<c:forEach var="project" items="${projectList }">
										<option value="${project.project_id }">${project.project_name }</option>
</c:forEach>									
									</select> --%>
									${dataInfo.project_name }
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="parent"><spring:message code='data.project.parent.node'/></form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<form:hidden path="parent" />
									<form:hidden path="parent_depth" />
		 							<form:input path="parent_name" cssClass="l" readonly="true" />
<c:if test="${dataInfo.parent ne 0 and dataInfo.depth ne 1 }">
									<input type="button" id="parentFind" value="<spring:message code='search'/>" />
</c:if>
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="data_name"><spring:message code='data.name'/></form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<form:input path="data_name" class="l" />
			  						<form:errors path="data_name" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="mapping_type"><spring:message code='data.mapping.type'/></form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<form:input path="mapping_type" class="l" />
			  						<form:errors path="mapping_type" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="latitude"><spring:message code='latitude'/></form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<form:input path="latitude" class="m" />
			  						<form:errors path="latitude" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="longitude"><spring:message code='longitude'/></form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<form:input path="longitude" class="m" />
			  						<form:errors path="longitude" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="height"><spring:message code='height'/></form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<form:input path="height" class="m" />
			  						<form:errors path="height" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="heading">Heading</form:label>
								</th>
								<td class="col-input">
									<form:input path="heading" class="m" />
			  						<form:errors path="heading" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="pitch">Pitch</form:label>
								</th>
								<td class="col-input">
									<form:input path="pitch" class="m" />
			  						<form:errors path="pitch" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="roll">Roll</form:label>
								</th>
								<td class="col-input">
									<form:input path="roll" class="m" />
			  						<form:errors path="roll" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="attributes"><spring:message code='properties'/></form:label>
									<span class="icon-glyph glyph-emark-dot color-warning"></span>
								</th>
								<td class="col-input">
									<form:input path="attributes" class="xl" />
			  						<form:errors path="attributes" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th class="col-label" scope="row">
									<form:label path="description"><spring:message code='description'/></form:label>
								</th>
								<td class="col-input">
									<form:input path="description" class="xl" />
			  						<form:errors path="description" cssClass="error" />
								</td>
							</tr>
						</table>
						
						<div class="button-group">
							<div class="center-buttons">
								<input type="submit" value="<spring:message code='modified'/>" onclick="updateData();" />
								<a href="/data/list-data.do" class="button"><spring:message code='list'/></a>
							</div>
						</div>
						</form:form>
					</div>
							
				</div>
			</div>
			<!-- End content by page -->
			
		</div>
	</div>
	<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
</div>
	
<!-- Dialog -->
<div id="dataDialog" class="dataDialog">
	<table class="list-table scope-col">
		<col class="col-number" />
		<col class="col-name" />
		<col class="col-id" />
		<col class="col-name" />
		<col class="col-toggle" />
		<col class="col-toggle" />
		<col class="col-toggle" />
		<col class="col-toggle" />
		<col class="col-toggle" />
		<thead>
			<tr>
				<th scope="col" class="col-number"><spring:message code='number'/></th>
				<th scope="col" class="col-number">Depth</th>
				<th scope="col" class="col-id"><spring:message code='data.key'/></th>
				<th scope="col" class="col-name"><spring:message code='data.name'/></th>
				<th scope="col" class="col-toggle"><spring:message code='latitude'/></th>
				<th scope="col" class="col-toggle"><spring:message code='longitude'/></th>
				<th scope="col" class="col-toggle"><spring:message code='height'/></th>
				<th scope="col" class="col-toggle"><spring:message code='properties'/></th>
				<th scope="col" class="col-toggle"><spring:message code='select'/></th>
			</tr>
		</thead>
		<tbody id="projectDataList">
		</tbody>
	</table>
</div>

<script type="text/javascript" src="/js/${lang}/common.js"></script>
<script type="text/javascript" src="/js/${lang}/message.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#project_id").val("${dataInfo.project_id}");
	});
	
	var dataDialog = $( ".dataDialog" ).dialog({
		autoOpen: false,
		height: 600,
		width: 1200,
		modal: true,
		overflow : "auto",
		resizable: false
	});
	
	// 부모 찾기
	$( "#parentFind" ).on( "click", function() {
		dataDialog.dialog( "open" );
		dataDialog.dialog( "option", "title", $("#project_id option:selected").prop("label"));
		drawDataList($("#project_id").val());
	});
	
	function drawDataList(projectId) {
		if(projectId === "") {
			alert(JS_MESSAGE["project.project_id.empty"]);
			return false;
		}
		var info = "project_id=" + projectId;
		$.ajax({
			url: "/data/ajax-list-data-by-project-id.do",
			type: "POST",
			data: info,
			cache: false,
			dataType: "json",
			success: function(msg){
				if(msg.result == "success") {
					var content = "";
					var dataList = msg.dataList;
					if(dataList == null || dataList.length == 0) {
						content = content
							+ 	"<tr>"
							+ 	"	<td colspan=\"9\" class=\"col-none\">데이터가 존재하지 않습니다.</td>"
							+ 	"</tr>";
					} else {
						dataListCount = dataList.length;
						var preViewDepth = "";
						var preDataId = 0;
						var preDepth = 0;
						for(i=0; i<dataListCount; i++ ) {
							var dataInfo = dataList[i];
							var viewAttributes = dataInfo.attributes;
							var viewDepth = getViewDepth(preViewDepth, dataInfo.data_id, preDepth, dataInfo.depth);
							var select = "<spring:message code='select'/>";
							if(viewAttributes !== null && viewAttributes !== "" && viewAttributes.length > 20) viewAttributes = viewAttributes.substring(0, 20) + "...";
							content = content 
								+ 	"<tr>"
								+ 	"	<td class=\"col-number\">" + (i + 1) + " </td>"
								+ 	"	<td class=\"col-id\">" + viewDepth + "</td>"
								+ 	"	<td class=\"col-id\">" + dataInfo.data_key + "</td>"
								+ 	"	<td class=\"col-name\">" + dataInfo.data_name + "</td>"
								+ 	"	<td class=\"col-toggle\">" + dataInfo.latitude + "</td>"
								+ 	"	<td class=\"col-toggle\">" + dataInfo.longitude + "</td>"
								+ 	"	<td class=\"col-toggle\">" + dataInfo.height + "</td>"
								+ 	"	<td class=\"col-toggle\">" + viewAttributes + "</td>"
								+ 	"	<td class=\"col-toggle\"><a href=\"#\" onclick=\"confirmParent('" 
								+ 									dataInfo.data_id + "', '" + dataInfo.data_name + "', '" + dataInfo.depth + "'); return false;\">" + select + "</a></td>"
								+ 	"	</tr>";
								
							preDataId = dataInfo.data_id;
							preDepth = dataInfo.depth;
							preViewDepth = viewDepth;
						}
					}
					
					$("#projectDataList").empty();
					$("#projectDataList").html(content);
				} else {
					alert(JS_MESSAGE[msg.result]);
				}
			},
			error:function(request, status, error) {
				//alert(JS_MESSAGE["ajax.error.message"]);
				alert(" code : " + request.status + "\n" + ", message : " + request.responseText + "\n" + ", error : " + error);
    		}
		});
	}
	
	function getViewDepth(preViewDepth, dataId, preDepth, depth) {
		var result = "";
		if(depth === 1) return result + dataId;
		
		if(preDepth === depth) {
			// 형제
			if(preViewDepth.indexOf(".") >= 0) {
				result =  preViewDepth.substring(0, preViewDepth.lastIndexOf(".") + 1) + dataId;
			} else {
				result = dataId;
			}
		} else if(preDepth < depth) {
			// 자식
			result = preViewDepth + "." + dataId;				
		} else {
			result =  preViewDepth.substring(0, preViewDepth.lastIndexOf("."));
			result =  result.substring(0, result.lastIndexOf(".") + 1) + dataId;
		}
		return result;
	}
	
	// 상위 Node
	function confirmParent(dataId, dataName, depth) {
		$("#parent").val(dataId);
		$("#parent_name").val(dataName);
		$("#parent_depth").val(depth);
		dataDialog.dialog( "close" );
	}
	
	// Data 정보 수정
	var updateDataFlag = true;
	function updateData() {
		if (checkData() == false) {
			return false;
		}
		if(updateDataFlag) {
			updateDataFlag = false;
			var info = $("#dataInfo").serialize();
			$.ajax({
				url: "/data/ajax-update-data-info.do",
				type: "POST",
				data: info,
				cache: false,
				dataType: "json",
				success: function(msg){
					if(msg.result == "success") {
						alert(JS_MESSAGE["update"]);
						$("#parent").val("");
					} else {
						alert(JS_MESSAGE[msg.result]);
					}
					updateDataFlag = true;
				},
				error:function(request,status,error){
			        alert(JS_MESSAGE["ajax.error.message"]);
			        alert(" code : " + request.status + "\n" + ", message : " + request.responseText + "\n" + ", error : " + error);
			        updateDataFlag = true;
				}
			});
		} else {
			alert(JS_MESSAGE["button.dobule.click"]);
			return;
		}
	}
	
	function checkData() {
		if ($("#parent").val() == "") {
			alert(JS_MESSAGE["data.parent.empty"]);
			$("#parent_name").focus();
			return false;
		}
		if ($("#data_name").val() == "") {
			alert(JS_MESSAGE["data.name.empty"]);
			$("#data_name").focus();
			return false;
		}
	}
</script>
</body>
</html>