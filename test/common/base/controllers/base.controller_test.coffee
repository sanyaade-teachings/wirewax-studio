'use strict'

describe "BaseControllerTest", ->

#     include the module we are testing
    beforeEach module('app.bases')

    #    Reference to UserSession so we can access inside the tests
    BaseController = null
    $rootScope = null
    $scope = null
    $state = null

    #    include the class we are testing
    beforeEach inject((_BaseController_, _$rootScope_, _$state_) ->
        BaseController = _BaseController_
        $rootScope = _$rootScope_
        $scope = _$rootScope_.$new()
        $state = _$state_
    )

    describe 'Constructor: ', ->
        it "should instantiate with properties: $scope, name and eventListener", () ->
            options =
                $scope_dep: $scope
                name: 'BASE_CONTROLLER'

            controller = new BaseController(options)

            assert.equal(controller.$scope_dep, options.$scope)
            assert.equal(controller.name, options.name)
            assert.lengthOf(controller.eventListeners, 0)

    describe '_bindEventListners: ', ->
        it "should bind to $scope destroy", () ->
            options =
                $scope: $scope
                name: 'BASE_CONTROLLER'

            $scope.$on = jasmine.createSpy('$on')

            new BaseController(options)

            assert.equal($scope.$on.argsForCall[0][0], '$destroy')


    describe '$scope.$destroy event: ', ->
        it "should remove all listeners in the eventListener array and $$listeners", () ->
            options =
                $scope: $scope
                name: 'BASE_CONTROLLER'

            controller = new BaseController(options)

            controller.eventListeners.push(
              $rootScope.$on('mock.event.subscriber.one'),
              $rootScope.$on('mock.event.subscriber.two'),
              $rootScope.$on('mock.event.subscriber.three')
            )

            $scope.$emit('$destroy')

            assert.isUndefined($scope.$$listeners['mock.event.subscriber.one'])
            assert.isUndefined($scope.$$listeners['mock.event.subscriber.two'])
            assert.isUndefined($scope.$$listeners['mock.event.subscriber.three'])

            assert.equal(controller.eventListeners, 0, 'BaseController.eventListeners array should be empty')