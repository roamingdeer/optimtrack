
<%@ page import="com.team.aspi.optimize.core.Manager" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manager.label', default: 'Manager')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-manager" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-manager" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="sex" title="${message(code: 'manager.sex.label', default: 'Sex')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'manager.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="contactNumber" title="${message(code: 'manager.contactNumber.label', default: 'Contact Number')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'manager.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="deleted" title="${message(code: 'manager.deleted.label', default: 'Deleted')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'manager.imageName.label', default: 'Image Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${managerInstanceList}" status="i" var="managerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${managerInstance.id}">${fieldValue(bean: managerInstance, field: "sex")}</g:link></td>
					
						<td>${fieldValue(bean: managerInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: managerInstance, field: "contactNumber")}</td>
					
						<td><g:formatDate date="${managerInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${managerInstance.deleted}" /></td>
					
						<td>${fieldValue(bean: managerInstance, field: "imageName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${managerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
