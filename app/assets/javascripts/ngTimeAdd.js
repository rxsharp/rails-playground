(function() {
  'use strict';

angular.module('timeApp')

.directive('timeForm', timeFormDirective)
.controller('timeFormController', timeFormController)

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

timeFormController.$inject = ['TimeEntries', 'TimeLoader'];
function timeFormController(TimeEntries, TimeLoader){
  var tf = this;
  tf.entries = TimeLoader.query();
  tf.addTime = function (input) {
    console.log("addTime Clicked");
      tf.try = 1
      TimeEntries.create({pid:input.project_id, devDate: input.devDate, devDuration: input.devDuration, note: input.note, project_id: input.project_id, user_id: input.user_id}, function(){
      console.log('SUCCESS', input);
      tf.entries.push({devDate: input.devDate, devDuration: input.devDuration, note: input.note})

    }, function(error){
      console.log(error, 'Error(input): ', input);
    });
 }
}

}());
