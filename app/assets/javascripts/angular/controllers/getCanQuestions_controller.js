// /candidates/:candidate_id/questions/unanswered

angular.module('qAnMp').controller('getCanQuestions', function($scope, $http){
	$scope.getCanQuestions = function(){
    $scope.display = 5
    var url = "http://localhost:3000/candidates/1/questions/unanswered"
    $http.get(url)
      .success(function(response){
    		console.log(response)
    	})
    	.error(function(error){
    		console.log('request not sent')
    	})


  
}

$scope.getCanQuestions()


})