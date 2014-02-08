package com.team.aspi.optimize.core.rest;

import grails.converters.JSON;
import com.team.aspi.optimize.core.*;
import com.team.aspi.optimize.utils.*;
class RESTTaskController 
{
    def restRequestHandlerService;
    def jsonRequestObject; 
    def responseTemplate = new RESTResponseTemplate()
    /**
     * This meathod creates a personal text message
     */
    def updateTask()
    {
        try
        {
            def fieldOperatorFromDB = restRequestHandlerService.validateUserBySessionToken(request);
            if(fieldOperatorFromDB)//check if given sessionToken is valid
            {
                jsonRequestObject = request.JSON
                Task taskFromDB = Task.get(jsonRequestObject.payload.taskInfo.id);
                if(taskFromDB)
                {
                    taskFromDB.status = jsonRequestObject.payload.taskInfo.status;
                    taskFromDB.fieldOperatorComment = jsonRequestObject.payload.taskInfo.fieldOperatorComment;
                    taskFromDB.collectedAmount = Double.parseDouble(jsonRequestObject.payload.taskInfo.collectedAmount);
                    if(taskFromDB.status.equals("COMPLETED"))
                        taskFromDB.completedOn = new Date();
                    taskFromDB.save();
                    responseTemplate.header = ["status":["code":"SUCCESS","msg":"Task Updated!"]];
                }
                else
                    responseTemplate.header = ["status":["code":"RECORD_NOT_FOUND","msg":"Task Not Found!"]];

                log.info  "RESTTaskController : request preocessed successfully"; 
                responseTemplate.payload =  [];  
                render responseTemplate as JSON;
                return;
            }
            else//device(user) sending this request is not valid
            {
                log.info  "RESTTaskController : Invalid session token";
                responseTemplate.header =  ["status":["code":"INVALID_CREDENTIALS","msg":"Invalid sessiontoken!"]];
                responseTemplate.payload =  [];           
                render responseTemplate as JSON;
                return;
            }
        }
        catch(Exception e)
        {
            log.error "Exception : RESTTaskController " + e;
            responseTemplate.header =  ["status":["code":"FAILED","msg":"Invalid request!"]];
            responseTemplate.payload = [];
            render responseTemplate  as JSON;
            return;
        }
    }
    
   
    /**
    *  Returns all personal messages for a given User
    */
    def getAllTasks() 
    { 
        def responseTemplate = new RESTResponseTemplate();
        try
        {
            def fieldOperatorFromDB = restRequestHandlerService.validateUserBySessionToken(request);
            if(fieldOperatorFromDB)//check if given sessionToken is valid
            {
                def taskCriteria = Task.createCriteria();
                def totalTasksToday = taskCriteria.list{
                    ge('dateCreated', UtilFunctions.setDateDetails(new Date(), 23, 59, 59, -1))
                    lt('dateCreated', UtilFunctions.setDateDetails(new Date(), 0, 0, 0, 1))
                    eq("createdBy", fieldOperatorFromDB)
                };
                log.info "totalTasksToday : " + totalTasksToday;
                if(totalTasksToday.size() > 0)//if the record is updated
                {
                    def totalTasksTodayDetails = totalTasksToday.collect{taskObj->
                        return [id:taskObj.id, taskId:taskObj.taskId, partyName: taskObj.partyName, partyAddress:taskObj.partyAddress,
                            dueAmount: taskObj.dueAmount, penaltyAmount: taskObj.penaltyAmount, collectedAmount:taskObj.collectedAmount,
                            status: taskObj.status, fieldOperatorComment: taskObj.fieldOperatorComment, supervisorComment: taskObj.supervisorComment,
                            taskLatAndLong: taskObj.taskLatAndLong?taskObj.taskLatAndLong:"", completedOn : taskObj.completedOn, createdBy : taskObj.createdBy.supervisorName,
                            assignedTo: taskObj.assignedTo.fieldOperatorName] 
                    }
                    responseTemplate.header = ["status":["code":"SUCCESS","msg":"Tasks Found!"]];
                    responseTemplate.payload = ["taskList" : totalTasksTodayDetails];
                }
                else
                {
                    responseTemplate.header = ["status":["code":"NO_DATA_FOUND","msg":"No Tasks found!"]];
                    responseTemplate.payload =  ["taskList" : []];
                }
                log.info  "RESTTaskController : request preocessed successfully";        
                render responseTemplate as JSON;
                return;
                //render "1";
            }
            else//device(user) sending this request is not valid
            {
                log.info  "RESTTaskController : Invalid session token";
                responseTemplate.header =  ["status":["code":"INVALID_CREDENTIALS","msg":"Invalid sessiontoken!"]];
                responseTemplate.payload =  [];
                render responseTemplate as JSON;
                return;
            }
        }
        catch(Exception e)
        {
            log.error "Exception : RESTTaskController " + e;
            responseTemplate.header =  ["status":["code":"FAILED","msg":"Invalid request!"]];
            responseTemplate.payload =  [];
            render responseTemplate as JSON;
            return;
        }
    }
}
