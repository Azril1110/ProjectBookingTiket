package controller;

import Model.UserBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.searchUserID;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/konser";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_USERS_SQL = "INSERT INTO user (username, password, email, status) VALUES (?, ?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT id_user, username, password, email, status FROM user WHERE id_user=?";
    private static final String SELECT_ALL_USERS = "SELECT id_user, username, password, email, status FROM user";
    private static final String DELETE_USERS_SQL = "UPDATE user SET status='DEACTIVE' WHERE id_user=?";
    private static final String UPDATE_USERS_SQL = "UPDATE user SET username=?, password=?, email=?, status=? WHERE id_user=?";
    private static final String INSERT_HISTORY_SQL = "INSERT INTO history (user_id, action_description) VALUES (?, ?)";

    public UserDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(UserBean user) throws SQLException, ClassNotFoundException {
        boolean rowInserted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getStatus());
            preparedStatement.executeUpdate();
            rowInserted = preparedStatement.executeUpdate() > 0;
            if (rowInserted) {
                saveHistory(20, "has Created");
            }
        }
    }
    
    

    private void saveHistory(int userId, String actionDescription) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_HISTORY_SQL)) {
            statement.setInt(1, userId);
            statement.setString(2, actionDescription);
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    
    public UserBean selectUser(int id) {
        UserBean user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String status = rs.getString("status");
                user = new UserBean(id, userName, password, email, status);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<UserBean> selectAllUsers() {
        List<UserBean> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id_user");
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String status = rs.getString("status");
                users.add(new UserBean(id, userName, password, email, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;

            // Save history
            if (rowDeleted) {
                saveHistory(20, "has updated " + id);
            }
        }
        return rowDeleted;
    }

    public boolean updateUser(UserBean user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getStatus());
            statement.setInt(5, user.getIdUser());

            rowUpdated = statement.executeUpdate() > 0;

            // Save history
            if (rowUpdated) {
                saveHistory(20, "User updated: " + user.getUserName());
            }
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
