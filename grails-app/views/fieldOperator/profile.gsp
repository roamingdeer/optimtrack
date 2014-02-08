
<%@ page import="com.team.aspi.optimize.core.FieldOperator" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fieldOperator.label', default: 'FieldOperator')}" />
		<title><g:message code="FieldOperator Profile"  /></title>
                <parameter name="currentPage" value="FIELD OPERATOR" />
	</head>
	<body>
            <script type="text/javascript">
                  var  mapContainer = document.getElementById('userLocationMap');
                  var dirContainer= document.getElementById('dir-container');
                  var map = null;
                  var geocoder = new google.maps.Geocoder();
                  var marker = null;
                  var userData = ${todaysTasksWithLatLongList};
                  
                  
                  jQuery(document).ready(function()
                  { 
                      var yourStartLatLng = new google.maps.LatLng(18.36634251919618, 73.91894459724426);
                      $('#userLocationMap').gmap({'center': yourStartLatLng, zoom: 2})
                      .bind('init', function(event, map) {
                     
                      var marker, i;
                      var infowindow = new google.maps.InfoWindow({ 'content': 'TEXT_AND_HTML_IN_INFOWINDOW' });
                      //var infoBox = new google.maps.InfoBox();
                      
                      for (i = 0; i < userData.length; i++) 
                      {  
                          marker = new google.maps.Marker({
                            position: new google.maps.LatLng(userData[i][2], userData[i][3]),
                            map: map,
                            /*icon: {
                              path: google.maps.SymbolPath.CIRCLE,
                              strokeColor: "red",
                              scale: 3
                          },*/
        
                            animation: google.maps.Animation.DROP,
                            title:userData[i][0]
                          });
                          
                          google.maps.event.addListener(marker, 'click', (function(marker, i) {
                              return function() {
                                infowindow.setContent(userData[i][0] + '<br/> ' + userData[i][1]);
                                  infowindow.open(map, marker);
                              }
                          })(marker, i));

                          
                        };
                      });
                      
                });
          </script>
		 <div id="page-wrapper">

                    <div class="row">
                      <div class="col-lg-12">
                        <h1>Field Operators <small>Filed Operators profile</small></h1>
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-user"></i> Field Operators</li>
                        </ol>

                      </div>
                    </div>
                   <table style="width: 100%;">
                     <tr>
                       <td>
                     <div class="row">

                                    <g:if test="${fieldOperatorInstance?.fieldOperatorName}">
                                          <div class="col-lg-3">
                                            <div class="panel panel-success">
                                              <div class="panel-footer announcement-bottom">
                                                <div class="row">
                                                  <div class="col-xs-6">
                                                   Name: <g:fieldValue bean="${fieldOperatorInstance}" field="fieldOperatorName"/>
                                                  </div>
                                                  <div class="col-xs-6 text-right">

                                                  </div>
                                                </div>
                                              </div>
                                            </div> 
                                          </div>
                                    </g:if>

                                    <g:if test="${fieldOperatorInstance?.address}">
                                        <div class="col-lg-3">
                                            <div class="panel panel-success">
                                              <div class="panel-footer announcement-bottom">
                                                <div class="row">
                                                  <div class="col-xs-6">
                                                    Address : <g:fieldValue bean="${fieldOperatorInstance}" field="address"/>
                                                  </div>
                                                  <div class="col-xs-6 text-right">

                                                  </div>
                                                </div>
                                              </div>
                                            </div> 
                                          </div>
                                    </g:if>

                                    <g:if test="${fieldOperatorInstance?.contactNumber}">
                                        <div class="col-lg-3">
                                            <div class="panel panel-success">
                                              <div class="panel-footer announcement-bottom">
                                                <div class="row">
                                                  <div class="col-xs-6">
                                                   Contact No. : <g:fieldValue bean="${fieldOperatorInstance}" field="contactNumber"/>
                                                  </div>
                                                  <div class="col-xs-6 text-right">

                                                  </div>
                                                </div>
                                              </div>
                                            </div> 
                                          </div>
                                    </g:if>

                     </div>
                         <div class="row">
                                    <g:if test="${fieldOperatorInstance?.lastLoginDate}">
                                        <div class="col-lg-3">
                                            <div class="panel panel-success">
                                              <div class="panel-footer announcement-bottom">
                                                <div class="row">
                                                  <div class="col-xs-6">
                                                  Last Login Date :  <g:fieldValue bean="${fieldOperatorInstance}" field="lastLoginDate"/>
                                                  </div>
                                                  <div class="col-xs-6 text-right">

                                                  </div>
                                                </div>
                                              </div>
                                            </div> 
                                          </div>
                                    </g:if>


                                    
                                    <g:if test="${fieldOperatorInstance?.employeeId}">
                                        <div class="col-lg-3">
                                            <div class="panel panel-success">
                                              <div class="panel-footer announcement-bottom">
                                                <div class="row">
                                                  <div class="col-xs-6">
                                                   Employee Id:  <g:fieldValue bean="${fieldOperatorInstance}" field="employeeId"/>
                                                  </div>
                                                  <div class="col-xs-6 text-right">

                                                  </div>
                                                </div>
                                              </div>
                                            </div> 
                                          </div>
                                    </g:if>




                                    <g:if test="${fieldOperatorInstance?.sex}">
                                        <div class="col-lg-3">
                                            <div class="panel panel-success">
                                              <div class="panel-footer announcement-bottom">
                                                <div class="row">
                                                  <div class="col-xs-6">
                                                  Sex :  <g:fieldValue bean="${fieldOperatorInstance}" field="sex"/>
                                                  </div>
                                                  <div class="col-xs-6 text-right">

                                                  </div>
                                                </div>
                                              </div>
                                            </div> 
                                          </div>
                                    </g:if>
                         </div>
                        </td>
                        <td>
                            <div style="height: 350px; width: 350px;" id="userLocationMap"></div>
                        </td>
                      </tr>
                  </table>
                   <br/>
                      <g:render template="fieldOperatorStats"/>

			
		</div>
	</body>
</html>
