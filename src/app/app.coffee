angular.module 'wirewaxStudio', [
    'ui.router'
]

.config ($stateProvider) ->
    $stateProvider
    .state "studio",
        url: '/studio'
        templateUrl: 'templates/studio/furniture/studioCore.html'