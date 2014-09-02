'use strict';

describe "UserSessionService", ->

    beforeEach module('app.core')

    beforeEach inject((_UserSession_) ->
        us = _UserSession_


        describe "shit", ->

            it "should set a cookie when UserSession.create is called with data", () ->
                console.log(UserSession.create());

            it "should a cookie when UserSession.create is called with data", () ->
                console.log(UserSession.create());
    )