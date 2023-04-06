<%@page import="com.demo.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

	<title>Book CRUD</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/index.html">Book CRUD</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page" href="/index.html">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/add.html">Add</a></li>
					<li class="nav-item"><a class="nav-link" href="/update.html">Update</a></li>
					<li class="nav-item"><a class="nav-link" href="/delete.html">Delete</a></li>
					<li class="nav-item"><a class="nav-link active" href="/view">View All</a></li>
				</ul>
				<form class="d-flex w-50">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-light" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container mt-3">
		<p class="display-4">View Book</p>
		<hr>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
				</tr>
			</thead>
			<tbody>
			<% List<Book> books = (List<Book>)request.getAttribute("bk"); %>
			<% for(Book book: books){ %>
				<tr>
					<th scope="row"><%= book.getId() %></th>
					<td><%= book.getName() %></td>
					<td><%= book.getPrice() %></td>
				</tr>
			<% } %>
			</tbody>
		</table>

	</div>
</body>

</html>