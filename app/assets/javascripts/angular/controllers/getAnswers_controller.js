angular.module('qAnMp').controller('getAnswers', function($scope, $http){
 	var getAnswersFromCandidate = function(){
 		var urlForAnswers = "http://localhost:3000/users/2/candidates/1/show_answered_asks"
 		$http.get(urlForAnswers)
 		.success(function(response){
 			console.log(response.answered_asks)
 			$scope.questionPrompted = response.answered_asks[0].ask_text
 			$scope.optionChosen = response.answered_asks[0].choice_text
 			console.log('hi clare I am a success')
 		})
 		.error(function(error){
 			console.log(error, 'error')
 		})
 	}

getAnswersFromCandidate()
})