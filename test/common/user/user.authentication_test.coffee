'use strict';

describe "User Authentication Service", ->


#     include the module we are testing
    beforeEach module('app.core')

    #    Reference to UserSession so we can access inside the tests
    UserAuthentication = null;
    TokenApi = null
    $rootScope = null;
    UserSession = null;
    $q = null;

    mockCookieService = null;

    beforeEach module(($provide) ->

        #create mock cookieStore
        mockCookieService =
            _cookies: {}
            get: (key) ->
                @_cookies[key]

            put: (key, value) ->
                @_cookies[key] = value

            remove: (key) ->
                delete @_cookies[key]

        $provide.value "$cookieStore", mockCookieService

        null #  COFFEE: must return null here, otherwise breaks
    )

    #    include the class we are testing
    beforeEach inject((_UserAuthentication_, _TokenApi_, _$q_, _$rootScope_, _UserSession_) ->
        UserAuthentication = _UserAuthentication_
        TokenApi = _TokenApi_
        $q = _$q_
        $rootScope = _$rootScope_
        UserSession = _UserSession_
    )

    describe "isAuthenticated: token exists and has not expired", ->
        it "should return true", () ->
            mockCookie =
                access_token: 'hNGfgizrarjuOj3XoMhOEDc3HIlsg13N3C3AEfXC'
                expires: Math.ceil((new Date().setYear(3000)) / 1000)
                expires_in: 108000
                refresh_token: '2c5gO2S4UUyJFLLInjBDDGpMlZNXvkdxLfmEbfS3'
                token_type: 'bearer'

            mockCookieService.put('wirewax', mockCookie);

            assert.isTrue(UserAuthentication.isAuthenticated());

    describe "isAuthenticated: token exists, has expired and has no refresh token", ->
        it "should return false", () ->

            mockCookie =
                access_token: 'hNGfgizrarjuOj3XoMhOEDc3HIlsg13N3C3AEfXC'
                expires: Math.ceil((new Date().setYear(1)) / 1000)
                expires_in: 108000
                token_type: 'bearer'

            mockCookieService.put('wirewax', mockCookie);

            UserSession.destroy = jasmine.createSpy('destroy')

            UserAuthentication.isAuthenticated()

            assert.equal(UserSession.destroy.callCount, 1, 'Destroy session should have been called once');



    describe "isAuthenticated: token exists, has expired and has a refresh token", ->
        describe "_refreshAccessToken: returns a promise and succeeds", ->
            it "should populate the cookieStore with new cookie", () ->
                mockExpiredCookie =
                    access_token: 'hNGfgizrarjuOj3XoMhOEDc3HIlsg13N3C3AEfXC'
                    expires: Math.ceil((new Date().setYear(1)) / 1000)
                    expires_in: 108000
                    refresh_token: '2c5gO2S4UUyJFLLInjBDDGpMlZNXvkdxLfmEbfS3'
                    token_type: 'bearer'

                mockNewCookie =
                    access_token: 'hNGfgizrarjuOj3XoMhOEDc3HIlsg13HUIOY789HO'
                    expires: Math.ceil((new Date().setYear(3000)) / 1000)
                    expires_in: 108000
                    token_type: 'bearer'

                mockCookieService.put('wirewax', mockExpiredCookie);

                deferred = $q.defer()
                TokenApi.refreshAccessToken = jasmine.createSpy('refreshAccessToken').andReturn(deferred.promise)
                UserAuthentication.isAuthenticated()

                deferred.resolve(mockNewCookie)

                #   Required to resolve promise
                $rootScope.$digest()

                assert.deepEqual(mockCookieService.get('wirewax'), mockNewCookie)

    describe "getAccessToken", ->
        it "should return the cookies accessToken", () ->
            mockCookie =
                access_token: 'hNGfgizrarjuOj3XoMhOEDc3HIlsg13N3C3AEfXC'
                expires: Math.ceil((new Date().setYear(3000)) / 1000)
                expires_in: 108000
                refresh_token: '2c5gO2S4UUyJFLLInjBDDGpMlZNXvkdxLfmEbfS3'
                token_type: 'bearer'

            mockCookieService.put('wirewax', mockCookie);

            UserAuthentication.isAuthenticated()

            assert.equal(UserAuthentication.getAccessToken(), mockCookie.access_token,
                'Access token should == ' + mockCookie.access_token)