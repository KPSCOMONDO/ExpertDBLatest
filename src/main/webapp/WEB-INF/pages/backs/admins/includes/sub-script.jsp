<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="../../../../../resources/static/admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../../../../resources/static/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="../../../../../resources/static/admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../../../resources/static/admin/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../../../../resources/static/admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../../../../../resources/static/admin/plugins/fastclick/fastclick.js"></script>
<script src="../../../../../resources/static/admin/dist/js/app.min.js"></script>
<script src="../../../../../resources/static/admin/dist/js/demo.js"></script>

<script src="../../../../../resources/static/switch/switch.js" type="text/javascript"></script>
<script src="../../../../../resources/static/sweetalert2/sweetalert2.js" type="text/javascript"></script>
<script>
    $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });

        edit = function (element) {
            $(element).html('<i class="fa fa-save">');
            $tr = $(element).parent().parent();
            $tr.children('td').children('input').each(function () {
                $(this).addClass('edit--text--enable');
                $(this).removeAttr('disabled');                
            });
            $tr.children('td').children('input')[0].focus();
        }
        add = function (element) {
            $(element).html('<i class="fa fa-minus">');
            $tb = $(element).parent().parent();
            $tb.children('tdody').first().removeAttr('style');
        }
    });
</script>
