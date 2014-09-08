'use strict';

describe "HTTPInterceptor", ->
    httpProvider = null

    #     include the module we are testing
    beforeEach module('app.core', ($httpProvider) ->
        httpProvider = $httpProvider

        null
    )
    #    Reference to UserSession so we can access inside the tests
    HTTPInterceptor = null
    UserAuthentication = null
    HttpHeaders = null
    $httpBackend = null
    $http = null


    #    include the class we are testing
    beforeEach inject((_HTTPInterceptor_, _UserAuthentication_, _HttpHeaders_, _$httpBackend_, _$http_) ->
        HTTPInterceptor = _HTTPInterceptor_
        UserAuthentication = _UserAuthentication_
        HttpHeaders = _HttpHeaders_
        $httpBackend = _$httpBackend_
        $http = _$http_
    )

    it "should have a HTTP interceptor set", () ->
        assert.include(httpProvider.interceptors, 'HTTPInterceptor')

#    describe "Interceptor.request: Request is not secure API request", ->
#        it "should return the request", ($provider) ->
#            $httpBackend.whenGET('/my/mock/call').respond(200);
#            $http.get('/my/mock/call')
#
#            HTTPInterceptor.request = jasmine.createSpy('request')
#
#            $httpBackend.flush()
#
#            assert(HTTPInterceptor.request)