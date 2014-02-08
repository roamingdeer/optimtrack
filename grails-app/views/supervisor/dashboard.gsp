<%@ page import="com.team.aspi.optimize.core.Supervisor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manager.label', default: 'Supervisor')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <parameter name="currentPage" value="DASHBOARD" />
	</head>
	<body>
		<div id="page-wrapper">

                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Dashboard <small>Statistics Overview</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-dashboard"></i> Dashboard</li>
                        </ol>

                      </div>
                    </div>
			
                        <g:render template="supervisorStats"/>
		</div>
	</body>
</html>
