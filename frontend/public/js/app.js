var QanMP = angular.module('QanMP',[]);

  QanMP.config(function($httpProvider) {
      $httpProvider.defaults.useXDomain = true;
      delete $httpProvider.defaults.headers.common['X-Requested-With'];
  });