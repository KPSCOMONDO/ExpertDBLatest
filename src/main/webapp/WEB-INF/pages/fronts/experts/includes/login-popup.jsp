<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="myModal" class="modal">
    <div>
        <div class="col-sm-4 col-sm-offset-4" style="opacity: 0.9;background-color: white;padding: 20px 20px 20px 20px;">
            <span class="close">×</span>
            <form>                        
                <input type="email" class="form-control login--control animated fadeInUp delay" placeholder="Email or Username"/>
                <input type="password" class="form-control login--control animated fadeInUp delay" placeholder="Password"/>
                <a class="mbr-buttons__btn btn btn-lg btn-default login--control animated fadeInUp delay" href="${pageContext.request.contextPath}/expert">Sign In</a>
                <span><input type="checkbox"> Remember me <br>Not a member ? <a href="">Sign Up</a></span>                        
            </form>
        </div>
    </div>
</div>

<script>
    var modal = document.getElementById('myModal');
    var btn = document.getElementsByClassName("btn--view--result")[2];
    var span = document.getElementsByClassName("close")[0];
    btn.onclick = function () {
        modal.style.display = "block";
    }
    $(document).ready(function () {
        $(".btn--view--result").click(function () {
            $("#myModal").style(display = "block";
        })
        $(".close").click(function () {
            modal.style.display = "none";
        })
    })
    span.onclick = function () {
        modal.style.display = "none";
    }
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>