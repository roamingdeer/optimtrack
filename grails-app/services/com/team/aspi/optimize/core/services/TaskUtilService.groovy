package com.team.aspi.optimize.core.services

import com.team.aspi.optimize.utils.UtilFunctions;
import com.team.aspi.optimize.core.*;
class TaskUtilService {

    def serviceMethod() {

    }
    
    def getTaskFroFieldOperator(FieldOperator currentUser)
    {
        
        def filteredRecords = getTodaysTask(currentUser);
        def todaysTasksList = filteredRecords.collect{taskObj-> 
            
            return ["\"" + taskObj.partyName + "\"", "\"" + taskObj.partyAddress + "\"", taskObj.taskLatAndLong.split(",")[0], taskObj.taskLatAndLong.split(",")[1]]
        };
        log.info " todaysTasksList : " + todaysTasksList;
        return todaysTasksList;
        
    }
    
    def getTodaysTask(FieldOperator currentUser)
    {
        //Get Total Tasks Cretaed Today
        def taskCriteria = Task.createCriteria();
        def totalTodaysTaskList = taskCriteria.list{
            ge('dateCreated', UtilFunctions.setDateDetails(new Date(), 23, 59, 59, -1))
            lt('dateCreated', UtilFunctions.setDateDetails(new Date(), 0, 0, 0, 1))
            eq("createdBy", currentUser)
        }
        
        return totalTodaysTaskList;
    }
}
