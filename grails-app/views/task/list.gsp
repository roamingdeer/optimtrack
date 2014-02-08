
<%@ page import="com.team.aspi.optimize.core.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                <parameter name="currentPage" value="TASK" />
	</head>
	<body>
          <script type="text/javascript">
                 /*
                jQuery(document).ready(function(){
                    jQuery('#tabTask').addClass('current');
                    jQuery('#createTask').removeClass();
                    jQuery('#divTaskList').show();
                    jQuery('#divCreateTask').hide();
                });
                
                jQuery('#tabTask').live('click',function(){
                    jQuery('#tabTask').addClass('current');
                    jQuery('#createTask').removeClass();
                    jQuery('#divTaskList').show();
                    jQuery('#divCreateTask').hide();
                });
                
                //for available tab
                jQuery('#createTask').live('click',function(){
                    
                    map  = new google.maps.Map(document.getElementById('taskLocationMap'), mapOptions);
                    jQuery('#tabTask').removeClass();
                    jQuery('#createTask').addClass('current');
                    jQuery('#divTaskList').hide();
                    jQuery('#divCreateTask').show();
                });*/
            
                
          </script>
		<div id="page-wrapper">
                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Tasks <small>Tasks created today</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-font"></i> Tasks</li>
                        </ol>

                      </div>
                    </div>
                    <ul class="nav nav-tabs nav-justified"> 
                        <li class="current"><g:link class="create" action="list">Task List</g:link></li>
                        <li  ><g:link class="create" action="create">Create Task</g:link></li>
                    </ul>
                              <table class="table table-bordered">
                                      <thead>
                                              <tr>
                                                      <th>#</th>
                                                      
                                                      <g:sortableColumn property="partyName" title="${message(code: 'task.partyName.label', default: 'Party Name')}" />

                                                      <g:sortableColumn property="partyAddress" title="${message(code: 'task.partyAddress.label', default: 'Party Address')}" />

                                                      <g:sortableColumn property="status" title="${message(code: 'task.status.label', default: 'Status')}" />

                                                      <g:sortableColumn property="completedOn" title="${message(code: 'task.completedOn.label', default: 'Completed On')}" />
                                                      
                                                      <g:sortableColumn property="assignedTo" title="${message(code: 'task.assignedTo.label', default: 'Assigned To')}" />

                                                      <th><g:message code="task.createdBy.label" default="Created By" /></th>

                                                      <g:sortableColumn property="dateCreated" title="${message(code: 'task.dateCreated.label', default: 'Date Created')}" />

                                                      <th></th>
                                                      
                                              </tr>
                                      </thead>
                                      <tbody>
                                      <g:each in="${taskInstanceList}" status="i" var="taskInstance">
                                              <tr >
                                                      <td>
                                                            ${i+1}
                                                      </td>
                                                      
                                                      <td>
                                                          ${fieldValue(bean: taskInstance, field: "partyName")}
                                                      </td>

                                                      <td>${fieldValue(bean: taskInstance, field: "partyAddress")}</td>

                                                      <td>${fieldValue(bean: taskInstance, field: "status")}</td>

                                                      <td><g:formatDate date="${taskInstance.completedOn}" /></td>

                                                      <td>${taskInstance.createdBy.supervisorName}</td>
                                                      
                                                      <td>${taskInstance.assignedTo.fieldOperatorName}</td>

                                                      <td><g:formatDate date="${taskInstance.dateCreated}" /></td>

                                                      <td>
                                                          <g:link class="btn btn-primary pull-right" action="details" id="${taskInstance.id}">Details</g:link>
                                                          <g:if test="${taskInstance.status != "COMPLETED"}">
                                                              <g:link class="btn btn-primary pull-right" action="edit" id="${taskInstance.id}">Edit</g:link>
                                                          </g:if>
                                                      </td>
                                              </tr>
                                      </g:each>
                                      </tbody>
                              </table>
                              <div class="pagination">
                                      <g:paginate total="${taskInstanceTotal}" />
                              </div>
                      </div>
	</body>
</html>
