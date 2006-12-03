<%@ include file="./inc/_taglibs.jsp" %>
<%@ include file="./inc/_header.jsp" %>
<aef:menu navi="1"  bct="${aef:getDeliverable(deliverableId)}"/> 
	<ww:actionerror/>
	<ww:actionmessage/>
	<c:choose>
		<c:when test="${iteration.id == 0}">
			<h2>Create new iteration</h2>
		</c:when>
		<c:otherwise>
			<h2>Edit iteration: ${iteration.id}</h2>
		</c:otherwise>
	</c:choose>
	<ww:form action="storeIteration">
		<ww:hidden name="iterationId" value="${iteration.id}"/>
		<ww:hidden name="deliverableId"/> 

<%--<ww:date name="%{new java.util.Date()}" format="dd-MM-yyyy" id="date"/>
<p>

			Startdate: <ww:datepicker value="%{#date}" showstime="%{true}" format="%d-%m-%Y" name="iteration.startDate"/> 
		</p>
		<p>		
			Enddate: <ww:datepicker value="%{#date}" showstime="%{true}" format="%d-%m-%Y" name="iteration.endDate"/> 
		</p>--%>
    	<p>		
			Name: <ww:textfield name="iteration.name"/>
		</p>
		<p>
			Description: <ww:textarea cols="40" rows="6" name="iteration.description" />
		</p>
		<p>
			<ww:submit value="Store"/>
		</p>
	</ww:form>	

	<c:if test="${!empty iteration.backlogItems}">
		<p>
			Backlog items:
		</p>
		<p>
			<display:table name="iteration.backlogItems" id="row" requestURI="editIteration.action">
				<display:column sortable="true" title="Id" property="id"/>
				<display:column sortable="true" title="Name" property="name"/>
				<display:column sortable="true" title="# of tasks">
					${fn:length(row.tasks)}
				</display:column>
				<display:column sortable="true" title="Effort estimate" sortProperty="remainingEffortEstimate.time">
					${row.remainingEffortEstimate}
				</display:column>
				<display:column sortable="true" title="Effort in tasks" sortProperty="taskEffortLeft.time">
					${row.taskEffortLeft}
				</display:column>
				<display:column sortable="false" title="Actions">
					<ww:url id="editLink" action="editBacklogItem" includeParams="none">
						<ww:param name="backlogItemId" value="${row.id}"/>
					</ww:url>
					<ww:url id="deleteLink" action="deleteBacklogItem" includeParams="none">
						<ww:param name="backlogItemId" value="${row.id}"/>
					</ww:url>
					<ww:a href="%{editLink}">Edit</ww:a>|<ww:a href="%{deleteLink}">Delete</ww:a>
				</display:column>
			</display:table>
		</p>
	</c:if>
<%@ include file="./inc/_footer.jsp" %>
