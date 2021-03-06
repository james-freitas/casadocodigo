<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<header id="layout-header">
	<div class="clearfix container">
		<a href="/" id="logo"> </a>
		<div id="header-content">
			<nav id="main-nav">
				<ul class="clearfix">
					<li><a href="shopping/items"
						rel="nofollow">Seu carrinho (${shoppingCart.quantity}) </a></li>
					<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre
							n�s </a></li>
					<li><a href="/pages/perguntas-frequentes" rel="nofollow">Perguntas
							Frequentes </a></li>
					<li><a href="<c:url value="/produtos?locale=pt_BR"/>">Portugu�s</a>
					</li>
					<li><a href="<c:url value="/produtos?locale=en_US"/>">Ingl�s</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<nav class="categories-nav">
	<ul class="container">
		<li class="category">
			<a href="http://www.casadocodigo.com.br">Home</a>
		</li>	
		<li class="category">
			<a href="/collections/livros-de-agile">
				<spring:message code="navigation.category.agile"  />
			</a>
		</li>	
		<li class="category">
			<a href="/collections/livros-de-front-end">
				<spring:message code="navigation.category.front" />
			</a>
		</li>	
		<li class="category">
			<a href="/collections/livros-de-games">
				<spring:message code="navigation.category.games" />
			</a>
		</li>	
		<li class="category">
			<a href="/collections/livros-de-java"> 
				<spring:message code="navigation.category.java" />
			</a>
		</li>	
		<li class="category">
			<a href="/collections/livros-de-mobile">
				<fmt:message key="navigation.category.mobile" />
			</a>
		</li>	
		<li class="category">
			<a href="/collections/livros-desenvolvimento-web"> 
				<fmt:message key="navigation.category.web" />
			</a>
		</li>	
		<li class="category">
			<a href="/collections/outros"> 
				<fmt:message key="navigation.category.others" />
			</a>
		</li>	
	</ul>
</nav>