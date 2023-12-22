<%@page import="business.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            User u = (User)session.getAttribute("user");
            if(u == null){
            %>
                <a href="login.jsp">Login</a><br/>
                <a href="register.jsp">Register</a>
            <%}else{
            %>
                <div> You are logged in!</div>
            <%
            }
        %>
        <h1>Search for users containing username:</h1>
        <form action="searchResults.jsp" method="get">
            <table>
                <tr>
                    <td> Username : </td><td> <input name="username" size=30 type="text" required /> </td>
                </tr>
            </table>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
