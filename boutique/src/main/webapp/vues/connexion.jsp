<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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


<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">          
            <a class="navbar-brand" href="#">E-Boutique ESSAT</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="">Home</a></li>
                <li><a href='#'>Promotions</a></li>
                <li><a href='#'>Ventes Flash</a></li>
            </ul>
			 <ul class="nav navbar-nav navbar-right">                
                <li>
					<a href="#"> Mon Panier 
						<span class="badge"> 0 </span>
					</a>   
				</li>              
                <li>
	                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                     Ali Ben Salah <span class="caret"></span></a>
	                     
			          <ul class="dropdown-menu">
			            <li><a href="#">Mes Commandes</a></li>
			            <li><a href="#">Déconnexion</a></li>		            
			          </ul>
	            </li>
              
            </ul>
        </div>
    </div>
</nav>




<div class="container">

    <div class="row" style="margin-top: 80px;">
        


        <div class="col-md-6">
            <div class="panel panel-info">
                <div class="panel-body">
					
					
				<form class="form-horizontal" method="get" action="verif">
				 <h4 align="center">Vous Avez Déjà Un Compte E-Boutique ?<br>
  				 Connectez-Vous !
				 </h4>
				 <br>
				  <div class="form-group">
					<label class="col-md-4 control-label">Email</label>
					<div class="col-md-8">
					  <input type="email" class="form-control" name="email" placeholder="Email">
					</div>
				  </div>
				  <div class="form-group">
					<label class="col-md-4 control-label">Mot de passe</label>
					<div class="col-md-8">
					  <input type="password" class="form-control" name="pass" placeholder="Password">
					</div>
				  </div>
				  
				  <div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					  <button type="submit" class="btn btn-info">Se Connecter</button>
					</div>
				  </div>
				</form>
					
                </div>
            </div>
        </div>
		
		
		
    </div>


</div>


</body>
</html>