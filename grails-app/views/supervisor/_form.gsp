<%@ page import="com.team.aspi.optimize.core.Supervisor" %>



<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'supervisorName', 'error')} ">
	<label for="supervisorName">
		<g:message code="supervisor.supervisorName.label" default="Supervisor Name" />
		
	</label>
	<g:textField class="form-control col-md-4" placeholder="Supervisor Name" name="supervisorName" id="supervisorName" value="${supervisorInstance?.supervisorName}"/>
        <div id="supervisorName_error" name="supervisorName_error" class="hintMsg" ></div>
</div>
<br/>
<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="supervisor.address.label" default="Address" />
		
	</label>
	<g:textField class="form-control col-md-4" placeholder="Address" name="address" id="address" value="${supervisorInstance?.address}"/>
        <div id="address_error" name="address_error" class="hintMsg" ></div>
</div>
<br/>
<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="supervisor.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textField class="form-control col-md-4" placeholder="Contact Number" name="contactNumber" id="contactNumber" value="${supervisorInstance?.contactNumber}"/>
        <div id="contactNumber_error" name="contactNumber_error" class="hintMsg" ></div>
</div>
<br/>
<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'employeeId', 'error')} ">
	<label for="employeeId">
		<g:message code="supervisor.employeeId.label" default="Employee Id" />
		
	</label>
	<g:textField class="form-control col-md-4" placeholder="Employee Id" name="employeeId" id="employeeId" value="${supervisorInstance?.employeeId}"/>
        <div id="employeeId_error" name="employeeId_error" class="hintMsg" ></div>
</div>
<!--
<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="supervisor.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" id="imageName" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'lastLoginDate', 'error')} required">
	<label for="lastLoginDate">
		<g:message code="supervisor.lastLoginDate.label" default="Last Login Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastLoginDate" precision="day"  value="${supervisorInstance?.lastLoginDate}"  />
</div>
-->


<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="supervisor.sex.label" default="Sex" />
		
	</label>
        <g:select class="form-control" name="sex" id="sex" from="${supervisorInstance.constraints.sex.inList}" value="${supervisorInstance?.sex}" valueMessagePrefix="supervisorInstance.sex" />
        <div id="sex_error" name="sex_error" class="hintMsg" ></div>
</div>
<br/>
<!--
<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="supervisor.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${supervisorInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['supervisor.id': supervisorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

</div>
-->
<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="supervisor.username.label" default="Username" />
		
	</label>
	<g:textField class="form-control col-md-4" placeholder="Username " name="username" id="username" value="${supervisorInstance?.username}"/>
        <div id="username_error" name="username_error" class="hintMsg" ></div>
</div>
<br/>
<div class="fieldcontain ${hasErrors(bean: supervisorInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="supervisor.password.label" default="Password" />
		
	</label>
	<g:textField class="form-control col-md-4" placeholder="Password" name="password" id="password" value="${supervisorInstance?.password}"/>
        <div id="password_error" name="password_error" class="hintMsg" ></div>
</div>



<g:hiddenField name="userType" value="SUPERVISOR"/>
<g:hiddenField name="imageName" value="avatar.png"/>