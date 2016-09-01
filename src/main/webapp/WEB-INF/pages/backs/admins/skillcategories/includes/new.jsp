<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="box box-info collapsed-box">
    <div class="box-header">
        <h3 class="box-title">បញ្ចូលប្រភេទនៃជំនាញថ្មី
            <small>ចុចសញ្ញា +</small>
        </h3>
        <div class="pull-right box-tools">
            <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                <i class="fa fa-plus"></i></button>                   
        </div>
    </div>
    <div class="box-body pad">
        <form ng-submit="createSkillCategory()">
            <div class="box-body">
                <div class="form-group">
                    <label for="txpskillcategory">ប្រភេទនៃជំនាញ</label>
                    <input ng-model="txtCategoryName" id="txskillcategory" type="text" class="form-control" placeholder="ប្រភេទនៃជំនាញ"  required>
                </div>                
                <div class="form-group">
                    <label for="tadescription">លំអិត</label>
                    <textarea  ng-model="txaDescription" id="tadescription" type="texta" rows="3" class="form-control" placeholder="លំអិត"></textarea>
                </div> 
            </div>
            <div class="box-footer">
                <button type="submit" class="btn btn-primary">រក្សារទុក</button>
                <button type="reset" class="btn btn-danger">សំអាត</button>
            </div>
        </form>
    </div>
</div>
