<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products</title>
</head>
<body>
 <h1>Listagem de produtos</h1>
 
 <br />
 <security:authentication property="principal" var="user" />
 Olá ${ user.name }
 
 <br />
 
 <table>
 	<tr>
 		<td>Titulo</td>
 		<td>Valores</td>
 	</tr>
 	
 	<c:forEach items="${products}" var="product">
 		<tr>
 			<td>
 				<a href="${spring:mvcUrl('PC#show').arg(0,product.id).build()}">
 					${product.title}
 				</a>
 				
 			
 			</td>
	 		<td>
	 			<c:forEach items="${product.prices}" var="price">
	 				[${price.value} - ${price.bookType}]
	 			</c:forEach>
	 		</td>
 		</tr>
 	</c:forEach>
 </table>
</body>
</html>