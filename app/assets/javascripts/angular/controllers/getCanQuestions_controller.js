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
            // console.log(question.id)
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
    
    $scope.submitAnswers = function(){
        // triggered with the click button
        var answersSelected = $scope.candidateQuestions[0].optionOneID
        var questionID = $scope.candidateQuestions[0].id
        console.log(questionID, 'questionID')
        var urlToPostAnswers = "http://localhost:3000//users/1/candidates/1/asks?question_id=" + questionID + "&choice_id=" + answersSelected
        $http.post(urlToPostAnswers)
            .success(function(response){
                console.log(response, 'success')
    console.log($scope.test, 'test')
            })
    }


})