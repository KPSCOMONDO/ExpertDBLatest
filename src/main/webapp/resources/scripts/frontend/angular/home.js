var app = angular.module("home--app", []);
app.controller("home__controller", function ($scope, $http) {
    $scope.LOGIN = APP_CACHE.get("LOGIN")
    $scope.logOut = function () {
        APP_CACHE.set("LOGIN", false)
        $scope.LOGIN = false
        $scope.LOGOUT=true
    }
    APP_CACHE.set("SKILL_ID", 0);
    //-----------------declarationion----------------- 
    $scope.loading = true;
    $scope.hash = "#";

    REQUEST.GET("/component/skill/category/skill/findall", $http, function (response) {
        if ($scope.SKILL_CATEGORIES = (response.data.DATA)) {
            $scope.SKILL_CATEGORIES.reverse()
        }
        console.log($scope.SKILL_CATEGORIES)
        $scope.loading = false;
    }, function (error) {
        REQUEST.ERROR(error)
        $scope.loading = false;
    })

    $scope.doFilter = function (element) {
        APP_CACHE.set("SKILL_ID", element.ID);
        console.log("SKill ID", APP_CACHE.get("SKILL_ID"))
        $scope.loading = true;
        REQUEST.GET("/filter/expert/by-skill-id/" + APP_CACHE.get("SKILL_ID"), $http, function (response) {
            if ($scope.EXPERTS = response.data.DATA) {
                $scope.COUNTERS = response.data.DATA.COUNTER;
            }
            $scope.loading = false;
        }, function (error) {
            REQUEST.ERROR(error)
            $scope.loading = false;
        })
    }

    $scope.onViewDetailClick = function (element) {
        APP_CACHE.set("EXPERT_ID", element.ID);
    }
});