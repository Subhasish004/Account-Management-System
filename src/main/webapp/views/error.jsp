<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Error</title>
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
                    <a class="nav-link" href="#">Error</a>
                </li>
               </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="card">
        <div class="card-header"><br>
        
        <a href="/atm" class="btn btn-primary">Logout To Home</a>
            
        </div>
        <div class="card-body">
           
			<font color="red">
			Error code : <%=response.getStatus() %><br>
			Error: <%=exception.getMessage()%></font><br>
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