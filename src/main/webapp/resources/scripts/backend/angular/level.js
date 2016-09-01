var app = angular.module('level--app', ['angularUtils.directives.dirPagination']);

app.controller('level__controller', function ($scope, $http) {
    
    REQUEST.GET("/component/level/findall", $http, function (response) {
        $scope.LEVELS = (response.data.DATA).reverse();
    }, function (error) {
        REQUEST.ERROR(error)
    })

    $scope.sort = function (keyname, name) {
        $scope.sortKey = keyname;   //set the sortKey to the param passed
        $scope.sortName = name;
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }      
});
