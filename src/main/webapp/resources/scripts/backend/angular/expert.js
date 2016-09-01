var app = angular.module('expert--app', ['angularUtils.directives.dirPagination']);
app.controller('expert__controller', function ($scope, $http) {
    $scope.formHide = true
    $scope.expertId = null
    $scope.UPDATE = false

    $scope.catId = null
    $scope.cityId = null
    $scope.city = null
    $scope.docuemntType = null
    $scope.locationId = null
    $scope.location = null
    $scope.positionA = null
    $scope.positionB = null
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
    $scope.ADD_POSITIONS = []
    $scope.ADD_EDUCATIONS = []
    $scope.ADD_CONTACTS = []

    $scope.BTADD = "ដាក់បន្ថែម"
    $scope.btAdd = "Add"
    $scope.onAddClick = function () {
        //$scope.UPDATE = false
        $scope.reset()
        $scope.BTADD = "ដាក់បន្ថែម"
    }
    $scope.FindAllExpert = function () {
        REQUEST.GET("/expert/findall", $http, function (response) {
            $scope.EXPERTS = response.data.DATA;
            if ($scope.EXPERTS) {
                $scope.EXPERTS = $scope.EXPERTS.reverse();
            }
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    /*
     * Language 
     */

    REQUEST.GET("/component/language/findall", $http, function (response) {
        $scope.LANGUAGES = (response.data.DATA);
        $.map($scope.LANGUAGES, function (item) {
            item.CHECKED = false
        })
        REQUEST.GET("/component/location/findall", $http, function (response)
        {
            $scope.LOCATIONS = (response.data.DATA);
            REQUEST.GET("/component/position/findall", $http, function (response)
            {
                $scope.POSITIONS = (response.data.DATA);
                REQUEST.GET("/component/skill/category/findall", $http, function (response)
                {
                    $scope.SKILLCATEGORIES = (response.data.DATA);
                    REQUEST.GET("/component/level/findall", $http, function (response)
                    {
                        $scope.LEVELS = (response.data.DATA);

                        REQUEST.GET("/component/skill/findall", $http, function (response) {
                            $scope.ALLSKILLS = (response.data.DATA);
                        }, function (error) {
                            REQUEST.ERROR(error)
                        })
                    }, function (error) {
                        REQUEST.ERROR(error)
                    })
                }, function (error) {
                    REQUEST.ERROR(error)
                })
            }, function (error) {
                REQUEST.ERROR(error)
            })
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }, function (error) {
        DIALOG.error("Error", error.message);
    })

    $scope.uploadProfile = function () {        
        REQUEST.UPLOAD($scope.txtFullName, $('#profileform'), $('input[name=file]')[0].files[0], function (data) {
            $scope.PROFILE_URL = data.PATH
            console.log("PATH:", data)
        }, function (data) {
            console.log("ERRO:", data)
        })
    }


    $scope.onLanguageCheck = function (laguage) {
        if (laguage.CHECKED) {
            $.map($scope.ADD_LANGUAGES, function (item, i) {
                if (laguage.LANGUAGEID == item.ID) {
                    $scope.deleteLanguage()
                }
            })
            console.log("Removed:", $scope.ADD_LANGUAGES)
        } else {

        }
        laguage.CHECKED = !laguage.CHECKED
    }


    $scope.onLaguageLevelCheck = function (language, level) {
        var update = false
        $.map($scope.ADD_LANGUAGES, function (item) {
            if (item.LANGUAGEID == language.ID) {
                item.LEVELID = level.LEVELID
                item.LEVEL = level.LEVELSTATUS
                console.log("UPDATED:", $scope.ADD_LANGUAGES)
                update = true
            }
        })
        if (!update) {
            $scope.ADD_LANGUAGES.push({
                "LANGUAGEID": language.ID,
                "LANGUAGE": language.LANGUAGE,
                "LEVELID": level.LEVELID,
                "LEVEL": level.LEVELSTATUS
            })
            console.log("ADDED:", $scope.ADD_LANGUAGES)
        }
    }

    $scope.deleteLanguage = function (index) {
        JYSON.DELETE($scope.ADD_LANGUAGES, index, function (data) {
            $scope.ADD_LANGUAGES = data
        })
    }


    /*
     *  Location
     */

    $scope.FindSkillBycatId = function () {
        REQUEST.GET("/component/skill/find-by-categoryid/" + $scope.catId, $http, function (response) {
            $scope.SKILLS = (response.data.DATA);
            if ($scope.SKILLS) {
                $scope.SKILLS = $scope.SKILLS.reverse();
            }
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    $scope.onSkillCheck = function (skill, index) {
        if (skill.CHECKED) {
            console.log("Removed:", $scope.ADD_SKILLS)
        }
        skill.CHECKED = !skill.CHECKED
    }

    $scope.deleteSkill = function (index) {
        JYSON.DELETE($scope.ADD_SKILLS, index, function (data) {
            $scope.ADD_SKILLS = data
        })
    }

    $scope.onSkillLevelCheck = function (skill, level) {
        var update = false
        $.map($scope.ADD_SKILLS, function (item) {
            if (item.SKILLID == skill.ID) {
                item.LEVELID = level.LEVELID
                item.LEVEL = level.LEVELSTATUS
                console.log("UPDATED:", $scope.ADD_SKILLS)
                update = true
                return
            }
        })
        if (!update) {
            $scope.ADD_SKILLS.push({
                "SKILLID": skill.ID,
                "LEVELID": level.LEVELID,
                "SKILL": skill.SKILL,
                "LEVEL": level.LEVELSTATUS
            })
            console.log("ADDED:", $scope.ADD_SKILLS)
        }
    }

    /*
     * Watch
     */
    $scope.$watch('skill_category_id', function (element) {
        if (element != undefined) {
            $scope.catId = element.ID;
            $scope.FindSkillBycatId()
        }
    });
    $scope.$watch('cboCategory', function (element) {
        if (element != undefined) {
            $scope.catId = element.ID;
            $scope.FindSkillBycatId()
        }
    });
    $scope.$watch('cboSkill', function (element) {
        if (element != undefined) {
            console.log(element)
            $scope.ADD_SKILLS.push({"SKILLID": element.ID, "LEVELID": 2})
            console.log($scope.ADD_SKILLS)
        }
    });

    $scope.$watch('cboGender', function (element) {
        if (element != undefined) {
            console.log("Element :", element)
            $scope.gender = element.VALUE;
        }
    });
    $scope.$watch('cboCity', function (element) {
        if (element != undefined) {
            console.log("Element :", element)
            $scope.cityId = element.ID;
            $scope.city = element.LOCATIONSTATUS
        }
    });
    $scope.$watch('cboLocation', function (element) {

        if (element != undefined) {
            console.log("Element :", element)
            $scope.locationId = element.LOCATIONID;
        }
        console.log($scope.locationId)
    });
    $scope.$watch('cboPositionA', function (element) {
        if (element != undefined) {
            //$scope.ADD_POSITIONS[0] = element.POSITIONID
            $scope.ADD_POSITIONS.push(element.POSITIONID)
        }
    });
    $scope.$watch('cboPositionB', function (element) {
        if (element != undefined) {
            //$scope.ADD_POSITIONS[1] = element.POSITIONID
            $scope.ADD_POSITIONS.push(element.POSITIONID)
        }
    });
    /*
     * Related Function
     */


    $scope.onDocumentTypeClick = function (type) {
        $scope.docuemntType = type.VALUE
        console.log("Tpe: ", $scope.docuemntType)
    }

    $scope.addDocument = function () {
        var url
        var key
        REQUEST.UPLOAD($scope.txtFullName, $('#docForm'), $('input[name=file1]')[0].files[0], function (data) {
            url = data.PATH
            key = data.KEY
            console.log("PATH:", data)
        }, function (data) {
            console.log("ERRO:", data)
            REQUEST.ERROR(data)
        })


        $scope.ADD_DOCUMENTS.push({
            "STATE": $scope.docuemntType,
            "STATUS": $scope.txtDocumentTitle,
            "URL": url,
            "DESCRIPTION": $scope.txtDocumentDescription,
            "KEY": key
        })
        console.log($scope.ADD_DOCUMENTS)
    }
    $scope.deleteDocument = function (element, index) {
        REQUEST.DELETE_FILE(element.KEY, function (data) {
            console.log("DELETE FILE OK ", data)
        }, function (data) {
            console.log("DELETE FILE ERRO ", data)
        })
        JYSON.DELETE($scope.ADD_DOCUMENTS, index, function (data) {
            $scope.ADD_DOCUMENTS = data
        })
    }

    $scope.addEducation = function () {
        $scope.ADD_EDUCATIONS.push({
            "STATUS": $scope.txtMajor,
            "GRADUATED_DATE": $scope.txtGraduateDate,
            "DESCRIPTION": $scope.txtEducationDescription
        })
    }

    $scope.addContact = function () {
        $scope.ADD_CONTACTS.push({
            "EMAIL": $scope.txtEmailA,
            "PHONE": $scope.txtPhoneA,
            "LIKED IN": $scope.txtSocialA,
            "WEBSITE": $scope.txtWebsiteA
        })
        if ($scope.txtPhoneB != "" || $scope.txtEmailB != "" || $scope.txtSocialB != "" || $scope.txtWebsiteB) {
            $scope.ADD_CONTACTS.push({
                "EMAIL": $scope.txtEmailB,
                "PHONE": $scope.txtPhoneB,
                "LIKED IN": $scope.txtSocialB,
                "WEBSITE": $scope.txtWebsiteB
            })
        }
    }

    $scope.prepareEducation = function () {
        var temp = []
        $.map($scope.ADD_EDUCATIONS, function (item) {
            temp.push({
                "STATUS": item.STATUS,
                "GRADUATED DATE": item.GRADUATED_DATE,
                "DESCRIPTION": item.DESCRIPTION
            })
        })
        $scope.ADD_EDUCATIONS = temp
    }
    $scope.deleteEducation = function (index) {
        JYSON.DELETE($scope.ADD_EDUCATIONS, index, function (data) {
            $scope.ADD_EDUCATIONS = data
        })
    }

    $scope.addExperience = function () {
        $scope.ADD_EXPERIENCES.push({
            "STATUS": $scope.txtPosition,
            "YEAR": $scope.txtYearFromB + " to " + $scope.txtYearToB,
            "DESCRIPTION": $scope.txtExperienceDescription
        })
    }
    $scope.deleteExperience = function (index) {
        JYSON.DELETE($scope.ADD_EXPERIENCES, index, function (data) {
            $scope.ADD_EXPERIENCES = data
        })
    }
    $scope.prepareSkill = function () {
        var temp = []
        $.map($scope.ADD_SKILLS, function (item) {
            temp.push({"SKILL ID": item.SKILLID, "LEVEL ID": item.LEVELID})
        })
        $scope.ADD_SKILLS = temp
    }
    $scope.prepareLanguage = function () {
        var temp = []
        $.map($scope.ADD_LANGUAGES, function (item) {
            temp.push({"LANGUAGE ID": item.LANGUAGEID, "LEVEL ID": item.LEVELID})
        })
        $scope.ADD_LANGUAGES = temp
    }
    $scope.detailClick = function (element) {
        if ($scope.formHide) {
            $scope.formHide = false
        }
        $scope.reset()
        APP_CACHE.set("EXPERT_ID", element.ID)
        $scope.UPDATE = true
        console.log($scope.UPDATE)
        $scope.BTADD = "កែរប្រែ"
        $scope.FindExpertByID()

    }
    $scope.FindExpertByID = function () {
        REQUEST.GET("/expert/find-by-id/" + APP_CACHE.get("EXPERT_ID"), $http, function (response) {
            $scope.EXPERT = response.data.DATA;
            if ($scope.EXPERT) {
                $scope.txtFullName = $scope.EXPERT.FULLNAME
                $scope.gender = $scope.EXPERT.GENDER

                $scope.txtDateOfBirth = $scope.EXPERT.DATEOFBIRTH
                $scope.txtCurrentWorkPlace = $scope.EXPERT.CURRENTWORK
                $scope.txtSalary = $scope.EXPERT.SALARY
                $scope.txtInterest = $scope.EXPERT.INTEREST
                $scope.txtYearexperience = $scope.EXPERT.YEAREXPERIENCE
                //"IMAGE URL": "not avaliable",
                $scope.locationId = $scope.EXPERT.LOCATION

                $scope.txtCommune = $scope.EXPERT.ADDRESS.COMMUNE
                $scope.txtDistrict = $scope.EXPERT.ADDRESS.DISTRICT
                $scope.city = $scope.EXPERT.ADDRESS.CITY
                $scope.txtCountry = $scope.EXPERT.ADDRESS.COUNTRY
                $scope.txtStreetNumber = $scope.EXPERT.ADDRESS.STREET

                $scope.locationId = $scope.EXPERT.LOCATION.LOCATIONID
                $scope.location = $scope.EXPERT.LOCATION.LOCATIONSTATUS


                $.map($scope.EXPERT.CONTACTS, function (item, index) {
                    if (index == 0) {
                        $scope.txtEmailA = item.EMAIL
                        $scope.txtPhoneA = item.PHONE
                        $scope.txtSocialA = item.LIKEDID
                        $scope.txtWebsiteA = item.WEBSITE
                    } else {
                        $scope.txtEmailB = item.EMAIL
                        $scope.txtPhoneB = item.PHONE
                        $scope.txtSocialB = item.LIKEDID
                        $scope.txtWebsiteB = item.WEBSITE
                    }
                })
                $.map($scope.EXPERT.DOCUMENTS, function (item) {
                    $scope.ADD_DOCUMENTS.push({
                        "STATE": item.DOCUMENTSTATE,
                        "STATUS": item.DOCUMENTSTATUS,
                        "URL": item.DOCUMENTURL,
                        "DESCRIPTION": item.DOCUMENTDESCRIPTION})
                })
                $.map($scope.EXPERT.EDUCATIONS, function (item) {
                    $scope.ADD_EDUCATIONS.push({
                        "STATUS": item.EDUCATION,
                        "GRADUATED_DATE": item.GRADUATEDDATE,
                        "DESCRIPTION": item.DESCRIPTION
                    })
                })
                $.map($scope.EXPERT.SKILLS, function (item) {
                    $.map($scope.ALLSKILLS, function (skill) {
                        if (item.SKILL == skill.SKILL) {
                            $.map($scope.LEVELS, function (lev) {
                                if (item.LEVEL == lev.LEVELSTATUS) {
                                    $scope.ADD_SKILLS.push({
                                        "SKILLID": skill.ID,
                                        "LEVELID": lev.LEVELID,
                                        "SKILL": skill.SKILL,
                                        "LEVEL": lev.LEVELSTATUS
                                    })
                                }
                            })
                        }
                    })
                })
                $.map($scope.EXPERT.LANGUAGES, function (item) {
                    $.map($scope.LANGUAGES, function (lang) {
                        if (item.LANGUAGE == lang.LANGUAGE) {
                            $.map($scope.LEVELS, function (lev) {
                                if (item.LEVEL == lev.LEVELSTATUS) {
                                    $scope.ADD_LANGUAGES.push({
                                        "LANGUAGEID": lang.ID,
                                        "LEVELID": lev.LEVELID,
                                        "LANGUAGE": lang.LANGUAGE,
                                        "LEVEL": lev.LEVELSTATUS
                                    })
                                }
                            })
                        }
                    })
                })
                $.map($scope.EXPERT.EXPERIENCES, function (item) {
                    $scope.ADD_EXPERIENCES.push({
                        "STATUS": item.EXPERIENCE,
                        "YEAR": item.YEAR,
                        "DESCRIPTION": item.DESCRIPTION
                    })
                })
            }
            console.log($scope.EXPERT, ":  :", APP_CACHE.get("EXPERT_ID"))
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }

    $scope.createData = function () {
        $scope.addContact()
        $scope.prepareSkill()
        $scope.prepareEducation()
        $scope.prepareLanguage()

        var data = {
            "FULL NAME": $scope.txtFullName,
            "GENDER": $scope.gender,
            "DATE OF BIRTH": $scope.txtDateOfBirth,
            "CURRENT WORK": $scope.txtCurrentWorkPlace,
            "SALARY": $scope.txtSalary,
            "INTEREST": $scope.txtInterest,
            "YEAR EXPERIENCE": $scope.txtYearexperience,
            "IMAGE URL": $scope.PROFILE_URL,
            "LOCATION ID": $scope.locationId,
            "ADDRESS": {
                "COMMUNE": $scope.txtCommune,
                "DISTRICT": $scope.txtDistrict,
                "CITY": $scope.city,
                "COUNTRY": $scope.txtCountry,
                "STREET NUMBER": $scope.txtStreetNumber
            },
            "CONTACTS": $scope.ADD_CONTACTS,
            "EDUCATIONS": $scope.ADD_EDUCATIONS,
            "DOCUMENTS": $scope.ADD_DOCUMENTS,
            "EXPERIENCES": $scope.ADD_EXPERIENCES,
            "LANGUAGES": $scope.ADD_LANGUAGES,
            "SKILLS": $scope.ADD_SKILLS,
            "POSITION ID": $scope.ADD_POSITIONS
        }
        console.log(data)
        return data
    }

    $scope.createExpert = function () {
        $scope.uploadProfile()
        REQUEST.POST("/expert/create", $scope.createData(), $http, function (response) {
            REQUEST.SUCCESS(response);
            $scope.reset()
            $scope.FindAllExpert()
            console.log("kkk", $scope.UPDATE)
            if ($scope.UPDATE) {             
                REQUEST.DELETE("/expert/delete/" + APP_CACHE.get("EXPERT_ID"), $http, function (data) {
                    console.log(data)
                    $scope.FindAllExpert()
                }, function (error) {
                    REQUEST.ERROR(error)
                })
            }
        }, function (error) {
            REQUEST.ERROR(error)
        })

    }

    $scope.deleteExpert = function (element) {
        DIALOG.confirm("Deleting!", element.FULLNAME + " is being deleted.", function () {
            REQUEST.DELETE("/expert/delete/" + element.ID, $http, function (data) {
                REQUEST.SUCCESS(data)
                console.log(data)
                $scope.FindAllExpert()
            }, function (error) {
                REQUEST.ERROR(error)
            })
        })
    }

    $scope.onActiveClick = function (element) {
        REQUEST.PUT_NO_DATA("/expert/update-state/" + !element.STATE + "/" + element.ID, $http, function (data) {
        }, function (data) {
            REQUEST.ERROR(data)
        })
    }


    $scope.FindAllExpert()


    $scope.sort = function (keyname, name) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.sortName = name;
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }

    $scope.reset = function () {
        $scope.txtFullName = ""
        $scope.gender = ""
        $scope.txtDateOfBirth = ""
        $scope.txtCurrentWorkPlace = ""
        $scope.txtSalary = ""
        $scope.txtInterest = ""
        $scope.txtYearexperience = ""
        $scope.locationId = ""
        $scope.ADD_SKILLS = []
        $scope.ADD_LANGUAGES = []
        $scope.ADD_SKILLS = []
        $scope.ADD_EXPERIENCES = []
        $scope.ADD_DOCUMENTS = []
        $scope.ADD_POSITIONS = []
        $scope.ADD_EDUCATIONS = []
        $scope.ADD_CONTACTS = []
        $scope.SKILLS = []
        $.map($scope.LANGUAGES, function (item) {
            item.CHECKED = false
        })

    }
});
