module.exports = function (karma) {
    process.env.PHANTOMJS_BIN = 'node_modules/karma-phantomjs-launcher/node_modules/.bin/phantomjs';

    karma.set({
        /**
         * From where to look for files, starting with the location of this file.
         */
        basePath: './',

        /**
         * Filled by the task `gulp karma-conf`
         */
        files: [

                                                                                                                                                                                                                                                                                                      'bower_components/angular/angular.js',

                                                                                                                                                                                                                                                                                                      'bower_components/angular-route/angular-route.js',

                                                                                                                                                                                                                                                                                                      'bower_components/angular-ui-router/release/angular-ui-router.js',

                                                                                                                                                                                                                                                                                                      'bower_components/angular-cookies/angular-cookies.js',

                                                                                                                                                                                                                                                                                                      'bower_components/underscore/underscore.js',

                                                                                                                                                                                                                                                                                                      'bower_components/angular-mocks/angular-mocks.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/studio/videos/services/_videos.services.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/studio/videos/controllers/_videos.controllers.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/studio/videos/controllers/videos.controller.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/studio/projects/controllers/_projects.controllers.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/studio/projects/controllers/projects.controller.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/studio/videos/_videos.module.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/studio/projects/_projects.module.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/login/services/_login.services.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/login/directives/_login.directives.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/login/directives/login.form.directive.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/login/controllers/_login.controllers.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/login/controllers/login.controller.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/base/_app.bases.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/base/models/base.model.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/base/controllers/base.controller.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/login/_login.module.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/modules/core/app.core.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/datasources/models/_app.models.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/datasources/models/video.model.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/user/_app.user.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/user/user.session.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/user/user.authentication.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/http/_app.http.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/http/http.interceptorService.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/http/http.headersService.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/constants/_app.constants.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/constants/constants.userRoles.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/constants/constants.config.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/constants/constants.authEvents.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/api/_app.api.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/api/http.tokenApi.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/common/api/apiService.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/datasources/_app.datasources.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/datasources/videos.datasource.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/datasources/projects.datasource.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/datasources/base.datasource.js',

                                                                                                                                                                                                                                                                                                      '.tmp/src/app/app.js',

                                                                                                                                                                                                                                                                                                      '.tmp/wirewax-studio-templates.js',

                                                                                                                                                                                                                                                                                                      '.tmp/test/datasources/base.datasource_test.js',

                                                                                                                                                                                                                                                                                                      '.tmp/test/datasources/videos.datasource_test.js',

                                                                                                                                                                                                                                                                                                      '.tmp/test/common/http/http.interceptor_test.js',

                                                                                                                                                                                                                                                                                                      '.tmp/test/common/user/user.authentication_test.js',

                                                                                                                                                                                                                                                                                                      '.tmp/test/common/user/user.session_test.js',

                                                                                                                                                                                                                                                                                                      '.tmp/test/common/base/controllers/base.controller_test.js',

                                                                                                                                                                                                                                                                                                      '.tmp/test/common/base/models/base.model_test.js',

                                                                                                                                                                                                                                                                                                      '.tmp/test/modules/studio/videos/controllers/videos.controller_test.js'

                                                                                                                                                                                                                                                                                                    ],

        frameworks: ['mocha', 'chai', 'jasmine'],
//        plugins: ['karma-mocha', 'karma-chai', 'karma-firefox-launcher', 'karma-phantomjs-launcher' ],

        /**
         * How to report, by default.
         */
        reporters: 'progress',

        /**
         * Show colors in output?
         */
        colors: true,

        /**
         * On which port should the browser connect, on which port is the test runner
         * operating, and what is the URL path for the browser to use.
         */
        port: 9099,
        runnerPort: 9100,
        urlRoot: '/',

        /**
         * Disable file watching by default.
         */
        autoWatch: false,

        /**
         * The list of browsers to launch to test on. This includes only "Firefox" by
         * default, but other browser names include:
         * Chrome, ChromeCanary, Firefox, Opera, Safari, PhantomJS
         *
         * Note that you can also use the executable name of the browser, like "chromium"
         * or "firefox", but that these vary based on your operating system.
         *
         * You may also leave this blank and manually navigate your browser to
         * http://localhost:9099/ when you're running tests. The window/tab can be left
         * open and the tests will automatically occur there during the build. This has
         * the aesthetic advantage of not launching a browser every time you save.
         */
        browsers: [
            'PhantomJS'
        ]
    });
};
