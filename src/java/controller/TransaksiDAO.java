package controller;

import Database.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransaksiDAO {
    private final Connection connection;

    public TransaksiDAO() throws SQLException {
        DbConnection dbConnection = new DbConnection();
        this.connection = dbConnection.driverConnect();
    }

    // Method to simpan transaksi ke database
    public boolean simpanTransaksi(String idTiket, String idEvent, String idType, String idUser, String paymentCode) {
        String query = "INSERT INTO transaksi (id_tiket, id_event, id_type, id_user, payment_code) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, idTiket);
            stmt.setString(2, idEvent);
            stmt.setString(3, idType);
            stmt.setString(4, idUser);
            stmt.setString(5, paymentCode);

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
