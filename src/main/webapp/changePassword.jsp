<%@ page import="business.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password change</title>
    </head>
    <body>
        <%
            User u = (User) session.getAttribute("user");
            if(u != null){
        %>
        <p>Change your password</p>
            <form action="controller" method="post">
                <table>
                    <tr>
                        <td> Old password : </td><td> <input name="oldPassword" size=30 type="password" required />
                    </td>
                    </tr>
                    <tr>
                        <td> New password : </td><td> <input name="newPassword" size=30 type="password" required /> </td>
                    </tr>
                    <tr>
                        <td> New password (again) : </td><td> <input name="newPasswordCopy" size=30 type="password"
                                                                     required /> </td>
                    </tr>
                </table>
                <input type="submit" value="Submit" />
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="changePassword" />
            </form>
    <%
        }else{
    %>
        You are not currently logged in. Please <a href="login.jsp">login</a> again to continue.
    <%
        }
    %>
    </body>
</html>
