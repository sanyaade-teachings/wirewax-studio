'use strict';

VideoCard = ->
    restrict: 'E'
    templateUrl: 'templates/common/cards/coreCard.html'
    link: (scope, element, attrs) ->
        console.log scope.video
    controllerAs: 'VideoCard'
    controller: ->

angular.module 'videos.directives'
.directive 'wwVideoCard', VideoCard