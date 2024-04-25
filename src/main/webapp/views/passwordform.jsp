<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Change Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: lightcyan;
        }
        .card {
            margin-top: 50px;
        }
        footer {
            position: fixed;
            width: 100%;
            bottom: 0;
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
                    <a class="nav-link" href="/atm/account">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/atm/debit">Withdraw</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/atm/credit">Deposit</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/atm/fundtransfer">Fund Transfer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/atm/transactions/account">View Transactions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/atm/logout">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container login-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header" style="padding-top: 30px;">
                    <h2 class="card-title text-center mb-4">Change Password Form</h2>
                </div>
                <div class="card-body">
                    <form action="/atm/changepassword" method="post">
                        <div class="mb-3" style="padding-left: 100px; padding-right: 100px;">
                            <label for="Account" class="form-label">Change Password For:-<span>${bankAccount.accountNumber}</span></label>
                           
                        </div>
                        <div class="mb-3" style="padding-left: 100px; padding-right: 100px;">
                            <label for="password" class="form-label">Enter Password </label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3" style="padding-left: 100px; padding-right: 100px;">
                            <label for="repassword" class="form-label">Enter Password Again</label>
                            <input type="password" class="form-control" id="repassword" name="repassword" required>
                        </div>

                        

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Change</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="text-muted text-center">
        <p>Developed by Subhasish Biswasaray</p>
        <p>&copy; 2024 . All rights reserved.</p>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>