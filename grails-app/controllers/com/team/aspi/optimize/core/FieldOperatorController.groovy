package com.team.aspi.optimize.core

import org.springframework.dao.DataIntegrityViolationException
import com.team.aspi.optimize.utils.UtilFunctions;
class FieldOperatorController {

    def taskUtilService;
    def dashboard()
    {
        Map profileData = getFieldOperatorProfileData(session?.currentUser);
        
        [ pendingTasksToday : profileData.pendingTasksToday, totalCompletedTasksToday : profileData.totalCompletedTasksToday, totalTasksToday : profileData.totalTasksToday ]
    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [fieldOperatorInstance: new FieldOperator(params), fieldOperatorInstanceList: FieldOperator.list(params), fieldOperatorInstanceTotal: FieldOperator.count()]
    }

    def create() {
        [fieldOperatorInstance: new FieldOperator(params)]
    }

    def save() {
        def fieldOperatorInstance = new FieldOperator(params);
        fieldOperatorInstance.password = params.password.encodeAsPassword();
        fieldOperatorInstance.createdBy = session.currentUser;
        if (!fieldOperatorInstance.save(flush: true)) {
            render(view: "create", model: [fieldOperatorInstance: fieldOperatorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'fieldOperator.label', default: 'FieldOperator'), fieldOperatorInstance.id])
        redirect(action: "list")
    }

    def profile(Long id) {
        //check if current user is FIeldOperator, if yes he can only view his profile...not others
        //Field Operator cannot see all Field Operators only Supervisor and Manager can create it
        if(session?.currentUser?.userType == "FIELD OPERATOR" && id != session?.currentUser?.id)
        {   
            redirect(controller:'fieldOperator',action:'profile', id:session?.currentUser?.id);
            return;
        }
        
        def fieldOperatorInstance = FieldOperator.get(id)
        if (!fieldOperatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fieldOperator.label', default: 'FieldOperator'), id])
            redirect(action: "list")
            return
        }
        def todaysTasksWithLatLongList = taskUtilService.getTaskFroFieldOperator(fieldOperatorInstance);
        
        Map profileData = getFieldOperatorProfileData(fieldOperatorInstance);
        [todaysTasksWithLatLongList : todaysTasksWithLatLongList, fieldOperatorInstance: fieldOperatorInstance, pendingTasksToday : profileData.pendingTasksToday, totalCompletedTasksToday : profileData.totalCompletedTasksToday, totalTasksToday : profileData.totalTasksToday ]
    }

    def edit(Long id) {
        def fieldOperatorInstance = FieldOperator.get(id)
        if (!fieldOperatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fieldOperator.label', default: 'FieldOperator'), id])
            redirect(action: "list")
            return
        }

        [fieldOperatorInstance: fieldOperatorInstance]
    }

    def update(Long id, Long version) {
        def fieldOperatorInstance = FieldOperator.get(id)
        if (!fieldOperatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fieldOperator.label', default: 'FieldOperator'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fieldOperatorInstance.version > version) {
                fieldOperatorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fieldOperator.label', default: 'FieldOperator')] as Object[],
                          "Another user has updated this FieldOperator while you were editing")
                render(view: "edit", model: [fieldOperatorInstance: fieldOperatorInstance])
                return
            }
        }

        fieldOperatorInstance.properties = params

        if (!fieldOperatorInstance.save(flush: true)) {
            render(view: "edit", model: [fieldOperatorInstance: fieldOperatorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'fieldOperator.label', default: 'FieldOperator'), fieldOperatorInstance.id])
        redirect(action: "show", id: fieldOperatorInstance.id)
    }

    def delete(Long id) {
        def fieldOperatorInstance = FieldOperator.get(id)
        if (!fieldOperatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fieldOperator.label', default: 'FieldOperator'), id])
            redirect(action: "list")
            return
        }

        try {
            fieldOperatorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fieldOperator.label', default: 'FieldOperator'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fieldOperator.label', default: 'FieldOperator'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def getFieldOperatorProfileData(def user)
    {
        //Get Total Tasks Cretaed Today
        def taskCriteria = Task.createCriteria();
        int totalTasksToday = taskCriteria.count{
            ge('dateCreated', UtilFunctions.setDateDetails(new Date(), 23, 59, 59, -1))
            lt('dateCreated', UtilFunctions.setDateDetails(new Date(), 0, 0, 0, 1))
            eq("assignedTo", user)
        }
        //Get Total Complted Tasks
        taskCriteria = Task.createCriteria();
        int totalCompletedTasksToday = taskCriteria.count{
            ge('dateCreated', UtilFunctions.setDateDetails(new Date(), 23, 59, 59, -1))
            lt('dateCreated', UtilFunctions.setDateDetails(new Date(), 0, 0, 0, 1))
            eq('status', 'COMPLETED')
            eq("assignedTo", user)
        }
        //pending tasks
        int pendingTasksToday = totalTasksToday - totalCompletedTasksToday;
        
        Map profileDataMap = new HashMap<String, String>();
        profileDataMap.pendingTasksToday = pendingTasksToday;
        profileDataMap.totalCompletedTasksToday = totalCompletedTasksToday;
        profileDataMap.totalTasksToday = totalTasksToday;
        
        return profileDataMap;
    }
}
