'use strict';

describe "ApiService", ->
    beforeEach module 'wirewaxStudio'

    beforeEach inject(($injector) ->
        ApiService = $injector.get("ApiService")
    )

    it "Should have name equal to 'ApiService'", inject(($injector) ->
        ApiService = $injector.get 'ApiService'
        expect ApiService.name
        .equals 'ApiService'
    )