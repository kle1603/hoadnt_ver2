<%-- 
    Document   : user
    Created on : May 30, 2023, 11:03:38 AM
    Author     : namdh
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>User's information</h1>

        User ID: ${sessionScope.LOGIN_USER.userID} <br>
        Full Name: ${sessionScope.LOGIN_USER.fullName} <br>
        Role ID: ${sessionScope.LOGIN_USER.roleID} <br>
        Password: ${sessionScope.LOGIN_USER.password} <br>
        <br>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
    </body>
</html>
