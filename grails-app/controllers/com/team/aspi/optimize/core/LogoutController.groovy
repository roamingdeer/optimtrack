package com.team.aspi.optimize.core;

import org.springframework.dao.DataIntegrityViolationException

class LogoutController {

    def logout() {
    	session.currentUser = null
        printf "Logout...."
        redirect(controller:'login',action: 'login')
    }

}
