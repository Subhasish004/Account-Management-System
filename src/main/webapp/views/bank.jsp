<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bank</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
      
        body {
            background-color: lightcyan;
        }
        .card-image {
            max-height: 200px;
            object-fit: cover;
        }
          footer {
            position: fixed;
            width: 100%;
            bottom: 0;
            color: black;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Bank Service</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/atm/admin">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/atm/adminlogout">Logout</a> 
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">

    <h1>Bank List</h1>
    <table class="table table-striped table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
               <!--  <th>ID</th>  -->
                
                <th>Bank Name</th>
                <th>Bank Address</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${banks}" var="bank">
                <tr>

                    
                    <td>${bank.bankName}</td>
                    <td>${bank.bankAddress}</td>
                    <%-- <td>
                        <a href="/atm/bank/delete/${bank.id}" class="btn btn-danger">Delete</a>
                    </td> --%>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="/atm/bank/create" class="btn btn-success">Register Bank</a>
    
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>