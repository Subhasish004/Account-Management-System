<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Customer</title>

    

    <!-- Add Bootstrap CSS -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>

body {

            background-color: lightcyan;

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
                    <a class="nav-link" href="/atm/accountlist">Home</a>
                
                <li class="nav-item">
                    <a class="nav-link" href="/atm/logout">Log Out</a>
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

                <h2 class="text-center">Customer Details</h2>

            </div>

            <div class="card-body" 

            	style="padding-left: 100px; padding-right: 100px; margin-right: 50px; margin-left: 50px;">

                <form action="/atm/admin/updatecustomer" method="post">

                    <!-- Customer Fields -->

                    <div class="mb-3">

                        <label for="firstName" class="form-label">First Name:</label>

                        <input type="text" id="firstName" name="firstName" class="form-control" value="${customer.firstName}" required>

                    </div>

                    <div class="mb-3">

                        <label for="lastName" class="form-label">Last Name:</label>

                        <input type="text" id="lastName" name="lastName" class="form-control" value="${customer.lastName}" required>

                    </div>

                    <div class="mb-3">

                        <label for="phoneNumber" class="form-label">Phone Number:</label>

                        <input type="number" id="phoneNumber" name="phoneNumber" class="form-control" value="${customer.phoneNumber}" required>

                    </div>

                    <div class="mb-3">

                        <label for="email" class="form-label">Email:</label>

                        <input type="email" id="email"  name="email" class="form-control" value="${customer.email}" required>

                    </div>

                    <div class="mb-3">

                        <label for="address" class="form-label">Address:</label>

                        <input type="text" id="address" name="address" class="form-control" value="${customer.address}" required>

                    </div>

                    <button type="submit" class="btn btn-primary" style="margin-top: 19px;">Update Customer</button>

                </form>

            </div>

        </div>

    </div>

    <!-- Add Bootstrap JS (optional, for certain Bootstrap features) -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<footer>

<div class="text-muted text-center" style="padding-top: 50px;">

    <p>Developed by Subhasish Biswasaray</p>

    <p>&copy; 2024 . All rights reserved.</p>

</div></footer>

</body>

</html>