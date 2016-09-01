<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="box-info box" ng-class="{'collapsed-box':formHide}">
    <div class="box-header">
        <h3 class="box-title">បង្កើត អ្នកជំនាញ
            <small>ចុចសញ្ញា +</small>
        </h3>
        <div class="pull-right">            
            <input type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" 
                   ng-click="onAddClick()" value="{{BTADD}}"/>                                        
        </div>
    </div>
    <div id="head">        
        <div class="box-body">
            <div class="col-sm-12">
                <form id="profileform">                   
                    <div class="form-group">
                        <img src="" style="width: 80px;height: 100px;" alt="UNAVALIABEL">
                        <label for="txtProfile">បញ្ចូលរូបភាព</label>
                        <input id="txtProfile" type="file" name="file">                                                   
                    </div>
                </form>  
            </div>                  
            <form ng-submit="createExpert()" novalidate>
                <div class="col-sm-6">  
                    <h3 class="box-title text-red">ព័តិតមានផ្ទាល់ខ្លួន</h3>

                    <%----------------------------------------- Basic information  ----------------------------------%>                    
                    <div class="form-group">
                        <label for="txtFullName">ឈ្មោះ</label>
                        <input ng-model="txtFullName" id="txtFullName" type="text" class="form-control" placeholder="ឈ្មោះ" required>
                    </div>
                    <div class="form-group">
                        <label for="cboGender">ភេទ</label>
                        <select class="form-filter expert--province--select form-control" id="cboGender" 
                                ng-model="cboGender" ng-options="item.VALUE for item in GENDERS" required>
                            <option value="" selected>-- {{gender}} --</option>
                        </select>            
                    </div>
                    <div class="form-group">
                        <label for="txtDateOfBirth">ថ្ងៃខែឆ្នាំកំណើត</label>
                        <input ng-model="txtDateOfBirth" id="txtDateOfBirth" type="date" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="txtInterest">ចំណង់ចំណូលចិត្ត</label>
                        <textarea ng-model="txtInterest" id="txtInterest" rows="4" class="form-control" placeholder="ចំណង់ចំណូលចិត">
                        </textarea>
                    </div>
                </div>                
                <div class="col-sm-6">
                    <%----------------------------------------- Address  ----------------------------------%>                    
                    <h3 class="box-title text-red">អាស័យដ្ឋានប្បច្ចុបន្ន</h3>
                    <div class="form-group">
                        <label for="txtStreetNumber">លេខផ្លូវ</label>
                        <input ng-model="txtStreetNumber" id="txtStreetNumber" type="text" class="form-control" placeholder="េលខផ្លូវ" required>
                    </div>                 
                    <div class="form-group">
                        <label for="txtCommune">ភូមិ</label>
                        <input ng-model="txtCommune" id="txtCommune" type="text" class="form-control" placeholder="Commune name" required>
                    </div>
                    <div class="form-group">
                        <label for="txtDistrict">ឃុំ / សង្កាត់</label>
                        <input ng-model="txtDistrict" id="txtDistrict" type="text" class="form-control" placeholder="District name" required>
                    </div>
                    <div class="form-group">
                        <label for="cboCity">ខេត្ត / ក្រុង</label>
                        <select class="form-filter expert--province--select form-control" ng-model="cboCity" ng-options="item.LOCATIONSTATUS for item in LOCATIONS" id="cboCity">
                            <option value="">-- {{city}} --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtCountry">ប្រទេស</label>
                        <input ng-model="txtCountry" id="txtCountry" type="text" class="form-control" placeholder="Country name" required>
                    </div>
                </div>
                <div class="col-sm-12">
                    <%----------------------------------------- Contact  ----------------------------------%>
                    <h3 class="box-title text-red">ទំនាក់ទំនង</h3>
                    <div class="col-sm-6 row">
                        <div class="form-group">
                            <label for="txtPhoneA">លេខទូរស័ព្ទខ្សែរទី​ ១</label>
                            <input ng-model="txtPhoneA" id="txtPhoneA" type="text" class="form-control" placeholder="េខទូរស័ព្ទខ្សែរទី​ ១" required>
                        </div>
                        <div class="form-group">
                            <label for="txtEmailA">អុីម៉ែល​ ១</label>
                            <input ng-model="txtEmailA" id="txtEmailA" type="email" class="form-control" placeholder="អុីម៉ែល​ ១" required>
                        </div>                        
                    </div>
                    <div class="col-sm-6">                        
                        <div class="form-group">
                            <label for="txtPhoneB">េខទូរស័ព្ទខ្សែរទី​ ២</label>
                            <input ng-model="txtPhoneB" id="txtPhoneB" type="text" class="form-control" placeholder="េខទូរស័ព្ទខ្សែរទី​ ២">
                        </div>
                        <div class="form-group">
                            <label for="txtEmailB">អុីម៉ែល​ ២</label>
                            <input ng-model="txtEmailB" id="txtEmailB" type="email" class="form-control" placeholder="អុីម៉ែល​ ២">
                        </div>                        
                    </div>
                    <div class="form-group">
                        <label for="txtWebsiteA">Website/block URL 1</label>
                        <input ng-model="txtWebsiteA" id="txtWebsiteA" type="text" class="form-control" placeholder="Website/block URL 1">
                    </div>
                    <div class="form-group">
                        <label for="txtWebsiteB">Website/block URL 2</label>
                        <input ng-model="txtWebsiteB" id="txtWebsiteB" type="text" class="form-control" placeholder="Website/block URL 2">
                    </div>

                    <div class="form-group">
                        <label for="txtSocialA">Facebook/LinkedIn URL 1</label>
                        <input ng-model="txtSocialA" id="txtSocialA" type="text" class="form-control" placeholder="Socail URL 1">
                    </div>
                    <div class="form-group">
                        <label for="txtSocialB">Facebook/LinkedIn URL 2</label>
                        <input ng-model="txtSocialB" id="txtSocialB" type="text" class="form-control" placeholder="Social URL 2">
                    </div>
                </div>

                <div class="col-sm-6">
                    <%------------------------------------ Work Experience ------------------------%>
                    <h3 class="box-title text-red">ព័តិមាន​ អំពីការងារ</h3>                                    
                    <div class="form-group">
                        <label for="txtCurrentWorkPlace">ទីតាំងការងារ ប្បច្ចុបន្ន</label>
                        <input ng-model="txtCurrentWorkPlace" id="txtCurrentWorkPlace" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="cboPositionA">តួនាទីការងារ</label>
                        <select class="form-filter expert--province--select form-control" ng-model="cboPositionA" 
                                ng-options="item.POSITION for item in POSITIONS" id="cboPositionA" required>
                            <option value="">-- ជ្រើសរើសមួយ --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtYearexperience">បទពិសោធន៍ ការងារ</label>
                        <input ng-model="txtYearexperience" id="txtYearexperience" type="number" class="form-control" placeholder="បទពិសោធន៍ ការងារ" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <h3 class="box-title text-red">ចំណាប់​ អារម្មរណ៍​ ការងារ</h3>                                       
                    <div class="form-group">
                        <label for="cboPositionB">តួនាទី​ការងារ</label>
                        <select class="form-filter expert--province--select form-control" ng-model="cboPositionB" ng-options="item.POSITION for item in POSITIONS" id="cboPositionB" required>
                            <option value="">-- ជ្រើរើសមួយ --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtSalary">ប្រាក់ខែ</label>
                        <input ng-model="txtSalary" id="txtSalary" type="number" class="form-control" placeholder="Salary" required>
                    </div> 
                    <div class="form-group">
                        <label for="cboLocation">ទីតាំងការងារ</label>
                        <select class="form-filter expert--province--select form-control" ng-model="cboLocation" ng-options="item.LOCATIONSTATUS for item in LOCATIONS" id="cboLocation" required>
                            <option value="">-- {{location}} --</option>
                        </select>
                    </div>
                </div>

                <div class="col-sm-12">
                    <div class="col-sm-6">
                        <%-- ---------------------------------------  Language  -------------------------------%>
                        <h3 class="box-title text-red">ភាសា</h3>
                        <div class="box-body">                
                            <div class="form-group">
                                <table style="width: 100%;" class="t able-striped table-condensed">
                                    <tr ng-repeat="item in LANGUAGES"> 
                                        <td style="width: 40%;">
                                            <input type="checkbox" ng-click="onLanguageCheck(item)" id="{{item.LANGUAGE}}">
                                            <label for="{{item.LANGUAGE}}">&nbsp;&nbsp;{{item.LANGUAGE}}</label>
                                        </td>
                                        <td ng-repeat="level in LEVELS">
                                            <input ng-checked="!item.CHECKED" ng-click="onLaguageLevelCheck(item, level)" type="radio" 
                                                   name="{{item.LANGUAGE}}" id="{{level.LEVELSTATUS}}" required ng-show="item.CHECKED">
                                            &nbsp;&nbsp;{{level.LEVELSTATUS}}                                
                                        </td>                                   
                                    </tr>
                                </table>               
                            </div>
                        </div>
                    </div> 
                    <div class="col-sm-6">
                        <h4 class="box-title text-red">ភាសា ដែលបានបញ្ចូលរួច</h4>                        
                        <table class="table-condensed table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>ភាសា</th>
                                    <th>កំរិត</th>                                
                                    <th>សកម្មភាព</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="item in ADD_LANGUAGES">
                                    <td>{{$index + 1}}</td>
                                    <td>{{item.LANGUAGE}}</td>
                                    <td>{{item.LEVEL}}</td>                                
                                    <td>
                                        <label for="{{item.LANGUAGE}}" ng-click="deleteLanguage($index)" class="btn btn-danger btn-xs">
                                            <i class="fa fa-remove"></i>
                                        </label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <input type="submit" id="btSubmit" class="hidden">
                <input type="reset" id="btReset" class="hidden">                                                                                                
            </form>
            <div class="col-sm-12">
                <div class="col-sm-10">
                    <h3 class="box-title text-red">ការសិក្សា</h3>                                       
                    <form ng-submit="addEducation()">
                        <div class="form-group">
                            <label for="txtMajor">ឈ្មោះ​មុខ ជំនាញ / វគ្គ</label>
                            <input ng-model="txtMajor" id="txtMajor" type="text" class="form-control" placeholder="ជំនាញ / វគ" required>
                        </div>
                        <div class="form-group">                            
                            <div class="col-sm-2">
                                <label for="txtGraduateDate">ថ្ងៃបញ្ចប់ការសិក្សា</label>
                            </div>
                            <div class="col-sm-5">
                                <input ng-model="txtGraduateDate" id="txtGraduateDate" type="date" class="form-control" required>
                            </div>                                                                                                             
                        </div>
                        <div class="form-group">
                            <br><br>
                            <label for="txtEducationDescription">លំអិត</label>
                            <textarea ng-model="txtEducationDescription" id="txtEducationDescription" rows="5" class="form-control" placeholder="Education description" required></textarea>
                        </div>      
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"><span class='fa fa-plus'>បញ្ចូល</span></button>
                            <button type="reset" class="btn btn-danger"><span class='fa fa-plus'>សំអាត</span></button>
                        </div>
                    </form>
                </div>
                <div class="col-sm-12">
                    <h4 class="box-title text-red">ការសិក្សា​ បញ្ចូលរួច</h4>                        
                    <table class="table-condensed table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>មុខ ជំនាញ /​ វគ្គ</th>
                                <th>ឆ្នាំបញ្ចប់</th>
                                <th>លំអាត</th>
                                <th>សកម្មភាព</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="item in ADD_EDUCATIONS">
                                <td>{{$index + 1}}</td>
                                <td>{{item.STATUS}}</td>
                                <td>{{item.GRADUATED_DATE}}</td>
                                <td>{{item.DESCRIPTION}}</td>
                                <td>
                                    <a ng-click="deleteEducation($index)" class="btn btn-danger btn-xs">
                                        <i class="fa fa-remove"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-sm-12">
                <%--------------------------------- Work Experience --------------------------------------%>
                <div class="col-sm-10">
                    <form ng-submit="addExperience()">
                        <h3 class="box-title text-red">បទពិសោធន៍ការងារ</h3>                                    
                        <div class="form-group">
                            <label for="txtPosition">តួនាទីការងារ</label>
                            <input ng-model="txtPosition" id="txtPosition" type="text" class="form-control" 
                                   placeholder="តួនាទីការងារ" required>
                        </div>
                        <div class="form-group">                           
                            <div>
                                <div class="col-sm-2">
                                    <label for="txtYearFromB">ឆ្នាំចាប់ផ្តើម</label>
                                </div>
                                <div class="col-sm-4">
                                    <input ng-model="txtYearFromB" id="txtYearFromB" type="date" class="form-control" 
                                           placeholder="From" required>
                                </div>
                                <div class="col-sm-2">
                                    <label for="txtYearToB">រហូតដល់ ឆ្នាំ</label>
                                </div>
                                <div class="col-sm-4">
                                    <input ng-model="txtYearToB" id="txtYearToB" type="date" class="form-control" 
                                           placeholder="To" required>
                                </div>
                            </div>                                                                       
                        </div>
                        <div class="form-group">
                            <label for="txtExperienceDescription">លំអិត</label>
                            <textarea ng-model="txtExperienceDescription" id="txtExperienceDescription" rows="5" class="form-control" 
                                      placeholder="ព័តិមានលំអិតអំពីការងារ" required></textarea>
                        </div>      
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"><span class='fa fa-plus'>បញ្ចូល</span></button>
                            <button type="reset" class="btn btn-danger"><span class='fa fa-plus'>សំអាត</span></button>
                        </div>
                        </h3>
                    </form>
                </div>
                <div class="col-sm-12">
                    <h4 class="box-title text-red">បទពិសោធន៍ដែលបញ្ចូលរួច</h4>                        
                    <table class="table-condensed table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>តួនាទីការងារ</th>
                                <th>ឆ្នាំ</th>
                                <th>លំអិត</th>
                                <th>សកម្មភាព</th>
                            </tr>                        
                        </thead>
                        <tbody>
                            <tr ng-repeat="item in ADD_EXPERIENCES"> 
                                <td>{{$index + 1}}</td>
                                <td>{{item.STATUS}}</td>
                                <td>{{item.YEAR}}</td>
                                <td>{{item.DESCRIPTION}}</td>                                
                                <td>
                                    <a ng-click="deleteExperience($index)" class="btn btn-danger btn-xs">
                                        <i class="fa fa-remove"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-sm-12">
                <div class="col-sm-6">
                    <%-- --------------------------------------- SKILL =-------------------------------%>
                    <h3 class="box-title text-red">ជំនាញ</h3>
                    <div class="box-body">
                        <label for="cboCategory"></label>
                        <select class="form-filter form-control" ng-model="cboCategory" 
                                ng-options="item.CATEGORYSTATUS for item in SKILLCATEGORIES" id="cboCategory">
                            <option value="">-- ជ្រើសរើសមួយ --</option>
                        </select>                
                        <br>
                        <div class="form-group">
                            <table style="width: 100%;" class="t able-striped table-condensed">
                                <tr ng-repeat="item in SKILLS"> 
                                    <td style="width: 40%;">
                                        <input type="checkbox" value="" ng-click="onSkillCheck(item)" id="{{item.SKILL}}">
                                        <label for="{{item.SKILL}}">&nbsp;&nbsp;{{item.SKILL}}</label>
                                    </td>
                                    <td ng-show="item.CHECKED" ng-repeat="level in LEVELS">
                                        <input ng-checked="!item.CHECKED" ng-click="onSkillLevelCheck(item, level)" type="radio" 
                                               name="{{item.SKILL}}" id="{{level.LEVELSTATUS}}" required>&nbsp;&nbsp;{{level.LEVELSTATUS}}                                
                                    </td>                                    
                                </tr>
                            </table>               
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <h4 class="box-title text-red">ជំនាញដែលបានបញ្ចូលរួច</h4>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>ជំនាញ</th>
                                <th>កំរិត</th>
                                <th>សកម្មភាព</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="item in ADD_SKILLS">
                                <td>{{$index + 1}}</td>
                                <td>{{item.SKILL}}</td>
                                <td>{{item.LEVEL}}</td>
                                <td>
                                    <label ng-click="deleteSkill($index)" for="{{item.SKILL}}" class="btn btn-danger btn-xs">
                                        <i class="fa fa-remove"></i>
                                    </label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>                
            </div>

            <div class="col-sm-12">
                <%-- ---------------------------------------  Document  -------------------------------%>
                <div class="col-sm-10">
                    <form ng-submit="addDocument()" id="docForm">
                        <h3 class="box-title text-red">ឯកសារផ្សេងៗ</h3>
                        <div class="box-body">      
                            <div class="form-group">
                                <label>ប្រភេទឯកសារ</label><br>
                                <span ng-repeat="item in DOCUMENTS" style="margin-right: 20px;">
                                    <input type="radio" ng-click="onDocumentTypeClick(item)" 
                                           name="document" required>&nbsp;&nbsp;&nbsp;{{item.VALUE}}                                
                                </span>              
                            </div>
                            <div class="form-group">
                                <label for="txtDocumentTitle">ចំណងជើង</label>                                                       
                                <input ng-model="txtDocumentTitle" id="txtDocumentTitle" type="text" 
                                       class="form-control" placeholder="Title" required>
                            </div>                            
                            <div class="form-group">
                                <label for="Upload">បន្ថែមឯកាសារ</label>                                                      
                                <input ng-model="Upload" name="file1" type="file"></textarea>                                                                                                    
                            </div>
                            <div class="form-group">
                                <label for="txtDocURL">URL</label>                                                      
                                <input ng-model="DOC_URL" id="txtDocURL" class="form-control" type="text"></textarea>                                                                                                    
                            </div>
                            <div class="form-group">
                                <label for="txtDocumentDescription">លំអិត</label>                                                      
                                <textarea ng-model="txtDocumentDescription" id="txtDocumentDescription" rows="5" 
                                          class="form-control" placeholder="លំអិត" required></textarea>                                                                                                    
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary"><span class='fa fa-plus'>បញ្ចូល</span></button>
                                <button type="reset" class="btn btn-danger"><span class='fa fa-plus'>សំអាត</span></button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-sm-12 table-responsive">
                    <h4 class="box-title text-red">ឯកសារដែលបានដាក់បញ្ចូល</h4>                        
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>ប្រភេទឯកសារ</th>
                                <th>ចំណងជើង</th>
                                <th>លំអិត</th>
                                <th>សកម្មភាព</th>
                            </tr>                                
                        </thead>
                        <tbody>
                            <tr ng-repeat="item in ADD_DOCUMENTS">
                                <td>{{$index + 1}}</td>
                                <td>{{item.STATE}}</td>
                                <td>{{item.STATUS}}</td>
                                <td>{{item.DESCRIPTION}}</td>
                                <td>
                                    <a ng-click="deleteDocument($index)" class="btn btn-danger btn-xs">
                                        <i class="fa fa-remove"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div> 
    </div>
    <div class="box-footer">
        <label class="btn btn-primary" for="btSubmit">រក្សារទុក</label>
        <label type="reset" ng-click="reset()" class="btn btn-danger" for="btReset">សំអាត</label>
    </div>    
</div>
