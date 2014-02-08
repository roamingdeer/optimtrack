package com.team.aspi.optimize.core

import org.springframework.dao.DataIntegrityViolationException
import com.team.aspi.optimize.utils.UtilFunctions;

class ManagerController {

    def dashboard()
    {
        //Get Total Operators
        def totalSupervisors = Supervisor.findAllByDeleted(false)?.size();
        //Get Total Operators
        def totalFieldOperators = FieldOperator.findAllByDeleted(false)?.size();
        //Get Total Tasks Cretaed Today
        def taskCriteria = Task.createCriteria();
        int totalTasksToday = taskCriteria.count{
            ge('dateCreated', UtilFunctions.setDateDetails(new Date(), 23, 59, 59, -1))
            lt('dateCreated', UtilFunctions.setDateDetails(new Date(), 0, 0, 0, 1))
        }
        //Get Total Complted Tasks
        taskCriteria = Task.createCriteria();
        int totalCompletedTasksToday = taskCriteria.count{
            ge('dateCreated', UtilFunctions.setDateDetails(new Date(), 23, 59, 59, -1))
            lt('dateCreated', UtilFunctions.setDateDetails(new Date(), 0, 0, 0, 1))
            eq('status', 'COMPLETED')
        }
        //pending tasks
        int pendingTasksToday = totalTasksToday - totalCompletedTasksToday;
        
        [totalFieldOperators : totalFieldOperators, totalSupervisors : totalSupervisors, pendingTasksToday : pendingTasksToday, totalCompletedTasksToday : totalCompletedTasksToday, totalTasksToday : totalTasksToday, ]
    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [managerInstanceList: Manager.list(params), managerInstanceTotal: Manager.count()]
    }

    def create() {
        [managerInstance: new Manager(params)]
    }

    def save() {
        def managerInstance = new Manager(params)
        if (!managerInstance.save(flush: true)) {
            render(view: "create", model: [managerInstance: managerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'manager.label', default: 'Manager'), managerInstance.id])
        redirect(action: "show", id: managerInstance.id)
    }

    def profile(Long id) {
        def managerInstance = Manager.get(id)
        if (!managerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manager.label', default: 'Manager'), id])
            redirect(action: "list")
            return
        }

        [managerInstance: managerInstance]
    }

    def edit(Long id) {
        def managerInstance = Manager.get(id)
        if (!managerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manager.label', default: 'Manager'), id])
            redirect(action: "list")
            return
        }

        [managerInstance: managerInstance]
    }

    def update(Long id, Long version) {
        def managerInstance = Manager.get(id)
        if (!managerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manager.label', default: 'Manager'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (managerInstance.version > version) {
                managerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'manager.label', default: 'Manager')] as Object[],
                          "Another user has updated this Manager while you were editing")
                render(view: "edit", model: [managerInstance: managerInstance])
                return
            }
        }

        managerInstance.properties = params

        if (!managerInstance.save(flush: true)) {
            render(view: "edit", model: [managerInstance: managerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'manager.label', default: 'Manager'), managerInstance.id])
        redirect(action: "show", id: managerInstance.id)
    }

    def delete(Long id) {
        def managerInstance = Manager.get(id)
        if (!managerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manager.label', default: 'Manager'), id])
            redirect(action: "list")
            return
        }

        try {
            managerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'manager.label', default: 'Manager'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'manager.label', default: 'Manager'), id])
            redirect(action: "show", id: id)
        }
    }
}
