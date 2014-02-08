package com.team.aspi.optimize.core



import org.junit.*
import grails.test.mixin.*

@TestFor(FieldOperatorController)
@Mock(FieldOperator)
class FieldOperatorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fieldOperator/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fieldOperatorInstanceList.size() == 0
        assert model.fieldOperatorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fieldOperatorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fieldOperatorInstance != null
        assert view == '/fieldOperator/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fieldOperator/show/1'
        assert controller.flash.message != null
        assert FieldOperator.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fieldOperator/list'

        populateValidParams(params)
        def fieldOperator = new FieldOperator(params)

        assert fieldOperator.save() != null

        params.id = fieldOperator.id

        def model = controller.show()

        assert model.fieldOperatorInstance == fieldOperator
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fieldOperator/list'

        populateValidParams(params)
        def fieldOperator = new FieldOperator(params)

        assert fieldOperator.save() != null

        params.id = fieldOperator.id

        def model = controller.edit()

        assert model.fieldOperatorInstance == fieldOperator
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fieldOperator/list'

        response.reset()

        populateValidParams(params)
        def fieldOperator = new FieldOperator(params)

        assert fieldOperator.save() != null

        // test invalid parameters in update
        params.id = fieldOperator.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fieldOperator/edit"
        assert model.fieldOperatorInstance != null

        fieldOperator.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fieldOperator/show/$fieldOperator.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fieldOperator.clearErrors()

        populateValidParams(params)
        params.id = fieldOperator.id
        params.version = -1
        controller.update()

        assert view == "/fieldOperator/edit"
        assert model.fieldOperatorInstance != null
        assert model.fieldOperatorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fieldOperator/list'

        response.reset()

        populateValidParams(params)
        def fieldOperator = new FieldOperator(params)

        assert fieldOperator.save() != null
        assert FieldOperator.count() == 1

        params.id = fieldOperator.id

        controller.delete()

        assert FieldOperator.count() == 0
        assert FieldOperator.get(fieldOperator.id) == null
        assert response.redirectedUrl == '/fieldOperator/list'
    }
}
