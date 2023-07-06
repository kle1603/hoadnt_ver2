<%-- 
    Document   : admin
    Created on : May 30, 2023, 11:07:47 AM
    Author     : namdh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        



        <h1>Welcome: ${sessionScope.LOGIN_USER.fullName} </h1>
        <!--<a href="MainController?action=Logout">Logout</a>-->
        <!--<div style="display: flex">-->
        <form action="MainController">
            <p>Search<input type="text" name="search" value="${prama.search}"/></p>
            <input type="submit" name="action" value="Search"/>
            <input type="submit" name="action" value="Logout"/>
        </form>
        <c:url var="logoutLink" value="MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <a href="${logoutLink}">Logout JSTL</a>
        <c:if test="${requestScope.LIST_USER != null}">
            <c:if test="${not empty requestScope.LIST_USER}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Role ID</th>
                            <th>Password</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                        <form action="MainController" method="POST">

                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    <input type="text" name="userID" value="${user.userID}" readonly=""/>
                                </td>
                                <td>
                                    <input type="text" name="fullName" value="${user.fullName}" required=""/>
                                </td>
                                <td>
                                    <input type="text" name="roleID" value="${user.roleID}" required=""/>
                                </td>
                                <td>${user.password}</td>
                                <td>
                                    <input type="submit" name="action" value="Update"/>
                                    <input type="hidden" name="search" value="${param.search}"/>
                                </td>
                                <td>
                                    <c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="Delete"></c:param>
                                        <c:param name="userID" value="${user.userID}"></c:param>
                                        <c:param name="search" value="${param.search}"></c:param>
                                    </c:url>
                                    <a href="${deleteLink}">Delete</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
    </c:if>
    ${requestScope.ERROR}
</body>
</html>
