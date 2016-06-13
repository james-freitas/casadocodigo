<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="customTags"%>


<customTags:pageTemplate bodyClass="container middle" title="Products">

	<h1>Listagem de produtos</h1>
	<br />
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<div>
			<spring:message  code="users.welcome"  arguments="${user.name}" />
		</div>
	</sec:authorize>

	<br />
	<table>
		<tr>
			<td>Titulo</td>
			<td>Valores</td>
		</tr>
		<c:forEach items="${products}" var="product">
			<tr>
				<td><a
					href="produtos/show">
						${product.title} </a></td>
				<td><c:forEach items="${product.prices}" var="price">
	 				[${price.value} - ${price.bookType}]
	 			</c:forEach></td>
			</tr>
		</c:forEach>
	</table>

</customTags:pageTemplate>



