<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="mbr-navbar mbr-navbar--freeze mbr-navbar--absolute mbr-navbar--sticky mbr-navbar--auto-collapse" id="menu-41">
    <div class="mbr-navbar__section mbr-section">
        <div class="mbr-section__container container">
            <div class="mbr-navbar__container">
                <div class="mbr-navbar__column mbr-navbar__column--s mbr-navbar__brand">
                    <span class="mbr-navbar__brand-link mbr-brand mbr-brand--inline">                                                    
                        <span class="mbr-brand__logo">
                            <a href="${pageContext.request.contextPath}/">
                                <img class="mbr-navbar__brand-img mbr-brand__img" src="${pageContext.request.contextPath}/resources/static/img/app-logo.png" alt="Mobirise">
                            </a>
                        </span>
                        <span class="mbr-brand__name">
                            <a class="mbr-brand__name text-white" href="${pageContext.request.contextPath}/">GEEKH</a>
                        </span>
                    </span>
                </div>
                <div class="mbr-navbar__hamburger mbr-hamburger text-white"><span class="mbr-hamburger__line"></span></div>
                <div class="mbr-navbar__column mbr-navbar__menu">
                    <nav class="mbr-navbar__menu-box mbr-navbar__menu-box--inline-right">
                        <div class="mbr-navbar__column">
                            <ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-decorator mbr-buttons--active">
                                <li class="mbr-navbar__item">
                                    <a class="mbr-buttons__link btn text-white" href="${pageContext.request.contextPath}/">ទំព័រដើម</a>
                                </li>                                                              
                            </ul>
                        </div>
                        <div class="mbr-navbar__column">
                            <ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-decorator mbr-buttons--active">
                                <li class="mbr-navbar__item">
                                    <a class="mbr-buttons__link btn text-white" href="${pageContext.request.contextPath}/expert/filter">ស្វេងរកបេក្ខភាព</a>
                                </li>                                                              
                            </ul>
                        </div>
                        <div ng-if="(LOGIN != true)" class="mbr-navbar__column">
                            <ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-inverse mbr-buttons--active">
                                <li class="mbr-navbar__item">
                                    <a  class="mbr-buttons__link mbr-buttons__btn btn btn-default" href="${pageContext.request.contextPath}/login">ចូលប្រើប្រាស់</a>
                                </li>                                
                            </ul>
                        </div>                        
                    </nav>
                </div>
                <div ng-if="(LOGIN == true)" class="mbr-navbar__column pull-right">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="/resources/static/img/profile/channy.jpg" style="width: 40px;height: 40px;border-radius: 50%;padding-top:0;padding-bottom: 0p;margin-top: 10px;margin-bottom: 10px;"  alt="User Image">
                    </a>
                    <div class="dropdown-menu panel row" style="width: 250px;padding: 0;background-color: #2196F3">                                        
                        <div class="text-center panel-heading" style="">
                            <img src="/resources/static/img/profile/channy.jpg" style="width: 60px;height: 60px;border-radius: 50%;" alt="User Image">
                            <p>
                                Sok Channy
                            </p>
                        </div>
                        <div class="col-2 panel-body">                           
                            <div class="text-right subject">
                                <a ng-click="logOut()" href="${pageContext.request.contextPath}/logout" class="text-white"><small class="text-white">ចាកចេញ</small>&nbsp;&nbsp;<span class="glyphicon glyphicon-log-out text-white"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>   