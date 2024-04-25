<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.entity.BankAccount" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bank Account Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
    
        body {
            background-color: lightcyan;
        }
        .card {
            margin-top: 50px;
            margin-left: 300px;
            margin-right: 300px;
        }
        footer {
        padding-top:2%;
        
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
                    <a class="nav-link" href="#">Home</a>
                </li>
                <% String admin = (String)session.getAttribute("admin"); 
                if(admin != null && admin.equals("admin")){%>
                	 <li class="nav-item">
                     <a class="nav-link" href="/atm/accountlist">AccountList</a>
                 </li>
                 <%} %>
               
                <li class="nav-item">
                    <a class="nav-link" href="/atm/changepassword">Change Password</a>
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
                    <a class="nav-link" href="/atm/bankaccount/edit">Edit</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/atm/logout">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="card">
        <div class="card-header"><br>
        <% String msg = (String) request.getAttribute("msg") ;
         if(msg != null) {%>
         <h4><%=msg %></h4><%} %>
        <br>
        <%BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
        if(bankAccount != null) {%>
            <h3>Bank Account Details</h3>
        </div>
        <div class="card-body">
            <p><strong>Account Number:</strong>&nbsp;<span><%= bankAccount.getAccountNumber() %></span></p>
            <p><strong>Bank Name:</strong>&nbsp; <span><%= bankAccount.getBank().getBankName() %></span></p>
            <p><strong>Bank Branch Name:</strong>&nbsp; <span><%= bankAccount.getBank().getBankAddress() %></span></p>
            <p><strong>Balance:</strong> &nbsp;<span><%= bankAccount.getBalance() %></span></p>
            <p><strong>Customer Name:</strong>&nbsp;<span><%= bankAccount.getCustomer().getFirstName() + ' ' + bankAccount.getCustomer().getLastName() %></span></p>
            <p><strong>Email:</strong>&nbsp;<span><%= bankAccount.getCustomer().getEmail() %></span></p>
            <p><strong>Phone Number:</strong>&nbsp;<span><%= bankAccount.getCustomer().getPhoneNumber() %></span></p>
            <p><strong>Address:</strong>&nbsp;<span><%= bankAccount.getCustomer().getAddress() %></span></p>
           <%} %>
        </div>
    </div>
</div>

<footer>
    <div class="text-muted text-center">
        <p>Developed by Subhasish Biswasaray</p>
        <p>&copy; 2024. All rights reserved.</p>
    </div>
</footer>

<!-- Add Bootstrap JS (optional, for certain Bootstrap features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>