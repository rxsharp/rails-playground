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
      return $resource('/dev_entries.json', {},{
      query: { method: 'GET', isArray: true },
      create: { method: 'POST' }
      })
    }])
    .controller('TimeProject', function($location, TimeEntries, $resource){
        var vm = this;
        vm.title = "A title to test";
        vm.devEntries = TimeEntries.query();
      })

}());
