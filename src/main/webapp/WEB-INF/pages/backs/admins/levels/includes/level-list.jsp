<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<div class="row">
    <div class="col-xs-12">                        
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">បញ្ជី</h3>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th ng-click="sort('LEVELSTATUS')">កំរិត
                                <span class="fa" ng-show="sortKey == 'LEVELSTATUS'" 
                                      ng-class="{'fa-sort-desc':reverse,'fa-sort-asc':!reverse}">              
                                </span>
                            </th>
                            <th ng-click="sort('LEVELRANGE')">តួលេខ
                                <span class="fa" ng-show="sortKey == 'LEVELRANGE'" 
                                      ng-class="{'fa-sort-desc':reverse,'fa-sort-asc':!reverse}">              
                                </span>
                            </th>                        
                        </tr>
                    </thead>
                    <tbody>
                        <tr dir-paginate="item in LEVELS|orderBy:sortKey:reverse|filter:search|itemsPerPage:5">
                            <td>{{$index + 1}}</td>
                            <td><input type="text" ng-model="item.LEVELSTATUS" class="edit--text" ng-class="{'edit--text--enable':item.STATUS}" ng-disabled="!item.STATUS"/></td>
                            <td><input type="text" ng-model="item.LEVELRANGE" class="edit--text" ng-class="{'edit--text--enable':item.STATUS}" ng-disabled="!item.STATUS"/></td>                            
                        </tr>                                
                    </tbody>
                    <div class="pull-right">
                        <dir-pagination-controls max-size="5" direction-links="true" boundary-links="true"></dir-pagination-controls> 
                    </div>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
