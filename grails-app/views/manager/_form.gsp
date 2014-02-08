<%@ page import="com.team.aspi.optimize.core.Manager" %>



<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="manager.sex.label" default="Sex" />
		
	</label>
	<g:select name="sex" from="${managerInstance.constraints.sex.inList}" value="${managerInstance?.sex}" valueMessagePrefix="manager.sex" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="manager.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${managerInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="manager.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textField name="contactNumber" value="${managerInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'deleted', 'error')} ">
	<label for="deleted">
		<g:message code="manager.deleted.label" default="Deleted" />
		
	</label>
	<g:checkBox name="deleted" value="${managerInstance?.deleted}" />
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="manager.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" value="${managerInstance?.imageName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'lastLoginDate', 'error')} required">
	<label for="lastLoginDate">
		<g:message code="manager.lastLoginDate.label" default="Last Login Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastLoginDate" precision="day"  value="${managerInstance?.lastLoginDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'managerName', 'error')} ">
	<label for="managerName">
		<g:message code="manager.managerName.label" default="Manager Name" />
		
	</label>
	<g:textField name="managerName" value="${managerInstance?.managerName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="manager.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${managerInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'userType', 'error')} ">
	<label for="userType">
		<g:message code="manager.userType.label" default="User Type" />
		
	</label>
	<g:textField name="userType" value="${managerInstance?.userType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managerInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="manager.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${managerInstance?.username}"/>
</div>

