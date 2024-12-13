<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="Myform" action="threadServlet">
            <select name="thraed">
                <c:forEach items="${requestScope.tdata}" var="t">
                    <option value=${t.tid}  ${t.tid eq tid ? "selected":""}>${t.tcontent}</option>
                </c:forEach>
            </select>
            <input type="submit" value="Submit" name="Submit" />
        </form>
        
    </body>
</html>
