
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Account Manage | Dormitory Management </title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script defer src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    </head>
    <c:if test="${sessionScope.adminAuth!=null}">

        <body class="sb-nav-fixed">
            <%
                String error = request.getAttribute("error") + "";
                error = (error.equals("null")) ? "" : error;


            %>
            <%@include file="includes/navbar.jsp" %>
            <div id="layoutSidenav">
                <%@include file="includes/sidebar.jsp" %>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4 mt-4">
                            <h3>Payment</h3>
                            <!-- Tại tài khoản -->
                            <%=error%>


                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead class="table" style="background-color: #f27124; color: white" >

                                <th>User</th>
                                <th>Room</th>
                                <th>Semester</th>
                                <th>Price</th>
                                <th>Status</th>


                                <th></th>
                                </tr>
                                </thead>
                                <tbody>

                                    <c:forEach items = "${requestScope.data}" var="c">
                                        <tr class="font-chu-nho">

                                            <td>${c.userId.username}</td>
                                            <td>${c.roomId.name}</td>
                                            <td>${c.semester}</td>
                                            <td>${c.total}</td>
                                            <td>${c.status}</td>
                                            <td>
                                                <a  ${c.status=='Thanh toán thành công' ?'hidden':''} class="btn btn-danger" href="#" onclick="doPay('${c.paymentId}', '${c.total}', '${c.userId}', '${c.roomId}', '${c.userId.email}')" role="button">Pay</a>
                                            </td>

                                        </tr>
                                    </c:forEach>



                                </tbody>

                            </table>
                        </div>
                    </main>
                    <!-- foooter -->
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
            <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
            <script>
                                                    function doPay(paymentId, total, userId, roomId, email) {
                                                        if (confirm("Do you want to pay " + total + " ?")) {
                                                            window.location = "payment?action=pay-booking&paymentId=" + paymentId + "&userId=" + userId + "&roomId=" + roomId+ "&email=" + email;
                                                        }
                                                    }
                                                    $(document).ready(function () {

                                                        $('#example').DataTable({
                                                            search: {
                                                                return: false,
                                                            },
                                                            lengthMenu: [
                                                                [10, 25, 50, -1],
                                                                [10, 25, 50, 'All'],
                                                            ],
                                                            order: [[4, 'asc']],
                                                        });

                                                    });
            </script>
        </body>
    </c:if>
    <c:if test="${sessionScope.adminAuth==null}">
        <div class="alert alert-danger container mt-4" role="alert">
            <h2>You are not logged into the system!</h2>

            <a href="login.jsp">Login in here!</a>
        </div>
    </c:if>

</html>