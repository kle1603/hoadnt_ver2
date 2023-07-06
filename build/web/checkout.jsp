<%@page import="sample.shopping.Laptop"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Checkout</title>
    </head>
<body>
    <h1>Please check for the last time before paying</h1>
    <h2>Here is your cart</h2>
    <%
        List<Laptop> laptopList = (List<Laptop>) request.getAttribute("LAPTOP_LIST");
        double total = (double) request.getAttribute("TOTAL");

        if (laptopList != null && laptopList.size() > 0) {
    %>
    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <%
                int count = 1;
                for (Laptop laptop : laptopList) {
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= laptop.getId() %></td>
                <td><%= laptop.getName() %></td>
                <td><%= laptop.getPrice() %></td>
                <td><%= laptop.getQuantity() %></td>
                <td><%= laptop.getQuantity() * laptop.getPrice() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <h2>Total amount you need to pay: <%= total %> $</h2>
    <a href="shopping.jsp">If you want to buy more</a>
    <form action="MainController" method="POST">
        <input type="submit" name="action" value="Payment">
    </form>
    <%
        } else {
    %>
    <p>Your cart is empty</p>
    <%
        }
    %>
</body>
</html>
