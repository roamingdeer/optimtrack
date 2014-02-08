<%@ page import="com.team.aspi.optimize.core.FieldOperator" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fieldOperator.label', default: 'FieldOperator')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
                <parameter name="currentPage" value="FIELD OPERATOR" />
	</head>
	<body>
        <script type="text/javascript">
                var myRules = 
                [
                    "required,fieldOperatorName,Please enter field oparator name.",
                    "required,address,Please enter address.",
                    "digits_only,contactNumber,Please enter valid contact number.",
                    "length=10,contactNumber,Please enter valid 10 digit contact number.",
                    "required,employeeId,Please enter employee id.",
                    "required,sex,Please select sex.",
                    "required,username,Please enter username.",
                    "length=6-10,username,Username must be between 6-10 characters.",
                    "required,password,Please enter password.",
                    "length=6-10,password,Password must be between 6-10 characters."
                ];
                
                //for available tab
                jQuery('document').ready(function(){
                    $("#createFieldOperatorForm").RSV(
                    {
                        customErrorHandler: customErrorHandlerFunction,                          
                        rules:myRules
                    });
                });
            
          </script>
		<div id="page-wrapper">

                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Field Operators <small>Create Filed Operator</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-user"></i> Field Operators</li>
                        </ol>

                      </div>
                    </div>
                    <ul class="nav nav-tabs nav-justified"> 
                        <li ><g:link class="create" action="list">Field Operator List</g:link></li>
                        <li  class="current"><g:link class="create" action="list">Create Field Operator</g:link></li>
                    </ul>
			
			<g:form action="save" name="createFieldOperatorForm" >
                              <fieldset class="form">
                                <div class="form-group">
                                      <g:render template="form"/>
                                </div>
                              </fieldset>
                              <fieldset class="buttons">
                                      <g:submitButton name="create" class="btn btn-block btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                              </fieldset>
                        </g:form>
		</div>
	</body>
</html>
