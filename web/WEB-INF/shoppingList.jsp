<%-- 
    Document   : shoppingList
    Created on : 25-Oct-2020, 9:44:16 PM
    Author     : 822408
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping List</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        Hello, ${username}! <a href="?action=logout" name="action">Logout</a><br>
        <h2>List</h2>
        <form method="post" action="ShoppingList">
            Add item: <input type="text" name="item"> 
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add"><br>
            
        </form>
        <form method="post" action="ShoppingList">
            <c:forEach var="itemsList" items="${itemsList}">
                <input type="radio" name="radioButton" value="${itemsList}">${itemsList}<br>
            </c:forEach><br>
            <input type="hidden" name="action" value="delete">
            <input type="submit" value="Delete">
        </form>
        
    </body>
</html>
