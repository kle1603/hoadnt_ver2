<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
    </head>
    <body>
        <h1>Welcome to my Mall</h1>
        <p>Select your favorite laptop:</p>
        <form action="MainController" method="POST">
            <select name="cmbLaptop">
                <option value="T01-Dell Laptop-15">Dell laptop-15$</option>
                <option value="T02-ASUS Laptop-20">ASUS laptop-20$</option>
                <option value="T03-MAC Laptop-10">MAC laptop-10$</option>
                <option value="T04-Lenovo Laptop-35">
                    Lenovo laptop-35$
                </option>
            </select>
            <select name="cmbQuantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="10">10</option>
            </select>
            <input type="submit" name="action" value="Add" />
            <input type="submit" name="action" value="View" />
        </form>
        ${requestScope.MESSAGE}
    </body>
</html>
