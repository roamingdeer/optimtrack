<html >
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="withOutSessionPages">
    <title><g:message code="user.default.LoginPageTitle.message"/></title>

  </head>
<body>
     <script type="text/javascript">
          var myRules = 
          [
              "required,username,Please enter username.",
              "required,password,Please enter password."
          ];
          //page load operations
           $(document).ready(function()
           {      
              
              $("#loginForm").RSV(
              {
                  customErrorHandler: customErrorHandlerFunction,                          
                  rules:myRules
              });
            });
      </script>      
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
              <!--<img src="${resource(dir: 'images', file: 'teamAspiLogo.png')}" height="25%" width="25%">-->
          </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <!-- /.navbar-collapse -->
      </nav>
<g:form action="doLogin" method="post" controller="login" name="loginForm">
  <div id="page-wrapper">
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-4" >
			    <div id="login">
                              <div class="panel panel" style="color: black;">
					<div class="panel-heading">
						<h3 class="panel-title text-center">System Login</h3>
					</div>
					<div class="panel-body">
                                              <div class="form-group">
                                                <g:select class="form-control" name="userType" type="text" from="${["MANAGER","SUPERVISOR","FIELD OPERATOR"]}" />

                                              </div>
                                              <div class="form-group">
                                                      <input class="form-control"  id="username"  type='text' name='username'  placeholder="Username"/>
                                                      <div id="_error" name="username_error" class="hintMsg" ></div>
                                              </div>
                                              <div class="form-group">
                                                      <input class="form-control" id="password" type='password' name='password' placeholder="Password"/>
                                                      <div id="password_error" name="password_error" class="hintMsg" ></div>
                                              </div>
                                              
                                              <button type="submit" class="btn btn-block btn-primary">Submit</button>
					</div>
				</div>
			</div>
			</div>
		    <div class="col-md-4">
                     
		    </div>
		</div>
		
    </div>
</g:form>


  
</body>
</html>