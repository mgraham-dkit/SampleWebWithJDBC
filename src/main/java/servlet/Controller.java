package servlet;

import business.User;
import daos.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

/**
 *
 * @author michelle
 */
@WebServlet(name = "Controller", urlPatterns = {"/controller"})
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String forwardToJsp = "index.html";
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "login":
                    forwardToJsp = loginCommand(request, response);
                    break;
                case "register":
                    forwardToJsp = registerCommand(request, response);
                    break;
                default:
                    forwardToJsp = "error.jsp";
                    String error = "No such action defined for this application. Please try again.";
                    session.setAttribute("errorMessage", error);
            }
        } else {
            forwardToJsp = "error.jsp";
            String error = "No action supplied. Please try again.";
            session.setAttribute("errorMessage", error);
        }
        response.sendRedirect(forwardToJsp);
    }

    private String loginCommand(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            UserDao userDao = new UserDao("user_database");
            User u = userDao.findUserByUsernamePassword(username, password);
            if (u == null) {
                forwardToJsp = "error.jsp";
                String error = "Incorrect credentials supplied. Please <a href=\"login.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            } else {
                forwardToJsp = "loginSuccessful.jsp";
                session.setAttribute("username", username);
                session.setAttribute("user", u);
            }
        } else {
            forwardToJsp = "error.jsp";
            String error = "No username and/or password supplied. Please <a href=\"login.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    private String registerCommand(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession(true);
        String uname = request.getParameter("username");
        String pword = request.getParameter("password");
        String first = request.getParameter("fName");
        String last = request.getParameter("lName");
        
        if (uname != null && pword != null && !uname.isEmpty() && !pword.isEmpty() && first != null && !first.isEmpty() && last != null && !last.isEmpty()) {
            UserDao userDao = new UserDao("user_database");
            int id = userDao.addUser(uname, pword, first, last);
            if (id == -1) {
                forwardToJsp = "error.jsp";
                String error = "This user could not be added. Please <a href=\"register.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            } else {
                forwardToJsp = "loginSuccessful.jsp";
                session.setAttribute("username", uname);
                User u = new User(id, first, last, uname, pword);
                session.setAttribute("user", u);
                String msg = "Registration successful, you are now logged in!";
                session.setAttribute("msg", msg);
            }
        } else {
            forwardToJsp = "error.jsp";
            String error = "Some information was not supplied. Please <a href=\"register.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
