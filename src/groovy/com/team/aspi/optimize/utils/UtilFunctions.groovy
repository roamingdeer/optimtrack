/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.team.aspi.optimize.utils;
import org.springframework.dao.DataIntegrityViolationException
import java.text.*;
import java.util.Calendar;
import java.util.Date;
/**
 *
 * @author Chaitanya
 */
class UtilFunctions 
{
    
    public static Date parseToDate(String dateInStr, String format)
    {	
    	SimpleDateFormat sdf = new SimpleDateFormat( format );
    	Date date = (Date)sdf.parse(dateInStr);  
    	return date;
    }
    
    public static Date setDateDetails(Date dateObj, int hours, int minutes, int seconds, int days)
    {
        // Get Calendar object set to the date and time of the given Date object  
        Calendar cal = Calendar.getInstance();  
        cal.setTime(dateObj);  

        // Set time fields to zero  
        cal.add(Calendar.DAY_OF_MONTH, days);
        Date modifiedDateObj =  cal.getTime();
        modifiedDateObj.setHours(hours);
        modifiedDateObj.setMinutes(minutes);
        modifiedDateObj.setSeconds(seconds); 
        return modifiedDateObj;
    }
    
    public static String getUserName(def currentLoggedInUser)
    {
        if(currentLoggedInUser.userType.equals("MANAGER"))
        {
            return currentLoggedInUser.managerName;
        }
        else if(currentLoggedInUser.userType.equals("SUPERVISOR"))
        {
            return currentLoggedInUser.supervisorName;
        }
        else if(currentLoggedInUser.userType.equals("FIELD OPERATOR"))
        {
            return currentLoggedInUser.fieldOperatorName;
        }
        
    }
}
