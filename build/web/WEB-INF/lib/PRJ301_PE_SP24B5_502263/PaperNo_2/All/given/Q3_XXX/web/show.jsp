<%-- 
    Document   : show
    Created on : Jul 13, 2024, 3:09:52 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Boats"%>
<%@page import="java.util.List"%>
<%@page import="dal.BoatsDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tbody>
                <tr>
                    <td>BoatID</td>
                    <td>BoatName</td>
                    <td>Seat</td>
                    <td>Booked</td>
                    <td>DepartPlace Name</td>
                    <td>Ticket Type</td>
                    <td>Is full?</td>
                </tr>

                <% 
                    BoatsDAO bd = new BoatsDAO();
                    for (Boats b : (List<Boats>) request.getAttribute("allBoats")){
                %>
                <tr>
                    <td><%=b.getBoatID()%></td>
                    <td><%=b.getBoatName()%></td>
                    <td><%=b.getSeat()%></td>
                    <td><%=b.getBooked()%></td>
                    <td><%=bd.getDepartNameById(b.getDepartPlaceID())%></td>
                    <td><%=bd.getTicketNameById(b.getTicketID())%></td>
                    <td><%=(b.getSeat()==b.getBooked())?"X":"" %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </body>
</html>
