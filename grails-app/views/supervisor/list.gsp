
<%@ page import="com.team.aspi.optimize.core.Supervisor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'supervisor.label', default: 'Supervisor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                <parameter name="currentPage" value="SUPERVISOR" />
	</head>
	<body>
               <div id="page-wrapper">
                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Supervisor <small>Supervisors in your system</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-font"></i> Supervisor</li>
                        </ol>

                      </div>
                    </div>
                    <ul class="nav nav-tabs nav-justified"> 
                        <li class="current"><g:link class="create" action="list">Supervisor List</g:link></li>
                        <li  ><g:link class="create" action="create">Create Supervisor</g:link></li>
                    </ul>
                 <table class="table table-bordered">
                                              <thead>
                                                      <tr>
                                                              <th>#</th>
                                                              
                                                              <g:sortableColumn property="supervisorName" title="${message(code: 'supervisor.supervisorName.label', default: 'Name')}" />

                                                              <g:sortableColumn property="address" title="${message(code: 'supervisor.address.label', default: 'Address')}" />

                                                              <g:sortableColumn property="contactNumber" title="${message(code: 'supervisor.contactNumber.label', default: 'Contact Number')}" />

                                                              <g:sortableColumn property="employeeId" title="${message(code: 'supervisor.employeeId.label', default: 'Employee Id')}" />

                                                              <g:sortableColumn property="lastLoginDate" title="${message(code: 'supervisor.lastLoginDate.label', default: 'Last Login Date')}" />

                                                              <th></th>
                                                      </tr>
                                              </thead>
                                              <tbody>
                                              <g:each in="${supervisorInstanceList}" status="i" var="supervisorInstance">
                                                      <tr >

                                                              <td>
                                                                    ${i+1}
                                                              </td>

                                                              <td>${fieldValue(bean: supervisorInstance, field: "supervisorName")}</td>

                                                              <td>${fieldValue(bean: supervisorInstance, field: "address")}</td>

                                                              <td>${fieldValue(bean: supervisorInstance, field: "contactNumber")}</td>

                                                              <td>${fieldValue(bean: supervisorInstance, field: "employeeId")}</td>

                                                              <td>${fieldValue(bean: supervisorInstance, field: "lastLoginDate")}</td>

                                                              <td>
                                                                  <g:link class="btn btn-primary pull-right" action="profile" id="${supervisorInstance.id}">Profile</g:link>
                                                                  <!--<g:link action="edit" id="${supervisorInstance.id}">Edit</g:link>-->
                                                              </td>
                                                      </tr>
                                              </g:each>
                                              </tbody>
                                      </table>
                                      <div class="pagination">
                                              <g:paginate total="${supervisorInstanceTotal}" />
                                      </div>
              </div>
	</body>
</html>
