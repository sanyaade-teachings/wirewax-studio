'use strict';

VideoModel = (BaseModel) ->
    class VideoModel extends BaseModel

        constructor: (options) ->
            super(options)

            @name = options.vidName
            @description = options.desc
            @poster_frame = options.posterFrame
            @date_created = options.created


angular.module 'app.models'
.factory 'VideoModel', VideoModel