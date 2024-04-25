<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login - Bank Service</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>

        body {

            

            background-color: lightcyan;

        }

        

        .login-container {

            margin-top: 5%;

        }

        form{

        padding-left: 100px;

        padding-right: 100px;

        }

        footer {

            position: fixed;

            width: 100%;

            bottom: 0;

            padding: 10px 0;

            text-align: center;

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

                    <a class="nav-link" href="/atm">Home</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="/atm/login">Login</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="/atm/createcustomer">Create Account</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="/atm/adminlogin">Admin</a>

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

            <br>

        	<h4 class="text-center">${msg}</h4><br>

            

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