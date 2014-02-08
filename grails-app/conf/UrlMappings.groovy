class UrlMappings {

	static mappings = {
            
                //System User
                "/rest/user/login"(controller:"RESTUserAuthentication", action = [POST:"userLogin"])
                "/rest/user/logout"(controller:"RESTUserAuthentication", action = [POST:"userLogout"])
        
                //Tasks
                "/rest/task/fetchAll"(controller:"RESTTask", action = [POST:"getAllTasks"])
                "/rest/task/update"(controller:"RESTTask", action = [POST:"updateTask"])
                
                //Field Operator
                "/rest/fieldOperator/updateCurrentLocation"(controller:"RESTFieldOperator", action = [POST:"updateLocation"])
        
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"login", action:"login")
		"500"(view:'/error')
	}
}
