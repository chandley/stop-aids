angular.module('qAnMp').controller('getAnswers', function($scope, $http){
 	var getAnswersFromCandidate = function(){
 		var urlForAnswers = "http://localhost:3000/users/2/candidates/1/show_answered_asks"
 		$scope.candidateAnswer = []
 		$http.get(urlForAnswers)
 		.success(function(response){
 						$scope.candidateReplying = response.candidate_name
 			      response.answered_asks.forEach(function(singleAnswer,index,array){
            answer = {}
            answer.originalQuestion = singleAnswer.ask_text
            answer.chosen = singleAnswer.choice_text
            console.log(answer, 'latesto')
            $scope.candidateAnswer.push(answer)
            })
            console.log($scope.candidateAnswer)
        })
 		.error(function(error){
 			console.log(error, 'error')
 		})
 	}

getAnswersFromCandidate()

})