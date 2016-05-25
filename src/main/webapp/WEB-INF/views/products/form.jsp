<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Cadastro de produtos</title>
</head>
<body>
	
	<form:form 
		method="post"  
		servletRelativeAction="/casadocodigo/produtos" 
		commandName="product"
		enctype="multipart/form-data">
		

		
		<div>
			<label for="title">Titulo</label>
			<form:input path="title" />
			<form:errors path="title" />
		</div>
		
		<div>
			<label for="description">Descri��o</label>
			<form:textarea rows="10" cols="20" path="description" />
			<form:errors path="description" />
		</div>
	
		<div>
			<label for="pages">N�mero de paginas</label>
			<form:input path="pages" />
			<form:errors path="pages" />
		</div>
		
		<div>
			<label for="releaseDate">Data de lan�amento</label>
			<form:input type="date" path="releaseDate"  />
			<form:errors path="releaseDate" />
		</div>
	
		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for="price_${booktype}">${bookType}</label>
				<input type="text" name="prices[${status.index}].value" id="price_${bookType}"/>
				<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}">
			</div>
		
		</c:forEach>
		
		<div>
			<label for="summary">Sum�rio do livro</label>
			<input type="file" name="summary" />
			<form:errors path="summaryPath" />
		</div>
		
		
		<div>
			<input type="submit" value="Enviar" />
		</div>
	
	</form:form>

</body>
</html>