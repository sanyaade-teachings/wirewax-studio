'use strict';


VideoCard = ->
    restrict: 'E'
    templateUrl: 'templates/common/cards/coreCard.html'
    link: ->
    controllerAs: 'VideoCard'
    controller: ->

angular.module 'videos.directives'
.directive 'wwVideoCard', VideoCard