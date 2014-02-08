package com.team.aspi.optimize.core;

class Task 
{
    String taskId;
    String partyName;
    String partyAddress;
    Double dueAmount;
    Double penaltyAmount;
    Double collectedAmount = 0;
    String status = "PENDING";
    String fieldOperatorComment;
    String supervisorComment;
    String taskLatAndLong;
    Date completedOn;
    
    Supervisor createdBy;
    FieldOperator assignedTo;
    
    Date dateCreated;
    Date lastUpdated;
    boolean deleted = false;
    
    static constraints = 
    {
        completedOn (nullable:true)
        partyAddress (maxSize:200)
        partyName (maxSize:50)
        status (maxSize:100)
        taskLatAndLong (nullable:true)
        supervisorComment (nullable:true)
        fieldOperatorComment (nullable:true)
    }
}
