package com.team.aspi.optimize.core;

class Supervisor {

    String supervisorName;
    String address;
    String employeeId;
    String sex;
    String imageName;
    String password;
    String username;
    String contactNumber;
    Date lastLoginDate;
    String userType;
    
    Manager createdBy;
    
    Date dateCreated
    Date lastUpdated
    boolean deleted = false;
    
    static hasMany = [tasks : Task]
    static belongsTo = [Manager]
    static constraints = {
        sex (maxSize:10,inList:["Male","Female"]);
        lastLoginDate (nullable:true);
        imageName (nullable:true);
    }
}
