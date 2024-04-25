<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Accounts</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background-color: lightcyan;
}

.card-image {
	max-height: 200px;
	object-fit: cover;
}

footer {
	padding-top: 3%;
	width: 100%;
	bottom: 0;
	color: black;
}

th {
	vertical-align: middle;
}
</style>
</head>

<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#">Bank Service</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/atm/admin">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="/atm/transactions">Transactions</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/atm/adminlogout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-5">
		<h1>Bank Accounts Management</h1>
		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>Account Number</th>
					<th>Customer Name</th>
					<th>Phone Number</th>
					<th>Bank Name</th>
					<th>Branch Name</th>
					<th>Customer Address</th>
					<th>Balance</th>
					<th>Status</th>
					<th>Transactions</th>
					<th colspan="5" class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bankAccounts}" var="bankAccount">
					<tr>
						<td>${bankAccount.accountNumber}</td>

						<td>${bankAccount.customer.firstName}
							${bankAccount.customer.lastName}</td>
						<td>${bankAccount.customer.phoneNumber}</td>
						<td>${bankAccount.bank.bankName}</td>
						<td>${bankAccount.bank.bankAddress}</td>
						<td>${bankAccount.customer.address}</td>
						<td>${bankAccount.balance}</td>
						<td>${bankAccount.status}</td>


						<td><a href="/atm/transactions/${bankAccount.id}"
							class="btn btn-primary">Transactions</a></td>
						<td><a href="/atm/account/${bankAccount.id}" 
							class="btn btn">View</a></td>
						<td><a href="/atm/bankaccount/edit/${bankAccount.id}"
							class="btn btn-info">Edit</a></td>
						<td><a href="/atm/bankaccount/activate/${bankAccount.id}"
							class="btn btn-success">Activate</a></td>
						<td><a href="/atm/bankaccount/deactivate/${bankAccount.id}"
							class="btn btn-warning">Deactivate</a></td>
						<td><a href="/atm/bankaccount/delete/${bankAccount.id}"
							class="btn btn-danger">Delete</a></td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<footer>
		<div class="text-muted text-center">
			<p>Developed by Subhasish Biswasaray</p>
			<p>&copy; 2024. All rights reserved.</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>