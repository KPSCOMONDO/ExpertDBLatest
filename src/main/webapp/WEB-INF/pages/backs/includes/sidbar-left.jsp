<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/resources/images/profile/profile.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>Sok Channy</p>                
            </div>
        </div>           
        <ul class="sidebar-menu">            
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/admin">
                    <i class="fa fa-dashboard"></i>
                    <span>ផ្ទាំងគ្រប់គ្រង</span>
                </a>                
            </li>
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/admin/expert/list">
                    <i class="fa fa-circle-o"></i> បញ្ជីអ្នកជំនាញ</a>                                        
                </a>                
            </li>  
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>ជំនាញ</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">14</span>
                    </span>
                    <ul class="treeview-menu">
                        <li><a href="${pageContext.request.contextPath}/admin/skill"><i class="fa fa-circle-o"></i> មុខជំនាញ</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/skill/category"><i class="fa fa-circle-o"></i> ប្រភេទមុខជំនាញ</a></li>                    
                    </ul>
                </a>                
            </li>  
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/admin/position">
                    <i class="fa fa-bars"></i>
                    <span>តួនាទី</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">34</span>
                    </span>
                </a>
            </li>                                            
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/admin/province">
                    <i class="fa fa-map-marker"></i>
                    <span>ទីតាំង(ខេត្ត/ក្រុង)</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">14</span>
                    </span>
                </a>                
            </li>
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/admin/language">
                    <i class="fa fa-language"></i>
                    <span>ភាសារ</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">14</span>
                    </span>
                </a>                
            </li>
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/admin/level">
                    <i class="fa fa-level-up"></i>
                    <span>កំរិត</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">144</span>
                    </span>
                </a>                
            </li>
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/admin/user">
                    <i class="fa fa-users"></i>
                    <span>បញ្ជីអ្នកគ្រប់គ្រង</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">144</span>
                    </span>
                </a>                
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/report">
                    <i class="fa fa-th"></i> <span>របាយការណ៍</span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-green">ថ្មី</small>
                    </span>
                </a>
            </li>
        </ul>
    </section>
</aside>