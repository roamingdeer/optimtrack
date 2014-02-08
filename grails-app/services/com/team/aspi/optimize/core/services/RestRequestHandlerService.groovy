package com.team.aspi.optimize.core.services;

import com.team.aspi.optimize.utils.RESTResponseTemplate;
import com.team.aspi.optimize.core.FieldOperator;
import grails.converters.JSON;

class RestRequestHandlerService {

    def serviceMethod() {

    }
    
    /**
    *  This method will validate all REST HTTP requests from clients and check if given
    *  session token from client is valid againts any of the user in the system 
    */
    def validateUserBySessionToken(def request)
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
                    log.error "Exception : RestRequestHandlerService  Invalid request format 1";
                    return null;
                }
                boolean flag = true;
                def userFromDB = FieldOperator.findBySessionToken(jsonRequestObject.header.sessionToken)
                if(userFromDB)//check if given sessionToken is valid
                {
                    return userFromDB;
                }
                else//device(user) sending this request is not valid
                {
                    log.info  "RestRequestHandlerService : Invalid session token";
                    return null;
                }
            } 
            else 
            {
                log.info "RestRequestHandlerService : Invalid request format 2";
                return null;
            }
                    
        }
        catch(Exception e)
        {
            log.error "Exception : RestRequestHandlerService " + e;
            return null;
        }
    }
}
