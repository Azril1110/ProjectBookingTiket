<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% 
    Boolean AdminOn = (Boolean) session.getAttribute("AdminOn");
    if (AdminOn == null) {
        AdminOn = false;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Form</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .container {
      max-width: 600px;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
      border-radius: 8px;
      margin-top: 2rem;
    }
    .mt-4 {
      margin-top: 2rem;
    }
    .form-group label {
      font-weight: bold;
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-secondary {
      background-color: #6c757d;
      border-color: #6c757d;
    }
    .access-denied {
      text-align: center;
      color: #dc3545;
    }
  </style>
</head>
<body>
  <c:choose>
    <c:when test="${AdminOn}">
      <div class="container mt-4">
        <h2>User Form</h2>
        <form action="UserServlet" method="post">
          <input type="hidden" name="action" value="${empty user ? 'insert' : 'update'}">
          <c:if test="${not empty user}">
            <input type="hidden" name="idUser" value="${user.idUser}">
          </c:if>

          <div class="form-group">
            <label for="userName">Username</label>
            <input type="text" class="form-control" id="userName" name="userName" value="${empty user ? '' : user.userName}" required>
          </div>

          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" value="${empty user ? '' : user.password}" required>
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${empty user ? '' : user.email}" required>
          </div>

          <div class="form-group">
            <label for="status">Status</label>
            <input type="text" class="form-control" id="status" name="status" value="${empty user ? '' : user.status}" required>
          </div>

          <button type="submit" class="btn btn-primary">Submit</button>
          <a href="UserServlet?action=list" class="btn btn-secondary">Cancel</a>
        </form>
      </div>
    </c:when>
    <c:otherwise>
      <div class="container mt-4 access-denied">
        <h2>Access Denied</h2>
        <p>You do not have permission to view this page.</p>
        <a href="index.jsp" class="btn btn-primary">Go to Home</a>
      </div>
    </c:otherwise>
  </c:choose>
</body>
</html>
