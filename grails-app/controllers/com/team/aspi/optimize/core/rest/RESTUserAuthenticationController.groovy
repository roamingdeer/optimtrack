package com.team.aspi.optimize.core.rest;

import grails.converters.JSON;
import com.team.aspi.optimize.utils.RESTResponseTemplate;
import com.team.aspi.optimize.core.FieldOperator;
import java.util.UUID;

class RESTUserAuthenticationController {

    def userLogin()
    {
        log.info "in method";
            def jsonRequestObject 
            def responseTemplate = new RESTResponseTemplate()
            try
            {
		//Check if request type in JSON
		if(request.format == 'json')
                {
                    try
                    {
                            jsonRequestObject = request.JSON
                    }
                    catch(Exception e)
                    {
                            log.error "Exception : RESTUserAuthenticationController  Invalid request format 1";
                            responseTemplate.header =  ["status":["code":"INVALID_REQUEST_DATA","msg":"Invalid request!"]]
                            responseTemplate.payload = [];
                            render responseTemplate as JSON	
                    }
                    //String password
                    //TODO Proper encryption meathod
                    FieldOperator user = FieldOperator.findByUsernameAndPassword(jsonRequestObject.payload.username,jsonRequestObject.payload.password);
                    if(user)//if user found in DB
                    {
                            HashMap<String,String> payload = new HashMap<String,String>();
                            user.sessionToken = UUID.randomUUID();
                            user.lastLoginDate = new Date();
                            if(user.save())
                            {
                                responseTemplate.header = ["status":["code":"SUCCESS","msg":"User Found"]]
                                responseTemplate.payload = ["sessionToken" : user.sessionToken];
                            }
                            else
                            {
                                responseTemplate.header = ["status":["code":"DB_UPDATE_ERROR","msg":"User Found"]]	
                                responseTemplate.payload = []; 
                            }
                            
                            render responseTemplate as JSON;
                            return;
                    }
                    else
                    {
                            responseTemplate.header =  ["status":["code":"UNAUTHORIZED","msg":"User Not found!"]]
                            responseTemplate.payload = [];
                            render responseTemplate as JSON;
                            return;
                    }
                } 
                else 
                {
                    log.info "RESTUserAuthenticationController : Invalid request format 2";
                    responseTemplate.header =  ["status":["code":"FAILED","msg":"Cannot preocess your request!"]];
                    responseTemplate.payload = [];
                    render responseTemplate as JSON;
                    return;
                }
                
            }
            catch(Exception e)
            {
                printf("Exception : " + e);
                responseTemplate.header =  ["status":["code":"FAILED","msg":"Invalid request!"]];
                responseTemplate.payload = [];
                render responseTemplate as JSON;
                return;
            }     
	}
        
    
    def userLogout()
    {
    	def jsonRequestObject 
    	def responseTemplate = new RESTResponseTemplate()
        try
        {
            //if request type is JSON
            if(request.format == 'json')
            {
                    try
                    {
                            jsonRequestObject = request.JSON
                    }
                    catch(Exception e)
                    {
                            log.error "Exception : RESTLogoutController  Invalid request format 1";
                            responseTemplate.header =  ["status":["code":"FAILED","msg":"Incorrect foramt!"]];
                            responseTemplate.payload = [];
                            render responseTemplate as JSON;
                            return;
                    }
                    boolean flag = true;
                    log.info "Session Token from request : " + jsonRequestObject.header.sessionToken;
                    def fieldOperatorFromDB = FieldOperator.findBySessionToken(jsonRequestObject.header.sessionToken)
                    if(fieldOperatorFromDB)//check if given sessionToken is valid
                    {
                            fieldOperatorFromDB.sessionToken = null;
                            if(fieldOperatorFromDB.save())//if the record is updated
                                    responseTemplate.header = ["status":["code":"SUCCESS","msg":"User signed out"]]
                            else
                                    responseTemplate.header = ["status":["code":"DB_UPDATE_ERROR","msg":"Cannot Update!"]];
                            
                            responseTemplate.payload = [];        
                            log.info  "RESTLogoutController : request preocessed successfully : " + fieldOperatorFromDB.sessionToken;        
                            render responseTemplate as JSON;
                            return;
                    }
                    else//device(user) sending this request is not valid
                    {
                            log.info  "RESTLogoutController : Invalid session token";
                            responseTemplate.header =  ["status":["code":"FAILED","msg":"Invalid sessiontoken!"]];
                            responseTemplate.payload = [];
                            render responseTemplate as JSON;
                            return;
                    }
            } 
            else 
            {
                    log.info "RESTLogoutController : Invalid request format 2";
                    responseTemplate.header =  ["status":["code":"FAILED","msg":"Cannot preocess your request!"]];
                    responseTemplate.payload = [];
                    render responseTemplate as JSON;
                    return;
            }
                    
        }
        catch(Exception e)
        {
            log.error "Exception : in RESTLogoutController " + e;
            responseTemplate.header =  ["status":["code":"FAILED","msg":"Invalid request!"]]
            responseTemplate.payload = [];
            render responseTemplate as JSON;
            return;
        }
	 	
    }
}
