package Model;

public class UserBean {
    private int idUser;
    private String userName;
    private String password;
    private String email;
    private String status;
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public UserBean() {
        // Default constructor
    }

    public UserBean(int idUser, String userName, String password, String email, String status) {
        this.idUser = idUser;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.status = status;
    }

    // Constructor without idUser (if needed)
    public UserBean(String userName, String password, String email, String status) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.status = status;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
