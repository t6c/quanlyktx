<%-- 
    Document   : MyExam
    Created on : Jul 13, 2024, 12:24:07 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="book" method="POST">
            TRAIN INFORMATION <br>
            Train code: <input type="text" name="code" value="" /> <br>
            Train name: <input type="text" name="name" value="" /> <br>
            Seat number: <input type="text" name="seat" value="" /> <br>
            Booked: <input type="text" name="booked" value="" /> <br>
            <input type="submit" value="BOOK" />
            <p>${requestScope.error}</p>
            <div style="display: ${(requestScope.isFull!=null)?'block':'none'}">
                Information of booked train: <br>
                ID: ${param.code}<br>
                Name: ${param.name}<br>
                Seat: ${param.seat}<br>
                Book: ${param.booked}<br>
                Is full? ${requestScope.isFull}
            </div>
        </form>
    </body>
</html>
