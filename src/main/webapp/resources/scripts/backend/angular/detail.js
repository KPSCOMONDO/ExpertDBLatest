var app = angular.module('detail--app', ['angularUtils.directives.dirPagination']);
app.controller('detail__controller', function ($scope, $http) {
    $scope.expertId = null

    $scope.catId = null
    $scope.cityId = null
    $scope.city = null
    $scope.docuemntType = null
    $scope.locationId = null
    $scope.positionAId = null
    $scope.positionBId = null
    $scope.gender = null

    $scope.AGES = DECLARATION.fetchAge()
    $scope.EXPERIENCES = DECLARATION.fetchExperience()
    $scope.SALARIES = DECLARATION.fetchSalary()
    $scope.GENDERS = DECLARATION.fetchGender()
    $scope.DOCUMENTS = DECLARATION.fetchDocument()

    $scope.ADD_SKILLS = []
    $scope.ADD_LANGUAGES = []
    $scope.ADD_SKILLS = []
    $scope.ADD_EXPERIENCES = []
    $scope.ADD_DOCUMENTS = []
    $scope.ADD_POSITIONS = new Array()
    $scope.ADD_EDUCATIONS = []

    $scope.FindExpertByID = function () {
        REQUEST.GET("/expert/find-by-id/" + APP_CACHE.get("EXPERT_ID"), $http, function (response) {
            console.log(response)
            $scope.EXPERT = response.data.DATA;
            if ($scope.EXPERT) {
                $scope.EXPERT = $scope.EXPERT.reverse();
            }
            console.log($scope.EXPERT, ":  :", APP_CACHE.get("EXPERT_ID"))
        }, function (error) {
            DIALOG.error("Error", error.message);
        })
    }
    $scope.FindExpertByID()
    
});
