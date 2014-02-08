<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fieldOperator.label', default: 'Report')}" />
		<title>Report</title>
                <script src="${resource(dir: 'js', file: 'datepickr.min.js')}" type="text/javascript"></script> 
                <parameter name="currentPage" value="REPORT" />
	</head>
	<body>
           <script type="text/javascript">
                  //page load operations
                 $(document).ready(function()
                 {      
                     var date = new Date();
                     setSearchParamsOnPageLoad();
                     new datepickr('dateFrom', {
                           'dateFormat': 'Y-d-m'
                     });
                 });

                 function customErrorHandlerFunction(f, errorInfo)
                 {
                         if(errorInfo.length > 0)         
                         {
                           document.getElementById("errMsg").innerHTML = errorInfo[0][1];
                           return false;
                         }
                         else{
                           document.getElementById("errMsg").innerHTML = "";              
                           return true;
                         }

                 }
                 //set date values when page is loaded
                 function setSearchParamsOnPageLoad()
                 {
                       var date = new Date();
                       var previousDate = new Date()-1;
                       jQuery( "#dateFrom" ).datepicker("setDate", previousDate);
                       $('#dateFrom').val($.datepicker.formatDate('yy-dd-mm', date));
                       //$('#dateTo').val($.datepicker.formatDate('yy-dd-mm', date));
                       //alert(date);
                 }
                 //validate date range entered for filtration, To date should not be less than From date
                 //
                 function dateRangeValid()
                 {
                     var fromDate = $.datepicker.parseDate( "yy-dd-mm", $('#dateFrom').val());
                     //var toDate = $.datepicker.parseDate( "yy-dd-mm", $('#dateTo').val());

                     if(toDate < fromDate)
                     {
                           //alert("Invalid date range, To date should not be less than From date.");
                           document.getElementById("errMsg").innerHTML = "Invalid date range, To date should not be less than From date.";
                           return false;
                     }
                     document.getElementById("errMsg").innerHTML = "";
                     return true;
                 }

                 //This function is called for Searching any record
                 function generateReport() 
                 {
                     //if(dateRangeValid())
                     {
                         //get the value of text entered for Searching
                         $fromDate =  $('#dateFrom').val();
                      //   $toDate =  $('#dateTo').val();
                         //alert("${createLink(controller:"report", action:"getReportData")}?fromDate=" + escape($fromDate) + "&toDate=" + escape($toDate));
                         $('#reportStatsDiv').load("${createLink(controller:"report", action:"getReportData")}?fromDate=" + escape($fromDate));
                         // + "&toDate=" + escape($toDate)
                     }
                     
                     
                 }
        </script>
		<div id="page-wrapper">

                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Report <small>Generate report by date</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-bar-chart-o"></i> Report</li>
                        </ol>

                      </div>
                    </div>
                 
                          <div align="center">
                            <div>
                                <label >
                                  Select Date
                                </label >
                            </div>
                                <input type="text" class="form-control"  id="dateFrom" class="textField1" name="dateFrom" style="width:15%;"/>&nbsp;
<!--
                                <label>
                                  To
                                </label> 
                                <input type="text" readonly="true" id="dateTo" class="textField1" name="dateTo" style="width:15%;" />&nbsp;&nbsp;&nbsp;

                                <label for="createdBy">
                                        <g:message code="task.createdBy.label" default="Created By" />
                                        <span class="required-indicator">*</span>
                                </label>
                                <g:select id="createdBy" name="createdBy.id" from="${com.team.aspi.optimize.core.Supervisor.list()}" optionValue="supervisorName" optionKey="id" required="" value="${taskInstance?.createdBy?.id}" class="many-to-one"/>

                                <label for="createdBy">
                                         <g:message code="task.createdBy.label" default="Assigned To" />
                                         <span class="required-indicator">*</span>
                                 </label>
                                 <g:select id="assignedTo" name="assignedTo.id" from="${com.team.aspi.optimize.core.FieldOperator.list()}" optionValue="fieldOperatorName" optionKey="id" required="" value="${taskInstance?.assignedTo?.id}" class="many-to-one"/>
-->
                                <div id="errMsg" class="errorMsg"></div>
                                <input type="button" class="btn btn-block btn-primary" name="getReport" onclick="generateReport()"  value="Generate Report" />
                                                                <br/><br/>

                                                                <div id="reportStatsDiv">
                                    <g:render template="reportData"/>
                                </div>
                          </div>
			
		</div>
	</body>
</html>
