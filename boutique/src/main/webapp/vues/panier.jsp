<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Boutique</title>
<c:set var="cxt" value="${pageContext.request.contextPath }" />
<c:set var="rs" value="resources" />

<link href="${cxt}/${rs}/files/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${cxt}/home">Boutique E-GCR</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="liste1">Home <span
							class="sr-only">(current)</span></a></li>
					<li><a href="add">Ajouter</a></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">${sessionScope.user.nom }
							${sessionScope.user.prenom }</a></li>
					<li><a href="${cxt}/monpanier"> panier <span class="badge">${fn:length(sessionScope.panier)}</span>
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item active"> Tous les Produits </a>
					<c:forEach items="${cats}" var="c">
						<a href="${cxt}/categorie/${c.id}" class="list-group-item">${c.description}</a>
					</c:forEach>

				</div>

</div>
</div>
			</div>

			<div class="col-md-9">
				<div class="panel panel-info">
					<div class="panel-heading">Mon panier</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>D&eacute;signation de vos articles</th>
									<th>Prix UT</th>
									<th>Quantit&eacute;</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:set var="s" value="1" />
								
								<c:forEach var="p" items="${panier}">
								<c:set var="a" value="${p.quantite}" />
								<c:set var="b" value="${p.prod.prix}" />
								<c:set var="f" value="${a*b}" />
								
									<tr>
										<th scope="row">
											${s}
										</th>
										<td><img src="${cxt}/${rs}/files/images/${p.prod.id}.jpg"
											width="10%"> ${p.prod.description}</td>
										<td>${p.prod.prix}</td>
										<td>${p.quantite}</td>
										
										<td>${f}</td>
										
										<td><a class="btn btn-danger "
											href="${cxt}/delete/${p.prod.id}">Suppimer </a></td>
											<c:set var="s" value="${s+1}" />
									</tr>
								</c:forEach>

							</tbody>
						</table>

					</div>
					<div class="panel-footer">
						<a href="#" class="btn btn-warning">POURSUIVRE VOS ACHATS</a> <a
							href="#" class="btn btn-info">FINALISER VOTRE COMMANDE</a>
						
					</div>
				</div>

			</div>
		
</body>
</html>