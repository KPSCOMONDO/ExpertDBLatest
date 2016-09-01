<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <jsp:include page="../includes/back-style.jsp" />       
    </head>
    <body  class="hold-transition skin-blue sidebar-mini">   
        <div class="wrapper">
            <jsp:include page="includes/menubar.jsp" />  
            <jsp:include page="includes/sidbar-left.jsp" /> 
            <section class="content">
                <!-- Small boxes (Stat box) -->
                <div class="row">

                    <!-- ./col -->
                    <div class="col-lg-6 col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">Data Table With Full Features</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="dataTables_length" id="example1_length">
                                                <label>
                                                    Show <select name="example1_length" aria-controls="example1" class="form-control input-sm">
                                                        <option value="10">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select> entries
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div id="example1_filter" class="dataTables_filter">
                                                <label>Search:
                                                    <input type="search" class="form-control input-sm" placeholder="" aria-controls="example1">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                <thead>
                                                    <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column descending" aria-sort="ascending" style="width: 166px;">Rendering engine</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 207px;">Browser</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 182px;">Platform(s)</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 142px;">Engine version</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 102px;">CSS grade</th></tr>
                                                </thead>
                                                <tbody>              
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Camino 1.0</td>
                                                        <td>OSX.2+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Camino 1.5</td>
                                                        <td>OSX.3+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Epiphany 2.20</td>
                                                        <td>Gnome</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Firefox 1.0</td>
                                                        <td>Win 98+ / OSX.2+</td>
                                                        <td>1.7</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Firefox 1.5</td>
                                                        <td>Win 98+ / OSX.2+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Firefox 2.0</td>
                                                        <td>Win 98+ / OSX.2+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Firefox 3.0</td>
                                                        <td>Win 2k+ / OSX.3+</td>
                                                        <td>1.9</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Mozilla 1.0</td>
                                                        <td>Win 95+ / OSX.1+</td>
                                                        <td>1</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Mozilla 1.1</td>
                                                        <td>Win 95+ / OSX.1+</td>
                                                        <td>1.1</td>
                                                        <td>A</td>
                                                    </tr><tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td class="">Mozilla 1.2</td>
                                                        <td>Win 95+ / OSX.1+</td>
                                                        <td>1.2</td>
                                                        <td>A</td>
                                                    </tr></tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th rowspan="1" colspan="1">Rendering engine</th>
                                                        <th rowspan="1" colspan="1">Browser</th>
                                                        <th rowspan="1" colspan="1">Platform(s)</th>
                                                        <th rowspan="1" colspan="1">Engine version</th>
                                                        <th rowspan="1" colspan="1">CSS grade</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">
                                                Showing 1 to 10 of 57 entries
                                            </div>                                    
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                                                <ul class="pagination">
                                                    <li class="paginate_button previous disabled" id="example1_previous">
                                                        <a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a>
                                                    </li>
                                                    <li class="paginate_button active">
                                                        <a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a>
                                                    </li>
                                                    <li class="paginate_button ">
                                                        <a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0">2</a>
                                                    </li>
                                                    <li class="paginate_button ">
                                                        <a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0">3</a>
                                                    </li>
                                                    <li class="paginate_button ">
                                                        <a href="#" aria-controls="example1" data-dt-idx="4" tabindex="0">4</a>
                                                    </li>
                                                    <li class="paginate_button ">
                                                        <a href="#" aria-controls="example1" data-dt-idx="5" tabindex="0">5</a>
                                                    </li>
                                                    <li class="paginate_button ">
                                                        <a href="#" aria-controls="example1" data-dt-idx="6" tabindex="0">6</a>
                                                    </li>
                                                    <li class="paginate_button next" id="example1_next">
                                                        <a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>            
                </div>
        </div>
        <jsp:include page="../includes/back-script.jsp" />
    </body>
</html>