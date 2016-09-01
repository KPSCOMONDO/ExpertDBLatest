<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <jsp:include page="../includes/sub-style.jsp"/>
    </head>
    <body  class="hold-transition skin-blue sidebar-mini">   
        <div class="wrapper"> 
            <jsp:include page="../../includes/menubar.jsp"/>
            <jsp:include page="../../includes/sidbar-left.jsp"/>
            <div class="content-wrapper">                                
                <section class="content">
                    <jsp:include page="../../includes/page-doesnot-exist.jsp"/>
                </section>
            </div>             
            <jsp:include page="../../includes/footer.jsp"/>
        </div>        
    </div>
    <jsp:include page="../includes/sub-script.jsp"/>
</body>
</html>