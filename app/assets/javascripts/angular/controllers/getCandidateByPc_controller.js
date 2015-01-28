angular.module('qAnMp').controller('getCandidatesByPC', function($scope, $http){

$scope.sendPostcodeToDb = function(){
  console.log($scope.postCode, 'inside II')
  var urlPostcode = "http://localhost:3000/quizmaster/get_constituency?postcode=" + $scope.postCode
  $http.post(urlPostcode)
  .success(function(response){
    console.log(response)
  })
  .error(function(error){
    console.log(error)
  })
  
}
$scope.sendPostcodeToDb()




// $scope.getCandidates = function(){
//     var url = "http://www.theyworkforyou.com/api/getMP?&id=&constituency=&postcode=" + $scope.postCode + "&key=CCa95kDVHTT2Dj2zmPDdYN4f&callback=JSON_CALLBACK"
//     var searchCandidate = $http.jsonp(url)
//                 .success(function(candidate) {
//                  $scope.mpCandidate = candidate
//                  console.log($scope.mpCandidate)
//                  console.log($scope.postCode)


//                 })
//                  .error(function(error) {
//                   $scope.erroR = error
//                   console.log($scope.erroR)
//                 })                

// }
//   $scope.getCandidates()
















})