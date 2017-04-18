(function() {
    'use strict';

    angular.module('timeApp', [
      'templates',
      'ngResource'
    ])
    .config(["$httpProvider", function($httpProvider) {
      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }])
    .factory('TimeEntries', ['$resource',function($resource){
      return $resource('/projects/:pid/dev_entries.json', {pid: '@pid'},{
      create: { method: 'POST' }
      })
    }])
    .factory('TimeLoader', ['$resource',function($resource){
      return $resource('/dev_entries.json', {},{
      query: { method: 'GET', isArray: true },
      })
    }])

}());
