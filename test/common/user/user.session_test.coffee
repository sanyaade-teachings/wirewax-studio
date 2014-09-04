'use strict';

describe "UserSessionService", ->


#     include the module we are testing
    beforeEach module('app.core')

    #    Reference to UserSession so we can access inside the tests
    UserSession = null;
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
    beforeEach inject((_UserSession_) ->
        UserSession = _UserSession_
    )

    it "should set a cookie when UserSession.create is called with data", () ->
        mockCookie =
            access_token: 'hNGfgizrarjuOj3XoMhOEDc3HIlsg13N3C3AEfXC'
            expires: 1409881725
            expires_in: 108000
            refresh_token: '2c5gO2S4UUyJFLLInjBDDGpMlZNXvkdxLfmEbfS3'
            token_type: 'bearer'

        UserSession.create(mockCookie);

        assert.deepEqual(mockCookieService.get('wirewax'), mockCookie)

    it "should remove the wirewax cookie on UserSession.destroy", () ->
        mockCookie =
            access_token: 'hNGfgizrarjuOj3XoMhOEDc3HIlsg13N3C3AEfXC'
            expires: 1409881725
            expires_in: 108000
            refresh_token: '2c5gO2S4UUyJFLLInjBDDGpMlZNXvkdxLfmEbfS3'
            token_type: 'bearer'

        UserSession.create(mockCookie);

        expect(mockCookieService.get('wirewax')).to.deep.equal(mockCookie)

        UserSession.destroy()

        assert.isUndefined(mockCookieService.get('wirewax'))