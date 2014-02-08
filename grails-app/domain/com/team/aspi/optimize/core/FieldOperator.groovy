package com.team.aspi.optimize.core;

class FieldOperator {

    String fieldOperatorName;
    String address;
    String employeeId;
    String sex;
    String imageName;
    String password;
    String username;
    String contactNumber;
    String currentLocationLatAndLong;
    Date lastLoginDate;
    String sessionToken;
    String userType;
    
    Supervisor createdBy;
    Date dateCreated;
    Date lastUpdated;
    boolean deleted = false;
    
    static belongsTo = [Manager]
    
    static constraints = {
        lastLoginDate (nullable:true);
        sessionToken (nullable:true);
        imageName (nullable:true);
        currentLocationLatAndLong (nullable:true);
        sex (maxSize:10,inList:["Male","Female"]);
    }
}