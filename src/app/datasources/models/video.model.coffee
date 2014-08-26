'use strict';

VideoModel = (BaseDataSource) ->
    class VideoModel
        constructor: (options)->
            @name = 'Video Model'


angular.module 'app.models'
.service 'VideoModel', VideoModel
