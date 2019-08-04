<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="greatnumbergame.css">
<title>GnG</title>
</head>
<body>
<%
int low = 0, high = 0, randomNumber = 0, num = 0;

if (session.getAttribute("randomNumber") == null) { %>
	<h1>Welcome to the Great Number Game!</h1>
	<h3>Try to guess a number between -low- and -high- as defined below </h3>
	<form action = "GameController" method="get">
      <h1>Set range</h1>
      <table>
        <tr>
          <td><label for="low">-low-</label></td>
          <td><input type="number" id="low" name="low"></td>
        </tr>
        <tr>
          <td><label for="high">-high-</label></td>
          <td><input type="number" id="high" name="high"></td>
        </tr>
      </table>
      <br>
      <input type="submit" value="Submit">
    </form> <%
} else {
	randomNumber = (int)session.getAttribute("randomNumber");

if (session.getAttribute("low") != null)
	low = (int)session.getAttribute("low");
if (session.getAttribute("high") != null)
	high = (int)session.getAttribute("high");
%>
	<h1>Welcome to the Great Number Game!</h1>
	<h3>I am thinking of a number between <%= low %> and <%= high %></h3>
	<h4>Take a guess!</h4>
	
	<% if (session.getAttribute("num") != null) {
		num = (int)session.getAttribute("num");
		if (num < randomNumber) {%>
		<%= "<div class='no'>Too low!</div>" %>
		<%} else if (num > randomNumber) {%>
		<%= "<div class='no'>Too high!</div>" %>
		<%} else {%>
		<div class='yes'>
			<%= num %> was the number!
			<br>
			<form action="GameController" method="POST">
				<input type="submit" value="Play again!">
			</form>
			<br>
		</div>
	<%}
	}%>

	<form action="GameController" method="POST">
		<div>
			<input type="text" name="num">
		</div>
		<br>
		<div>
			<button type="submit">Submit</button>
		</div>
	</form><%
}%>
</body>
</html>