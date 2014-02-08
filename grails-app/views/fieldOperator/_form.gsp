<%@ page import="com.team.aspi.optimize.core.FieldOperator" %>


<!--
<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'lastLoginDate', 'error')} ">
	<label for="lastLoginDate">
		<g:message code="fieldOperator.lastLoginDate.label" default="Last Login Date" />
		
	</label>
	<g:datePicker name="lastLoginDate" precision="day"  value="${fieldOperatorInstance?.lastLoginDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'sessionToken', 'error')} ">
	<label for="sessionToken">
		<g:message code="fieldOperator.sessionToken.label" default="Session Token" />
		
	</label>
	<g:textField name="sessionToken" value="${fieldOperatorInstance?.sessionToken}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="fieldOperator.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" value="${fieldOperatorInstance?.imageName}"/>
</div>
-->

<div >
	<label for="fieldOperatorName">
		<g:message code="fieldOperator.fieldOperatorName.label" default="Field Operator Name" />
		
	</label>
        <g:textField class="form-control" placeholder="Field Operator Name" name="fieldOperatorName" id="fieldOperatorName" value="${fieldOperatorInstance?.fieldOperatorName}"/>
        <div id="fieldOperatorName_error" name="fieldOperatorName_error" class="hintMsg" ></div>
</div>

<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="fieldOperator.address.label" default="Address" />
		
	</label>
        <g:textField class="form-control" placeholder="Address" name="address" id="address" value="${fieldOperatorInstance?.address}"/>
        <div id="address_error" name="address_error" class="hintMsg" ></div>
</div>

<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="fieldOperator.contactNumber.label" default="Contact Number" />
		
	</label>
        <g:textField class="form-control" placeholder="Contact Number" name="contactNumber" id="contactNumber" value="${fieldOperatorInstance?.contactNumber}"/>
        <div id="contactNumber_error" name="contactNumber_error" class="hintMsg" ></div>
</div>
<!--
<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'currentLocationLatAndLong', 'error')} ">
	<label for="currentLocationLatAndLong">
		<g:message code="fieldOperator.currentLocationLatAndLong.label" default="Current Location Lat And Long" />
		
	</label>
	<g:textField name="currentLocationLatAndLong" value="${fieldOperatorInstance?.currentLocationLatAndLong}"/>
</div>
-->

<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'employeeId', 'error')} ">
	<label for="employeeId">
		<g:message code="fieldOperator.employeeId.label" default="Employee Id" />
		
	</label>
        <g:textField class="form-control" placeholder="Employee Id" name="employeeId" id="employeeId" value="${fieldOperatorInstance?.employeeId}"/>
        <div id="employeeId_error" name="employeeId_error" class="hintMsg" ></div>
</div>



<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="fieldOperator.sex.label" default="Sex" />
		
	</label>
        <g:select class="form-control"  name="sex" id="sex" from="${fieldOperatorInstance.constraints.sex.inList}" value="${fieldOperatorInstance?.sex}" valueMessagePrefix="fieldOperatorInstance.sex" />
        <div id="sex_error" name="sex_error" class="hintMsg" ></div>
</div>

<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="fieldOperator.username.label" default="Username" />
		
	</label>
	<g:textField class="form-control" placeholder="Username" name="username" id="username" value="${fieldOperatorInstance?.username}"/>
        <div id="username_error" name="username_error" class="hintMsg" ></div>
</div>

<div class="fieldcontain ${hasErrors(bean: fieldOperatorInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="fieldOperator.password.label" default="Password" />
		
	</label>
	<g:textField class="form-control" placeholder="Password" name="password" id="password" value="${fieldOperatorInstance?.password}"/>
        <div id="password_error" name="password_error" class="hintMsg" ></div>
</div>
<g:hiddenField name="userType" value="FIELD OPERATOR"/>
<g:hiddenField name="imageName" value="avatar.png"/>