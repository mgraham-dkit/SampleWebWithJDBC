<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
  <%
    String username = request.getParameter("username");
    if(username != null){
      UserDao userDao = new UserDao("user_database");
      List<User> users = userDao.findAllUsersContainingUsername(username);
      if(!users.isEmpty()){
      %>
        <table>
          <tr><th>Username</th><th>First name</th><th>Last name</th></tr>
      <%
        for(User u: users){
      %>
          <tr>
            <td><%=u.getUsername()%></td>
            <td><%=u.getFirstName()%></td>
            <td><%=u.getLastName()%></td>
          </tr>
          <%
        }
        %>
        </table>
          <%
      }else{
        %>
        <div>
          No users containing the username "<%=username%>"<br/>
          Please <a href="index.jsp">go back</a> and try again.
        </div>
        <%
      }
    }else{
      %>
  <div>
    No username supplied for search.<br/>
    Please <a href="index.jsp">go back</a> and try again.
  </div>
  <%
      }
  %>
</body>
</html>
