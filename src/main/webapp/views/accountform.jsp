
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<head>

    <meta charset="UTF-8">

    <title>Create Bank Account</title>

    

    <!-- Add Bootstrap CSS -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>

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

                    <a class="nav-link" href="/atm">Home</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="/atm/login">Login</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="/atm/createcustomer">Create Account</a>

                </li>

            </ul>

        </div>

    </div>

</nav>

    <div class="container mt-5" 

    	style="margin-top: 40px;margin-left: 50px; 

    		padding-left: 80px;padding-right: 50px; margin-right: 50px;">

        <div class="card">

            <div class="card-header">

                <h2 class="text-center">Create Bank Account</h2>

            </div>

            <div class="card-body" 

            	style="padding-left: 100px; padding-right: 100px; margin-right: 50px; margin-left: 50px;">

                <form action="/atm/createaccount" method="post">

					<div class="mb-3">

        				<label for="bank" class="form-label">Select Bank:</label>

        				<select id="bank" name="bank" class="form-select" required>

            			 <c:forEach items="${banks}" var="bank">
            				
            				<option value="${bank.id}">${bank.bankName} - ${bank.bankAddress }</option>
            				 </c:forEach> 
            

        				</select>

    				</div>

                    

    

                    <div class="mb-3">

                        Generate AccountNumber automatically

                        <label for="accountNumber" class="form-label">Account Number:</label>

                        <div class="input-group">

                            <input type="text" id="accountNumber" name="accountNumber" class="form-control" value="${bankAccount.accountNumber}" readonly>

                         

                        </div>

                    </div> 

                    <div class="mb-3">

                        <label for="password" class="form-label">Password:</label>

                        <input type="password" id="password" name="password" class="form-control" value="${bankAccount.password}" required>

                    </div>

                    <button type="submit" class="btn btn-primary" style="margin-top: 19px;">Create Bank Account and Customer</button>

                </form>

            </div>

        </div>

    </div>

    <!-- Add Bootstrap JS (optional, for certain Bootstrap features) -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Add JavaScript to generate AccountNumber -->

<script>

    function generateAccountNumber(length) {

        let result = '';

        const characters = '0123456789';

        for (let i = 0; i < length; i++) {

            const randomIndex = Math.floor(Math.random() * characters.length);

            result += characters.charAt(randomIndex);

        }

        return result;

    }

    // Example: generate a random string of length 6

    var accountNumber = generateAccountNumber(6);

    // Set the generated value to the input field

    document.getElementById('accountNumber').value = accountNumber;

</script>

<footer>

<div class="text-muted text-center" style="padding-top: 50px;">

    <p>Developed by Subhasish Biswasaray</p>

    <p>&copy; 2024 . All rights reserved.</p>

</div></footer>

</body>

</html>