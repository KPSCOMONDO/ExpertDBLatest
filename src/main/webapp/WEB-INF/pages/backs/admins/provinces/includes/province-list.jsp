<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="row">
    <div class="col-xs-12">                        
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">បញ្ជី</h3>
            </div>
            <form class="form-inline box-header">
                <div class="form-group">
                    <input type="text" ng-model="search" class="form-control" placeholder="ច្រោះ">
                </div>
            </form>
            <div class="box-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th ng-click="sort('LOCATIONSTATUS')">ខេត្ត/ក្រុង
                                <span class="fa" ng-show="sortKey == 'LOCATIONSTATUS'" 
                                      ng-class="{'fa-sort-desc':reverse,'fa-sort-asc':!reverse}">              
                                </span>
                            </th>
                            <th>សកម្មភាព</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr dir-paginate="item in LOCATIONS|orderBy:sortKey:reverse|filter:search|itemsPerPage:10">
                            <td>{{$index + 1}}</td>                            
                            <td><input type="text" ng-model="item.LOCATIONSTATUS" class="edit--text" ng-class="{'edit--text--enable':item.STATUS}" ng-disabled="!item.STATUS"/></td>
                            <td>
                                <a ng-click="editClick(item)" class="btn btn-primary btn-xs" >
                                    <span class="fa " ng-class="{'fa-edit':(item.STATUS == false),'fa-save':(item.STATUS == true)}"></span>
                                </a>
                                <a ng-click="deleteLocation(item)" class="btn btn-warning btn-xs"><i class="fa fa-remove"></i></a>
                            </td>
                        </tr>                                
                    </tbody>                    
                </table>
                <div class="pull-right">
                        <dir-pagination-controls max-size="5" direction-links="true" boundary-links="true"></dir-pagination-controls> 
                </div>
            </div>
        </div>
    </div>
</div>