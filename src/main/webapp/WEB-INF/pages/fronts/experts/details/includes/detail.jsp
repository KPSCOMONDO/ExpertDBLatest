<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section>
    <div class="container" style="margin-top: 20px;">
        <span class="pull-left subject">
            <a href="${pageContext.request.contextPath}/home"><span class="fa fa-home"></span>&nbsp;ទំព័រដើម</a>
            <a href="${pageContext.request.contextPath}/expert/filter">/ទំព័រស្វែងរក</a>
            <span>/ទំព័រព័តិមានលំអិត</span>
        </span> 
    </div>
    <div class="mbr-section__container mbr-section__container--isolated container"> 
        <div class="col-sm-8" style="border-right: #004444 1px solid">
            <div>             
                <div class="content-detail">
                    <%--      ------------ BSIC INFO ----------------------- --%>                   
                    <div class="content-detail"> 
                        <h3>
                            <i class="fa fa-align-right fa-2x text-blue"></i>
                            <strong class="text-blue">ព័តិមានផ្ទាល់ខ្លួន</strong>
                        </h3>
                        <div class="condent-left">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 30%;"><h4 class="text--title">ឈ្មោះ</h4></td>
                                    <td><h4>{{EXPERTS.FULLNAME}}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4 class="text--title">ភេទ</h4></td>
                                    <td><h4>{{EXPERTS.GENDER}}</h4></td>
                                </tr> 
                                <tr>
                                    <td style="width: 30%;"><h4 class="text--title">ថ្ងៃខែឆ្នាំកំណើត</h4></td>
                                    <td><h4>{{EXPERTS.DATEOFBIRTH| date}}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4 class="text--title">អាយុ</h4></td>
                                    <td><h4>{{EXPERTS.AGE}}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4 class="text--title">អាស័យដ្ឋាន</h4></td>
                                    <td>
                                        <span>St.{{EXPERTS.ADDRESS.STREET}}&nbsp;,</span>
                                        <span>&nbsp;{{EXPERTS.ADDRESS.COMMUNE}}&nbsp;commune,</span>
                                        <span>&nbsp;{{EXPERTS.ADDRESS.DISTRICT}}&nbsp;district,</span>
                                        <span>&nbsp;{{EXPERTS.ADDRESS.CITY}}&nbsp;,</span>
                                        <span>{{EXPERTS.ADDRESS.COUNTRY}}</span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>    

                    <div class="content-detail">
                        <%--      ------------ Education ----------------------- --%>
                        <h3>
                            <i class="fa fa-graduation-cap fa-2x text-blue"></i>
                            <strong class="text-blue">ការសិក្សារ</strong>
                        </h3>
                        <div class="condent-left"> 
                            <div class="item" ng-repeat="item in EXPERTS.EDUCATIONS" style="padding-top: 30px;">                      
                                <h4><i class="fa fa-university" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}"></i>
                                    &nbsp;&nbsp;<strong>{{item.EDUCATION}}</strong></h4>
                                <p class="mbr-reviews__up__text mbr-reviews__up__p">
                                    {{item.DESCRIPTION}}
                                    <span class="year">&nbsp;&nbsp;({{item.EDUCATEDDATE}})</span>
                                </p>
                            </div>                               
                        </div>
                    </div>
                    <%--      ------------ Language ----------------------- --%>
                    <div class="content-detail"> 
                        <h3>
                            <i class="fa fa-comments-o fa-2x text-blue"></i>
                            <strong class="text-blue">ភាសា</strong>
                        </h3>
                        <div class="condent-left">
                            <table style="width: 100%" class="table-striped">                            
                                <tbody>
                                    <tr ng-repeat="item in EXPERTS.LANGUAGES" style="font-size: 12pt">
                                        <td><h6><i class="fa fa-circle-o" 
                                                   ng-class="{'text-blue':($index % 2 === 0),
                                                'text-red':($index % 3 === 0),
                                                'text-green':($idex % 2 !== 0),
                                                'text-yellow':($index % 3 !== 0)}">

                                                </i>
                                                {{item.LANGUAGE}}</h6></td>
                                        <td><spap class="pull-right">{{item.LEVEL}}</spap></td>
                                </tr>                                        
                                </tbody>
                            </table>
                        </div>
                    </div> 
                    <div class="content-detail">
                        <%--      ------------ Skill ----------------------- --%>
                        <h3>
                            <i class="fa fa-circle-o-notch fa-2x text-blue"></i>
                            <strong class="text-blue">ជំនាញ</strong>
                        </h3>
                        <div class="condent-left">                                  
                            <table style="width: 100%;" class="table-striped">                               
                                <tbody>
                                    <tr ng-repeat="item in EXPERTS.SKILLS">
                                        <td>
                                            <h6><i class="fa fa-circle-o" 
                                                   ng-class="{'text-blue':($index % 2 === 0),
                                                               'text-red':($index % 3 === 0),
                                                               'text-green':($idex % 2 !== 0),
                                                               'text-yellow':($index % 3 !== 0)}">

                                                </i>
                                                {{item.SKILL}}
                                            </h6>
                                        </td>
                                        <td>                                                                                          
                                            <span class="pull-right">{{item.LEVEL}}</span>                                                                                                                                     
                                        </td>                                           
                                    </tr>                                            
                                </tbody>
                            </table>
                        </div> 
                    </div>

                    <%--      ------------ WORK EXPERIENCE ----------------------- --%>
                    <div class="content-detail"> 
                        <h3>
                            <i class="fa fa-bar-chart fa-2x text-blue"></i>
                            <strong class="text-blue">បទពិសោធន៍ការងារ</strong>
                        </h3>
                        <div class="condent-left" ng-repeat="item in EXPERTS.EXPERIENCES" style="padding-top: 40px;">                                    
                            <h3>
                                <i class="fa fa-chain" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}">                                            
                                </i>&nbsp;&nbsp;<strong>{{item.EXPERIENCE}}</strong>
                                <span class="year sub-menu">&nbsp;&nbsp;({{item.YEAR}})</span>
                            </h3>                                    
                            <p class="mbr-reviews__up__text mbr-reviews__up__p text-black">
                                {{item.DESCRIPTION}}
                            </p>                                    
                        </div>
                    </div>
                    <%-- --------------------- OTHER PROJECT ------------------ -----%>

                    <div class="content-detail"> 
                        <h3>
                            <i class="fa fa-expand fa-2x text-blue"></i>
                            <strong class="text-blue">គំរោងផ្សេងៗ</strong>
                        </h3>
                        <div class="condent-left" ng-repeat="item in EXPERTS.DOCUMENTS" ng-if="item.DOCUMENTSTATE == 'Project'">
                            <div style="padding-bottom: 40px;">        
                                <h3> 
                                    <i class="fa fa-github" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}"></i>
                                    <strong>{{item.DOCUMENTSTATUS}}</strong>&nbsp;<small>គំរោង</small>                                            
                                </h3>
                                <p>{{item.DOCUMENTDESCRIPTION}}</p>                                       
                                <p class="group">
                                    <a href="{{item.DOCUMENTURL}}" style="text-decoration: none">
                                        <i class="fa fa-download" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}">&nbsp;ទាញយក&nbsp;&nbsp;&nbsp;&nbsp;</i>                                                
                                    </a>
                                    <a href="{{item.DOCUMENTURL}}" style="text-decoration: none">
                                        <i class="fa fa-info" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 == 0)}">&nbsp;ព័តិមានលំអិត</i>                                                
                                    </a>
                                </p>
                            </div>
                        </div>                                                                         
                    </div>


                    <%--      ------------ DOCUMENTATION ----------------------- --%>

                    <div class="content-detail"> 
                        <h3>
                            <i class="fa fa-file-archive-o fa-2x text-blue"></i>
                            <strong class="text-blue">ឯកសារ ផ្សេងៗ</strong>
                        </h3>
                        <div class="condent-left" ng-repeat="item in EXPERTS.DOCUMENTS" ng-if="item.DOCUMENTSTATE == 'Transcript'">
                            <div style="padding-bottom: 40px;">         
                                <h3> 
                                    <i class="fa fa-certificate" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}"></i>
                                    <strong>{{item.DOCUMENTSTATUS}}</strong>&nbsp;<small>វិញ្ញាប័នប័ត្រ</small>                                            
                                </h3>
                                <p>{{item.DOCUMENTDESCRIPTION}}</p>                                       
                                <p class="group">
                                    <a href="{{item.DOCUMENTURL}}" style="text-decoration: none">
                                        <i class="fa fa-download" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}">&nbsp;ទាញយក&nbsp;&nbsp;&nbsp;&nbsp;</i>                                                
                                    </a>
                                    <a href="{{item.DOCUMENTURL}}" style="text-decoration: none">
                                        <i class="fa fa-info" ng-class="{'text-green':($index != 2 == 0),'text-red':($index % 2 == 0)}">&nbsp;ព័តិមានលំអិត</i>                                                
                                    </a>
                                </p>
                            </div>
                        </div>
                        <div  class="condent-left" ng-repeat="item in EXPERTS.DOCUMENTS" ng-if="item.DOCUMENTSTATE == 'Certificate'">
                            <div style="padding-bottom: 40px;">         
                                <h3> 
                                    <i class="fa fa-paper-plane" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}"></i>
                                    <strong>{{item.DOCUMENTSTATUS}}</strong>&nbsp;<small>សញាប័ត្រ</small>                                            
                                </h3>
                                <p>{{item.DOCUMENTDESCRIPTION}}</p>                                       
                                <p class="group">
                                    <a href="{{item.DOCUMENTURL}}" style="text-decoration: none">
                                        <i class="fa fa-download" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}">&nbsp;ទាញយក&nbsp;&nbsp;&nbsp;&nbsp;</i>                                                
                                    </a>
                                    <a href="{{item.DOCUMENTURL}}" style="text-decoration: none">
                                        <i class="fa fa-info" ng-class="{'text-green':($index != 2 == 0),'text-red':($index % 2 == 0)}">&nbsp;ព័តិមានលំអិត</i>                                                
                                    </a>
                                </p>
                            </div>
                        </div>
                        <div class="condent-left" ng-repeat="item in EXPERTS.DOCUMENTS" ng-if="item.DOCUMENTSTATE == 'Achievement'">
                            <div style="padding-bottom: 40px;">         
                                <h3> 
                                    <i class="fa fa-certificate" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}"></i>
                                    <strong>{{item.DOCUMENTSTATUS}}</strong>&nbsp;<small>ស្នារដៃ</small>                                            
                                </h3>
                                <p>{{item.DOCUMENTDESCRIPTION}}</p>                                       
                                <p class="group">
                                    <a href="{{item.DOCUMENTURL}}" style="text-decoration: none">
                                        <i class="fa fa-download" ng-class="{'text-green':($index % 2 == 0),'text-red':($index % 2 != 0)}">&nbsp;ទាញយក&nbsp;&nbsp;&nbsp;&nbsp;</i>                                                
                                    </a>
                                    <a href="{{item.DOCUMENTURL}}" style="text-decoration: none">
                                        <i class="fa fa-info" ng-class="{'text-green':($index != 2 == 0),'text-red':($index % 2 == 0)}">&nbsp;ព័តិមានលំអិត</i>                                                
                                    </a>
                                </p>
                            </div>
                        </div> 
                    </div>                                                                                             
                </div>
            </div>           
        </div>
        <div class="col-sm-4"> 
            <div class="content-detail">
                <button class="btn btn-info mbr-buttons__link">ដាក់បញ្ចូលក្នុងបញ្ចី ចូលចិត្ត</button>
            </div>
            <div class="content-detail">
                <h3>
                    <i class="fa fa-share fa-2x text-blue"></i>
                    <strong class="text-blue">ចែកចាយ</strong>
                </h3>
                <!-- I got these buttons from simplesharebuttons.com -->
                <div id="share-buttons">
                    <!-- Email -->
                    <a href="mailto:?Subject=Simple Share Buttons&amp;Body=I%20saw%20this%20and%20thought%20of%20you!%20 https://simplesharebuttons.com">
                        <img src="/resources/static/assets/images/Gmail.png" alt="Gmail" />
                    </a>
                    <!-- Facebook -->
                    <a href="http://www.facebook.com/sharer.php?u=https://simplesharebuttons.com" target="_blank">
                        <img src="/resources/static/assets/images/facebook-icon.png" alt="Facebook" />
                    </a>
                    <!-- Google+ -->
                    <a href="https://plus.google.com/share?url=https://simplesharebuttons.com" target="_blank">
                        <img src="/resources/static/assets/images/google+.png" alt="Google" />
                    </a>
                    <!-- LinkedIn -->
                    <a href="http://www.linkedin.com/shareArticle?mini=true&amp;url=https://simplesharebuttons.com" target="_blank">
                        <img src="/resources/static/assets/images/Linked-in.png" alt="LinkedIn" />
                    </a>
                    <!-- Twitter -->
                    <a href="https://twitter.com/share?url=https://simplesharebuttons.com&amp;text=Simple%20Share%20Buttons&amp;hashtags=simplesharebuttons" target="_blank">
                        <img src="/resources/static/assets/images/Twitter.png" alt="Twitter" />
                    </a>
                </div>
            </div>
            <div class="content-detail">     
                <h3>
                    <i class="fa fa-chain-broken fa-2x text-blue"></i>
                    <strong class="text-blue">ទំនាក់ទំនង</strong>
                </h3>
                <h4 class="subject" ng-repeat="item in EXPERTS.CONTACTS" ng-if="item.EMAIL">
                    <i class="glyphicon glyphicon-envelope"></i>
                    <a href="#">&nbsp;&nbsp;{{item.EMAIL}}</a>
                </h4>
                <h4 class="subject" ng-repeat="item in EXPERTS.CONTACTS" ng-if="item.WEBSITE">
                    <i class="glyphicon glyphicon-globe"></i>
                    <a href="#">&nbsp;&nbsp;{{item.WEBSITE}}</a>
                </h4>
                <h4 class="subject" ng-repeat="item in EXPERTS.CONTACTS" ng-if="item.PHONE">
                    <i class="glyphicon glyphicon-phone"></i>
                    <a href="#">&nbsp;&nbsp;{{item.PHONE}}</a>
                </h4>            
                <h4 class="subject" ng-repeat="item in EXPERTS.CONTACTS" ng-if="item.LIKEDIN">
                    <i class="glyphicon glyphicon-list-alt"></i>
                    <a href="#">&nbsp;&nbsp;{{item.LIKEDIN}}</a>
                </h4>  
            </div>
        </div>
    </div>
</section>
