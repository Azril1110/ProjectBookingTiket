<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 800px;
            margin-top: 50px;
        }
        .mt-4 {
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>History of Actions</h2>
        <table class="table table-striped mt-4">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Action Time</th>
                    <th>User</th>
                    <th>Action Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${historyList}" var="history">
                    <tr>
                        <td>${history.id}</td>
                        <td>${history.actionTime}</td>
                        <td>${history.userName}</td>
                        <td>${history.actionDescription}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
