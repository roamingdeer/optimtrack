
<%@ page import="com.team.aspi.optimize.core.Supervisor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'supervisor.label', default: 'Supervisor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <parameter name="currentPage" value="SUPERVISOR" />
	</head>
	<body>
		<div id="page-wrapper">

                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Supervisor <small>Supervisor profile</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-user"></i> Supervisor</li>
                        </ol>

                      </div>
                    </div>
                  <div class="row">
                                <g:if test="${supervisorInstance?.supervisorName}">
                                    <div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Name :  <g:fieldValue bean="${supervisorInstance}" field="supervisorName"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
                          
				<g:if test="${supervisorInstance?.address}">
                                    <div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Address :   <g:fieldValue bean="${supervisorInstance}" field="address"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				<g:if test="${supervisorInstance?.contactNumber}">
                                      <div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Contact No. :  <g:fieldValue bean="${supervisorInstance}" field="contactNumber"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				<g:if test="${supervisorInstance?.employeeId}">
                                    <div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Employee Id : <g:fieldValue bean="${supervisorInstance}" field="employeeId"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
				
			
				<g:if test="${supervisorInstance?.lastLoginDate}">
                                    <div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Last Login Date :  <g:fieldValue bean="${supervisorInstance}" field="lastLoginDate"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
			
				<g:if test="${supervisorInstance?.sex}">
                                     <div class="col-lg-3">
                                      <div class="panel panel-success">
                                        <div class="panel-footer announcement-bottom">
                                          <div class="row">
                                            <div class="col-xs-6">
                                            Sex : <g:fieldValue bean="${supervisorInstance}" field="sex"/>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div> 
                                    </div>
				</g:if>
			
						</div>
                                <g:render template="supervisorStats"/>
		</div>
	</body>
</html>
