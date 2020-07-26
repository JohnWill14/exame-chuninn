<%-- 
    Document   : newjspfooter
    Created on : 12/07/2020, 14:38:18
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<footer class="py-4 bg-light mt-auto">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted">Copyright &copy; DEVCAR</div>
            <div>

            </div>
        </div>
    </div>
</footer>
</div>
</div>

<c:url value="/assets/adm/js/jquery-3.5.1.min.js" var="jquery"/>
<script src="${jquery}" crossorigin="anonymous"></script>
<script src="<c:url value="/assets/adm/js/"/>bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="/assets/adm/js/"/>scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="/assets/adm/"/>demo/chart-area-demo.js"></script>
<script src="<c:url value="/assets/adm/"/>demo/chart-bar-demo.js"></script>
<script src="<c:url value="/assets/adm/js/"/>jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="/assets/adm/js/"/>dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="/assets/adm/"/>demo/datatables-demo.js"></script>
<script type="text/javascript" src="<c:url value="/assets/adm/"/>js/dropzone.js"></script>
<script type="text/javascript" src="<c:url value="/assets/adm/js/bootstrap-filestyle.min.js" />"></script>


</body>
</html>