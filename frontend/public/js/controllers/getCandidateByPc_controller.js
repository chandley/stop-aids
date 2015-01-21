angular.module('QanMP').controller('getCandidatesByPC', function($scope, $http){
$scope.getCandidates = function(){
    var url = "http://www.theyworkforyou.com/api/getMP?&id=&constituency=&postcode=" + $scope.postCode + "&key=CCa95kDVHTT2Dj2zmPDdYN4f&callback=JSON_CALLBACK"
    var searchCandidate = $http.jsonp(url)
                .success(function(candidate) {
                 $scope.mpCandidate = candidate
                    console.log($scope.mpCandidate)
                })
                 .error(function(error) {
                  // console.log('error in getCandidatesByPC',error)
                  $scope.erroR = error
                  // $scope.myError = "Invalid Postcode"
                  // console.log($scope.myError)
                })                
}
    $scope.getCandidates()




$scope.trialFunction = function(){
    var urlTrial = "https://stopaidz-rails1.herokuapp.com/candidates"
    $http.jsonp(urlTrial)
    .success(function(response){
        console.log(response)
    })
}

$scope.trialFunction()


})