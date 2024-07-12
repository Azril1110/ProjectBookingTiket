package controller;

import Model.Ticket;
import Database.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TicketDAO {
    private final Connection connection;

    public TicketDAO() throws SQLException {
        DbConnection dbConnection = new DbConnection();
        this.connection = dbConnection.driverConnect();
    }

    // Method to retrieve all tickets with details
    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        String query = "SELECT t.id_tiket, t.Stok, t.id_event, t.id_type, e.day, tt.harga, tt.nama_tiket " +
                "FROM tiket t " +
                "JOIN event e ON t.id_event = e.id_event " +
                "JOIN type_tiket tt ON t.id_type = tt.id_type";

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setId_tiket(rs.getString("id_tiket"));
                ticket.setStok(rs.getString("Stok"));
                ticket.setId_event(rs.getString("id_event"));
                ticket.setId_type(rs.getString("id_type"));
                ticket.setDay(rs.getString("day"));
                ticket.setHarga(rs.getDouble("harga"));
                ticket.setTicketType(rs.getString("nama_tiket"));
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tickets;
    }

    // Method to update ticket stock in the database
    public boolean updateStok(String idTiket) {
        String query = "UPDATE tiket SET Stok = Stok - 1 WHERE id_tiket = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, idTiket);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Method to update a ticket in the database
    public boolean updateTicket(Ticket ticket) {
        String query = "UPDATE tiket SET Stok = ?, id_event = ?, id_type = ? WHERE id_tiket = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, ticket.getStok());
            stmt.setString(2, ticket.getId_event());
            stmt.setString(3, ticket.getId_type());
            stmt.setString(4, ticket.getId_tiket());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a ticket from the database
    public boolean deleteTicket(int id_tiket) {
        String query = "DELETE FROM tiket WHERE id_tiket = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id_tiket);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to close the database connection
    public void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
