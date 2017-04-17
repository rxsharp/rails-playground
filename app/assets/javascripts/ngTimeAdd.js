(function() {
  'use strict';

angular.module('timeApp')

.directive('timeForm', timeFormDirective)
.controller('timeFormController', timeFormController)
.directive('timeList', timeListDirective)
.controller('timeListController', timeListController)


timeFormDirective.$inject = [];
function timeFormDirective(){
  return {
    restrict: 'E',
    templateUrl: 'timeAdd.html',
    controller: 'timeFormController as tf',
    scope: {
      project: '=',
      user: '=',
    }
  };
}

timeListDirective.$inject = [];
function timeListDirective(){
  return {
    restrict: 'E',
    templateUrl: 'timeList.html',
    controller: 'timeListController as tl',
  };
}

timeFormController.$inject = ['TimeEntries'];
function timeFormController(TimeEntries){
  var tf = this;
  tf.addTime = function (input) {
    console.log("addTime Clicked");
      TimeEntries.create({Deventry: input}, function(){
      console.log('SUCCESS', entry);
    }, function(error){
      console.log(error)
      console.log('Error(input): ', input);
    });
 }
}

timeListController.$inject = ['TimeEntries'];
function timeListController(TimeEntries){
  var tl = this;
  tl.entries = TimeEntries.query();
}

}());
