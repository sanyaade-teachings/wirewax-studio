'use strict';

VideoModel = () ->
    class VideoModel

        constructor: (options) ->
            @name = options.vidName
            @poster_frame = options.posterFrame
            @description = options.desc
            @date_created = options.created


angular.module 'app.models'
.service 'VideoModel', VideoModel

#created: 1410203626
#password:false
#posterFrame: "http://d2zqckv5bq8ab.cloudfront.net/vidData/8010012/8010012_still.jpg"
#status: 5
#vidDesc:null
#vidId: 8010012
#vidName: "spinning-logo.mp4"
#views: 0