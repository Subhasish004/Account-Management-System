<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Transactions</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>

        body {

            background-color: lightcyan;

        }

        .card {

            margin-top: 50px;

        }

        .card-body{

        margin-bottom: 30px ;

        }

        footer {

            padding-top: 20px;

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

                    <a class="nav-link" href="/atm/credit">Deposite</a>

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

        <div class="col-md-10">

            <div class="card">

            <div class="card-header" style="padding-top: 30px;">

            <br>

        	<center><h4>All Transactions</h4><br></center>

             </div>

                <div class="card-body">

       

        <!-- Transaction details table -->

        <table class="table">

            <thead>

                <tr>

                    <th scope="col">ID</th>

                    <th scope="col">Bank</th>

                    <th scope="col">Account ID</th>

                    <th scope="col">Type</th>

                    <th scope="col">Amount</th>

                    <th scope="col">Balance</th>

                    <th scope="col">Date</th>

                </tr>

            </thead>

            <tbody>

                

               <c:forEach items="${transactions}" var="transaction">
                                <tr>
                                    <td>${transaction.id}</td>
                                    <td>${transaction.bank.bankName}</td>
                                    <td>${transaction.bankAccount.accountNumber}</td>
                                    <td>${transaction.type}</td>
                                    <td>${transaction.amount}</td>
                                    <td>${transaction.balance}</td>
								<td><fmt:formatDate value="${transaction.time}" pattern="yyyy-MM-dd HH:mm:ss.SSS"/></td>                                </tr>
                            </c:forEach>

            </tbody>

        </table>

					

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