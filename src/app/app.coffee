angular.module 'wirewaxStudio', [
    'app.core'

    #   Modules  #
    'videos.module'
    'projects.module'
]


#       Add states(routes)
.config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise("/studio");

    $stateProvider
    .state "studio",
        url: '/studio'
        templateUrl: 'templates/studio/furniture/studioCore.html'
        controller: 'VideosController'
    .state "projects",
        url: '/projects'
        templateUrl: 'templates/studio/furniture/studioCore.html'
        controller: 'ProjectsController'


.constant 'AUTH_EVENTS',
    login_success: 'auth-login-success',
    login_ailed: 'auth-login-failed',
    logout_success: 'auth-logout-success',
    session_timeout: 'auth-session-timeout',
    not_authenticated: 'auth-not-authenticated',
    not_authorized: 'auth-not-authorized'

.constant 'USER_ROLES',
    all: '*',
    admin: 'admin'

#       Add the HTTP interceptor
.config ($httpProvider) ->
    $httpProvider.interceptors.push "HttpInterceptor"


#       Declare app wide constants
.constant 'WIREWAX_CONFIG',
    api_url: 'http://api.wirewax.com/api/'
    root: '/'
    client_id: 1
    client_secret: 'WgDuxKpzmMLhX0TMAnWE3qhmVMTe6aL1'
    cloud_front_url: '//d2zqckv5bq8ab.cloudfront.net/'
    cdn_url: '//devf4pjng0kk0.cloudfront.net/'

    upload_cdn_url: '//d3chrq2sclixg2.cloudfront.net/'
    upload_cdn_folder: 'encode-input/'
    upload_cdn_policy: 'ICAJCXsiZXhwaXJhdGlvbiI6ICIyMDUwLTAxLTAxVDAwOjAwOjAwWiIsDQogICJjb25kaXRpb25zIjogWyANCiAgICB7ImJ1Y2tldCI6ICJ3aXJld2F4LXVwbG9hZHMifSwgDQogICAgWyJzdGFydHMtd2l0aCIsICIka2V5IiwgImVuY29kZS1pbnB1dHMvIl0sDQogICAgeyJhY2wiOiAicHVibGljLXJlYWQifQ0KICBdDQp9'
    upload_cdn_id: 'd3chrq2sclixg2'