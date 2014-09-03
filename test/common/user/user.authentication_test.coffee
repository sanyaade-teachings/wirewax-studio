'use strict';

describe "User Authentication Service", ->


#     include the module we are testing
    beforeEach module('app.core')

    #    Reference to UserSession so we can access inside the tests
    UserAuthentication = null;
    mockCookieService = null;
    TokenApi = null
    $q = null

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
    beforeEach inject((_UserAuthentication_, _TokenApi_, _$q_) ->
        UserAuthentication = _UserAuthentication_
        TokenApi = _TokenApi_
        $q = _$q_
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

            assert.isFalse(UserAuthentication.isAuthenticated());

    describe "isAuthenticated: token exists, has expired and has a refresh token", ->
        describe "_refreshAccessToken: returns a promise and succeeds", ->
            it "should populate the cookieStore with new cookie", () ->
                mockExpiredCookie =
                    access_token: 'hNGfgizrarjuOj3XoMhOEDc3HIlsg13N3C3AEfXC'
                    expires: Math.ceil((new Date().setYear(1)) / 1000)
                    expires_in: 108000
                    refresh_token: '2c5gO2S4UUyJFLLInjBDDGpMlZNXvkdxLfmEbfS3'
                    token_type: 'bearer'

                mockCookieService.put('wirewax', mockExpiredCookie);

                deferred = $q.defer();
                deferred.resolve('resolved');
                spyOn(TokenApi, 'refreshAccessToken').andReturn(deferred.promise);

                UserAuthentication.isAuthenticated()

    describe "isAuthenticated: token does not exist", ->
        it "should return false", () ->
            assert.isFalse(UserAuthentication.isAuthenticated());
