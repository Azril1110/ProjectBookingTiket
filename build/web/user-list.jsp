<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Management</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Margarine&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Margarine', cursive;
      background: url('gambar/Backgroundd.png');
      background-size: cover;
      background-position: center;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      overflow-x: hidden;
    }
    .container {
      max-width: 900px;
      background: rgba(255, 255, 255, 0.85);
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
      backdrop-filter: blur(10px);
      border: 1px solid #ddd;
      margin-top: 2rem;
    }
    .mt-4 {
      margin-top: 2rem;
    }
    .btn-group {
      margin-bottom: 1rem;
    }
    .alert {
      margin-top: 1rem;
    }
    .table-striped tbody tr:nth-of-type(odd) {
      background-color: rgba(255, 255, 255, 0.85);
    }
    .table thead th {
      background-color: #007bff;
      color: white;
    }
    .btn-info {
      background-color: #17a2b8;
      border-color: #17a2b8;
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-danger {
      background-color: #dc3545;
      border-color: #dc3545;
    }
    .btn-success {
      background-color: #28a745;
      border-color: #28a745;
    }
  </style>
</head>
<body>
  <div class="container mt-4">
    <div class="row">
      <div class="col-md-8">
        <h2>User List</h2>
      </div>
      <div class="col-md-4 text-right">
        <!-- Button to reload user data -->
        <form action="UserServlet" method="get" class="form-inline justify-content-end">
          <input type="hidden" name="action" value="list">
          <button type="submit" class="btn btn-info">Load Data</button>
        </form>
      </div>
    </div>

    <!-- Check if users list is empty -->
    <c:if test="${empty users}">
      <div class="alert alert-info" role="alert">
        No users found.
      </div>
    </c:if>

    <c:if test="${not empty users}">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="user" items="${users}">
            <tr>
              <td>${user.idUser}</td>
              <td>${user.userName}</td>
              <td>${user.email}</td>
              <td>${user.status}</td>
              <td>
                <a href="UserServlet?action=edit&idUser=${user.idUser}" class="btn btn-primary btn-sm">Edit</a>
                <a href="javascript:void(0);" onclick="confirmDelete(${user.idUser})" class="btn btn-danger btn-sm">Delete</a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:if>
    
    <a href="UserServlet?action=new" class="btn btn-success">Add New User</a>
    <a href="admin-home.jsp" class="btn btn-success">Close</a>
  </div>

  <!-- Optional: JavaScript function for confirmation dialog -->
  <script>
    function confirmDelete(idUser) {
      if (confirm('Are you sure you want to delete this user?')) {
        window.location.href = 'UserServlet?action=delete&idUser=' + idUser;
      }
    }
  </script>
</body>
</html>
