<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
        <p>Registration form</p>
            <form action="controller" method="post">
                <table>
                    <tr>
                        <td> Username : </td><td> <input name="username" size=30 type="text" required /> </td> 
                    </tr>
                    <tr>
                        <td> Password : </td><td> <input name="password" size=30 type="password" required /> </td> 
                    </tr>
                    <tr>
                        <td> First name : </td><td> <input name="fName" size=30 type="text" required /> </td> 
                    </tr>
                    <tr>
                        <td> Last name : </td><td> <input name="lName" size=30 type="text" required /> </td> 
                    </tr>
                </table>
                <input type="submit" value="Register" />
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="register" />
            </form>
    </body>
</html>
