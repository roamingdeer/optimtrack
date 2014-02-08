package com.team.aspi.optimize.core

import org.springframework.dao.DataIntegrityViolationException
import com.team.aspi.optimize.utils.UtilFunctions;

class SupervisorController {

    def dashboard()
    {
        if(session?.currentUser.userType.equals("SUPERVISOR"))
        {
            Map profileData = getSupervisorProfileData(session?.currentUser);
            log.info " profileData : " + profileData;
            [totalFieldOperators : profileData.totalFieldOperators, pendingTasksToday : profileData.pendingTasksToday, 
            totalCompletedTasksToday : profileData.totalCompletedTasksToday, totalTasksToday : profileData.totalTasksToday ]
        }
    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [supervisorInstance: new Supervisor(params), supervisorInstanceList: Supervisor.list(params), supervisorInstanceTotal: Supervisor.count()]
    }

    def create() {
        [supervisorInstance: new Supervisor(params)]
    }

    def save() {
        def supervisorInstance = new Supervisor(params);
        supervisorInstance.password = params.password.encodeAsPassword();
        supervisorInstance.createdBy = session.currentUser;
        if (!supervisorInstance.save(flush: true)) {
            render(view: "create", model: [supervisorInstance: supervisorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), supervisorInstance.id])
        redirect(action: "list")
    }

    def profile(Long id) {
        def supervisorInstance = Supervisor.get(id)
        if (!supervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), id])
            redirect(action: "list")
            return
        }
        log.info " supervisorInstance : " + supervisorInstance;
        Map profileData = getSupervisorProfileData(supervisorInstance);
        
        [supervisorInstance: supervisorInstance, totalFieldOperators : profileData.totalFieldOperators, pendingTasksToday : profileData.pendingTasksToday, 
            totalCompletedTasksToday : profileData.totalCompletedTasksToday, totalTasksToday : profileData.totalTasksToday ]
       
    }

    def edit(Long id) {
        def supervisorInstance = Supervisor.get(id)
        if (!supervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), id])
            redirect(action: "list")
            return
        }
        supervisorInstance
        [supervisorInstance: supervisorInstance]
    }

    def update(Long id, Long version) {
        def supervisorInstance = Supervisor.get(id)
        if (!supervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (supervisorInstance.version > version) {
                supervisorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'supervisor.label', default: 'Supervisor')] as Object[],
                          "Another user has updated this Supervisor while you were editing")
                render(view: "edit", model: [supervisorInstance: supervisorInstance])
                return
            }
        }

        supervisorInstance.properties = params

        if (!supervisorInstance.save(flush: true)) {
            render(view: "edit", model: [supervisorInstance: supervisorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), supervisorInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def supervisorInstance = Supervisor.get(id)
        if (!supervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), id])
            redirect(action: "list")
            return
        }

        try {
            supervisorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def getSupervisorProfileData(def user)
    {
        //Get Total Operators
        def totalFieldOperators = FieldOperator.findAllByDeletedAndCreatedBy(false, user)?.size();
        //Get Total Tasks Cretaed Today
        def taskCriteria = Task.createCriteria();
        int totalTasksToday = taskCriteria.count{
            ge('dateCreated', UtilFunctions.setDateDetails(new Date(), 23, 59, 59, -1))
            lt('dateCreated', UtilFunctions.setDateDetails(new Date(), 0, 0, 0, 1))
            eq("createdBy", session?.currentUser)
        }
        //Get Total Complted Tasks
        taskCriteria = Task.createCriteria();
        int totalCompletedTasksToday = taskCriteria.count{
            ge('dateCreated', UtilFunctions.setDateDetails(new Date(), 23, 59, 59, -1))
            lt('dateCreated', UtilFunctions.setDateDetails(new Date(), 0, 0, 0, 1))
            eq('status', 'COMPLETED')
            eq("createdBy", session?.currentUser)
        }
        //pending tasks
        int pendingTasksToday = totalTasksToday - totalCompletedTasksToday;
        
        Map profileDataMap = new HashMap<String, String>();
        profileDataMap.totalFieldOperators = totalFieldOperators;
        profileDataMap.pendingTasksToday = pendingTasksToday;
        profileDataMap.totalCompletedTasksToday = totalCompletedTasksToday;
        profileDataMap.totalTasksToday = totalTasksToday;
        
        return profileDataMap;
    }
}
