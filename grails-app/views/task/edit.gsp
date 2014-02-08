<%@ page import="com.team.aspi.optimize.core.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <script type="text/javascript"
                  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqimr5C6BgygGI3SONI6TP0gnn8gb61JE&sensor=true">
                </script>
	</head>
	<body>
          
          
          <script type="text/javascript">
                  var  mapContainer = document.getElementById('taskLocationMap');
                  var dirContainer= document.getElementById('dir-container');
                  var map = null;
                  var geocoder = new google.maps.Geocoder();
                  var marker = null;
                  var myRules = 
                  [
                      "required,taskId,Please enter task id.",
                      "required,partyName,Please enter party name.",
                      "required,partyAddress,Please enter party address.",
                      "required,dueAmount,Please enter due amount.",
                      "required,penaltyAmount,Please enter penalty amount.",
                      "digits_only,dueAmount,Please enter valid due amount.",
                      "digits_only,penaltyAmount,Please enter valid penalty amount.",
                      "required,taskLatAndLong,Please validate party address on map using On Map button."
                  ];
                  jQuery(document).ready(function()
                  { 
                      $("#editTaskForm").RSV(
                      {
                          customErrorHandler: customErrorHandlerFunction,                          
                          rules:myRules
                      });
                      var yourStartLatLng = new google.maps.LatLng(${taskInstance.taskLatAndLong});
                      alert(yourStartLatLng);
                      var mapOptions = {
                        zoom: 12,
                        center: yourStartLatLng
                      };
                      map  = new google.maps.Map(document.getElementById('taskLocationMap'), mapOptions);
                      marker = new google.maps.Marker({
                          position: yourStartLatLng,
                          map: map,
                          title:$('#partyAddress').val()
                      });
                      $('#taskLatAndLong').val('');
                  });
                  
                  
                  function showMarker()
                  {
                      geocoder.geocode( { 'address': $('#partyAddress').val()}, function(results, status) {
                          if (status == google.maps.GeocoderStatus.OK) 
                          {
                            var mapOptions = {
                              zoom: 12,
                              center: results[0].geometry.location
                            };
                            map  = new google.maps.Map(document.getElementById('taskLocationMap'), mapOptions);
                            var location = results[0].geometry.location + "";
                            $('#taskLatAndLong').val(location.replace(" ",""));
                              map.setCenter(results[0].geometry.location);
                              marker = new google.maps.Marker({
                                  position: results[0].geometry.location,
                                  map: map,
                                  title:$('#partyAddress').val()
                              });
                          } 
                          else 
                          {
                               alert('Geocode was not successful for the following reason: ' + status);
                          }
                      });
                  }
          </script>
          
		<div id="page-wrapper">

                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Tasks <small>Edit task</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-font"></i> Tasks</li>
                        </ol>

                      </div>
                    </div>
                        
                 	<g:form method="post" name="editTaskForm">
				<g:hiddenField name="id" value="${taskInstance?.id}" />
				<g:hiddenField name="version" value="${taskInstance?.version}" />
				<fieldset class="form">
                                      <table style="width: 100%;">
                                          <tr >
                                              <td>
                                                  <g:render template="form"/>
                                              </td>
                                              <td style="width: 35px;"></td>
                                              <td>
                                                  <div style=" height: 430px; width: 500px;" id="taskLocationMap"></div>
                                              </td>
                                          </tr>
                                     </table>
				</fieldset>
				<fieldset class="buttons">
                                  <br/>
					<g:actionSubmit class="btn btn-block btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
