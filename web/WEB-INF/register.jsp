<%-- 
    Document   : register
    Created on : 25-Oct-2020, 9:44:10 PM
    Author     : 822408
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping List</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        <form method="post" action="ShoppingList">
            Username: <input type="text" name="username">
            <input type="hidden" name="action" value="register">
            <input type="submit" value="Register name">
        </form>
        
        <c:forEach var="itemsList" items="${itemsList}">
            <input type="radio" name="items" value="${itemsList}">${itemsList}<br>
        </c:forEach>
            
        <c:if test="${message == 'nullUser'}">
            <p>Username cannot be null.</p>
        </c:if>
        <c:if test="${message == 'logoutSuccess'}">
            <p>You have successfully logged out.</p>
        </c:if>
    </body>
</html>
