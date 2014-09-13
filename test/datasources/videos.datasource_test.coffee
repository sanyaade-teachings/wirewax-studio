'use strict';

describe "VideosDataSource", ->

#    Reference to UserSession so we can access inside the tests
    VideosDataSource = null
    $httpBackend = null;
    UserAuthentication = null
    VideoModel = null
    $rootScope = null

    mockVideoData = [
        {"vidId": 8010012, "vidName": "spinning-logo.mp4", "vidDesc": null, "created": 1410203626, "views": 0, "status": 5, "password": false, "posterFrame": "http:\/\/d2zqckv5bq8ab.cloudfront.net\/vidData\/8010012\/8010012_still.jpg"},
        {"vidId": 8010011, "vidName": "Russian Daredevils: Adrenaline Rush On Top Of The World (RT Documentary)", "vidDesc": null, "created": 1410203596, "views": 0, "status": 5, "password": false, "posterFrame": "http:\/\/d2zqckv5bq8ab.cloudfront.net\/vidData\/8010011\/8010011_still.jpg"},
        {"vidId": 8009939, "vidName": "ECMAscript 6 - The let keyword.mp4", "vidDesc": null, "created": 1409762487, "views": 0, "status": 5, "password": false, "posterFrame": "http:\/\/d2zqckv5bq8ab.cloudfront.net\/vidData\/8009939\/8009939_still.jpg"},
        {"vidId": 8009935, "vidName": "Max Boyce on Blind Irish referees", "vidDesc": null, "created": 1409747428, "views": 0, "status": 5, "password": false, "posterFrame": "http:\/\/d2zqckv5bq8ab.cloudfront.net\/vidData\/8009935\/8009935_still.jpg"}
    ]

    mockAccessToken = 'MOCKACCESSTOKEN69'

    #   include the module we are testing
    beforeEach module('app.core')

    beforeEach inject((_$rootScope_, _$httpBackend_, _VideosDataSource_, _UserAuthentication_, _VideoModel_) ->
        VideosDataSource = _VideosDataSource_
        $httpBackend = _$httpBackend_
        UserAuthentication = _UserAuthentication_
        VideoModel = _VideoModel_
        $rootScope = _$rootScope_
    )


    describe "Initialise: success", ->
        it "should call _createItems and populate the collection", ->
            $httpBackend.whenGET('http://api.wirewax.com/api/videos')
            .respond 200, mockVideoData

            UserAuthentication.isAuthenticated = jasmine.createSpy('isAuthenticated').andReturn(true)
            UserAuthentication.getAccessToken = jasmine.createSpy('getAccessToken').andReturn(mockAccessToken)

            # Trigger the mock HTTP request
            $httpBackend.flush()

            assert.equal(VideosDataSource.collection.length, mockVideoData.length,
              'Videos Data Source collection length should equal mock data length')
            assert.instanceOf(VideosDataSource.collection[0], VideoModel,
              'Videos Data Source model to be an instance of VideoModel')

        it "should set initialised flag true and emit 'videoDataSource.loaded' event", ->
            $httpBackend.whenGET('http://api.wirewax.com/api/videos')
            .respond 200, mockVideoData

            UserAuthentication.isAuthenticated = jasmine.createSpy('isAuthenticated').andReturn(true)
            UserAuthentication.getAccessToken = jasmine.createSpy('getAccessToken').andReturn(mockAccessToken)

            emitSpy = $rootScope.$emit = jasmine.createSpy('$emit')

            # Trigger the mock HTTP request
            $httpBackend.flush()

            assert.isTrue(VideosDataSource.initialised, 'VideosDataSource.initialised property should be true ')
            assert.equal(emitSpy.argsForCall[0], 'videoDataSource.loaded',
              'videoDataSource.loaded event should have been called')

    describe "Initialise: Error", ->
        it "should call set inError and initialised true and emit 'videoDataSource.error' event", ->
            $httpBackend.whenGET('http://api.wirewax.com/api/videos')
            .respond 400, mockVideoData

            UserAuthentication.isAuthenticated = jasmine.createSpy('isAuthenticated').andReturn(true)
            UserAuthentication.getAccessToken = jasmine.createSpy('getAccessToken').andReturn(mockAccessToken)

            emitSpy = $rootScope.$emit = jasmine.createSpy('$emit')

            # Trigger the mock HTTP request
            $httpBackend.flush()

            assert.isTrue(VideosDataSource.inError, 'VideosDataSource.inError should be true')
            assert.isTrue(VideosDataSource.initialised, 'VideosDataSource.initialised should be true')
            assert.equal(emitSpy.argsForCall[0], 'videoDataSource.error',
              'videoDataSource.error event should have been called')


