'use strict';

AuthEvents =
    login_success: 'auth-success',
    login_failed: 'auth-failed',
    logout_success: 'auth-logout-success',
    session_timeout: 'auth-session-timeout',
    not_authenticated: 'auth-not-authenticated',
    not_authorised: 'auth-not-authorized'

angular.module 'app.constants'
.constant 'AUTH_EVENTS', AuthEvents