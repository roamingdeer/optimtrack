function customErrorHandlerFunction(f, errorInfo)
{
       // disabled all errors by default
        for (var i=0; i<myRules.length; i++)
        {
                var parts = myRules[i].split(",");
                var fieldName = parts[1];
                
                var messageClassName = document.getElementById(fieldName + "_error").className;
                //document.getElementById(fieldName + "_error").style.display = "none";
                if(messageClassName == "hintMsg") 
                {
                	
                } 
                else 
                {
                	document.getElementById(fieldName + "_error").style.display = "none";
                }
                
        }

        for (var i=0; i<errorInfo.length; i++)
        {
            var fieldName;

            // radio button
            if (errorInfo[i][0].type == undefined)
                    fieldName = errorInfo[i][0][0].name;
            else
                    fieldName = errorInfo[i][0].name;
            // display the error
            //document.getElementById(fieldName + "_label").style.color = "#cc0000";
            document.getElementById(fieldName + "_error").className = "errorMsg";
            document.getElementById(fieldName + "_error").style.display = "block";
            document.getElementById(fieldName + "_error").innerHTML = errorInfo[i][1];
        }

        // normally, we'd do something like this: only return TRUE if there were no errors.
        // but this is just a demo. so it's commented out.
        //return (errorInfo.length == 0) ? true : false;

        if (errorInfo.length == 0)
                return true;

        return false;
}

