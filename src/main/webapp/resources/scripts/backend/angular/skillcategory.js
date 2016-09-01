var app = angular.module('skill-category--app', ['angularUtils.directives.dirPagination']);

app.controller('skill_category__controller', function ($scope, $http) {   
    $scope.FinallSkillCategory = function () {
        REQUEST.GET("/component/skill/category/findall", $http, function (response) {
            $scope.loading = false;
            $scope.SKILLCATEGORIES = (response.data.DATA);
            if ($scope.SKILLCATEGORIES) {
                $scope.SKILLCATEGORIES = $scope.SKILLCATEGORIES.reverse();
            }
            $scope.setItemStatus();         
        }, function (error) {
           REQUEST.ERROR(error)
        })
    }
    $scope.setItemStatus = function () {
        $.map($scope.SKILLCATEGORIES, function (item) {
            item.STATUS = false;
        })
    }

    $scope.sort = function (keyname, name) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.sortName = name;
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }
    $scope.editClick = function (element) {
        if (element.STATUS) {
            $scope.updateCategory(element)
        }
        element.STATUS = !element.STATUS;
    }


    /*
     * Create new 
     */
    $scope.createSkillCategory = function () {
        REQUEST.POST("/component/skill/category/create", {
            "CATEGORY STATUS": $scope.txtCategoryName,
            "DESCRIPTION": $scope.txaDescription
        }, $http, function (response) {
            REQUEST.SUCCESS(response);
            $scope.FinallSkillCategory()
            $scope.txtCategoryName = ""
            $scope.txaDescription = ""
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    $scope.updateCategory = function (element) {
        REQUEST.PUT("/component/skill/category/update", {
            "CATEGORY ID": element.ID,
            "CATEGORY STATUS": element.CATEGORYSTATUS,
            "DESCRIPTION": element.DESCRIPTION
        }, $http, function (response) {
            REQUEST.SUCCESS(response)
            $scope.FinallSkillCategory()
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }

    $scope.deleteSkillCategory = function (element) {
        DIALOG.confirm("Deleting!", element.CATEGORYSTATUS + " is being deleted.", function () {
            REQUEST.DELETE("/component/skill/category/delete/" + element.ID, $http, function (data) {
                REQUEST.SUCCESS(data)
                console.log(data, "ddssss")
                $scope.FinallSkillCategory()
            }, function (error) {
                REQUEST.ERROR(error)
            })
        })
    }
    $scope.FinallSkillCategory();
});
