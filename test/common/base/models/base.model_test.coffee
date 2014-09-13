'use strict'

describe "BaseModelTest", ->

    #    Reference to UserSession so we can access inside the tests
    BaseModel = null

    #     include the module we are testing
    beforeEach module('app.bases')

    #    include the class we are testing
    beforeEach inject((_BaseModel_) ->
        BaseModel = _BaseModel_
    )

    describe '_setInError', ->
        it "should set inError property true", () ->
            model = new BaseModel()
            model._setInError()
            assert.isTrue(model._inError)

    describe '_setIsLoading', ->
        it "should set isLoading property true", () ->
            model = new BaseModel()
            model._setIsLoading()
            assert.isTrue(model._isLoading)