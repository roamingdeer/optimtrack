<%@ page import="com.team.aspi.optimize.core.Task" %>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'taskId', 'error')} ">
	<label for="taskId">
		<g:message code="task.taskId.label" default="Task Id" />
		
	</label>
	<g:textField class="form-control" placeholder="Task Id"  name="taskId" id="taskId" value="${taskInstance?.taskId}"/>
        <div id="taskId_error" name="taskId_error" class="hintMsg" ></div>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'partyName', 'error')} ">
	<label for="partyName">
		<g:message code="task.partyName.label" default="Party Name" />
		
	</label>
	<g:textField class="form-control" placeholder="Party Name" name="partyName" id="partyName" maxlength="50" value="${taskInstance?.partyName}"/>
        <div id="partyName_error" name="partyName_error" class="hintMsg" ></div>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'partyAddress', 'error')} ">
	<label for="partyAddress">
		<g:message code="task.partyAddress.label" default="Party Address" />
		
	</label>
	<g:textField class="form-control" placeholder="Party Address" name="partyAddress" id="partyAddress" maxlength="200" value="${taskInstance?.partyAddress}"/>
        <br/><input class="btn btn-block btn-primary" type="button" value="On Map" onclick="showMarker()">
        <div id="partyAddress_error" name="partyAddress_error" class="hintMsg" ></div>
        <div id="taskLatAndLong_error" name="taskLatAndLong_error" class="hintMsg" ></div>
        
</div>

<!--
<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="task.status.label" default="Status" />
		
	</label>
	<g:textField name="status" maxlength="100" value="${taskInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'completedOn', 'error')} required">
	<label for="completedOn">
		<g:message code="task.completedOn.label" default="Completed On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="completedOn" precision="day"  value="${taskInstance?.completedOn}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="task.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.team.aspi.optimize.core.Supervisor.list()}" optionValue="supervisorName" optionKey="id"  value="${taskInstance?.createdBy?.id}" class="many-to-one"/>
</div>
-->
<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedTo', 'error')} required">
	<label for="createdBy">
		<g:message code="task.createdBy.label" default="Assigned To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control"  id="assignedTo" name="assignedTo.id" from="${com.team.aspi.optimize.core.FieldOperator.list()}" optionValue="fieldOperatorName" optionKey="id"  value="${taskInstance?.assignedTo?.id}" class="many-to-one"/>
        <div id="assignedTo_error" name="assignedTo_error" class="hintMsg" ></div>
</div>

<!--
<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'deleted', 'error')} ">
	<label for="deleted">
		<g:message code="task.deleted.label" default="Deleted" />
		
	</label>
	<g:checkBox name="deleted" value="${taskInstance?.deleted}" />
</div>


<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'fieldOperatorComment', 'error')} ">
	<label for="fieldOperatorComment">
		<g:message code="task.fieldOperatorComment.label" default="Field Operator Comment" />
		
	</label>
	<g:textField name="fieldOperatorComment" value="${taskInstance?.fieldOperatorComment}"/>
</div>

-->

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'dueAmount', 'error')} required">
	<label for="dueAmount">
		<g:message code="task.dueAmount.label" default="Due Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" placeholder="Due Amount" name="dueAmount" id="dueAmount" value="${taskInstance.dueAmount}" />
        <div id="dueAmount_error" name="dueAmount_error" class="hintMsg" ></div>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'penaltyAmount', 'error')} required">
	<label for="penaltyAmount">
		<g:message code="task.penaltyAmount.label" default="Penalty Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" placeholder="Penalty Amount" name="penaltyAmount" id="penaltyAmount" value="${taskInstance.penaltyAmount}" />
        <div id="penaltyAmount_error" name="penaltyAmount_error" class="hintMsg" ></div>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'supervisorComment', 'error')} ">
	<label for="supervisorComment">
		<g:message code="task.supervisorComment.label" default="Supervisor Comment" />
		
	</label>
	<g:textField class="form-control" placeholder="Supervisor Comment" name="supervisorComment" id="supervisorComment" value="${taskInstance?.supervisorComment}"/>
</div>


<!--
<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'taskLatAndLong', 'error')} ">
	<label for="taskLatAndLong">
		<g:message code="task.taskLatAndLong.label" default="Task Lat And Long" />
		
	</label>
	<g:textField name="taskLatAndLong" value="${taskInstance?.taskLatAndLong}"/>
</div>
-->

<g:hiddenField name="taskLatAndLong" id="taskLatAndLong" value="${taskInstance?.taskLatAndLong}"/>
