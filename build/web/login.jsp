<%-- 
    Document   : login
    Created on : May 31, 2023, 9:39:05 PM
    Author     : namdh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!-- 1 Tạo view chức năng
             2 main-controller: điều phối
             3 Tạo controller chức năng
                DTO
                DAO
                Error
             4 Tạo view kết quả
             
        -->
        <h1>Input your information:</h1>
        <form action="MainController" method="POST">
            User ID <input type="text" name="userID" required=""> <br>
            Password <input type="password" name="password" required=""> <br>
            <input type="submit" name="action" value="Login"> <br>
            <input type="submit" Value="Reset">
        </form>
        <a href="MainController?action=CreatePage">Create new user</a>


        ${requestScope.ERROR}
    </body>
</html>
