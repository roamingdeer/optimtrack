package com.team.aspi.optimize.core


import com.team.aspi.optimize.utils.UtilFunctions;
class ReportController {

    def generateReport() 
    { 
        [reportData:null]
    }
    
    def getReportData()
    {
        log.info " params.toDate : " + params.toDate;
        Date fromDate = UtilFunctions.parseToDate(params.fromDate, "yyyy-dd-MM");
        //Date toDate = UtilFunctions.parseToDate(params.toDate, "yyyy-dd-MM");
        Map reportData = getStats(fromDate);
        log.info " fromDate : " + fromDate
        log.info " reportData : " + reportData; 
        render(template:"reportData", model:[reportData:reportData]);
    }
    
    def getStats(Date fromDate)
    {
        //Get Total Operators
        def totalSupervisors = Supervisor.findAllByDeleted(false)?.size();
        
        Date startDate = UtilFunctions.setDateDetails(fromDate, 23, 59, 59, -1);
        Date endDate = UtilFunctions.setDateDetails(fromDate, 23, 59, 59, 0);
        log.info " startDate : " + startDate + " endDate : " + endDate; 
        //Get Total Operators
        def totalFieldOperators = FieldOperator.findAllByDeleted(false)?.size();
        //Get Total Tasks Cretaed Today
        def taskCriteria = Task.createCriteria();
        int totalTasksToday = taskCriteria.count{
            ge('dateCreated', startDate)
            lte('dateCreated', endDate)
            
            //eq("createdBy", session?.currentUser)
        }
        //Get Total Complted Tasks
        taskCriteria = Task.createCriteria();
        int totalCompletedTasksToday = taskCriteria.count{
            ge('dateCreated', startDate)
            lte('dateCreated', endDate)
            eq('status', 'COMPLETED')
            //eq("createdBy", session?.currentUser)
        }
        //pending tasks
        int pendingTasksToday = totalTasksToday - totalCompletedTasksToday;
        
        Map profileDataMap = new HashMap<String, String>();
        profileDataMap.totalFieldOperators = totalFieldOperators;
        profileDataMap.pendingTasksToday = pendingTasksToday;
        profileDataMap.totalCompletedTasksToday = totalCompletedTasksToday;
        profileDataMap.totalTasksToday = totalTasksToday;
        profileDataMap.totalSupervisors = totalSupervisors;
        return profileDataMap;
    }
}
