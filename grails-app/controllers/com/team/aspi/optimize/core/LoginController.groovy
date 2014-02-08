package com.team.aspi.optimize.core;

import org.springframework.dao.DataIntegrityViolationException;
import java.security.MessageDigest
import sun.misc.BASE64Encoder
class LoginController 
{
   //def userReviewHandlerService; 
   def login () 
   {
	printf("In login")
        if(!session.currentUser) 
        {
            printf("user not found...")
            render(view:'login')
        } 
        else 
        {
            printf("user found...");
            if(session.currentUser.userType == "MANAGER")
                redirect(action:'dashboard', controller:'manager')
            else if(params.userType == "SUPERVISOR")
                redirect(action:'dashboard', controller:'supervisor')
            else if(params.userType == "FIELD OPERATOR")    
                redirect(action:'dashboard', controller:'fieldOperator')
            return
        }
    }
    def doLogin () 
    {
            flash.message = null;
            def systemUser;
            log.info " params.userType : " + params.userType;
            if(params.userType == "MANAGER")
                systemUser = Manager.findByUsernameAndPassword(params.username, params.password.encodeAsPassword());
            else if(params.userType == "SUPERVISOR")    
                systemUser = Supervisor.findByUsernameAndPassword(params.username, params.password.encodeAsPassword());
            else if(params.userType == "FIELD OPERATOR")    
                systemUser = FieldOperator.findByUsernameAndPassword(params.username, params.password.encodeAsPassword());
            log.info " systemUser : " + systemUser;
            //session.welcome_name = user.welcome_name
            if (systemUser)
            {
                session.currentUser = systemUser;
                systemUser.lastLoginDate = new Date();
                systemUser.save();
                printf("index......")
                if(session.currentUser.userType == "MANAGER")
                    redirect(action:'dashboard', controller:'manager')
                else if(params.userType == "SUPERVISOR")
                    redirect(action:'dashboard', controller:'supervisor')
                else if(params.userType == "FIELD OPERATOR")    
                    redirect(action:'dashboard', controller:'fieldOperator')
                
            }
            else
            {
                flash.message = message(code: 'user.default.loginfailed.message')
                render(view: 'login', params: [error: true])
            }
            
    }
}
