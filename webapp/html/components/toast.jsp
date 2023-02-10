<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/16/2022
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--====================== Toast ==================-->
<c:if test="${toastSuccess == true}">
    <div class="position-fixed top-0 end-0 p-3" style="z-index: 1100000">
        <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex align-items-center text-white bg-${toastColor} border-0">
                <div class="toast-body">
                        ${infoToast}
                    <c:set var = "toastSuccess" scope = "session" value = "${false}"/>
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
</c:if>
<%----%>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<%----%>
<script>
    const toastLiveExample = document.getElementById('liveToast')
    window.onload = function () {
        const toast = new bootstrap.Toast(toastLiveExample)

        toast.show()
    };

</script>
