var app = angular.module('detail--app', []);

app.controller('detail__controller', function ($scope, $http) {
    $scope.LOGIN = APP_CACHE.get("LOGIN")
    $scope.logOut = function () {
        APP_CACHE.set("LOGIN", false)
        $scope.LOGIN = false
    }
    $scope.loading = true;
    REQUEST.GET("/filter/expert/find-by-expert-id/" + APP_CACHE.get("EXPERT_ID"), $http, function (response) {
        if (response.data.DATA)
            $scope.EXPERTS = response.data.DATA;
        $scope.loading = false;
    }, function (error) {
        REQUEST.ERROR(error)
        $scope.loading = false;
    })

    $scope.DONLOAD = function (element) {
        
        $scope.loading = true;
        console.log(element)
        REQUEST.DOWNLOAD(element.DOCUMENTID, function () {

        }, function (error) {
            REQUEST.ERROR(error)
            $scope.loading = false;
        })
    }
});
