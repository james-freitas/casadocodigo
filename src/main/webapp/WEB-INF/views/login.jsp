<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form servletRelativeAction="/login">
	<div>
		<label>
			User
			<input type="text" name="username" value="" />
		</label>
		<label>
			Password
			<input type="password" name="password" value="" />
		</label>		
	</div>
	<div>
		<input type="submit" name="submit" value="Login" />
	</div>
</form:form>