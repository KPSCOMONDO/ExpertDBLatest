var app = angular.module('skill--app', ['angularUtils.directives.dirPagination']);
app.controller('skill__controller', function ($scope, $http) {
    
    $scope.catId = null;
    
    REQUEST.GET("/component/skill/category/findall", $http, function (response) {
        $scope.SKILLCATEGORIES = response.data.DATA
        if ($scope.SKILLCATEGORIES) {
            $scope.SKILLCATEGORIES = $scope.SKILLCATEGORIES.reverse();
        }        
        console.log("CT:",$scope.SKILLCATEGORIES)
    }, function (error) {
        REQUEST.ERROR(error)
    })

    $scope.$watch('skill_category_id', function (element) {
        if (element != undefined) {
            $scope.catId = element.ID;
            $scope.FindSkillBycatId()
        }
    });
    
    $scope.FindSkillBycatId = function () {
        REQUEST.GET("/component/skill/find-by-categoryid/" + $scope.catId, $http, function (response) {
            $scope.SKILLS = (response.data.DATA);
            if ($scope.SKILLS) {
                $scope.SKILLS = $scope.SKILLS.reverse();
            }            
            $scope.setItemStatus();
        }, function (error) {
            REQUEST.ERROR(error)
        })

    }

    $scope.sort = function (keyname, name) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.sortName = name;
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }

    $scope.editClick = function (element) {
        if (element.STATUS) {
            $scope.updateSkill(element)
        }
        element.STATUS = !element.STATUS;
    }

    $scope.createSkill = function () {
        REQUEST.POST("/component/skill/create", {
            "SKILL STATUS": $scope.txtSkill,
            "CATEGORY ID": $scope.catId
        }, $http, function (response) {
            REQUEST.SUCCESS(response);
            $scope.FindSkillBycatId()
            $scope.txtSkill = ""
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }

    $scope.setItemStatus = function () {
        $.map($scope.SKILLS, function (item) {
            item.STATUS = false;
        })
    }

    $scope.updateSkill = function (element) {
        REQUEST.PUT("/component/skill/update", {
            "SKILL ID": element.ID,
            "SKILL STATUS": element.SKILL
        }, $http, function (response) {
            REQUEST.SUCCESS(response)
            $scope.FindSkillBycatId()
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    $scope.deleteSkill = function (element) {
        DIALOG.confirm("Deleting!", element.SKILL + " is being deleted.", function () {
            REQUEST.DELETE("/component/skill/delete/" + element.ID, $http, function (data) {
                REQUEST.SUCCESS(data)
                $scope.FindSkillBycatId()
            }, function (error) {
                REQUEST.ERROR(error)
            })
        })
    }

});
