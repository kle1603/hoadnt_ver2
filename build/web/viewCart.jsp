<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Cart"%>
<%@page import="sample.shopping.Laptop"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Cart</title>
    </head>
    <body>
    <body>
        <h1>Your selected laptop here: </h1>
        ${empty sessionScope.CART.getCart()}
        <c:if test="${empty sessionScope.CART.getCart()}">
            <c:redirect url="shopping.html"/>
        </c:if>

        <c:if test="${not empty sessionScope.CART}">

            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Edit</th>           
                        <th>Remove</th>           
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="o" items="${sessionScope.CART.getCart().values()}" varStatus="loop">
                        <c:set var="total" value="${total + (o.getQuantity() * o.getPrice())}" scope="page"/>
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${loop.count}</td>
                            <td>
                                <input type="text" name="id" value="${o.getId()}" readonly=""/>
                            </td>
                            <td>${o.getName()}</td>
                            <td>${o.getPrice()}</td>
                            <td>
                                <input type="number" name="quantity" value="${o.getQuantity()}" required="" min="1"/>
                            </td>
                            <!--Edit here-->
                            <td>
                                <input type="submit" name="action" value="Edit"/>
                            </td>
                            <!--Remove here-->
                            <td>
                                <input type="submit" name="action" value="Remove"/>
                            </td>
                            <td>${o.getQuantity() * o.getPrice()}</td>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <p>Total: ${total} $</p>
    <a href="shopping.html">Add more</a>
    <form action="MainController" method="POST">
        <input type="submit" name="action" value="Checkout">
    </form>
</body>
</html>