package com.team.aspi.optimize.filters;

class SecurityFilters {

    def filters = 
    {  
    		//println("======" /*+ controllerName*/)
                         
    		loginCheck(uriExclude:"/rest/**", find: true)
		{ 
            	   before = 
                   {                     
            		if(!session.currentUser)
                        {
                            //log.info "FIlter......" + session.currentUser;
                            if (request.getHeader('X-Requested-With')?.equals('XMLHttpRequest')) 
                            {
                                println("catch ajax request!!!")
                                response.status = 401;
                                return false
                            }

                            if(actionName != 'login' && actionName != 'doLogin' )
                            {
                                log.info "FIlter......" + session.currentUser;
                                session.loginFlag = '2';
                                redirect(controller:'login',action:'login')
                            }
                            return;
                        }
               			 
                   }
                     
                }
                
                //user access check
                userAccessCheck(uriExclude:"/rest/**", find: true)
		{ 
            	   before = 
                   {                     
            		if(session.currentUser)
                        {
                            
                            //manager pages can be accessed by manager only
                            if(controllerName == 'manager' && session?.currentUser?.userType != "MANAGER" )
                            {   
                                if(session?.currentUser?.userType.equals("SUPERVISOR"))
                                    redirect(controller:'supervisor',action:'dashboard')
                                else
                                    redirect(controller:'fieldOperator',action:'dashboard')
                                return;
                            }
                            
                            //Reports are accessible to Manager only
                            if(controllerName == 'report' && actionName == 'generateReport' && session?.currentUser?.userType != "MANAGER" )
                            {   
                                if(session?.currentUser?.userType.equals("SUPERVISOR"))
                                    redirect(controller:'supervisor',action:'dashboard')
                                else
                                    redirect(controller:'fieldOperator',action:'dashboard')
                                return;
                            }
                            
                            //Manager & Field Operator cannot create Task
                            if(controllerName == 'task' && actionName == 'create' && session?.currentUser?.userType != "SUPERVISOR" )
                            {   
                                if(session?.currentUser?.userType.equals("MANAGER"))
                                    redirect(controller:'supervisor',action:'dashboard')
                                else
                                    redirect(controller:'fieldOperator',action:'dashboard')
                                return;
                            }
                            if(controllerName == 'supervisor' && actionName == 'dashboard' && session?.currentUser?.userType != "SUPERVISOR" )
                            {   
                                if(session?.currentUser?.userType.equals("MANAGER"))
                                {    
                                    redirect(controller:'manager',action:'dashboard');
                                    return;
                                }
                                    
                                else
                                {
                                    redirect(controller:'fieldOperator',action:'dashboard')
                                }
                                return;
                            }
                            //Supervisor cannot create Supervisor, only Manager can create it
                            if(controllerName == 'supervisor' && (actionName == 'create' || actionName == 'list') && session?.currentUser?.userType != "MANAGER" )
                            {   
                                if(session?.currentUser?.userType.equals("SUPERVISOR"))
                                    redirect(controller:'supervisor',action:'dashboard')
                                else
                                    redirect(controller:'fieldOperator',action:'dashboard')
                                return;
                            }
                            /*
                            //Supervisor pages can be accessed by manager only
                            if(controllerName == 'supervisor' && session?.currentUser?.userType != "MANAGER" )
                            {   
                                if(session?.currentUser?.userType.equals("SUPERVISOR"))
                                    redirect(controller:'supervisor',action:'dashboard')
                                else
                                    redirect(controller:'fieldOperator',action:'dashboard')
                            }*/
                            //Field Operator cannot create Field Operator only Supervisor can create it
                            if(controllerName == 'fieldOperator' && actionName == 'create' && session?.currentUser?.userType != "SUPERVISOR" )
                            {   
                                if(session?.currentUser?.userType.equals("MANAGER"))
                                    redirect(controller:'manager',action:'dashboard')
                                else
                                    redirect(controller:'fieldOperator',action:'dashboard')
                                return;    
                            }
                            //Field Operator cannot see all Field Operators only Supervisor and Manager can create it
                            if(controllerName == 'fieldOperator' && actionName == 'list' && session?.currentUser?.userType == "FIELD OPERATOR" )
                            {   
                                redirect(controller:'fieldOperator',action:'dashboard')
                                return;
                            }
                            
                            //Field Operator can only see his dashbaord
                            if(controllerName == 'fieldOperator' && actionName == 'dashboard' && session?.currentUser?.userType != "FIELD OPERATOR" )
                            {   
                                if(session?.currentUser?.userType.equals("MANAGER"))
                                    redirect(controller:'manager',action:'dashboard')
                                else
                                    redirect(controller:'supervisor',action:'dashboard')
                                return;
                            }
                            /*
                            //field operator can view only his profile
                            if(controllerName == 'fieldOperator' && actionName == 'profile' && session?.currentUser?.userType == "FIELD OPERATOR" )
                            {   
                                log.info " Id : " + idName;
                                redirect(controller:'fieldOperator',action:'dashboard')
                            }*/
                            return;
                        }
               			 
                   }
                     
                }
                
             
             
          
     }  
}
