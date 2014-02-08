package com.team.aspi.optimize.core



import org.junit.*
import grails.test.mixin.*

@TestFor(ManagerController)
@Mock(Manager)
class ManagerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/manager/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.managerInstanceList.size() == 0
        assert model.managerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.managerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.managerInstance != null
        assert view == '/manager/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/manager/show/1'
        assert controller.flash.message != null
        assert Manager.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/manager/list'

        populateValidParams(params)
        def manager = new Manager(params)

        assert manager.save() != null

        params.id = manager.id

        def model = controller.show()

        assert model.managerInstance == manager
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/manager/list'

        populateValidParams(params)
        def manager = new Manager(params)

        assert manager.save() != null

        params.id = manager.id

        def model = controller.edit()

        assert model.managerInstance == manager
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/manager/list'

        response.reset()

        populateValidParams(params)
        def manager = new Manager(params)

        assert manager.save() != null

        // test invalid parameters in update
        params.id = manager.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/manager/edit"
        assert model.managerInstance != null

        manager.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/manager/show/$manager.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        manager.clearErrors()

        populateValidParams(params)
        params.id = manager.id
        params.version = -1
        controller.update()

        assert view == "/manager/edit"
        assert model.managerInstance != null
        assert model.managerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/manager/list'

        response.reset()

        populateValidParams(params)
        def manager = new Manager(params)

        assert manager.save() != null
        assert Manager.count() == 1

        params.id = manager.id

        controller.delete()

        assert Manager.count() == 0
        assert Manager.get(manager.id) == null
        assert response.redirectedUrl == '/manager/list'
    }
}
