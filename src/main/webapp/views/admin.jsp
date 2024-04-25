<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bank Service - ADMIN</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>

        /* Add custom styles here */

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

<body class="bg-light">

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

                <li class="nav-item">

                    <a class="nav-link" href="/atm/login">Login</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="/atm/createcustomer">Create Account</a>

                </li>
               

                <li class="nav-item">

                    <a class="nav-link" href="/atm/adminlogout">Logout</a> 

                </li>

            </ul>

        </div>

    </div>

</nav>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="card">

                <!-- Bank Image -->

                <img src="/bank.jpg" class="card-img-top card-image" alt="Bank Image">

                <div class="card-body">

                    <h2 class="card-title text-center mb-4">Welcome to Our Bank Services</h2>

                    <div class="text-center">

                        <a href="/atm/bank" class="btn btn-primary">Bank</a>
                        <a href="/atm/accountlist" class="btn btn-primary">Bank Accounts</a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<footer>

<div class="text-muted text-center">

    <p>Developed by Subhasish Biswasaray</p>

    <p>&copy; 2024 . All rights reserved.</p>

</div></footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>