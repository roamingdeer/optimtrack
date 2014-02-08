
<%@ page import="com.team.aspi.optimize.core.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title>Task Details</title>
                <parameter name="currentPage" value="TASK" />
	</head>
	<body>
		<div id="page-wrapper">

                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Tasks <small>Task details</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-font"></i> Tasks</li>
                        </ol>

                      </div>
                    </div>
			<div class="row">
                                <g:if test="${taskInstance?.taskId}">
                                  <div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Task Id :  <g:fieldValue bean="${taskInstance}" field="taskId"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
                                
				<g:if test="${taskInstance?.partyAddress}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                             Party Address : <g:fieldValue bean="${taskInstance}" field="partyAddress"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				<g:if test="${taskInstance?.partyName}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Party Name : <g:fieldValue bean="${taskInstance}" field="partyName"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				<g:if test="${taskInstance?.status}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Status : <g:fieldValue bean="${taskInstance}" field="status"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				<g:if test="${taskInstance?.completedOn}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Completed On :  <g:fieldValue bean="${taskInstance}" field="completedOn"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				
			
				<g:if test="${taskInstance?.dueAmount}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Due Amount : <g:fieldValue bean="${taskInstance}" field="dueAmount"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
                          
				<g:if test="${taskInstance?.penaltyAmount}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Penalty Amount : <g:fieldValue bean="${taskInstance}" field="penaltyAmount"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
                                <g:if test="${taskInstance?.collectedAmount}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                             Collected Amount : <g:fieldValue bean="${taskInstance}" field="collectedAmount"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
                          
                                <g:if test="${taskInstance?.createdBy}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Created By : ${taskInstance.createdBy.supervisorName}
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
                          
                                <g:if test="${taskInstance?.assignedTo}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Assigned To :  ${taskInstance.assignedTo.fieldOperatorName}
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				<g:if test="${taskInstance?.dateCreated}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                             Created On : <g:fieldValue bean="${taskInstance}" field="dateCreated"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
                          
				<g:if test="${taskInstance?.fieldOperatorComment}">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Field Operator Comment : <g:fieldValue bean="${taskInstance}" field="fieldOperatorComment"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				
				<g:if test="${taskInstance?.supervisorComment}">
				<li class="fieldcontain">
				<div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Supervisor Comment : <g:fieldValue bean="${taskInstance}" field="supervisorComment"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				
			
				<!--<g:if test="${taskInstance?.taskLatAndLong}">
				<li class="fieldcontain">
					<span id="taskLatAndLong-label" class="property-label"><g:message code="task.taskLatAndLong.label" default="Task Lat And Long" /></span>
					
						<span class="property-value" aria-labelledby="taskLatAndLong-label"><g:fieldValue bean="${taskInstance}" field="taskLatAndLong"/></span>
					
				</li>
				</g:if>-->
			
                        </div>
		</div>
	</body>
</html>
