<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@attribute name="title" required="true" %>
<%@attribute name="bodyClass" required="true" %>
<%@attribute name="extraScripts" fragment="true" %>

<!doctype html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt">
<![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8" lang="pt">
<![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="pt"><![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="pt">
<!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" >
	
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>"> 
	<link rel="stylesheet" href="<c:url value='/resources/css/core.css' />">
	
	<title>${title}</title>

</head>

<body class="${bodyClass}">

	<%@include file="/WEB-INF/header.jsp" %>
	
	<jsp:doBody />
	
	<%@include file="/WEB-INF/footer.jsp" %>
	
	<jsp:invoke fragment="extraScripts" />
	
	<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
</body>
</html>