package Servlet;

import Database.DbConnection;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    Connection conn;
    PreparedStatement stmt;
    ResultSet rs;
    private Boolean AdminOn = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String Uname = request.getParameter("username");
        String Pname = request.getParameter("password");

        HttpSession session = request.getSession();

        try {
            DbConnection cnc = new DbConnection();
            conn = cnc.driverConnect();

            String sql = "SELECT * FROM user WHERE username=? AND password=? AND status='ACTIVE'";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, Uname);
            stmt.setString(2, Pname);

            rs = stmt.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String userEmail = rs.getString("email");
                String id_user = rs.getString("id_user");

                if (username.equals("admin") && password.equals("admin") && userEmail.equals("admin@gmail.com")) {
                    AdminOn = true;
                    session.setAttribute("user", id_user);
                    session.setAttribute("username", username);
                    session.setAttribute("email", userEmail);
                    session.setAttribute("login", true);
                    session.setAttribute("AdminOn", AdminOn);
                    RequestDispatcher rd = request.getRequestDispatcher("admin-home.jsp");
                    rd.forward(request, response);
                } else {
                    session.setAttribute("user", id_user);
                    session.setAttribute("username", username);
                    session.setAttribute("email", userEmail);
                    session.setAttribute("login", true);
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }

            } else {
                session.setAttribute("error", "Kredensial login salah.");
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            session.setAttribute("error", "Kesalahan koneksi database.");
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
