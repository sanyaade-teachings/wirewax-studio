'use strict';

WirewaxConfig =
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


angular.module 'app.constants'
.constant 'WIREWAX_CONFIG', WirewaxConfig