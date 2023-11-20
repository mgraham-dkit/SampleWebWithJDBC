<%@page import="business.User"%>
<%@page import="daos.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controller</title>
    </head>
    <body>
        <%
            String forwardToJsp = "index.html";
            String action = request.getParameter("action");
            if(action != null){
                switch(action){
                    case "login":
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");
                        if(username != null && password != null && !username.isEmpty() && !password.isEmpty()){
                            UserDao userDao = new UserDao("user_database");
                            User u = userDao.findUserByUsernamePassword(username, password);
                            if(u == null){
                                forwardToJsp = "error.jsp";
                                String error = "Incorrect credentials supplied. Please <a href=\"login.jsp\">try again.</a>";
                                session.setAttribute("errorMessage", error);
                            }else{
                                forwardToJsp = "loginSuccessful.jsp";
                                session.setAttribute("username", username);
                                session.setAttribute("user", u);
                            }
                        }else{
                            forwardToJsp = "error.jsp";
                            String error = "No username and/or password supplied. Please <a href=\"login.jsp\">try again.</a>";
                            session.setAttribute("errorMessage", error);
                        }
                        break;
                    case "register":
                        String uname = request.getParameter("username");
                        String pword = request.getParameter("password");
                        String first = request.getParameter("fName");
                        String last = request.getParameter("lName");
                        if(uname != null && pword != null && !uname.isEmpty() && !pword.isEmpty() && first != null && !first.isEmpty() && last != null && !last.isEmpty()){
                            UserDao userDao = new UserDao("user_database");
                            int id = userDao.addUser(first, last, uname, pword);
                            if(id == -1){
                                forwardToJsp = "error.jsp";
                                String error = "This user could not be added. Please <a href=\"register.jsp\">try again.</a>";
                                session.setAttribute("errorMessage", error);
                            }else{
                                forwardToJsp = "loginSuccessful.jsp";
                                session.setAttribute("username", uname);
                                User u = new User(id, first, last, uname, pword);
                                session.setAttribute("user", u);
                                String msg = "Registration successful, you are now logged in!";
                                session.setAttribute("msg", msg);
                            }
                        }else{
                            forwardToJsp = "error.jsp";
                            String error = "Some information was not supplied. Please <a href=\"register.jsp\">try again.</a>";
                            session.setAttribute("errorMessage", error);
                        }
                        break;
                    default: 
                        forwardToJsp = "error.jsp";
                        String error = "No such action defined for this application. Please try again.";
                        session.setAttribute("errorMessage", error);
                }
            }else{
                forwardToJsp = "error.jsp";
                String error = "No action supplied. Please try again.";
                session.setAttribute("errorMessage", error);
            }
            response.sendRedirect(forwardToJsp);
        %>
    </body>
</html>
