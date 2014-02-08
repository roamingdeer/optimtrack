package com.team.aspi.optimize.core.rest;

import grails.converters.JSON;
import com.team.aspi.optimize.core.*;
import com.team.aspi.optimize.utils.*;
class RESTFieldOperatorController 
{
    def restRequestHandlerService;
    def jsonRequestObject; 
    def responseTemplate = new RESTResponseTemplate()
    /**
     * This meathod creates a personal text message
     */
    def updateCurrentLocation()
    {
        try
        {
            def fieldOperatorFromDB = restRequestHandlerService.validateUserBySessionToken(request);
            if(fieldOperatorFromDB)//check if given sessionToken is valid
            {
                fieldOperatorFromDB.currentLocationLatAndLong = jsonRequestObject.payload.locationInfo.currentLocationLatAndLong;
                if(fieldOperatorFromDB.save())
                {
                    responseTemplate.header = ["status":["code":"SUCCESS","msg":"Location updaetd"]];
                }
                else
                    responseTemplate.header = ["status":["code":"RECORD_NOT_UPDATED","msg":"Error in updating record!"]];

                log.info  "RESTTasckController : request processed successfully"; 
                responseTemplate.payload =  [];  
                render responseTemplate as JSON;
                return;
            }
            else//device(user) sending this request is not valid
            {
                log.info  "RESTTasckController : Invalid session token";
                responseTemplate.header =  ["status":["code":"INVALID_CREDENTIALS","msg":"Invalid sessiontoken!"]];
                responseTemplate.payload =  [];           
                render responseTemplate as JSON;
                return;
            }
        }
        catch(Exception e)
        {
            log.error "Exception : RESTTasckController " + e;
            responseTemplate.header =  ["status":["code":"FAILED","msg":"Invalid request!"]];
            responseTemplate.payload = [];
            render responseTemplate  as JSON;
            return;
        }
    }
    
   
}
