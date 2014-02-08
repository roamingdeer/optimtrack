package com.team.aspi.optimize.core;

class Manager {
    
    String managerName;
    String address;
    String sex;
    String imageName;
    String password;
    String username;
    String contactNumber;
    Date lastLoginDate;
    String userType;
    
    Date dateCreated
    Date lastUpdated
    boolean deleted = false;
    
    static constraints = {
        sex (maxSize:10,inList:["Male","Female"]);
    }
}
