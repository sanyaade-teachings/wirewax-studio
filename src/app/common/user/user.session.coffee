'use strict';

UserSession = ($cookieStore) ->
    create: (data) ->
        $cookieStore.put 'wirewax', data

    destroy: ->
        $cookieStore.remove 'wirewax'

    getFacebookData: ->

    getUserObject: ->


angular.module 'app.user'
.service 'UserSession', UserSession