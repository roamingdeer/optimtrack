
<%@ page import="com.team.aspi.optimize.core.FieldOperator" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fieldOperator.label', default: 'FieldOperator')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                <parameter name="currentPage" value="FIELD OPERATOR" />
	</head>
	<body>
          
		  
                <div id="page-wrapper">

                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Field Operators <small>Filed Operators in your system</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-user"></i> Field Operators</li>
                        </ol>

                      </div>
                    </div>
                    <ul class="nav nav-tabs nav-justified"> 
                        <li class="current"><g:link class="create" action="list">Field Operator List</g:link></li>
                        <li  ><g:link class="create" action="create">Create Field Operator</g:link></li>
                    </ul>
                              <table class="table table-bordered">
                                      <thead>
                                              <tr>
                                                      <th>#</th>
                                                
                                                      <g:sortableColumn property="fieldOperatorName" title="${message(code: 'fieldOperator.fieldOperatorName.label', default: 'Name')}" />

                                                      <g:sortableColumn property="address" title="${message(code: 'fieldOperator.address.label', default: 'Address')}" />

                                                      <g:sortableColumn property="contactNumber" title="${message(code: 'fieldOperator.contactNumber.label', default: 'Contact Number')}" />

                                                      <g:sortableColumn property="lastLoginDate" title="${message(code: 'fieldOperator.lastLoginDate.label', default: 'Last Login Date')}" />

                                                      <g:sortableColumn property="createdBy" title="${message(code: 'fieldOperator.createdBy.label', default: 'Created By')}" />
                                                      
                                                      <th></th>

                                              </tr>
                                      </thead>
                                      <tbody>
                                      <g:each in="${fieldOperatorInstanceList}" status="i" var="fieldOperatorInstance">
                                              <tr >
                                                      <td>
                                                            ${i+1}
                                                      </td>
                                                
                                                      <td>
                                                            ${fieldOperatorInstance.fieldOperatorName}
                                                      </td>

                                                      <td>${fieldValue(bean: fieldOperatorInstance, field: "address")}</td>

                                                    
                                                      <td>${fieldValue(bean: fieldOperatorInstance, field: "contactNumber")}</td>

                                                     
                                                      <td>${fieldValue(bean: fieldOperatorInstance, field: "lastLoginDate")}</td>
                                                      
                                                      <td>${fieldOperatorInstance.createdBy?.supervisorName}</td>

                                                      <td>                                                            
                                                          <g:link class="btn btn-primary pull-right" action="profile" id="${fieldOperatorInstance.id}">Profile</g:link>
                                                          <!--<g:link action="edit" id="${fieldOperatorInstance.id}">Edit</g:link>-->
                                                      </td>    
                                              </tr>
                                      </g:each>
                                      </tbody>
                              </table>
                              <div class="pagination">
                                      <g:paginate total="${fieldOperatorInstanceTotal}" />
                              </div>
                      </div>
                
                
	</body>
</html>
