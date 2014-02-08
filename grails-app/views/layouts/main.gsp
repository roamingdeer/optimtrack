<%@ page import="com.team.aspi.optimize.utils.UtilFunctions" %>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="description" content="">
                <meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
                
                <link href="${resource(dir: 'css', file: 'bootstrap.css')}" rel="stylesheet">
                <link href="${resource(dir: 'css', file: 'sb-admin.css')}" rel="stylesheet">
                <link rel="stylesheet" href="${resource(dir: 'font-awesome/css/', file: 'font-awesome.min.css')}">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'datepickr.css')}" type="text/css">
    
                
                <script src="${resource(dir: 'js', file: 'jquery-1.7.2.min.js')}" type="text/javascript"></script>
		<script src="${resource(dir: 'js', file: 'jquery-ui-1.9.1.custom.min.js')}" type="text/javascript"></script>
                <script src="${resource(dir: 'js', file: 'jqueryUI.js')}" type="text/javascript"></script>
                <script type="text/javascript" src="${resource(dir: 'js', file: 'googleMapKey.js')}"></script>
                <script src="${resource(dir: 'js', file: 'jquery.rsv-2.5.1.js')}" type="text/javascript"></script>
                <script src="${resource(dir: 'js', file: 'jQValidationErrorDisplayFunction.js')}" type="text/javascript" ></script>

                <script type="text/javascript"
                  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqimr5C6BgygGI3SONI6TP0gnn8gb61JE&sensor=true">
                </script>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="wrapper">

                    <!-- Sidebar -->
                    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                      <!-- Brand and toggle get grouped for better mobile display -->
                      <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                          <span class="sr-only">Toggle navigation</span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                        </button>
                        <a style="color: white;" class="navbar-brand" href="index.html">
                          TEAMaspirants OptimTrack
                      </div>

                      <!-- Collect the nav links, forms, and other content for toggling -->
                      <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav">
                          <li <g:if test="${pageProperty(name:'page.currentPage') == 'DASHBOARD'}">class="active"</g:if>><g:link class="create" controller="manager" action="dashboard"><i class="fa fa-dashboard"></i> Dashboard</g:link></li>
                          <li <g:if test="${pageProperty(name:'page.currentPage') == 'SUPERVISOR'}">class="active"</g:if>><g:link class="create" controller="supervisor" action="list"><i class="fa fa-user"></i> Supervisors</g:link></li>
                          <li <g:if test="${pageProperty(name:'page.currentPage') == 'FIELD OPERATOR'}">class="active"</g:if>><g:link class="create" controller="fieldOperator" action="list"><i class="fa fa-user"></i> Field Operators</g:link></li>
                          <li <g:if test="${pageProperty(name:'page.currentPage') == 'TASK'}">class="active"</g:if>><g:link class="create" controller="task" action="list"><i class="fa fa-font"></i> Tasks</g:link></li>
                          <li <g:if test="${pageProperty(name:'page.currentPage') == 'REPORT'}">class="active"</g:if>><g:link class="create" controller="report" action="generateReport"><i class="fa fa-bar-chart-o"></i> Reports</g:link></li>
                          <li><g:link class="create" controller="logout" action="logout"><i class="fa fa-power-off"></i> Logout</g:link></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right navbar-user">
                          <li class="dropdown user-dropdown">
                            <a style="color: white;" href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><b> ${UtilFunctions.getUserName(session?.currentUser)}</b> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                              <li><g:link class="create" controller="logout" action="logout"><i class="fa fa-power-off"></i> Log Out</g:link></li>
                            </ul>
                          </li>
                        </ul>
                      </div><!-- /.navbar-collapse -->
                    </nav>
      
                <g:layoutBody/>
                 
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
        <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
                <script src="${resource(dir: 'js/morris', file: 'chart-data-morris.js')}"></script>
                <script src="${resource(dir: 'js/tablesorter', file: 'jquery.tablesorter.js')}"></script>
                <script src="${resource(dir: 'js/tablesorter', file: 'tables.js')}"></script>   
                <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
                <script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
</html>