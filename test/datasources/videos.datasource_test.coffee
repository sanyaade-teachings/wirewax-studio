'use strict';

describe "VideosDataSource", ->


#     include the module we are testing
    beforeEach module('app.core')

    #    Reference to UserSession so we can access inside the tests
    VideosDataSource = null;

#    beforeEach module(($provide) ->
#
#        #create mock cookieStore
#        mockCookieService =
#            _cookies: {}
#            get: (key) ->
#                @_cookies[key]
#
#            put: (key, value) ->
#                @_cookies[key] = value
#
#            remove: (key) ->
#                delete @_cookies[key]
#
#
#        $provide.value "$cookieStore", mockCookieService
#
#        null #  COFFEE: must return null here, otherwise breaks
#    )

    #    include the class we are testing
    beforeEach inject((_VideosDataSource_) ->
        VideosDataSource = _VideosDataSource_
    )

    describe "Initialise: success", ->
        it "should call _createItems populate the collection", () ->