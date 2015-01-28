angular.module('qAnMp').controller('getCanQuestions', function($scope, $http){
	$scope.getCanQuestions = function(){
    $scope.display = 4
    $scope.candidateQuestions = []
    var url = "http://localhost:3000/candidates/1/questions/unanswered"
    $http.get(url)
      .success(function(response){

         response.questions.forEach(function(singleQuestion,index,array){
            question = {}
            question.id = singleQuestion.question.id
            question.wording = singleQuestion.question.ask_text
            question.total = array.length
            question.optionOne = singleQuestion.choices[0].text
            question.optionOneID = singleQuestion.choices[0].id
            question.optionTwo = singleQuestion.choices[1].text 
            question.optionTwoID = singleQuestion.choices[1].id
            $scope.candidateQuestions.push(question)
            })
        })
        .error(function(error){
            console.log('request not sent')
        })
    }


$scope.getCanQuestions()
    
    $scope.submitOptionOne = function(question){
        console.log($scope.testing)
        var qId = question['id']
        var opId = question['optionOneID']
        var urlToPostAnswers = "http://localhost:3000/candidates/1/answers?question_id=" + qId + "&choice_id=" + opId
        $http.post(urlToPostAnswers)
            .success(function(response){
                console.log(response, 'success')
            })
    }

        $scope.submitOptionTwo = function(question){
        console.log($scope.testing)
        var qId = question['id']
        var opId = question['optionTwoID']
        var urlToPostAnswers = "http://localhost:3000/candidates/1/answers?question_id=" + qId + "&choice_id=" + opId
        $http.post(urlToPostAnswers)
            .success(function(response){
                console.log(response, 'success')
            })
    }



})