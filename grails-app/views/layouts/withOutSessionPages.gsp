<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Login-OptimTrack</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${resource(dir: 'css', file: 'bootstrap.css')}" rel="stylesheet">
                <link href="${resource(dir: 'css', file: 'sb-admin.css')}" rel="stylesheet">
                <link rel="stylesheet" href="${resource(dir: 'font-awesome/css/', file: 'font-awesome.min.css')}">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'datepickr.css')}" type="text/css">
    
                
                <script src="${resource(dir: 'js', file: 'jquery-1.7.2.min.js')}" type="text/javascript"></script>
                <script src="${resource(dir: 'js', file: 'jQValidationErrorDisplayFunction.js')}" type="text/javascript" ></script>
                <script src="${resource(dir: 'js', file: 'jquery.rsv-2.5.1.js')}" type="text/javascript"></script>
                 <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
                <script src="${resource(dir: 'js/morris', file: 'chart-data-morris.js')}"></script>
                <script src="${resource(dir: 'js/tablesorter', file: 'jquery.tablesorter.js')}"></script>
                <script src="${resource(dir: 'js/tablesorter', file: 'tables.js')}"></script>   
                <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
                <script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
                <g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		 <g:layoutBody/>
                
		<div style="text-align: right;">
                  
               <nav class="navbar navbar-fixed-bottom" >
                  <!-- Brand and toggle get grouped for better mobile display-->
                  
                  <ul class="nav navbar-nav navbar-right navbar-user">
                          <li class="dropdown user-dropdown">
                            <a style="padding-right: 50px; padding-bottom: 50px;" href="http://www.teamaspitants.com">powered by TEAMaspirants
                      </a>
                          </li>
                        </ul>
                </nav>
                </div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>