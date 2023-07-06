<%-- 
    Document   : create
    Created on : Jun 9, 2023, 10:15:19 AM
    Author     : kle
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <body>
        <h1>Create new user: </h1>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/>${requestScope.USER_ERROR.userIDError}
            <br>Full Name<input type="text" name="fullName" required=""/>${requestScope.USER_ERROR.fullNameError}
            <br>Role ID<input type="text" name="roleID" value="US" readonly=""/>
            <br>Password<input type="password" name="password" required=""/>
            <br>Confirm<input type="password" name="confirm" required=""/>${requestScope.USER_ERROR.confirmError}
            <br><input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>
            ${requestScope.USER_ERROR.error}
        </form>
    </body>
</html>
