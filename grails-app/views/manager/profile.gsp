
<%@ page import="com.team.aspi.optimize.core.Manager" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manager.label', default: 'Manager')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-manager" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-manager" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list manager">
			
				<g:if test="${managerInstance?.sex}">
				<li class="fieldcontain">
					<span id="sex-label" class="property-label"><g:message code="manager.sex.label" default="Sex" /></span>
					
						<span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${managerInstance}" field="sex"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="manager.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${managerInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.contactNumber}">
				<li class="fieldcontain">
					<span id="contactNumber-label" class="property-label"><g:message code="manager.contactNumber.label" default="Contact Number" /></span>
					
						<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${managerInstance}" field="contactNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="manager.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${managerInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.deleted}">
				<li class="fieldcontain">
					<span id="deleted-label" class="property-label"><g:message code="manager.deleted.label" default="Deleted" /></span>
					
						<span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean boolean="${managerInstance?.deleted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="manager.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${managerInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.lastLoginDate}">
				<li class="fieldcontain">
					<span id="lastLoginDate-label" class="property-label"><g:message code="manager.lastLoginDate.label" default="Last Login Date" /></span>
					
						<span class="property-value" aria-labelledby="lastLoginDate-label"><g:formatDate date="${managerInstance?.lastLoginDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="manager.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${managerInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.managerName}">
				<li class="fieldcontain">
					<span id="managerName-label" class="property-label"><g:message code="manager.managerName.label" default="Manager Name" /></span>
					
						<span class="property-value" aria-labelledby="managerName-label"><g:fieldValue bean="${managerInstance}" field="managerName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="manager.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${managerInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.userType}">
				<li class="fieldcontain">
					<span id="userType-label" class="property-label"><g:message code="manager.userType.label" default="User Type" /></span>
					
						<span class="property-value" aria-labelledby="userType-label"><g:fieldValue bean="${managerInstance}" field="userType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managerInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="manager.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${managerInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${managerInstance?.id}" />
					<g:link class="edit" action="edit" id="${managerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
