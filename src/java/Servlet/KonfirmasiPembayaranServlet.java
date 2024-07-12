package Servlet;

import Database.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "KonfirmasiPembayaranServlet", urlPatterns = {"/KonfirmasiPembayaranServlet"})
public class KonfirmasiPembayaranServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the form
        String idTiket = request.getParameter("id_tiket");
        String day = request.getParameter("day");
        String ticketType = request.getParameter("ticketType");
        String harga = request.getParameter("harga");
        String stok = request.getParameter("stok");
        String idEvent = request.getParameter("id_event");
        String idType = request.getParameter("id_type");
        String idUser = request.getParameter("id_user");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String paymentCode = request.getParameter("paymentCode");

        // Example: Insert into transaction table
        boolean success = insertIntoTransaction(idTiket, day, ticketType, harga, stok, idEvent, idType, idUser, username, email, paymentCode);

        if (success) {
            // Update stock in 'tiket' table
            boolean updateSuccess = updateTicketStock(idTiket);

            if (updateSuccess) {
                // Redirect to success.jsp if transaction and stock update are successful
                response.sendRedirect("success.jsp");
            } else {
                // Handle failure scenario
                response.getWriter().println("Failed to update ticket stock. Please contact support.");
            }
        } else {
            // Handle failure scenario
            response.getWriter().println("Failed to process payment. Please try again later.");
        }
    }

    private boolean insertIntoTransaction(String idTiket, String day, String ticketType, String harga, String stok,
                                           String idEvent, String idType, String idUser, String username, String email, String paymentCode) {
        String query = "INSERT INTO transaksi (id_tiket, day, ticket_type, harga, stok, id_event, id_type, id_user, username, email, payment_code) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        DbConnection dbConnection = new DbConnection();
        try (Connection connection = dbConnection.driverConnect();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setString(1, idTiket);
            stmt.setString(2, day);
            stmt.setString(3, ticketType);
            stmt.setString(4, harga);
            stmt.setString(5, stok);
            stmt.setString(6, idEvent);
            stmt.setString(7, idType);
            stmt.setString(8, idUser);
            stmt.setString(9, username);
            stmt.setString(10, email);
            stmt.setString(11, paymentCode);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean updateTicketStock(String idTiket) {
        String updateQuery = "UPDATE tiket SET Stok = Stok - 1 WHERE id_tiket = ?";
        
        DbConnection dbConnection = new DbConnection();
        try (Connection connection = dbConnection.driverConnect();
             PreparedStatement stmt = connection.prepareStatement(updateQuery)) {
            
            stmt.setString(1, idTiket);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
