angular.module('qAnMp').controller('getQuestions', function($scope, $http){
    $scope.display = 3
    $scope.myDate = new Date()
    $scope.questions = []
    $scope.getQuestions = function(){
        var question;
        var urlTrial = "https://stopaidz-rails1.herokuapp.com/candidates/1/questions?callback=JSON_CALLBACK"
        $http.jsonp(urlTrial)
        .success(function(response){
            console.log(response.questions[0].id)
        response.questions.forEach(function(singleQuestion,index,array){
            question = {}
            question.id = singleQuestion.id
            // console.log('i am an id', question.id)
            question.wording = singleQuestion.ask_text
            question.locked = false
            question.imgSrc = "images/unlock.png"
            question.priority = new Date
            question.total = array.length
            $scope.questions.push(question)
        })
    })
    $scope.lockQuestion = function(question) {
        if (question.locked) {
            question.imgSrc = "unlock.png";
            question.locked = false
            question.priority = new Date
        } else {
            question.imgSrc = "lock.png";
            question.locked = true
            question.priority = 0
        } 
    }
    $scope.newQuestion = function(question) {
        if (!question.locked) {
            for(var i = 0; i < $scope.questions.length; i++) {
                if ($scope.questions[i] == question) $scope.questions[i].priority = new Date
            }
        }
    }
    $scope.countOfLockedItem = function(){
        $scope.countOfLocked = []
        $scope.questions.forEach(function(element){
            if(element.imgSrc === "images/lock.png"){
                $scope.countOfLocked.push(element)
            }
        })
            return $scope.countOfLocked
    }

    $scope.isReadyToSubmit = function(){
        $scope.countOfLockedItem()
        if($scope.countOfLocked.length === 3){
            return true
        }
    }    
}
$scope.getQuestions()

$scope.postQuestion = function(){
        var questionsSelected = []
        $scope.questions.forEach(function(question) {
            if(question.locked == true) questionsSelected.push(question)
        })
      console.log("postQuestion 1", questionsSelected[0] )
      console.log("postQuestion",questionsSelected)
      var url = "http://users/1/candidates/1/asks"
      // asks/question(1)(2)(3).ids/userid/candidates
        $http.post(url, {'questionsSelected' : 1} )
        .success(function(response){
            console.log(response, 'success')
        })
        .error(function(error){
            console.log(error)
        })
   }
})